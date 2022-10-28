Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9056111B9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Oct 2022 14:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiJ1Mlp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Oct 2022 08:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiJ1Mlj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Oct 2022 08:41:39 -0400
X-Greylist: delayed 577 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 28 Oct 2022 05:41:35 PDT
Received: from smtp-out-12.comm2000.it (smtp-out-12.comm2000.it [212.97.32.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43F21D1E05
        for <linux-usb@vger.kernel.org>; Fri, 28 Oct 2022 05:41:35 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-12.comm2000.it (Postfix) with ESMTPSA id DFF77BA1D5A;
        Fri, 28 Oct 2022 14:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1666960314;
        bh=Di6IsiD0NMg/+4NNtSr7+fBdBHgcfhk8D03KtwsND40=;
        h=Date:From:To:Cc:Subject;
        b=gmXe9K4pbqmQy3pumWjoFP/MeRf+/azTJroZfJ8QxUPMvQT4CxeKZBE1N10yYvzId
         pCWSsxrFuArYXr0PfE1LNpZT7mF11CkmNCTGNpX65WkoKI0sln00GLSSRGeKHTuE8c
         8xVG8AeiWDReKT7MgEhQzY2h9IubvyFmjM3oeYy07oyGWUVVfAoP4iMkX62bEtnklx
         zoeTa9JcP7BlEP3dKqMYGBBOAR84rFieuj2NL0FoTX0fqdF7qJnZY6GTIbU+Dy5NcV
         0K+OHSsGO7LrFAJMoW0Rr+lNDQPONOZQ+QbatqjRMJjv6yAh6tFIA4CHywRPzIXDjS
         7Aqk/BDRgcaVg==
Date:   Fri, 28 Oct 2022 14:31:33 +0200
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        Li Jun <jun.li@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Felipe Balbi <balbi@kernel.org>, philippe.schenker@toradex.com,
        francesco.dolcini@toradex.com
Subject: USB runtime PM issues on i.MX6ULL
Message-ID: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

I am debugging some unexpected USB behavior on a i.MX6ULL SOC,
chipidea controller ("fsl,imx6ul-usb") and a fsl mxs usbphy
("fsl,imx6ul-usbphy").

The HW design has 2 USB interface, the first one is dual-role, while the second
one is a host port with NO way to re-read the VBUS (USB_OTG2_VBUS is not
really connected, there is just a capacitor to GND).

Focusing on the second interface, USB Host only, what I do experience is the
following:

 - if there is no USB HUB connected and no device connected at boot, any USB
   device hotplugged is not working, ci_runtime_suspend is called and it never
   resume.
 - if there is a HUB in between it somehow works, however I have a continuos
   runtime powermanagement reset loop every 2 seconds
       [ 1026.146360] ci_hdrc ci_hdrc.1: at ci_runtime_suspend
       [ 1026.164725] ci_hdrc ci_hdrc.1: at ci_controller_resume
       [ 1026.487844] usb 1-1: reset high-speed USB device number 2 using ci_hdrc
       [ 1028.326789] ci_hdrc ci_hdrc.1: at ci_runtime_suspend
       [ 1028.335378] ci_hdrc ci_hdrc.1: at ci_controller_resume
       [ 1028.657853] usb 1-1: reset high-speed USB device number 2 using ci_hdrc


I was able to have it fully working disabling the runtime power management in
the chipidea driver or using sysfs (`echo on > /sys/.../power/control`).

--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -56,7 +56,7 @@ static const struct ci_hdrc_imx_platform_flag imx6sx_usb_data = {
 };
 
 static const struct ci_hdrc_imx_platform_flag imx6ul_usb_data = {
-       .flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
+       .flags =

I was digging even more into the topic and I found out that what is happening
is that mxs_phy_disconnect_line() is called. I than tried to remove the MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS flag.

--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -178,7 +178,7 @@ static const struct mxs_phy_data imx6sx_phy_data = {
 };
 
 static const struct mxs_phy_data imx6ul_phy_data = {
-       .flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
+       /*.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,*/
 };

This commit from NXP downstream kernel seems somehow related
https://github.com/nxp-imx/linux-imx/commit/89ec73836a9b1347743e406d62dd446dc4365db3
however it builds on other commits that allow to communicate the actual mode to
the USB PHY driver and prevent mxs_phy_disconnect_line() to be called for the
USB host case.

With that the situation is way better, but while without
`CI_HDRC_SUPPORTS_RUNTIME_PM` it works perfectly, without
`MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS` it does not really work smootly
in case there is a hub in between (~20% of the time the device is not
enumerated after plugging it in).

When it does not work I see that after plugging in a device runtime resume
function is called, but after that the device is not enumerated on the USB bus.
It looks like something else is missing.

It seems like having a pure USB Host interface without having a way to re-read
the VBUS is not really supported in SW at the moment, am I wrong?
Any idea?

One last comment, even the USB dual role port is not working smoothly, however
I have not investigated this specific case that much because disabling runtime pm
solves everything also in that case.

Francesco

