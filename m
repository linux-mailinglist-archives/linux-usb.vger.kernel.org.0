Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E9E2DF71B
	for <lists+linux-usb@lfdr.de>; Mon, 21 Dec 2020 00:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgLTXYb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Dec 2020 18:24:31 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50189 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgLTXYa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Dec 2020 18:24:30 -0500
X-Greylist: delayed 1023 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Dec 2020 18:24:30 EST
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kr7ml-0003Dr-P1; Mon, 21 Dec 2020 00:06:43 +0100
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Correct ordering of phy_init and phy_power_on
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-usb@vger.kernel.org, Jules Maselbas <jmaselbas@kalray.eu>
Message-ID: <6cd01e79-fdc0-3bd4-32b5-a85142533f8a@pengutronix.de>
Date:   Mon, 21 Dec 2020 00:06:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I just noticed that USB controller drivers differ in the order in which they
do phy_init and phy_power_on. For example:

__dwc2_lowlevel_hw_enable():

	ret = phy_power_on(hsotg->phy);    
	if (ret == 0)                      
        	ret = phy_init(hsotg->phy);

dwc3_core_init():

	ret = dwc3_core_soft_reset(dwc); // internally does phy_init(dwc->usb2_generic_phy);
	/* [snip] */
	ret = phy_power_on(dwc->usb2_generic_phy);


My initial assumption has been init -> power_on, but at least the phy-stm32-usbphyc
(used with dwc2) is written with the assumption that exit -> power_off (and therefore
power_on -> init). If they are swapped, disabling fails.

So how was it meant to be?

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
