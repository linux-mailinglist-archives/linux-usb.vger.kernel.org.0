Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C10199864
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 16:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731034AbgCaOZy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 10:25:54 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39064 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729891AbgCaOZx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 10:25:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id e9so2937828wme.4
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2020 07:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8pzPGR9a3649MW/xsbMSg19q7qbk+CNuP6wfeOC/1Rg=;
        b=c2IBWf8k098JffO/t5dWCZxHF8IJUQwiBMNsJg+E7ja61G7uhjuBrFyF6mvzweCBv4
         iP0BNZ4ZNXnWLiALRL2slSgGE+g6Fisz0M58xJUTW2IBpbam37tZhyjWWICdlW9KIKHk
         IWM3jAHEFQd6KiPuAxRcttCzh+Z2+PFOZXCyEfQ/3MOSU2deyFVuTqsoWRJvg8IwBKjC
         sXwDYu4OxiUiZCq3JxW+M4ZPWj6xvRtsHY+m26uGZyjwtw/dAeu8+x6xhAso/ycOdrGC
         epV2nQDMvWC7mfc3UVSnqYP8kbpHtWRD32w+UCDN+HGPEUMjd5HMTrWhbimWc+OLiFTC
         gMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8pzPGR9a3649MW/xsbMSg19q7qbk+CNuP6wfeOC/1Rg=;
        b=MM59Ww9N3FL4rRioLS9FpyzscgmfFoULPH+ydeSQtbE58R4I6Ld5rQN2F3JWxvbeYv
         1CUBS2kPCiC0mbp0+TGfU9peidMWfRNX2s3l3S9QD6usHxVQGzhqxl/LfesUDYMhoj5Y
         Omk1Y8t7RTf8xGJIwQVDrrauMnwsYTVzB2LkVxvnVreOEQ+kTT3UNbgfFVXSNmY0/7dv
         nV4vGevEg3msvkqSLn53ABmiys9nCkBSLFRh9LrJkqcgxMtLWgyOUMshvHm8qFn4XgGU
         N71/P2wKF3/MR32nNvc5nzyFhUce4acCu2ET2cEhA5Ac3KaAvC+rpn3Kmweyn5xrN+YB
         wh5g==
X-Gm-Message-State: ANhLgQ1oi63VBqYqquamDVBk2Pmxp2DRSsliLRC6/jps6tp6dV1ee6Ox
        FvFruj/KVRzxlsJwa9g2jQA=
X-Google-Smtp-Source: ADFU+vtUNKX0jsZzUQk4/Hv1gTVYAvx9w9eW3oIFURLt+Hc/KDb6BCgw2gMYvIRBRTiY8b5S6r4xcA==
X-Received: by 2002:a1c:81:: with SMTP id 123mr3537738wma.97.1585664751499;
        Tue, 31 Mar 2020 07:25:51 -0700 (PDT)
Received: from localhost (ipv6-519a10c4ee0c305c.ost.clients.hamburg.freifunk.net. [2a03:2267:4:0:519a:10c4:ee0c:305c])
        by smtp.gmail.com with ESMTPSA id q8sm28652453wrc.8.2020.03.31.07.25.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Mar 2020 07:25:42 -0700 (PDT)
Date:   Tue, 31 Mar 2020 16:25:29 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oliver Graute <Oliver.Graute@KoCoConnector.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: using cdns3-imx driver on imx8qm
Message-ID: <20200331142528.GA2246@portage>
References: <20200326170109.GA28051@optiplex>
 <20200327090554.GA31160@b29397-desktop>
 <20200327095028.GA19809@ripley>
 <20200327132153.GA31668@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327132153.GA31668@b29397-desktop>
