Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64FA219FA11
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 18:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgDFQZf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 12:25:35 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41041 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728913AbgDFQZf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 12:25:35 -0400
Received: by mail-wr1-f65.google.com with SMTP id h9so133053wrc.8
        for <linux-usb@vger.kernel.org>; Mon, 06 Apr 2020 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4GfYEkVzNCb4x29lNFnBeqY4TVhjIHPj9OCCd13ZWY8=;
        b=iIAGEXlKTpGqznPcMQc+mXZxjTG2ViGE788I82K6UcZ32IzXYGJ+H03wAzqTw1K0oR
         97R1uK6+ptravuItaMly599NnwJHMPOso4mZNIZu92U+JDx2KRnAzYhik329qJoPEKi2
         vKS6CNSEz5lF+oIs+BEeVQYfR3bovgR54G8qQqtS6W1IVlXQ8Rld2a63foZ8ZqgXW4MA
         gEnifvIhi4Ob/5QDScGS8iS41R+9ABvaIws/Zty2u65QrjK8mtY8W3Sg3TkXvQPs8vXF
         k+g8uZB+mfDOxqbgR9HiklL5SsaIAQ5SGPP+AuoIiDNdLNOTA5BHbTYbMTyZpq98VhKA
         jZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4GfYEkVzNCb4x29lNFnBeqY4TVhjIHPj9OCCd13ZWY8=;
        b=rxK6Bl6v/ARrc3nLE0rkp5MqEk8PxL5e5EXHfZD0oirncnNG8NXUbOY023z+FRxa/q
         1A0FoiExwReTYYQ7aw862vQ0a60AFlEUaQKids3YlUeV5DuqV67fFCJCUQQYrFl9yB3J
         uyjV3tene4Gu+cRL0qf1KFBPetsrzumzKk5cpT0FwKupSV6+wz/LJgfF8IbdUMZ/Gw1e
         gEDlTyNPyUBoTCUoBaqE8uGYwXncUXXZ4ORoMnRKs4r04DBtHweEB8LY4FVKPcasa/Uu
         781qry9rwafmvIaHwQtLMICfJtic9EPi3NdH1K3Cwmd7d632NL3NT8zYCQErNi1ghW6W
         In6A==
X-Gm-Message-State: AGi0PuYoEQDuI1XcrE6QZlbF+iqyzDEMQEIiWhpCa/zSIO/6hr0Sj9LW
        0Pe8VozyKd49+pMfR/8E5+U=
X-Google-Smtp-Source: APiQypIgVBpk2IfHT0k32l3inmZvXXBaSfhpqSlPP00H2yvWhSLu6igC0z//U1ocspry0vJr3Yot/w==
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr3811416wru.91.1586190320221;
        Mon, 06 Apr 2020 09:25:20 -0700 (PDT)
Received: from localhost (ipv6-b93f0ba3014ec9a6.ost.clients.hamburg.freifunk.net. [2a03:2267:4:0:b93f:ba3:14e:c9a6])
        by smtp.gmail.com with ESMTPSA id r3sm27674026wrm.35.2020.04.06.09.25.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Apr 2020 09:25:19 -0700 (PDT)
Date:   Mon, 6 Apr 2020 18:25:17 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>
Subject: Re: using cdns3-imx driver on imx8qm
Message-ID: <20200406162517.GA3320@portage>
References: <20200326170109.GA28051@optiplex>
 <20200327090554.GA31160@b29397-desktop>
 <20200327095028.GA19809@ripley>
 <20200327132153.GA31668@b29397-desktop>
 <20200331142528.GA2246@portage>
 <AM7PR04MB715728ED4EF3715A7798A5A08BC80@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200403144044.GA49880@archlinux.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403144044.GA49880@archlinux.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/04/20, Oliver Graute wrote:
