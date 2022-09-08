fx_version 'cerulean'

game 'gta5'

author 'Jon Doe'

description 'Clothing for Los Scandalous.'

version '3.1.0'

lua54 'yes'

dependencies {
	'/server:5104',
}

files {
  'mp_m_freemode_01_mp_m_anx_legacy.meta',
  'mp_f_freemode_01_mp_f_anx_legacy.meta',
  'mp_m_freemode_01_mp_m_anx_reborn.meta',
  'mp_f_freemode_01_mp_f_anx_reborn.meta',
}

-- Male
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_m_freemode_01_mp_m_anx_legacy.meta'
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_m_freemode_01_mp_m_anx_reborn.meta'

-- Female
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_f_freemode_01_mp_f_anx_legacy.meta'
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_f_freemode_01_mp_f_anx_reborn.meta'