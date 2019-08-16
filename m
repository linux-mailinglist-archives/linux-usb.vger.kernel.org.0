Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 267338F8C9
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 04:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfHPCQy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 22:16:54 -0400
Received: from mail-eopbgr00050.outbound.protection.outlook.com ([40.107.0.50]:45569
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726279AbfHPCQx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 22:16:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDZhSC1oaje8jgRFzIgqLGKAhierBUxkdlsg0xWPKTiRoM7BGRrOd1RqUZ48uWH4oBqOtxOUNTsFYq0vhcqddk/M+gmugmwA4VoOPpJUlnxqzujVpTnje3ziTWo/LmTW2bqEnoAwwp7Eo2hNtkm/cwv5gHxZlKXrCn5sYFKvaRbyGlzL4tlbk0C0ddejnshPw+zl7DBXwcM7TdvaNMPU9oyDWQ6yViC5J1/laJjjNeOi9Hqwpl5kcFpcuXZWzX6YSugbSerWtVaoICMP9rpoIWto1vfLey3hflRu0SNq69xia8oHVQvFcZ9+NCSg8iWEYVLAPvUYZAIPeF1XL1Uyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGYaZSoCa4la/+ttKqzi+h4KtT+gH4RfkrTNbtD7xZs=;
 b=mk5IdHKMsIKHQ+jTEwdfDqd6OGGnryFXCZAgbxkyniKjV+g1kA8zpKGBcb2BWSssQHpctgimxO4DKlaMpcidV8aRNqGsIlZQk+QOvjhI79HHFkGrtWYGqaILUrV6up1BaKq+i43cEO6FkJNHiEwsdbYrEhNqSvkrQYqBeXT+FZ8xTbNMIXYBIk+ddx3sBnPJ3HdN9MsPE4s0bNJqBHXNAy8z/ynob79eKSVA7vAI6TPTe/rlnM79One3manEhpXzGn/SulliRsF58xs1R5B8mrTZAtBY5q52Dj5Pk3HILn3KKZtxf1EBOJUL/Z7Mh2xfv3Q6HuCWGCXHRrl6cR+P+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGYaZSoCa4la/+ttKqzi+h4KtT+gH4RfkrTNbtD7xZs=;
 b=iSuvHXDOdrxdRVLaNXhNY9KSDEWAxjHjyjHB57Nrc8jSSwIfBAmiTP/aglXvwWXKuJovaFg2PhlMs3TBhEBMvQO5PoK/UQgVoLVJqWAmENwrPjdIj6jh8oPfHgucAjiTHwRUSAGzSWDdtzOUpK0BOA7DLLgnxdwkZIOOnPTAFXs=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6207.eurprd04.prod.outlook.com (20.179.24.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 02:16:49 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5%2]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 02:16:49 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v3] usb: chipidea: add role switch class support
Thread-Topic: [PATCH v3] usb: chipidea: add role switch class support
Thread-Index: AQHVUpTuCbwiFrwKA0Oe2QOtWe0MVab9CxwA
Date:   Fri, 16 Aug 2019 02:16:49 +0000
Message-ID: <VI1PR04MB5327D9BB317CFB91B8DAFD358BAF0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190814112942.33142-1-jun.li@nxp.com>
In-Reply-To: <20190814112942.33142-1-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 094c9b99-bb30-4fbd-9533-08d721efcbec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6207;
x-ms-traffictypediagnostic: VI1PR04MB6207:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB62072CA69CFF49A484F490B38BAF0@VI1PR04MB6207.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:369;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(199004)(189003)(256004)(74316002)(14444005)(9686003)(25786009)(3846002)(6436002)(4326008)(2906002)(66556008)(66066001)(7736002)(6116002)(305945005)(71200400001)(6862004)(76116006)(6246003)(66946007)(66476007)(64756008)(66446008)(55016002)(71190400001)(53936002)(229853002)(86362001)(26005)(14454004)(11346002)(81166006)(81156014)(8676002)(8936002)(5660300002)(6636002)(44832011)(76176011)(52536014)(7696005)(316002)(446003)(476003)(486006)(54906003)(186003)(99286004)(33656002)(6506007)(102836004)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6207;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bDnmjTaZAZJSdUvryEMSN6UWQ/F2L6050cpnE9uS1QZJEhjWuVdBnCFPl/xv5kVmS7qHtBQ7uvl1Zb/FXvrJOHaLB7ycrcDcuMZxEnlujJB6rW/Bc3/INouloVlMk+VsUG/AXEFcgv+5AfIk0tO8bTp1Lg5QMSwvPVZDdt+910T0xRAhs24lNHXmPV65PyqrFYVvKMsXrCMROwyT8/P9x+GI6h1kAU/Zw/P7B6SHP+TOMZzx2gaIL4f/OQ7AI2iw9B8x2EjYOQwhs2XoWwpDzuyQuwpj+wkkuLQ9ag3f3m/h5gYKs/4xIxFftHnSWdHSOw+vyaw9h7j5a/TEss8cHuaz1D/u+Emv+0QJe8IRg0D0Q9R4aA2jObczOJE1RpQpTkxCzFvTya3a9Z2SKWijMp2dS2I9qpZf9sJpCgplMu4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094c9b99-bb30-4fbd-9533-08d721efcbec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 02:16:49.5945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +7FJCk61WasJ7u8Zs3yNuVXxfM4hU2FK/dcS1s/juET6c+QiIKMe0v+I2kwpyRgEjxqJiNq9lThwJro1FKcNhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6207
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> Changes for v3:
> - Remove the patch usb: chipidea: replace ci_role with usb_role
>   as the existing ci->role usage can't map to usb_role.
> - Use the suggested ci_hdrc_cable for reuse current role change
>   handling.
> - Fix build robot warning by add usb_role head file.
>=20