> On 31/03/20, Peter Chen wrote:
> >   
> > > > 		compatible = "fsl,imx8qxp-lpcg";
> > > > 		reg = <0x5b280000 0x10000>;
> > > > 		#clock-cells = <1>;
> > > > 		bit-offset = <0 4 16 20 24 28>;
> > > > 		clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> > > > 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> > > > 			 <&conn_ipg_clk>,
> > > > 			 <&conn_ipg_clk>,
> > > > 			 <&conn_ipg_clk>,
> > > > 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> > > > 		clock-output-names = "usb3_app_clk",
> > > > 				     "usb3_lpm_clk",
> > > > 				     "usb3_ipg_clk",
> > > > 				     "usb3_core_pclk",
> > > > 				     "usb3_phy_clk",
> > > > 				     "usb3_aclk";
> > > > 		power-domains = <&pd IMX_SC_R_USB_2_PHY>;
> > > > 	};
> > > >
> > > > 	usbotg3: usb3@5b110000 {
> > > > 		compatible = "fsl,imx8qm-usb3";
> > > > 		#address-cells = <1>;
> > > > 		#size-cells = <1>;
> > > > 		ranges;
> > > > 		reg = <0x5B110000 0x10000>;
> > > > 		clocks = <&usb3_lpcg 1>,
> > > > 			 <&usb3_lpcg 0>,
> > > > 			 <&usb3_lpcg 5>,
> > > > 			 <&usb3_lpcg 2>,
> > > > 			 <&usb3_lpcg 3>;
> > > > 		clock-names = "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
> > > > 			"usb3_ipg_clk", "usb3_core_pclk";
> > > > 		assigned-clocks = <&clk IMX_SC_R_USB_2
> > > IMX_SC_PM_CLK_PER>,
> > > > 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> > > > 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> > > > 		assigned-clock-rates = <125000000>, <12000000>, <250000000>;
> > > > 		power-domains = <&pd IMX_SC_R_USB_2>;
> > > > 		status = "disabled";
> > > >
> > > > 		usbotg3_cdns3: cdns3 {
> > > > 			compatible = "cdns,usb3";
> > > > 			#address-cells = <1>;
> > > > 			#size-cells = <1>;
> > > > 			interrupt-parent = <&gic>;
> > > > 			interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> > > > 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> > > > 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
> > > > 			interrupt-names = "host", "peripheral", "otg";
> > > > 			reg = <0x5B130000 0x10000>,     /* memory area for HOST
> > > registers */
> > > > 				<0x5B140000 0x10000>,   /* memory area for
> > > DEVICE registers */
> > > > 				<0x5B120000 0x10000>;   /* memory area for
> > > OTG/DRD registers */
> > > > 			reg-names = "xhci", "dev", "otg";
> > > > 			phys = <&usb3_phy>;
> > > > 			phy-names = "cdns3,usb3-phy";
> > > > 			status = "disabled";
> > > > 		};
> > > > 	};
> > > 
> > > Hello Peter,
> > > 
> > > thx for the dts example. Now I get "wait clkvld timeout" in "cdns_imx_noncore_init()"
> > > So USB3_SSPHY_STATUS register seems to be wrong.
> > > 
> > > dmesg | grep imx
> > > [    1.065445] cdns3-imx 5b110000.usb3: Adding to iommu group 0
> > > [    1.257309] imx-scu scu: NXP i.MX SCU Initialized
> > > [    1.275489] imx-scu-clk: probe of gpt0_clk failed with error -5
> > > [    1.291143] imx-scu-clk: probe of pwm_clk failed with error -22
> > > [    1.302517] imx-scu-clk: probe of lcd_clk failed with error -22
> > > [    1.341405] imx8qm-pinctrl scu:pinctrl: initialized IMX pinctrl driver
> > > [    3.029484] cdns3-imx 5b110000.usb3: wait clkvld timeout
> > > [    3.034891] cdns3-imx: probe of 5b110000.usb3 failed with error -110
> > > [    3.237393] sdhci-esdhc-imx 5b030000.mmc: Got CD GPIO
> > > [    3.242468] sdhci-esdhc-imx 5b030000.mmc: Got WP GPIO
> > > [    3.316687] imx8qxp-lpcg-clk 5a4a0000.clock-controller: ignoring dependency for
> > > device, assuming no driver
> > > 
> >  
> > Make sure the five clocks in dts are correct, and print the USB3_SSPHY_STATUS if
> > timeout still exists.
> 
> ok thx, we got it fixed by replacing:
> 
>  clocks = <&usb3_lpcg 1>,
>           <&usb3_lpcg 0>,
>           <&usb3_lpcg 4>,
>           <&usb3_lpcg 2>,
>           <&usb3_lpcg 3>;
> 
> with this:
>  
>  clocks = <&usb3_lpcg IMX_LPCG_CLK_1>,
>           <&usb3_lpcg IMX_LPCG_CLK_0>,
>           <&usb3_lpcg IMX_LPCG_CLK_7>,
>           <&usb3_lpcg IMX_LPCG_CLK_4>,
>           <&usb3_lpcg IMX_LPCG_CLK_5>;
> 
> now the "wait clkvld timeout" is gone and the USB3_SSPHY_STATUS register
> is very similar to another imx8qm device which runs linux-imx from NXP.
> 
> Now I try to get into USB HOST mode:
> 
> --- a/drivers/usb/cdns3/cdns3-imx.c
> +++ b/drivers/usb/cdns3/cdns3-imx.c
> @@ -113,11 +115,11 @@ static int cdns_imx_noncore_init(struct cdns_imx *data)
>         udelay(1);
> 
>         value = cdns_imx_readl(data, USB3_CORE_CTRL1);
> -       value = (value & ~MODE_STRAP_MASK) | OTG_MODE | OC_DISABLE;
> +       value = (value & ~MODE_STRAP_MASK) | HOST_MODE | OC_DISABLE;
>         cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> 
> Is this change necessary?
> 
> Do I need special changes on xhci.c do get it work with cdns-imx in host mode?
> 
> I'am stuck at:
> 
> [   16.697525] xhci-hcd xhci-hcd.0.auto: can't setup: -110

A bit more debug information:

[    5.988571] cdns-usb3 5b130000.cdns3: DRD version v0 (00000100)
[    6.012664] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[    6.018173] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
[    6.036369] xhci-hcd xhci-hcd.0.auto: // Halt the HC
[    6.041335] xhci-hcd xhci-hcd.0.auto: Resetting HCD
[    6.056364] xhci-hcd xhci-hcd.0.auto: // Reset the HC
[   16.062450] xhci-hcd xhci-hcd.0.auto: can't setup: -110
[   16.067686] xhci-hcd xhci-hcd.0.auto: USB bus 1 deregistered
[   16.073361] xhci-hcd: probe of xhci-hcd.0.auto failed with error -110

Best Regards,

Oliver
