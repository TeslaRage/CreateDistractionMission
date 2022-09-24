class X2StrategyElement_CreateDistractionActivities extends X2StrategyElement_DefaultActivities;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	CreateAbiziDistractionAssault(Templates);
	CreateAbiziDistractionInfiltration(Templates);

	return Templates;
}

static function CreateAbiziDistractionAssault (out array<X2DataTemplate> Templates)
{
	local X2ActivityTemplate_Assault ActivityAssault;
	
	`CREATE_X2TEMPLATE(class'X2ActivityTemplate_Assault', ActivityAssault, 'Activity_AbiziDistractionAssault');
	
	ActivityAssault.OverworldMeshPath = "UI_3D.Overwold_Final.GorillaOps";
	ActivityAssault.UIButtonIcon = "img:///UILibrary_StrategyImages.X2StrategyMap.MissionIcon_GOPS";
	ActivityAssault.MissionImage = "img:///UILibrary_StrategyImages.Alert_Advent_Ops_Appear";
	ActivityAssault.Difficulty = 2; //default.DistractionDifficulty;
	
	ActivityAssault.ActivityTag = 'Tag_AbiziDistraction';
	// ActivityAssault.MissionRewards.AddItem('Reward_SmallIncreaseIncome');
	ActivityAssault.GetMissionDifficulty = GetMissionDifficultyFromMonthPlusTemplate;
	ActivityAssault.WasMissionSuccessful = class'X2StrategyElement_DefaultMissionSources'.static.OneStrategyObjectiveCompleted;
	ActivityAssault.AvailableSound = "GeoscapeFanfares_GuerillaOps";

	ActivityAssault.InitializeMissionRewards = RandomRewards;
	
	Templates.AddItem(ActivityAssault);
}

static function CreateAbiziDistractionInfiltration (out array<X2DataTemplate> Templates)
{
	local X2ActivityTemplate_Infiltration ActivityInfil;
	local X2CovertActionTemplate CovertAction;

	CovertAction = class'X2StrategyElement_InfiltrationActions'.static.CreateInfiltrationTemplate('CovertAction_AbiziDistractionInfiltrate', true);
	ActivityInfil = CreateStandardInfilActivity(CovertAction, "AbiziDistractionInfiltrate", "UI_3D.Overwold_Final.GorillaOps", "img:///UILibrary_StrategyImages.X2StrategyMap.MissionIcon_GOPS");
	
	ActivityInfil.bNeedsPOI = true;
	ActivityInfil.GetMissionDifficulty = GetMissionDifficultyFromMonth;
	ActivityInfil.WasMissionSuccessful = class'X2StrategyElement_DefaultMissionSources'.static.OneStrategyObjectiveCompleted;
	ActivityInfil.AvailableSound = "GeoscapeFanfares_GuerillaOps";

	ActivityInfil.InitializeMissionRewards = RandomRewards;
	
	Templates.AddItem(CovertAction);
	Templates.AddItem(ActivityInfil);
}

static function array<StateObjectReference> RandomRewards (XComGameState NewGameState, XComGameState_Activity ActivityState)
{
	local X2StrategyElementTemplateManager StratMan;
	local X2RewardTemplate RewardTemplate;
	local array<StateObjectReference> RewardRefs;
	local array<name> Rewards;
	local name ChosenReward;

	StratMan = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	Rewards.AddItem('DistractionIntel');
	Rewards.AddItem('DistractionSupplies');
	Rewards.AddItem('DistractionAlloy');
	Rewards.AddItem('DistractionElerium');

	ChosenReward = Rewards[`SYNC_RAND_STATIC(Rewards.Length)];

	RewardTemplate = X2RewardTemplate(StratMan.FindStrategyElementTemplate(ChosenReward));
	if (RewardTemplate != none)
	{
		RewardRefs.AddItem(class'X2ActivityTemplate_Mission'.static.InitMissionReward(NewGameState, ActivityState, RewardTemplate));
	}

	return RewardRefs;
}