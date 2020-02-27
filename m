Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAA5171B1D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 14:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732364AbgB0N7k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 08:59:40 -0500
Received: from mail-am6eur05on2067.outbound.protection.outlook.com ([40.107.22.67]:28769
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732616AbgB0N7i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 08:59:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RP+q8ZoI9bZTI/fHFtVao7kph6zQUa0vAd3S8JunyhB0Bsvgj6LKYDe8mHaaXAkQKnzU0Rd2MM3pfcz+Ppwlze5528iVa+100LZklVFuVNz/rxDTfga80A7Ezgrn0UfjWLz4NNJIIZa4flezmXRkN28VSnRqZbkihn0n0Z+MBjdwtFGCM/lmDNEiqOEcJYiU2sq5m6kMsSh5D8lZ0frtpY27vzIfL6/IePj5KDUr/s82/U0CvHwnpUbEFucUywlvkAglhaXU1BuUUMLxIXWEaKJTtbN4Jp+N9LKDrmLqcTNetpjhamkF0UQ1WiAUMNcNg4ERpUlo0v7Vn3mzzoLTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+OoXlv+5DJUilBFUVJMtUVmrZEhnsO/2uccgrm8+qk=;
 b=bQoR/dEX7ujo5nzQ9Z/jbKQpWV/+xTUppyUTBNUypf8ausG4gt2T+WSyTobwQ6G4lhgfzdDsPTh/j5rodNO0ShPKXIHB0bPsngwWpziZW9nlcDvmyYUeoMStDIbviA2/L05IwjRxmzg6HNAI83m/hU5ZFjs6klsMR6KhrMrDxJjqZfl77w9XUAnSaZFZpfvAhdqxW4+FQdqddARYlfGer2/GLhqM1vX9mbn0Z8h1jxHFK1BxeL8vsiX3DL/4Dnqix3pmsILDIsKvQJQixdr+wuxEcJbIBG8UtUcETdpHyNlj0+9mp/CkQr/emKudeJZVB6Oy4/2ltFz8Q51ymvbb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+OoXlv+5DJUilBFUVJMtUVmrZEhnsO/2uccgrm8+qk=;
 b=e2Y/qKdlpT3khrExaa+sv+5twXTfwcFTy5ciSdhSv5oXwznzRVknUOY+3eHIUsZHEu43UGeF6RDReTBsVIkPxCuaDT+aPrsN6wGCn0yjB6k+aHCcHJmQdLmKUbrQXIIlOcx6Rs4EYg9RwY3xSBVz5hqnCzTFz0FIBUcYS2IjgvY=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6958.eurprd04.prod.outlook.com (52.133.246.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Thu, 27 Feb 2020 13:59:36 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2750.021; Thu, 27 Feb 2020
 13:59:36 +0000
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
Thread-Index: AQHV7VqVZ4BeDr6e5UuTM5ZPfBO9kqgu5JsAgAAEwYCAAAyagIAABoeAgAAFTBCAAA4DIA==
Date:   Thu, 27 Feb 2020 13:59:35 +0000
Message-ID: <VI1PR04MB532766F9451C419409CC0B358BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
 <20200227111838.GA24071@b29397-desktop>
 <20200227113539.gcx3nfwm2fbm3ukv@pengutronix.de>
 <20200227122045.GB24071@b29397-desktop>
 <20200227124406.6kbgu3dbru4qmews@pengutronix.de>
 <VI1PR04MB53270541BB66CAB1EB8F00008BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB53270541BB66CAB1EB8F00008BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [222.65.251.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 43af10b0-342f-4100-8230-08d7bb8d4783
x-ms-traffictypediagnostic: VI1PR04MB6958:|VI1PR04MB6958:|VI1PR04MB6958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB69589C95D7CFFE6D279397388BEB0@VI1PR04MB6958.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(199004)(189003)(6506007)(316002)(26005)(54906003)(71200400001)(186003)(2906002)(6916009)(8676002)(81166006)(81156014)(44832011)(2940100002)(52536014)(8936002)(4326008)(33656002)(9686003)(66556008)(76116006)(66446008)(66476007)(66946007)(55016002)(478600001)(5660300002)(7696005)(86362001)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6958;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3rH7Z9+yC5niupsYEljmr0QnU4mKaN50uPh6ktI4EYD75YiVm033OpW3UzysjJNViK7dfqocJk9PoOrgD8gIYFCJnzYQTCysHWgDqY0EPbp5+8dK7isfI7fvyC5hwQnTFY6ThcG/2ijadud6U4aT1Xri9bQ6iNIuVdrKEsQUFZs0ookWxaSVQ1+BTHAdK2RJBvqVN7K2YbskNGFNtLqt64oO6kekVP0JpBLmSgRXJVbS/YPjIeBn1yTq/M13dc69MJS0Hggo98IWfJ/18MBcLpWWGB51sJ2NRNBY86wniCJLneuoqdIsRwqioFCTxFPFB5C1TJMez+IpyRHFkHOHRpBW3CtWj7ZRHj6qFNwLncKkDkrJCh6ElNoijtkFrINDwkTAf/qYNhv029PUubUV57k3789p8BE6Jt5mAhE4X0LG85CxpP1q4c2Dp7ZffmOH
x-ms-exchange-antispam-messagedata: ibXyapL6WOvpCQGIgvFDEHMQM3B1o39lPmNOJfAm2YegFmA1571iFWni4YT0Xdbn3JkIxPiIeR9zkfRTuaAVLHtTu8eH9/KfzeKpO7HXON67GbHkc4xg8NCWAi38FFGoCAs2RuzLyj6Mzy+80TPXVA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43af10b0-342f-4100-8230-08d7bb8d4783
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 13:59:35.9688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6UfMtFopeeCVCkon4OYUeKmCwkOjmkehryE/8rHP+hhpOBf01z5pWkwYYdwttSPIAufUKpaVo8Y0tbJpskR9Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6958
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > I had the problem that the vbus regulator wasn't turned off during a
> > suspend/resume logic. The first issue within the usb-core should be
> > fixed by [1] (v2 RFC is on the way). You never run in that case if you
> > don't fix this. After I fixed it the port-power is called during
> > suspend but obviously the regulator didn't get turned off because we do=
n't add it
> to the priv->reg_vbus.
> >
> > This patchset should fix this and get rid of the
> > CI_HDRC_TURN_VBUS_EARLY_ON flag.
> >
>=20
> Hi Marco,
>=20
> I may understand your case now. At old USB port design, the VBUS is never
> allowed to turned off to response the USB wakeup event. But the expected =
behavior
> has changed after pm_qos_no_power_off is introduced for USB port, it is a=
llowed
> the port is powered off.
>=20
> PORTSC.PP could be controlled by USB core, but USB VBUS's power is not
> controlled by this bit if the VBUS power enable pin is configured as GPIO=
 function,
> that is your case.
>=20
> CI_HDRC_TURN_VBUS_EARLY_ON is introduced by fixing a bug that some i.mx
> USB controllers PHY's power is sourced from VBUS, the PHY's power need to=
 be
> on before touch some ehci registers, otherwise, the USB signal will be wr=
ong at
> some low speed devices use case. So, this flag can't be deleted, it may c=
ause
> regression.
>=20
> The solution I see is your may need to implement chipidea VBUS control fl=
ow by
> considering pm_qos_no_power_off at suspend situation. You may add .suspen=
d
> API for ci_role_driver, and called by ci_controller_suspend/ci_controller=
_resume, of
> cos, better solution is welcome.
>=20

Or you keep refcount for VBUS regulator on/off, if VBUS is already on, don'=
t re-turn on
again. Do not consider CI_HDRC_TURN_VBUS_EARLY_ON after probe, and let
the USB core handle pm_qos_no_power_off, and call .ehci_ci_portpower accord=
ingly.

Peter
