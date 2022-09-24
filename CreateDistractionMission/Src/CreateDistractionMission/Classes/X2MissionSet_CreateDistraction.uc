class X2MissionSet_CreateDistraction extends X2MissionSet;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(AddMissionTemplate('AbiziCreateDistraction'));

	return Templates;
}