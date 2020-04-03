Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75BE19D95D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2020 16:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391072AbgDCOn7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Apr 2020 10:43:59 -0400
Received: from mail-eopbgr40088.outbound.protection.outlook.com ([40.107.4.88]:55365
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390954AbgDCOn7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Apr 2020 10:43:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVMtTydLrBif72eIIyxVFi1N7fx9uIlEiCRQZaABlxYpEpmZ2L/Z0pi4LrM7whzN7CyqZfAbSkASdI9t5C1ZhCGGZbRjuyjUz6XWdQZCiyN2Lhn4lbmQNpDz15pjkhTQChinLV/Cc4fpHyeVKlHi9AaDyH4ZhTBlHOW1I91msvNSbXccu5nlwxODRpk3vqBGjjWFubi1sN90E1DZG7ORQm7f3z6g00CPgH75RFw63e7ArpPUDqFlaTaNwmE9/vsnsw0cqWqVsp8M5RSQflsfG1ShTJete1ycbClOuGX/N5upAxXMP36iYf+N/bQEDQlK/QzMGSkPJ04BHFWKt4Hipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vdb6VpD5DH6V9BvA2w3TU68C7mvmYhyl7s5l8itwYAs=;
 b=lFOMHtRN2hucHVPy9ukXZQlaKS9ZwZhlhdESmkoWikUY4uGn0FAEeFjQq5ASMN6FPaH7UL5hkw0eV2keud5oQsJaCtKkwaNx6J8h32aHOMDPKq12IDHedLG6A4vomZCLWFSTZC0vraxF2Gh+HAElyI21gnC10QhzVdybXTJ8CRDPW8DEJid9VoQCIxDNgfyYm3oZbxTh4M4N9biK6uZHQmBSZ+CkAT6odWeqqqhhAc9GlDqM95pbUuSwVDCClzLOADg+O5431o6BHFU/U4ykbrzWXDuN2MqVdGPeIKzSO+M90+Z5nN4A5KXKv6aU26+kOvJh7/0Su6l8rydvXh2YYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vdb6VpD5DH6V9BvA2w3TU68C7mvmYhyl7s5l8itwYAs=;
 b=TMwQAOeFEzRkMIiUYh2iQy3RfP3Hzp49XIrkBf2oZG5G1y/oTfqpg0wqPs7d0qt8Cpn6Jl1eyhMvQxHcQftoxpYKOt0QD6Z/Bm0xF1mnbjx9lm49fbJ6QAEjNtciUgKEuwlXXd62G2Lrjmx0zVoJROVAOkvX9j3KWcvsc4xtneI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oliver.graute@kococonnector.com; 
Received: from AM0PR09MB4067.eurprd09.prod.outlook.com (10.186.128.206) by
 AM0PR09MB2292.eurprd09.prod.outlook.com (20.177.109.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Fri, 3 Apr 2020 14:43:55 +0000
Received: from AM0PR09MB4067.eurprd09.prod.outlook.com
 ([fe80::7559:adc1:bb07:495f]) by AM0PR09MB4067.eurprd09.prod.outlook.com
 ([fe80::7559:adc1:bb07:495f%3]) with mapi id 15.20.2878.014; Fri, 3 Apr 2020
 14:43:55 +0000
Date:   Fri, 3 Apr 2020 16:40:44 +0200
From:   Oliver Graute <oliver.graute@kococonnector.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: using cdns3-imx driver on imx8qm
Message-ID: <20200403144044.GA49880@archlinux.localdomain>
References: <20200326170109.GA28051@optiplex>
 <20200327090554.GA31160@b29397-desktop>
 <20200327095028.GA19809@ripley>
 <20200327132153.GA31668@b29397-desktop>
 <20200331142528.GA2246@portage>
 <AM7PR04MB715728ED4EF3715A7798A5A08BC80@AM7PR04MB7157.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB715728ED4EF3715A7798A5A08BC80@AM7PR04MB7157.eurprd04.prod.outlook.com>
X-ClientProxiedBy: AM0PR06CA0058.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::35) To AM0PR09MB4067.eurprd09.prod.outlook.com
 (2603:10a6:208:194::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (31.17.95.22) by AM0PR06CA0058.eurprd06.prod.outlook.com (2603:10a6:208:aa::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Fri, 3 Apr 2020 14:43:54 +0000
X-Originating-IP: [31.17.95.22]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c30b8d1f-85b3-429e-bc76-08d7d7dd6f15
X-MS-TrafficTypeDiagnostic: AM0PR09MB2292:
X-Microsoft-Antispam-PRVS: <AM0PR09MB22921374447B121109D7AED8EBC70@AM0PR09MB2292.eurprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0362BF9FDB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR09MB4067.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(346002)(136003)(366004)(376002)(39830400003)(316002)(66556008)(52116002)(7416002)(86362001)(6486002)(6916009)(9686003)(6666004)(33656002)(4326008)(186003)(16526019)(54906003)(26005)(1076003)(81166006)(44832011)(2906002)(66946007)(956004)(6496006)(8936002)(8676002)(66476007)(5660300002)(81156014)(508600001)(32563001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: kococonnector.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 51YcscIFrwRMMF0mAe+8IBNHgOOxYOyNLc0ld9GsqpIj9TIdZtddaT0gXBSFgjvmpc7hKO6J7Zcpq6jY2Lx7pcDj/IaXaoCHfd9mN9Llnn3A/CLa6QoGjtzZkKfYzZ45AOwejcPQXHVBhkbzPynwx35NhqJLKv2JZHtt6ENyENw6hkp94gPECO+mkZKaumuGtzju5WOF1BwUg7Njlibp8oahjTyYo1sAP37zVK1TPq/th7x6jOpB+AuawLmx59xq5Z8b464RpswcmE4TtRvtdibYQl1c3H0yZbD9WqonndPE12H7nSIy6AkYgb5O5tJ7I1pPlp5nJ5wYtlMVq41OG5PKNXqCm0MPLP/eLnNmlTTgM1OqnHPI5RMqJm94HUv9XOh0tXPvlGEIqntYnH8iC0K9CKTSg0Vqtrn3z3FIPoeTX/9AGWajcjwmK1c4O3oF6mCKe8CYkUhT0wn5tyGhaHP5b2aTVmz4DPXN+wT5O/s=
X-MS-Exchange-AntiSpam-MessageData: 2AiyrYR9CyV9l6VcjovQi7DzjxFmBQvHPJ+LKChBi6Waka+gXjPKqftA3E7dvaV10A72WkXVT/vqibWSXHw+4JPtm3GdnjttFY4E9vW+xYnLmR3ch4482n5PVbvloWNSuJ53nD4gp0oinGwB42/mYg==
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30b8d1f-85b3-429e-bc76-08d7d7dd6f15
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2020 14:43:54.9784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0dBaKLoZMw0IfMBwKQ0T1khFYP4Mm+v1QK57/8rHQqEuKmOsU3f7Bs0cd78pwtAy+P4TQ7ZQHDbuWW+1xYQsFix1J7aFPxmdKIgJqudv50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2292
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31/03/20, Peter Chen wrote:
>   
> > > 		compatible = "fsl,imx8qxp-lpcg";
> > > 		reg = <0x5b280000 0x10000>;
> > > 		#clock-cells = <1>;
> > > 		bit-offset = <0 4 16 20 24 28>;
> > > 		clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> > > 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> > > 			 <&conn_ipg_clk>,
> > > 			 <&conn_ipg_clk>,
> > > 			 <&conn_ipg_clk>,
> > > 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> > > 		clock-output-names = "usb3_app_clk",
> > > 				     "usb3_lpm_clk",
> > > 				     "usb3_ipg_clk",
> > > 				     "usb3_core_pclk",
> > > 				     "usb3_phy_clk",
> > > 				     "usb3_aclk";
> > > 		power-domains = <&pd IMX_SC_R_USB_2_PHY>;
> > > 	};
> > >
> > > 	usbotg3: usb3@5b110000 {
> > > 		compatible = "fsl,imx8qm-usb3";
> > > 		#address-cells = <1>;
> > > 		#size-cells = <1>;
> > > 		ranges;
> > > 		reg = <0x5B110000 0x10000>;
> > > 		clocks = <&usb3_lpcg 1>,
> > > 			 <&usb3_lpcg 0>,
> > > 			 <&usb3_lpcg 5>,
> > > 			 <&usb3_lpcg 2>,
> > > 			 <&usb3_lpcg 3>;
> > > 		clock-names = "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
> > > 			"usb3_ipg_clk", "usb3_core_pclk";
> > > 		assigned-clocks = <&clk IMX_SC_R_USB_2
> > IMX_SC_PM_CLK_PER>,
> > > 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> > > 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> > > 		assigned-clock-rates = <125000000>, <12000000>, <250000000>;
> > > 		power-domains = <&pd IMX_SC_R_USB_2>;
> > > 		status = "disabled";
> > >
> > > 		usbotg3_cdns3: cdns3 {
> > > 			compatible = "cdns,usb3";
> > > 			#address-cells = <1>;
> > > 			#size-cells = <1>;
> > > 			interrupt-parent = <&gic>;
> > > 			interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> > > 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> > > 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
> > > 			interrupt-names = "host", "peripheral", "otg";
> > > 			reg = <0x5B130000 0x10000>,     /* memory area for HOST
> > registers */
> > > 				<0x5B140000 0x10000>,   /* memory area for
> > DEVICE registers */
> > > 				<0x5B120000 0x10000>;   /* memory area for
> > OTG/DRD registers */
> > > 			reg-names = "xhci", "dev", "otg";
> > > 			phys = <&usb3_phy>;
> > > 			phy-names = "cdns3,usb3-phy";
> > > 			status = "disabled";
> > > 		};
> > > 	};
> > 
> > Hello Peter,
> > 
> > thx for the dts example. Now I get "wait clkvld timeout" in "cdns_imx_noncore_init()"
> > So USB3_SSPHY_STATUS register seems to be wrong.
> > 
> > dmesg | grep imx
> > [    1.065445] cdns3-imx 5b110000.usb3: Adding to iommu group 0
> > [    1.257309] imx-scu scu: NXP i.MX SCU Initialized
> > [    1.275489] imx-scu-clk: probe of gpt0_clk failed with error -5
> > [    1.291143] imx-scu-clk: probe of pwm_clk failed with error -22
> > [    1.302517] imx-scu-clk: probe of lcd_clk failed with error -22
> > [    1.341405] imx8qm-pinctrl scu:pinctrl: initialized IMX pinctrl driver
> > [    3.029484] cdns3-imx 5b110000.usb3: wait clkvld timeout
> > [    3.034891] cdns3-imx: probe of 5b110000.usb3 failed with error -110
> > [    3.237393] sdhci-esdhc-imx 5b030000.mmc: Got CD GPIO
> > [    3.242468] sdhci-esdhc-imx 5b030000.mmc: Got WP GPIO
> > [    3.316687] imx8qxp-lpcg-clk 5a4a0000.clock-controller: ignoring dependency for
> > device, assuming no driver
> > 
>  
> Make sure the five clocks in dts are correct, and print the USB3_SSPHY_STATUS if
> timeout still exists.

ok thx, we got it fixed by replacing:

 clocks = <&usb3_lpcg 1>,
          <&usb3_lpcg 0>,
          <&usb3_lpcg 4>,
          <&usb3_lpcg 2>,
          <&usb3_lpcg 3>;

with this:
 
 clocks = <&usb3_lpcg IMX_LPCG_CLK_1>,
          <&usb3_lpcg IMX_LPCG_CLK_0>,
          <&usb3_lpcg IMX_LPCG_CLK_7>,
          <&usb3_lpcg IMX_LPCG_CLK_4>,
          <&usb3_lpcg IMX_LPCG_CLK_5>;

now the "wait clkvld timeout" is gone and the USB3_SSPHY_STATUS register
is very similar to another imx8qm device which runs linux-imx from NXP.

Now I try to get into USB HOST mode:

--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -113,11 +115,11 @@ static int cdns_imx_noncore_init(struct cdns_imx *data)
        udelay(1);

        value = cdns_imx_readl(data, USB3_CORE_CTRL1);
-       value = (value & ~MODE_STRAP_MASK) | OTG_MODE | OC_DISABLE;
+       value = (value & ~MODE_STRAP_MASK) | HOST_MODE | OC_DISABLE;
        cdns_imx_writel(data, USB3_CORE_CTRL1, value);

Is this change necessary?

Do I need special changes on xhci.c do get it work with cdns-imx in host mode?

I'am stuck at:

[   16.697525] xhci-hcd xhci-hcd.0.auto: can't setup: -110

I already tried to add the Intel quirk:

udelay(1000) in xhci_reset() but without success.

Is the host mode working on your side?

Best regards,

Oliver

