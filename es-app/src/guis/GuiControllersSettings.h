#pragma once

#include "GuiSettings.h"
#include <vector>

class Window;

class InputConfigInfo
{
public:
	InputConfigInfo(const std::string& ideviceName, const std::string& ideviceGUIDString, const std::string& idevicePath)
	{
		name = ideviceName;
		guid = ideviceGUIDString;
		path = idevicePath;
	}

	std::string name;
	std::string guid;
	std::string path;
};

class GuiControllersSettings : public GuiSettings
{
public:
	static std::string getControllersSettingsLabel();
	static void openControllersSettings(Window* wnd, int autoSel = 0);
	// Arcadia: tela "Ordem dos jogadores" (P1 a P4), aberta por "Configurar botoes"
	static void openArcadiaPlayerOrder(Window* wnd);

	GuiControllersSettings(Window* wnd, int autosel = 0, bool arcadiaOrdem = false);
	~GuiControllersSettings();

private:
	void openControllersSpecificSettings_sindengun();
	void openControllersSpecificSettings_wiigun();
	void openControllersSpecificSettings_steamdeckgun();

	std::vector<InputConfigInfo*> mLoadedInput;
	void clearLoadedInput();
};