You may need to add "select USB_ROLE_SWITCH" at chipidea Kconfig to fix
build error.

=20
> +static int ci_usb_role_switch_set(struct device *dev, enum usb_role
> +role) {
> +	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> +	struct ci_hdrc_cable *cable =3D NULL;
> +	enum usb_role current_role =3D ci_role_to_usb_role(ci);
> +
> +	if (current_role =3D=3D role)
> +		return 0;
> +
> +	/* Stop current role */
> +	if (current_role =3D=3D USB_ROLE_DEVICE)
> +		cable =3D &ci->platdata->vbus_extcon;
> +	else if (current_role =3D=3D USB_ROLE_HOST)
> +		cable =3D &ci->platdata->id_extcon;
> +
> +	if (cable) {
> +		cable->changed =3D true;
> +		cable->connected =3D false;
> +		ci_irq(ci->irq, ci);
> +	}
> +
> +	cable =3D NULL;
> +
> +	/* Start target role */
> +	if (role =3D=3D USB_ROLE_DEVICE)
> +		cable =3D &ci->platdata->vbus_extcon;
> +	else if (role =3D=3D USB_ROLE_HOST)
> +		cable =3D &ci->platdata->id_extcon;
> +
> +	if (cable) {
> +		if (ci->wq)
> +			flush_workqueue(ci->wq);
> +		cable->changed =3D true;
> +		cable->connected =3D true;
> +		ci_irq(ci->irq, ci);
> +	}
> +
> +	return 0;
> +}
> +

You may add spin_lock_irqsave in .set API either and pay attention to flush=
_workqueue.

And you may improve low power management support for it later, other things=
 are ok for me.
I have tested it at imx8qm mek by adding .allow_userspace_control =3D true.

Peter

> +static struct usb_role_switch_desc ci_role_switch =3D {
> +	.set =3D ci_usb_role_switch_set,
> +	.get =3D ci_usb_role_switch_get,
> +};
> +
>  static int ci_get_platdata(struct device *dev,
>  		struct ci_hdrc_platform_data *platdata)  { @@ -726,6 +784,9 @@
> static int ci_get_platdata(struct device *dev,
>  			cable->connected =3D false;
>  	}
>=20
> +	if (device_property_read_bool(dev, "usb-role-switch"))
> +		ci_role_switch.fwnode =3D dev->fwnode;
> +
>  	platdata->pctl =3D devm_pinctrl_get(dev);
>  	if (!IS_ERR(platdata->pctl)) {
>  		struct pinctrl_state *p;
> @@ -1051,6 +1112,15 @@ static int ci_hdrc_probe(struct platform_device *p=
dev)
>  		}
>  	}
>=20
> +	if (ci_role_switch.fwnode) {
> +		ci->role_switch =3D usb_role_switch_register(dev,
> +					&ci_role_switch);
> +		if (IS_ERR(ci->role_switch)) {
> +			ret =3D PTR_ERR(ci->role_switch);
> +			goto deinit_otg;
> +		}
> +	}
> +
>  	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
>  		if (ci->is_otg) {
>  			ci->role =3D ci_otg_role(ci);
> @@ -1115,6 +1185,9 @@ static int ci_hdrc_probe(struct platform_device *pd=
ev)
>  remove_debug:
>  	dbg_remove_files(ci);
>  stop:
> +	if (ci->role_switch)
> +		usb_role_switch_unregister(ci->role_switch);
> +deinit_otg:
>  	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
>  		ci_hdrc_otg_destroy(ci);
>  deinit_gadget:
> @@ -1133,6 +1206,9 @@ static int ci_hdrc_remove(struct platform_device *p=
dev)
> {
>  	struct ci_hdrc *ci =3D platform_get_drvdata(pdev);
>=20
> +	if (ci->role_switch)
> +		usb_role_switch_unregister(ci->role_switch);
> +
>  	if (ci->supports_runtime_pm) {
>  		pm_runtime_get_sync(&pdev->dev);
>  		pm_runtime_disable(&pdev->dev);
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c inde=
x
> f25d482..fbfb02e 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -35,7 +35,7 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
>  	 * detection overwrite OTGSC register value
>  	 */
>  	cable =3D &ci->platdata->vbus_extcon;
> -	if (!IS_ERR(cable->edev)) {
> +	if (!IS_ERR(cable->edev) || ci->role_switch) {
>  		if (cable->changed)
>  			val |=3D OTGSC_BSVIS;
>  		else
> @@ -53,7 +53,7 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
>  	}
>=20
>  	cable =3D &ci->platdata->id_extcon;
> -	if (!IS_ERR(cable->edev)) {
> +	if (!IS_ERR(cable->edev) || ci->role_switch) {
>  		if (cable->changed)
>  			val |=3D OTGSC_IDIS;
>  		else
> @@ -83,7 +83,7 @@ void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 d=
ata)
>  	struct ci_hdrc_cable *cable;
>=20
>  	cable =3D &ci->platdata->vbus_extcon;
> -	if (!IS_ERR(cable->edev)) {
> +	if (!IS_ERR(cable->edev) || ci->role_switch) {
>  		if (data & mask & OTGSC_BSVIS)
>  			cable->changed =3D false;
>=20
> @@ -97,7 +97,7 @@ void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 d=
ata)
>  	}
>=20
>  	cable =3D &ci->platdata->id_extcon;
> -	if (!IS_ERR(cable->edev)) {
> +	if (!IS_ERR(cable->edev) || ci->role_switch) {
>  		if (data & mask & OTGSC_IDIS)
>  			cable->changed =3D false;
>=20
> --
> 2.7.4

