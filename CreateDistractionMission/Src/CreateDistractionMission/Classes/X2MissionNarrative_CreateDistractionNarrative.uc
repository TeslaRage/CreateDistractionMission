class X2MissionNarrative_CreateDistractionNarrative extends X2MissionNarrative;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(CreateDistractionNarrative());

	return Templates;
}

static function X2MissionNarrativeTemplate CreateDistractionNarrative()
{
	local X2MissionNarrativeTemplate Template;

	`CREATE_X2MISSIONNARRATIVE_TEMPLATE(Template,'AbiziCreateDistractionNarrative');
	Template.MissionType = "AbiziCreateDistraction";
	Template.NarrativeMoments[0]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Squad Wipe";
    Template.NarrativeMoments[1]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Squad Extracted";
    Template.NarrativeMoments[2]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Partial Squad Recovery";
    Template.NarrativeMoments[3]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Operative Down";
    Template.NarrativeMoments[4]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Operative Dead";
    Template.NarrativeMoments[5]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Objective Indicated";
    Template.NarrativeMoments[6]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Mission Intro";
    Template.NarrativeMoments[7]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Many Enemies Reminder";
    Template.NarrativeMoments[8]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Last Operative";
    Template.NarrativeMoments[9]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Kill Captain";
    Template.NarrativeMoments[10]="XPACK_NarrativeMoments.X2_XP_CEN_T_Covert_Escape_Captain Dead";

    return Template;
}

