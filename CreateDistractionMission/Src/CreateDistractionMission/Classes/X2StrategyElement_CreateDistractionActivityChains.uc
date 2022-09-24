class X2StrategyElement_CreateDistractionActivityChains extends X2StrategyElement_DefaultActivityChains config (GameCore);

var config int MinForceLevel;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Activites;

	Activites.AddItem(CreateAbiziDistractionTemplate());

	return Activites;
}

static function X2DataTemplate CreateAbiziDistractionTemplate()
{
	local X2ActivityChainTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ActivityChainTemplate', Template, 'ActivityChain_AbiziDistractionAssault');
	
	Template.ChooseFaction = ChooseMetFaction;
	Template.ChooseRegions = ChooseRandomContactedRegion;
	Template.SpawnInDeck = true;
	Template.NumInDeck = 1;
	Template.DeckReq = IsAbiziDistractionAvailable;
	
	Template.Stages.AddItem(ConstructPresetStage('Activity_AbiziDistractionInfiltrate'));
	
	Template.GetNarrativeObjective = GetNarrative;

	return Template;
}

static function bool IsAbiziDistractionAvailable (XComGameState NewGameState)
{
	local XComGameState_HeadquartersAlien AlienHQ;

	AlienHQ = XComGameState_HeadquartersAlien(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersAlien'));
	
	return FindRegionWithRelay().ObjectID > 0 && AlienHQ.GetForceLevel() >= default.MinForceLevel;
}

static function string GetNarrative (XComGameState_ActivityChain ChainState)
{
	return "Some narrative goes here";
}