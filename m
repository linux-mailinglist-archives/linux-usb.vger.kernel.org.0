Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6EAE1716FC
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 13:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbgB0MUr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 07:20:47 -0500
Received: from mail-eopbgr30074.outbound.protection.outlook.com ([40.107.3.74]:47570
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728946AbgB0MUr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 07:20:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfsvwFX4fYxZgJL60OuGF5eXgL0gKo8iWLBMxP5m6ZAgtMfqdYgalOhowckflBAsoV7jKCn5UT6iVgaryKZrCOrk6t1+F4aG5DFAC6G8IV1lGqFBJ4FdQ3HRzfMt/lk1QX3nf5Rdm2Qjjo9O8/tIuEBCjMUhX3Zt6RRAALvnUrVDrYTxy6rFfuPFLh1GRoUiC1E9YjpwiQ/BvPTE0XyCBELfvbRS79iMgNhdB51dUoIKA/RObuaRlmztXE/n7nmbfX+6bNlH7QXE2+/uM5xHzlKJvbW9YiXWAS+fMDtMq1nhWraFCb+tymfE98LK3UEpdzCg50JDzBrpmx6ALsGDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BQJVqsz3e00yKFGoZDmnfBlC5Nup2boO0cg5JBoVrk=;
 b=dUqgF60fH8XJPs1c81ZFkTdGI5k0aX6TKQfQDGwLodW0iW9tq89iSc+oX2B1sOXqod1Qa2eoIQsYssQsh+LP4yoiJDLwAUpVYeGoKVIig5M3uB+xffNBQbA6vY1tvLVWioTPizVKutiStlhT70jgCcCmC8jqT9ahNnrcoBKYo5IoucY2YFMMlEl8p9JyIgfRq3hbSp3mONAaWpk2Lc5cr8C5kp1G39MTeH8OObFzMPU4P5Lv5mNhmerEpF4kAxS/356dRCns1f6tUV+IGmbe1nKlCynjM+ib9UFZzO+J6Ncrb2pdCzWYGFicnyNy2rt9rejvxn71e5ev90vCy5vbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BQJVqsz3e00yKFGoZDmnfBlC5Nup2boO0cg5JBoVrk=;
 b=UKONwOfUe8BxNLeY0PjHGZu+f1Cqv4ttzKCYOEgBa0ES/yZy/zB6iGEWyAUQLvVYKiMl10PGlqgDQxoEiXfy5ooOwsEYVQrtVUG1HG6+WeANDIm6el34a+whNqxYrrHfQcDaG7Qznl8o4UcQSFs5/QndkiMQd+o722Ifg0RSxUg=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4350.eurprd04.prod.outlook.com (52.134.31.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Thu, 27 Feb 2020 12:20:43 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2750.021; Thu, 27 Feb 2020
 12:20:43 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jun.li@freescale.com" <jun.li@freescale.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Thread-Topic: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Thread-Index: AQHV7VqVZ4BeDr6e5UuTM5ZPfBO9kqgu5JsAgAAEwYCAAAyagA==
Date:   Thu, 27 Feb 2020 12:20:43 +0000
Message-ID: <20200227122045.GB24071@b29397-desktop>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
 <20200227111838.GA24071@b29397-desktop>
 <20200227113539.gcx3nfwm2fbm3ukv@pengutronix.de>
In-Reply-To: <20200227113539.gcx3nfwm2fbm3ukv@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2357cc92-6458-458b-60fe-08d7bb7f774e
x-ms-traffictypediagnostic: VI1PR04MB4350:|VI1PR04MB4350:|VI1PR04MB4350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB43501D4D42FC9630B11548D38BEB0@VI1PR04MB4350.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(2906002)(186003)(53546011)(6506007)(5660300002)(33656002)(9686003)(54906003)(33716001)(6512007)(6916009)(26005)(66476007)(76116006)(66446008)(64756008)(8936002)(66556008)(316002)(478600001)(8676002)(81166006)(81156014)(91956017)(4326008)(6486002)(1076003)(71200400001)(66946007)(44832011)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4350;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cremqyKllvYH0gjyiBjGGLYytaW36zadaqEfhQ9dDn85Nqr7Suea4yP4cTOzVlGtYcaEIAWpK2zjJtE3mG9vZQXYUReVrrVwtlddo87HS5yZCwlIoZej9LQqrBpWPHdJbKA6FTkhQuq/s7cg9xvzbUtXQSqbTjupRTTvvKNQmGtnO5dulK6gS5v4fwETyLTgCYDKopRx2Id7dJLmT5v5Q8yUkECQPvMaoDcBN7WNz1Xgw/Srh87ZwTURzOYgL/wUKhmkqOO6C5SXO+P9Ts/nT97kvfWOhDAfvRNL/EYLM5UCjXKzPjjDbPDqTL2codnK6TrwxRGTGd6Yj3XN7gj63+0F41R0C9LGvF5CHZ6a2nftczPMfwQDfWafscu0W6ET/+D9NGsvNCkcEs5tsD8nFqG73nbU/jvi2Te0olVSUS7OYgEsrIKd9GgVdc/Rn/DK
x-ms-exchange-antispam-messagedata: dvA0DjgW3M8VLUkniWNK2hj0GBupT1WAIUwc4n0EKBOuAa350qHPf3RpdQsQA8aIN/WAXyY2GKsrBagET3z3+xYRZLb51LKl2oMPTB5bM3Kb1edVEjqxMB4Tsq13OPDgKeMFA4VNGTsE3TnxeAVE7Q==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93E4892C75ED5E4AAFD5E6C3D473D9B4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2357cc92-6458-458b-60fe-08d7bb7f774e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 12:20:43.1541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bsDAPnGhp+uRd0aeZ1VaPBXBMITYA7Ke3F8Yg9vT/rLklpwQ0wKs61GveXFHiKJLQOphNIRjt8RSQaVsvj5rCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-02-27 12:35:39, Marco Felsch wrote:
> Hi Peter,
>=20
> thanks for your fast reply :)
>=20
> On 20-02-27 11:18, Peter Chen wrote:
> > On 20-02-27 11:42:09, Marco Felsch wrote:
> > > Hi,
> > >=20
> > > the gpio-based port power is broken since commit [1,2]. I changed the
> > > core behaviour to to cleanup the code and avoid local workaround fixe=
s.
> >=20
> > Many i.mx series evk boards work well for gpio-based port power control=
,
> > what problem you have found, would you please list it detail?
>=20
> Hm.. who could that work? I picked the important parts:
>=20
> static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enabl=
e)
> {
> 	...
>=20
> 	if (priv->reg_vbus && enable !=3D priv->enabled) {
>=20
> 		...
>=20
> 		if (enable)
> 			ret =3D regulator_enable(priv->reg_vbus);
> 		else
> 			ret =3D regulator_disable(priv->reg_vbus);
>=20
> 		...
> 	}
>=20
> 	...
> }
>=20
> static int host_start(struct ci_hdrc *ci)
> {
> 	...
>=20
> 	priv->reg_vbus =3D NULL;
>=20
> 	if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci)) {
> 		if (ci->platdata->flags & CI_HDRC_TURN_VBUS_EARLY_ON) {
> 			ret =3D regulator_enable(ci->platdata->reg_vbus);
> 			if (ret) {
> 				dev_err(ci->dev,
> 				"Failed to enable vbus regulator, ret=3D%d\n",
> 									ret);
> 				goto put_hcd;
> 			}
> 		} else {
> 			priv->reg_vbus =3D ci->platdata->reg_vbus;
> 		}
> 	}
>=20
> 	...
> }
>=20
> Note, I'm using a imx6q which has the CI_HDRC_TURN_VBUS_EARLY_ON set.
>=20

Do you have a VBUS regulator at your dts, and add it at controller's
node? See: arch/arm/boot/dts/imx6qdl-sabresd.dtsi as an example please?

If you have set CI_HDRC_TURN_VBUS_EARLY_ON, the VBUS is controlled by
chipidea driver, not by USB core through PORTSC.PP (ehci_ci_portpower).

--=20

Thanks,
Peter Chen=