X-URL:  https://raspberry.redbrain.me
X-PGP-Key: https://raspberry.redbrain.me/production/impressum/pub_key.asc
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/03/20, Peter Chen wrote:
> On 20-03-27 10:50:28, Oliver Graute wrote:
> > On 27/03/20, Peter Chen wrote:
> > > On 20-03-26 18:01:09, Oliver Graute wrote:
> > > > Hello,
> > > > 
> > > > What is the right way for using the new cdns3-imx glue usb driver on a
> > > > imx8qm soc with linux-next. I added this snippet in imx8qm.dtsi and
> > > > enabled the driver in the kernel configuration.
> > > > 
> > > 
> > > Hi Oliver,
> > > 
> > > I just checked linux-next-0326, there is no imx8qm dtsi. 
> > 
> > I'am currently using this series on top of linux-next-0214.
> > 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fpatch%2F11248331%2F&amp;data=02%7C01%7Cpeter.chen%40nxp.com%7C1b6963823b924b76684908d7d2344976%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637208994318640157&amp;sdata=HGG4r65ROTeY54uQArcWTZGT9%2BLrr0kndwmDegULtDw%3D&amp;reserved=0
> > 
> > 
> > > When I worked this driver, I use a internal version
> > > based on v5.4, the dts layout is different with internal tree.
> > 
> > I looked also at:
> > 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsource.codeaurora.org%2Fexternal%2Fimx%2Flinux-imx%2Ftree%2Farch%2Farm64%2Fboot%2Fdts%2Ffreescale%2Fimx8-ss-conn.dtsi%3Fh%3Dimx_5.4.3_2.0.0&amp;data=02%7C01%7Cpeter.chen%40nxp.com%7C1b6963823b924b76684908d7d2344976%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637208994318640157&amp;sdata=yTiMWh5BpWdtA%2B8Vy06KeCvg2jPzlgPOmKaM3fmK%2F6w%3D&amp;reserved=0
> > 
> > How do I adapt the usbotg3 for linux-next? I already ported some usb
> > related dependencies from imx8-ss-conn.dtsi. But the cdns3 core driver
> > is stucked at probe and currently I don't understand how the cdns3-imx glue
> > layer comes into play.
> > 
> 
> cdns3-imx is the parent device, the cdns3 core is the child device. The
> example dts like below:
> 
> 	usb3_lpcg: clock-controller@5b280000 {
> 		compatible = "fsl,imx8qxp-lpcg";
> 		reg = <0x5b280000 0x10000>;
> 		#clock-cells = <1>;
> 		bit-offset = <0 4 16 20 24 28>;
> 		clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> 			 <&conn_ipg_clk>,
> 			 <&conn_ipg_clk>,
> 			 <&conn_ipg_clk>,
> 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> 		clock-output-names = "usb3_app_clk",
> 				     "usb3_lpm_clk",
> 				     "usb3_ipg_clk",
> 				     "usb3_core_pclk",
> 				     "usb3_phy_clk",
> 				     "usb3_aclk";
> 		power-domains = <&pd IMX_SC_R_USB_2_PHY>;
> 	};
> 
> 	usbotg3: usb3@5b110000 {
> 		compatible = "fsl,imx8qm-usb3";
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		ranges;
> 		reg = <0x5B110000 0x10000>;
> 		clocks = <&usb3_lpcg 1>,
> 			 <&usb3_lpcg 0>,
> 			 <&usb3_lpcg 5>,
> 			 <&usb3_lpcg 2>,
> 			 <&usb3_lpcg 3>;
> 		clock-names = "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
> 			"usb3_ipg_clk", "usb3_core_pclk";
> 		assigned-clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> 		assigned-clock-rates = <125000000>, <12000000>, <250000000>;
> 		power-domains = <&pd IMX_SC_R_USB_2>;
> 		status = "disabled";
> 
> 		usbotg3_cdns3: cdns3 {
> 			compatible = "cdns,usb3";
> 			#address-cells = <1>;
> 			#size-cells = <1>;
> 			interrupt-parent = <&gic>;
> 			interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
> 			interrupt-names = "host", "peripheral", "otg";
> 			reg = <0x5B130000 0x10000>,     /* memory area for HOST registers */
> 				<0x5B140000 0x10000>,   /* memory area for DEVICE registers */
> 				<0x5B120000 0x10000>;   /* memory area for OTG/DRD registers */
> 			reg-names = "xhci", "dev", "otg";
> 			phys = <&usb3_phy>;
> 			phy-names = "cdns3,usb3-phy";
> 			status = "disabled";
> 		};
> 	};

Hello Peter,

thx for the dts example. Now I get "wait clkvld timeout" in
"cdns_imx_noncore_init()" So USB3_SSPHY_STATUS register seems to be wrong.

dmesg | grep imx 
[    1.065445] cdns3-imx 5b110000.usb3: Adding to iommu group 0
[    1.257309] imx-scu scu: NXP i.MX SCU Initialized
[    1.275489] imx-scu-clk: probe of gpt0_clk failed with error -5
[    1.291143] imx-scu-clk: probe of pwm_clk failed with error -22
[    1.302517] imx-scu-clk: probe of lcd_clk failed with error -22
[    1.341405] imx8qm-pinctrl scu:pinctrl: initialized IMX pinctrl driver
[    3.029484] cdns3-imx 5b110000.usb3: wait clkvld timeout
[    3.034891] cdns3-imx: probe of 5b110000.usb3 failed with error -110
[    3.237393] sdhci-esdhc-imx 5b030000.mmc: Got CD GPIO
[    3.242468] sdhci-esdhc-imx 5b030000.mmc: Got WP GPIO
[    3.316687] imx8qxp-lpcg-clk 5a4a0000.clock-controller: ignoring dependency for device, assuming no driver

Some Idea howto fix that?

Best regards,

Oliver
