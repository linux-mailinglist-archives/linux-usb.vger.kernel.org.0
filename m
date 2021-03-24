Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6331347147
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 06:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbhCXFyp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 01:54:45 -0400
Received: from mail-eopbgr60082.outbound.protection.outlook.com ([40.107.6.82]:8838
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233049AbhCXFyU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Mar 2021 01:54:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2oNHPda8C9rqEIai63lscnDlfTJ4c7K1V6VEB53Z3UO5FMaET1KE+3cyoA3sVx5Au1JmqUHspr5SbdJG5F9LRadl2rFGy2l1MNRn9NSppg8xCMH0js63/cw6R2h7oyy8/3pAgxBcZ5bAptGx6qciIvaAKD2THYq5YybBKFfa/jDTLzQR2FhNSJw2TdKKJdjywtpMm3pKx+q7+aa0iFDlA3ajc4d85FsBmrmWdSX0uHzZZPC7aXRNDnecrFDw3RH/qCpKH5ZdSO+cMwzPwVBH3/MEmxbsuXUNojD+R1kkYZx++7+uZT5q9O0NnklLki7WiU5r91yPGRoQc7TdxtN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruwZbPuNnSBUoCUqTVKpRFtwArJ6GyZJ1+vBW+LjkzA=;
 b=gd5+A/WwUSFTbiOM2o0fprPrVGYtMVyNAJU0fUlDzvSrcFeWvuxr3ZZg0QSQ04pA1wK86YINELuxODBI/v/kEJUO5dblmSW/ofOwESkUBAv9RXMmOmwTBeHwri+Ve1W6kP6oHKC2BBoCn5q7dySea/iv1MBQSay0/vAo8pU/MjckN8bxZ59A4TeW6RgqMKGTs3JaQzPrxi3SzIT+t+h/3sbA326gMrRIN7dSAeEFu0Ho3Vw2WeHockYESqgcBObeI4Oqn6wVNjX2CRFC4geGj012um/73w626kV++/LKwe/CE0Nv/4j16WyVaTY890lc//SKEwFnEmQlbfNAS4+VGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruwZbPuNnSBUoCUqTVKpRFtwArJ6GyZJ1+vBW+LjkzA=;
 b=LhDmwj4nt/VkmpomgITQpJNP4dqWrthGjY7N78+IEBhp6YmE2mk65TIuwM0BA8O5wbestZCXK0VVY9MVNW02KYTYMVVYRdvk8IV9Ex334RAGJ0xAvqigAvUVwghBwOelRtltPwh4GPm/sRSI075Du8eV5C5vwBoqxLkToDaoDhI=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB4271.eurprd04.prod.outlook.com (2603:10a6:803:3f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Wed, 24 Mar
 2021 05:54:18 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 05:54:18 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: core: don't enable wakeup for runtime PM
Thread-Topic: [PATCH] usb: dwc3: core: don't enable wakeup for runtime PM
Thread-Index: AQHXEBr8VcibFbAdG0iVJpCdA7ezA6qRlboAgAEuI1A=
Date:   Wed, 24 Mar 2021 05:54:17 +0000
Message-ID: <VI1PR04MB5935FB5B13B55A0B4498634689639@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1614767857-12723-1-git-send-email-jun.li@nxp.com>
 <YFnWcPqua4burARj@kroah.com>
In-Reply-To: <YFnWcPqua4burARj@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4a3ba80-a19b-4bd6-cc18-08d8ee89436c
x-ms-traffictypediagnostic: VI1PR04MB4271:
x-microsoft-antispam-prvs: <VI1PR04MB4271D123248D04CFC9C39D2E89639@VI1PR04MB4271.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g16IAjdHrc/AU23DwOGyhOnu38Vkpk58Jy3JzmBvP/uLxca8DqZd/Qu43nnOHHlLGPPLF6tFQ7D+gtQAvsfKFXJddKP1R276KwMe6xDBzBQPWgR2LvkEuT+idVLce7zEtImiGNxANiLZJk0FEECAG3CuUHhpV7Y0reySUwgN+ryDCknpjTk3v1j+2bdFPZN7Qui37BximIzbUoILSJUD74aChPA9M/KtIdcjoUzJL2a37EJxMpoQUsiSegodEqSdlr3jM3N6mgkFlDi7b1YNc7eMBg0zmMAGb4XCn7FnvEqp2M3X9cHRDDIW0R+IDit/ftU2PBBc4MwmLfcVY5wfs6Ionn8DaHG6zG4YT47kVPoNbZUjfXZEC7X8fGSeclOn1sf8CZIW4tMmsPyQeIwxXi5MxgsdRdqtovd4Pw0M9jGIsKw0DYsvxaG3lu78YoDzC/E4THa94TBLGLjWrO/9zFY2qDFgex+94U0rqCP6pELVtwZaWSM9JZsUvcwYJhiWGjnFnOjolOafNnT5YHf0ka//DjbcEYJ7LBWr4Gj7beTSs2q9A4On0msMdmXtOYSDZVE9zy9p7z1xP7lpAkXgD0oub20ThDMb7gR0+iL1mECHxIBES5PS6vhAxKmsJ5iaQD7EcmOt6MiZAoJC73pnuqxn+KFP0O+7sYmHozemIWo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(7696005)(71200400001)(6506007)(66446008)(8676002)(6916009)(4326008)(8936002)(38100700001)(64756008)(53546011)(86362001)(478600001)(52536014)(44832011)(5660300002)(55016002)(26005)(9686003)(83380400001)(33656002)(66476007)(66946007)(4744005)(2906002)(54906003)(186003)(316002)(66556008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?24Ro+M/l87E4JaLl9zH16s5ZUKrLoLR/29+CluN3MWklYYHRSQo5PQE7R648?=
 =?us-ascii?Q?5mSm1Ubu/kKrx36kDOi5Lzsvsxql4XUUrP1qaUnIa67x4WE/TUr0FIoyRJ49?=
 =?us-ascii?Q?TrM1188Q4CivoOm1oeBt+5oszovXhA8cWxt3GLyzex7PTJ8f1OiKPz+qlowY?=
 =?us-ascii?Q?XdXLC360/8ZL3wVy5xjOMi/cPcOnlzVPaacLDzm9aetkmmHBGBilmghYJ9nS?=
 =?us-ascii?Q?86+rfAOFRnE7wWE+gs+Sdm3c8fESSe4wO2DggsaX0RhyOdSqyAstg2T/TAKp?=
 =?us-ascii?Q?SKs/OWhPecbTryTuGqcHOgYGjNiklEvaWrpxPznDFT998rwi8W8t0+jntQlG?=
 =?us-ascii?Q?z64wpD+gLMBYoKQlWFZPRKHHyMEQXM7VPHvIW/ze92xeXLLIQoJaarQqgXlA?=
 =?us-ascii?Q?z0MGPb2pCpwKFWSgB0FzgoeXsVkHWzaOJD/pChLCPhwBTZu8nhS/GoXruhDu?=
 =?us-ascii?Q?PRlFrieSBpD/GhQaiLJGS7fWFCEkKHE8UcF2SnwY6tYAElW3zGOnoyxtUqJl?=
 =?us-ascii?Q?Gpa0m5305wSDca4xFhNA6IJLz8dkN6mj65bXa9qtyuY41emL533JkGSruJEO?=
 =?us-ascii?Q?VIoBtPdiMDtOV2s/fzyIVELzUYMzB23caEW/e+85mlwtmxNWsxDPfyHyOwif?=
 =?us-ascii?Q?TMNj0GlB74/wj7KdAW1Q/WbHoQANOxvO637QshBCjAMIlZ3jSDOEcGvx6TYw?=
 =?us-ascii?Q?PO8apk1ODomsdtbkD02qPJLJ+jmt0d3H8JL/4UKwS39wQPOYNIHxbt/WL3XF?=
 =?us-ascii?Q?OKkICEVwwo1SSedg+3WT5X+PWiLm+BurL74Df9x0PdKMOYu5wNmJpvJ2o+lt?=
 =?us-ascii?Q?WlqdVQBNOCsCYTDRLevbzRjrpcFMuda3aeEqDaXIqk+iG42/mRsFMXEd4FIa?=
 =?us-ascii?Q?Mu54sBTGIm0LlwCg4GK+4Vie7YQY/l4QydtZPGthUN1Ru3RUWxGC40wbqd+m?=
 =?us-ascii?Q?l508hrljdtkFlccG7JPWMS9Pr+7tKY9KDF+t3xLLn5qLjmCOBW8Z+r3xjuaL?=
 =?us-ascii?Q?DDtF8YphG9TQvdXcNYA5hHYp5r+7xhT+YtgKwXPJkjYHA7mQ8ZwMAR9YLA7E?=
 =?us-ascii?Q?OxNxlkUlVjVxAjOm/05BU5fZ/VQbOeKarX4VQxNnFBL9ZQzePIzbu0liqGR4?=
 =?us-ascii?Q?DJNwXj+2WGMqz+yOsdR224i12j4BiPgEGQ1P5O+I7EN5D4/c8GOmXwZmaOb9?=
 =?us-ascii?Q?3sFE+H2BLK956iQSX8xHISE53Ra2Z+v8BDiHuBjRex2h++pvSU1c0z9orzie?=
 =?us-ascii?Q?ym033fvHcE5j7MyUDCdEHp8RO1kJAnkfVExtvn6as/HVGO4FwigUNcZIivdS?=
 =?us-ascii?Q?mdrDb0y2Pnqho3FbA/Kk9j/6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a3ba80-a19b-4bd6-cc18-08d8ee89436c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 05:54:18.0509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WcJjbMapAJ1/vQ3IBl3SxhkrSqq6ft/tyIb05Q5ZYR/XdkOlriEUC8tQGuaJtIoQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4271
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Tuesday, March 23, 2021 7:52 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: balbi@kernel.org; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] usb: dwc3: core: don't enable wakeup for runtime PM
>=20
> On Wed, Mar 03, 2021 at 06:37:37PM +0800, Li Jun wrote:
> > Don't enable dwc3 core to wakeup system by default if runtime
> > suspended, this will make the power domain of dwc3 core or its parent
> > device can't be off while system sleep even system wakeup by usb is not
> required.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
>=20
> What commit does this fix?  Does it need to go to stable kernels?  If so,
> how far back?
>=20
> Please add that information to the signed-off-by area when resending.

Just sent out v2 with fix tag and cc to stable kernel.

Thanks
Li Jun
>=20
> thanks,
>=20
> greg k-h
