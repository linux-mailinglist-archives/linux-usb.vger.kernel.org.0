Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 816CB1718B7
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 14:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbgB0Nai (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 08:30:38 -0500
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:59688
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729070AbgB0Nah (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 08:30:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/Foy9qjrDuDVwMdw7NQjHYXuEkEpiT5bAlBm6+n1zhPblSrru2BM6Z8SuzdWp8lbfSxanXdUQJTHAvuQuE0tgQNIP2ZgM4Y7TMXIrYdNVMt9r1t34BMyR7VNUgINNG/9Q3ByRL0GCe7GNAlsZp8FXNIMt7p0gHqKqw7e4+mmvFslWKxnrJU+TL7KQUhoUQ0YqMfWeT3RBAUPabAqGiu2MYCkLWlLETav8xmf+BO5Hp8YZelBqFz8lDg9UrAYxto8GEaPb3ZbObHPQFxQBmZHxkymdgFZ0mKraMZIhV3Qy1v2MU0ihrMjoQ/fU/8Bl70SuetktUD+V2khGQpC1l7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vqzOvFYnljGAPChiiJPpHZ8kG/HWj0dkRiu0kRUxeQ=;
 b=M5Fh6xwMdDbaia4SkhyfO3uKiIALm81K2Ml43qaxdFVGl9uaYXUfu11zbM+C8rlqebB81NKi872WvWLEhlFtgefeTWrjDrefQAFLw6G+cU0MX27yjneti3PeICO+UtdHC1o94q1isLmzC95uhKUSlFma0tWFgeNHc619ajvz1yNraBlOw/Amm4hPDnT6W1v3Sgummtzx9jbJtH/LnT6z6oTRRysE+l9rnwantg5c1DwNsOkN4fKQzQ8WHTBTuJNMUECToAfuDuy8cNEFB9WMs4KKV3M/+YS31G0uL/DRrsPMyXwfgD6wpZ0ULaZHLyLwWtdDvsEsQqYnWqg47qemHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vqzOvFYnljGAPChiiJPpHZ8kG/HWj0dkRiu0kRUxeQ=;
 b=ZY60Q74wPYbxx//iE3jCPdhkHwcBWtkZTczi9MW38DH8c7pdInuG/21j7Mkqwr7DxJK8zvSAM83UrjqydPwkeKkb+RkAriPP678TR82Jt25m8JYBFOcr8dB/7UCi+4nWomYOCClqB2FlR4DoQawxP0922jwoiWrhvnVNYVIMfsg=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4624.eurprd04.prod.outlook.com (20.177.56.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Thu, 27 Feb 2020 13:30:33 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2750.021; Thu, 27 Feb 2020
 13:30:33 +0000
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
Subject: RE: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Thread-Topic: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Thread-Index: AQHV7VqVZ4BeDr6e5UuTM5ZPfBO9kqgu5JsAgAAEwYCAAAyagIAABoeAgAAFTBA=
Date:   Thu, 27 Feb 2020 13:30:33 +0000
Message-ID: <VI1PR04MB53270541BB66CAB1EB8F00008BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
 <20200227111838.GA24071@b29397-desktop>
 <20200227113539.gcx3nfwm2fbm3ukv@pengutronix.de>
 <20200227122045.GB24071@b29397-desktop>
 <20200227124406.6kbgu3dbru4qmews@pengutronix.de>
In-Reply-To: <20200227124406.6kbgu3dbru4qmews@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [222.65.251.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5ff36921-dd96-46bd-7467-08d7bb8938da
x-ms-traffictypediagnostic: VI1PR04MB4624:|VI1PR04MB4624:|VI1PR04MB4624:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB46247649C0D6496A48EC972A8BEB0@VI1PR04MB4624.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(396003)(376002)(346002)(366004)(136003)(189003)(199004)(5660300002)(66446008)(64756008)(66556008)(33656002)(66946007)(6506007)(7696005)(66476007)(52536014)(2906002)(54906003)(8936002)(71200400001)(76116006)(44832011)(86362001)(55016002)(186003)(8676002)(26005)(81156014)(81166006)(316002)(9686003)(478600001)(4326008)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4624;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9GqQTZcI666MxJG1JfbfeW69VJ7B/sB86DcXUjLFO71Pd4EwV1dPf9awKy+O8/uD667IzVQUncjm4dBzj/joDZNoniL1OTe3wpy/C7bsDt1G3rzy/kZhH84uh+u3EWy/wA0xjYXLsJA7LLRRmtcvQjYsu2QEes3WUnDnjgOuUjWYTXNCnk5qdp8aBH2QrZDf0enqReayPj9cJDu/GRye2N0tB+6qqATBBtHhRIbzvCNOoLbjzqXvYefAoYTa/z0PMmTBFZ3tTKlgr0dMM0/dsMILTKO4UUzApy5+jlddko1ndYnc9H545LRsrXxBWGBobi+MtjuXoqwfrRBR7eHtAEQ/o4jxcea1Y+VOmaCfwP5elwySf9JDXDPAw2honZ2Z9Tg2b6G7bCozDnQVp1zvuhFxdBoresnDYcKc3eDbluzY+iUGOqsFN+N4lc1NES2C
x-ms-exchange-antispam-messagedata: y5vbgv9HXs61h+XErs+jpuHNfxuZELD7Z+8/cITew9cNZ17UoIWei2qu87d0QacjKpu7v8nR203c2QFa68UCWpkzJLqU3+LzVqXGWAtEGmFpPByUUDNhLGNKaEkGKArglVFZlC9Fpao2YA2pGYr4bA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff36921-dd96-46bd-7467-08d7bb8938da
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 13:30:33.4659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T3S+ZH88ej8OScE1OfNlm4uHbPAQ1I0RCa/QtwNXfJldFevLCxZoNn45ANYHnjuLMrseJJyPVGw/j5hWS18Gmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4624
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 =20
> > >
> > > Note, I'm using a imx6q which has the CI_HDRC_TURN_VBUS_EARLY_ON set.
> > >
> >
> > Do you have a VBUS regulator at your dts, and add it at controller's
> > node? See: arch/arm/boot/dts/imx6qdl-sabresd.dtsi as an example please?
>=20
> Yes, that's my use case too.
>=20
> > If you have set CI_HDRC_TURN_VBUS_EARLY_ON, the VBUS is controlled by
> > chipidea driver, not by USB core through PORTSC.PP (ehci_ci_portpower).
>=20
> I know, pls have a look my the patches.
>=20
> I had the problem that the vbus regulator wasn't turned off during a
> suspend/resume logic. The first issue within the usb-core should be fixed=
 by [1] (v2
> RFC is on the way). You never run in that case if you don't fix this. Aft=
er I fixed it
> the port-power is called during suspend but obviously the regulator didn'=
t get turned
> off because we don't add it to the priv->reg_vbus.
>=20
> This patchset should fix this and get rid of the CI_HDRC_TURN_VBUS_EARLY_=
ON
> flag.
>=20
=20
Hi Marco,

I may understand your case now. At old USB port design, the VBUS is never a=
llowed to
turned off to response the USB wakeup event. But the expected behavior has =
changed
after pm_qos_no_power_off is introduced for USB port, it is allowed the por=
t is powered off.

PORTSC.PP could be controlled by USB core, but USB VBUS's power is not cont=
rolled
by this bit if the VBUS power enable pin is configured as GPIO function, th=
at is your case.

CI_HDRC_TURN_VBUS_EARLY_ON is introduced by fixing a bug that some i.mx USB
controllers PHY's power is sourced from VBUS, the PHY's power need to be on=
 before
touch some ehci registers, otherwise, the USB signal will be wrong at some =
low speed
devices use case. So, this flag can't be deleted, it may cause regression.

The solution I see is your may need to implement chipidea VBUS control flow=
 by considering
pm_qos_no_power_off at suspend situation. You may add .suspend API for ci_r=
ole_driver,
and called by ci_controller_suspend/ci_controller_resume, of cos, better so=
lution is welcome.

Peter
