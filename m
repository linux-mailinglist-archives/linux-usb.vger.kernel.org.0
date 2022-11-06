Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316C361E34A
	for <lists+linux-usb@lfdr.de>; Sun,  6 Nov 2022 16:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiKFPzT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Nov 2022 10:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiKFPzS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Nov 2022 10:55:18 -0500
Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09CFCDF51;
        Sun,  6 Nov 2022 07:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667750097; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=XNiv+CF7+Vs1rdY6a6EuF+1eJnqZQK/qGbQelTOrSa0EUkFwCTkmRX0D10G83loms2xu0CdspPkwCWlxDDZ38KQwGOv55kvu3znSn8merlJwJnqxULgGQqhIJWRHvwerjwa1W12XdXMsNgCeHvtWuVtnU6Ii5ShAHn7RHMYv/N4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1667750097; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=y6fXoKKrDJIOduh8b2eg9tngV6yDXgIm+yDwzoQwtGg=; 
        b=BHQGPW3Xay8ZQLy2KJEFTVjcRtXabnSO4cPlHkdTUwsv0Vt2k8piEq2HO2YFP3K050MAoBNvovYsJeImoDN3tMJW8F9pgQuIoGn5XIOde0Y1kgT4ttw7vZ5YmcG3RdJexCxtpiHNqJgqPwZiczHeD4DBe85A8oHDQIaXq8T7kng=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=icenowy.me;
        spf=pass  smtp.mailfrom=uwu@icenowy.me;
        dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1667750097;
        s=zmail; d=icenowy.me; i=uwu@icenowy.me;
        h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=y6fXoKKrDJIOduh8b2eg9tngV6yDXgIm+yDwzoQwtGg=;
        b=UXoiLHPi/gNN/lNsmmC93LqgNGqppYri8Y/CN4nyVcc3bWSaSyHRtuzPQI1xSa3q
        EE8KlC5ulke76X2rqIgoHat01cbMXpy2CAUmpT9eNq2hhGQmuvIVc2c5NF6yE3pwIiE
        e58n3VXcGhvh8OlZ0rwq84G9yRUel8jUKCxiqFMY=
Received: from [127.0.0.1] (112.94.102.138 [112.94.102.138]) by mx.zohomail.com
        with SMTPS id 1667750094773943.5610305071772; Sun, 6 Nov 2022 07:54:54 -0800 (PST)
Date:   Sun, 06 Nov 2022 23:54:46 +0800
From:   Icenowy Zheng <uwu@icenowy.me>
To:     Andre Przywara <andre.przywara@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_10/11=5D_phy=3A_sun4i-usb=3A_R?= =?US-ASCII?Q?eplace_types_with_explicit_quirk_flags?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221106154826.6687-11-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-11-andre.przywara@arm.com>
Message-ID: <D8382138-8943-46F7-B6A6-F83DF98E26AE@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



=E4=BA=8E 2022=E5=B9=B411=E6=9C=886=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
1:48:25, Andre Przywara <andre=2Eprzywara@arm=2Ecom> =E5=86=99=E5=88=B0:
>So far we were assigning some crude "type" (SoC name, really) to each
>Allwinner USB PHY model, then guarding certain quirks based on this=2E
>This does not only look weird, but gets more or more cumbersome to
>maintain=2E
>
>Remove the bogus type names altogether, instead introduce flags for each
>quirk, and explicitly check for them=2E
>This improves readability, and simplifies future extensions=2E
>
>Signed-off-by: Andre Przywara <andre=2Eprzywara@arm=2Ecom>
>---
> drivers/phy/allwinner/phy-sun4i-usb=2Ec | 50 ++++++++-------------------
> 1 file changed, 15 insertions(+), 35 deletions(-)
>
>diff --git a/drivers/phy/allwinner/phy-sun4i-usb=2Ec b/drivers/phy/allwin=
ner/phy-sun4i-usb=2Ec
>index 51fb24c6dcb3=2E=2E422129c66282 100644
>--- a/drivers/phy/allwinner/phy-sun4i-usb=2Ec
>+++ b/drivers/phy/allwinner/phy-sun4i-usb=2Ec
>@@ -99,27 +99,17 @@
> #define DEBOUNCE_TIME			msecs_to_jiffies(50)
> #define POLL_TIME			msecs_to_jiffies(250)
>=20
>-enum sun4i_usb_phy_type {
>-	sun4i_a10_phy,
>-	sun6i_a31_phy,
>-	sun8i_a33_phy,
>-	sun8i_a83t_phy,
>-	sun8i_h3_phy,
>-	sun8i_r40_phy,
>-	sun8i_v3s_phy,
>-	sun50i_a64_phy,
>-	sun50i_h6_phy,
>-};
>-
> struct sun4i_usb_phy_cfg {
> 	int num_phys;
> 	int hsic_index;
>-	enum sun4i_usb_phy_type type;
> 	u32 disc_thresh;
> 	u32 hci_phy_ctl_clear;
> 	u8 phyctl_offset;
> 	bool dedicated_clocks;
> 	bool phy0_dual_route;
>+	bool phy2_is_hsic;

Maybe use a `int hsic_phy` instead? But the problem is this practice is
assuming USB0 could not be HSIC -- although USB0 is usually OTG=2E

>+	bool siddq_in_base;
>+	bool poll_vbusen;
> 	int missing_phys;
> };
>=20
>@@ -251,7 +241,7 @@ static void sun4i_usb_phy_passby(struct sun4i_usb_phy=
 *phy, int enable)
