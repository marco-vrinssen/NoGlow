-- Removes button glow effects from action bars

local function hideActionButtonGlowEffect(actionButton)
    if not actionButton then return end

    local assistedCombatRotationFrame = actionButton.AssistedCombatRotationFrame
    if assistedCombatRotationFrame and assistedCombatRotationFrame.SpellActivationAlert then
        assistedCombatRotationFrame.SpellActivationAlert:Hide()
    end

    if actionButton.overlay then
        actionButton.overlay:Hide()
    end

    if actionButton.SpellActivationAlert then
        actionButton.SpellActivationAlert:Hide()
    end
end

if ActionButtonSpellAlertManager then
    hooksecurefunc(ActionButtonSpellAlertManager, "ShowAlert", function(_, actionButton)
        hideActionButtonGlowEffect(actionButton)
    end)
else
    hooksecurefunc("ActionButton_ShowOverlayGlow", hideActionButtonGlowEffect)
end
