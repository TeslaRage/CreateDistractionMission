class X2StrategyElement_DistractionRewards extends X2StrategyElement config(GameCore);

var config int DistractionIntelRewardAmount;
var config int DistractionSuppliesRewardAmount;
var config int DistractionAlloyRewardAmount;
var config int DistractionEleriumRewardAmount;
var config float RewardVariance;


static function array<X2DataTemplate> CreateTemplates()
{

	local array<X2DataTemplate> Rewards;
	
	Rewards.AddItem(CreateDistractionIntelReward());
	Rewards.AddItem(CreateDistractionSuppliesReward());
	Rewards.AddItem(CreateDistractionAlloyReward());
	Rewards.AddItem(CreateDistractionEleriumReward());

	return Rewards;
}

static function X2RewardTemplate CreateDistractionIntelReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'DistractionIntel');
	Template.rewardObjectTemplateName = 'Intel';
	Template.RewardImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Intel";
	Template.bResourceReward = true;

	Template.GenerateRewardFn = GenerateDistractionIntelReward;
	Template.SetRewardFn = class'X2StrategyElement_DefaultRewards'.static.SetResourceReward;
	Template.GiveRewardFn = class'X2StrategyElement_DefaultRewards'.static.GiveResourceReward;
	Template.GetRewardStringFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardString;
	Template.GetRewardPreviewStringFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardString;
	Template.GetRewardImageFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardImage;
	Template.GetRewardIconFn = class'X2StrategyElement_DefaultRewards'.static.GetGenericRewardIcon;

	return Template;
}

static function GenerateDistractionIntelReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference RegionRef)
{
	RewardState.Quantity = Round(RewardScalar * default.DistractionIntelRewardAmount * (1 + (`SYNC_FRAND_STATIC() - 0.5)* default.RewardVariance));
}

static function X2RewardTemplate CreateDistractionSuppliesReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'DistractionSupplies');
	Template.rewardObjectTemplateName = 'Supplies';
	Template.RewardImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Supplies";
	Template.bResourceReward = true;

	Template.GenerateRewardFn = GenerateDistractionSupplyReward;
	Template.SetRewardFn = class'X2StrategyElement_DefaultRewards'.static.SetResourceReward;
	Template.GiveRewardFn = class'X2StrategyElement_DefaultRewards'.static.GiveResourceReward;
	Template.GetRewardStringFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardString;
	Template.GetRewardPreviewStringFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardString;
	Template.GetRewardImageFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardImage;
	Template.GetRewardIconFn = class'X2StrategyElement_DefaultRewards'.static.GetGenericRewardIcon;

	return Template;
}

static function GenerateDistractionSupplyReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference RegionRef)
{
	RewardState.Quantity = Round(RewardScalar * default.DistractionSuppliesRewardAmount* (1 + (`SYNC_FRAND_STATIC() - 0.5)* default.RewardVariance));
}

static function X2RewardTemplate CreateDistractionAlloyReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'DistractionAlloy');
	Template.rewardObjectTemplateName = 'AlienAlloy';
	Template.RewardImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Alien_Alloy";
	Template.bResourceReward = true;

	Template.GenerateRewardFn = GenerateDistractionAlloyReward;
	Template.SetRewardFn = class'X2StrategyElement_DefaultRewards'.static.SetResourceReward;
	Template.GiveRewardFn = class'X2StrategyElement_DefaultRewards'.static.GiveResourceReward;
	Template.GetRewardStringFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardString;
	Template.GetRewardPreviewStringFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardString;
	Template.GetRewardImageFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardImage;
	Template.GetRewardIconFn = class'X2StrategyElement_DefaultRewards'.static.GetGenericRewardIcon;

	return Template;
}

static function GenerateDistractionAlloyReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference RegionRef)
{
	RewardState.Quantity = Round(RewardScalar * default.DistractionAlloyRewardAmount* (1 + (`SYNC_FRAND_STATIC() - 0.5)* default.RewardVariance));
}

static function X2RewardTemplate CreateDistractionEleriumReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'DistractionElerium');
	Template.rewardObjectTemplateName = 'EleriumDust';
	Template.RewardImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Elerium_Crystals";
	Template.bResourceReward = true;

	Template.GenerateRewardFn = GenerateDistractionEleriumReward;
	Template.SetRewardFn = class'X2StrategyElement_DefaultRewards'.static.SetResourceReward;
	Template.GiveRewardFn = class'X2StrategyElement_DefaultRewards'.static.GiveResourceReward;
	Template.GetRewardStringFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardString;
	Template.GetRewardPreviewStringFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardString;
	Template.GetRewardImageFn = class'X2StrategyElement_DefaultRewards'.static.GetResourceRewardImage;
	Template.GetRewardIconFn = class'X2StrategyElement_DefaultRewards'.static.GetGenericRewardIcon;

	return Template;
}

static function GenerateDistractionEleriumReward(XComGameState_Reward RewardState, XComGameState NewGameState, optional float RewardScalar = 1.0, optional StateObjectReference RegionRef)
{
	RewardState.Quantity = Round(RewardScalar * default.DistractionEleriumRewardAmount* (1 + (`SYNC_FRAND_STATIC() - 0.5)* default.RewardVariance));
}