> 		SUNXI_AHB_INCRX_ALIGN_EN | SUNXI_ULPI_BYPASS_EN;
>=20
> 	/* A83T USB2 is HSIC */
>-	if (phy_data->cfg->type =3D=3D sun8i_a83t_phy && phy->index =3D=3D 2)
>+	if (phy_data->cfg->phy2_is_hsic && phy->index =3D=3D 2)
> 		bits |=3D SUNXI_EHCI_HS_FORCE | SUNXI_HSIC_CONNECT_INT |
> 			SUNXI_HSIC;
>=20
>@@ -295,8 +285,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
> 		writel(val, phy->pmu + REG_HCI_PHY_CTL);
> 	}
>=20
>-	if (data->cfg->type =3D=3D sun8i_a83t_phy ||
>-	    data->cfg->type =3D=3D sun50i_h6_phy) {
>+	if (data->cfg->siddq_in_base) {
> 		if (phy->index =3D=3D 0) {
> 			val =3D readl(data->base + data->cfg->phyctl_offset);
> 			val |=3D PHY_CTL_VBUSVLDEXT;
>@@ -340,8 +329,7 @@ static int sun4i_usb_phy_exit(struct phy *_phy)
> 	struct sun4i_usb_phy_data *data =3D to_sun4i_usb_phy_data(phy);
>=20
> 	if (phy->index =3D=3D 0) {
>-		if (data->cfg->type =3D=3D sun8i_a83t_phy ||
>-		    data->cfg->type =3D=3D sun50i_h6_phy) {
>+		if (data->cfg->siddq_in_base) {
> 			void __iomem *phyctl =3D data->base +
> 				data->cfg->phyctl_offset;
>=20
>@@ -414,9 +402,8 @@ static bool sun4i_usb_phy0_poll(struct sun4i_usb_phy_=
data *data)
> 	 * vbus using the N_VBUSEN pin on the pmic, so we must poll
> 	 * when using the pmic for vbus-det _and_ we're driving vbus=2E
> 	 */
>-	if ((data->cfg->type =3D=3D sun6i_a31_phy ||
>-	     data->cfg->type =3D=3D sun8i_a33_phy) &&
>-	    data->vbus_power_supply && data->phys[0]=2Eregulator_on)
>+	if (data->cfg->poll_vbusen && data->vbus_power_supply &&
>+	    data->phys[0]=2Eregulator_on)
> 		return true;
>=20
> 	return false;
>@@ -861,7 +848,6 @@ static int sun4i_usb_phy_probe(struct platform_device=
 *pdev)
>=20
> static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg =3D {
> 	=2Enum_phys =3D 1,
>-	=2Etype =3D sun4i_a10_phy,
> 	=2Edisc_thresh =3D 3,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A10,
> 	=2Ededicated_clocks =3D true,
>@@ -869,7 +855,6 @@ static const struct sun4i_usb_phy_cfg suniv_f1c100s_c=
fg =3D {
>=20
> static const struct sun4i_usb_phy_cfg sun4i_a10_cfg =3D {
> 	=2Enum_phys =3D 3,
>-	=2Etype =3D sun4i_a10_phy,
> 	=2Edisc_thresh =3D 3,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A10,
> 	=2Ededicated_clocks =3D false,
>@@ -877,7 +862,6 @@ static const struct sun4i_usb_phy_cfg sun4i_a10_cfg =
=3D {
>=20
> static const struct sun4i_usb_phy_cfg sun5i_a13_cfg =3D {
> 	=2Enum_phys =3D 2,
>-	=2Etype =3D sun4i_a10_phy,
> 	=2Edisc_thresh =3D 2,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A10,
> 	=2Ededicated_clocks =3D false,
>@@ -885,15 +869,14 @@ static const struct sun4i_usb_phy_cfg sun5i_a13_cfg=
 =3D {
>=20
> static const struct sun4i_usb_phy_cfg sun6i_a31_cfg =3D {
> 	=2Enum_phys =3D 3,
>-	=2Etype =3D sun6i_a31_phy,
> 	=2Edisc_thresh =3D 3,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A10,
> 	=2Ededicated_clocks =3D true,
>+	=2Epoll_vbusen =3D true,
> };
>=20
> static const struct sun4i_usb_phy_cfg sun7i_a20_cfg =3D {
> 	=2Enum_phys =3D 3,
>-	=2Etype =3D sun4i_a10_phy,
> 	=2Edisc_thresh =3D 2,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A10,
> 	=2Ededicated_clocks =3D false,
>@@ -901,31 +884,31 @@ static const struct sun4i_usb_phy_cfg sun7i_a20_cfg=
 =3D {
>=20
> static const struct sun4i_usb_phy_cfg sun8i_a23_cfg =3D {
> 	=2Enum_phys =3D 2,
>-	=2Etype =3D sun6i_a31_phy,
> 	=2Edisc_thresh =3D 3,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A10,
> 	=2Ededicated_clocks =3D true,
>+	=2Epoll_vbusen =3D true,
> };
>=20
> static const struct sun4i_usb_phy_cfg sun8i_a33_cfg =3D {
> 	=2Enum_phys =3D 2,
>-	=2Etype =3D sun8i_a33_phy,
> 	=2Edisc_thresh =3D 3,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A33,
> 	=2Ededicated_clocks =3D true,
>+	=2Epoll_vbusen =3D true,
> };
>=20
> static const struct sun4i_usb_phy_cfg sun8i_a83t_cfg =3D {
> 	=2Enum_phys =3D 3,
> 	=2Ehsic_index =3D 2,
>-	=2Etype =3D sun8i_a83t_phy,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A33,
> 	=2Ededicated_clocks =3D true,
>+	=2Esiddq_in_base =3D true,
>+	=2Ephy2_is_hsic =3D true,
> };
>=20
> static const struct sun4i_usb_phy_cfg sun8i_h3_cfg =3D {
> 	=2Enum_phys =3D 4,
>-	=2Etype =3D sun8i_h3_phy,
> 	=2Edisc_thresh =3D 3,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A33,
> 	=2Ededicated_clocks =3D true,
>@@ -935,7 +918,6 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg =
=3D {
>=20
> static const struct sun4i_usb_phy_cfg sun8i_r40_cfg =3D {
> 	=2Enum_phys =3D 3,
>-	=2Etype =3D sun8i_r40_phy,
> 	=2Edisc_thresh =3D 3,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A33,
> 	=2Ededicated_clocks =3D true,
>@@ -945,7 +927,6 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg =
=3D {
>=20
> static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg =3D {
> 	=2Enum_phys =3D 1,
>-	=2Etype =3D sun8i_v3s_phy,
> 	=2Edisc_thresh =3D 3,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A33,
> 	=2Ededicated_clocks =3D true,
>@@ -955,16 +936,15 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg=
 =3D {
>=20
> static const struct sun4i_usb_phy_cfg sun20i_d1_cfg =3D {
> 	=2Enum_phys =3D 2,
>-	=2Etype =3D sun50i_h6_phy,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A33,
> 	=2Ededicated_clocks =3D true,
> 	=2Ehci_phy_ctl_clear =3D PHY_CTL_SIDDQ,
> 	=2Ephy0_dual_route =3D true,
>+	=2Esiddq_in_base =3D true,
> };
>=20
> static const struct sun4i_usb_phy_cfg sun50i_a64_cfg =3D {
> 	=2Enum_phys =3D 2,
>-	=2Etype =3D sun50i_a64_phy,
> 	=2Edisc_thresh =3D 3,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A33,
> 	=2Ededicated_clocks =3D true,
>@@ -974,11 +954,11 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cf=
g =3D {
>=20
> static const struct sun4i_usb_phy_cfg sun50i_h6_cfg =3D {
> 	=2Enum_phys =3D 4,
>-	=2Etype =3D sun50i_h6_phy,
> 	=2Ephyctl_offset =3D REG_PHYCTL_A33,
> 	=2Ededicated_clocks =3D true,
> 	=2Ephy0_dual_route =3D true,
> 	=2Emissing_phys =3D BIT(1) | BIT(2),
>+	=2Esiddq_in_base =3D true,
> };
>=20
> static const struct of_device_id sun4i_usb_phy_of_match[] =3D {
