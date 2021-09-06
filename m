Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F671401953
	for <lists+linux-usb@lfdr.de>; Mon,  6 Sep 2021 11:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241692AbhIFJyk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Sep 2021 05:54:40 -0400
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:58784
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241296AbhIFJyj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Sep 2021 05:54:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjpBTy1miAAgeQR+oK7bR3Y0UOXPVoihRfyfvPi6GhJveeEQ1AWO24j+ucHxLmg22tY5uj8sCpvb+d5iz2c2nGVCuzWbYG6YNAZwP58gpsCPeDeEjcJjMH+KaQn0glzKl31ZhGIdqLeFtQsd2dzq5cH087FJkgCte+Xv/8y5rVSqoaGBUZOZTfpYu2Zj8GzmtV3EQgcVwLMh+Z4LDY+ss4otcFfUR+P9IVEIq5YUVUjEncZre33bspouEbgpQBTCvCVC7mRdviAK17ak6E9WWtDG8/JYZoiKU8XlxLgdVw6W0V2ba8t1Zz0dzCR59oeoCFfwRYQ5CCo0jGbAGECHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qs1ZeKXZ1tc7dctI7wQdDu/vUtfU5ct1z39I9v8zU1I=;
 b=deD0KmTvumisbUh9eBrbWcZCR0acm6fr36dGyMoHKrui1g9MQWxXrU2aR4hTTg6wQnQjYGQm8g6I9fLlpU7HqsQSF9TZifHXxPUUGvfy8wR65ke6H24UCJf3Nv0wrokQb2gaUpnz7mAkqPoyphkiH0djpdB0mU6NZaOZk7emJ1AcAkraS9eo27kTXvj/isAHo5hAITnN32swXuqYu3oUvmVZ/6IjJMI5wJsH5U0b8Dw+jfqhxLm/YEEadrRhW8xmYCwFw79OgdCtiNkJXsnQY6Kzgs0t0/76M2E57w9S2XPbKiaonuW2+WXK9pQQx6vzaSSKkA/6zbGmCEhdRclrrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qs1ZeKXZ1tc7dctI7wQdDu/vUtfU5ct1z39I9v8zU1I=;
 b=cEd5MfR5hpmVwVTkPo71IKYYG2ZRPPljfsr+MEOM6jVnbNcG8qkVKUMIUpc4D0/eevCmWRIKI4ZQXgeWfdwK32YG8ypu1FqhqH0YYoypxwHHht1zj45+cjc7sRqKuzf+fBYySfWmjuKqwc0l/XESToVgGabC+pAhYFEdEEYALDw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6575.jpnprd01.prod.outlook.com (2603:1096:400:ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 09:53:32 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b10a:f267:d52c:1e5b]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b10a:f267:d52c:1e5b%3]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 09:53:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Felipe Balbi <balbi@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: r8a66597: fix a loop in set_feature()
Thread-Topic: [PATCH] usb: gadget: r8a66597: fix a loop in set_feature()
Thread-Index: AQHXowOKUu15V8K4AESjwjc4lKB2ZauWw7YQ
Date:   Mon, 6 Sep 2021 09:53:31 +0000
Message-ID: <TY2PR01MB369245E96145726CB3D30A36D8D29@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210906094221.GA10957@kili>
In-Reply-To: <20210906094221.GA10957@kili>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39896974-297a-4b7c-8c7c-08d9711c2f71
x-ms-traffictypediagnostic: TYCPR01MB6575:
x-microsoft-antispam-prvs: <TYCPR01MB6575A827460ECE30ACF4507CD8D29@TYCPR01MB6575.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uavvvt5ZEc8ywxqNnB1TnUlFbW6tRoE+q6z3HcR0aZNjPjUY8rVn/2yvtisZPWColQEBVyOK3HPd8D5mGykIw3aQuiCdWHXcH9d7sneJ8SUiPt0Uq4siVCNLrhDqE6lg5T4+HCdtT/W7TMlIHxLgrq+kQEPfZSy4C3n63BfQAK9+a2/P1MRbsdKgigL/0RYzH4sGkRtbFJGVGkFdG9Z4znVJLDqcurNEU9MKedVB/lEMiQAD/PLq4HC2XqFQLwFcxnlRssQPOckW2O7Tk71oVcPV+qtVzmYpO2QyVeNdcRJU9h+p/o4ud4IdoZips18RwhVzqy4NESFADw45Rynt07RUtzzAoylOveClATPLf3adliOzNmw+hQQid651w6xUYWJ4yStplVIrfolEds6Rng9Hbl+hQ1VgA/CbA/SJ5vvm+8Ls+z78c4vls/4JTy0yWU+45P95FKu3xYz+r1H1PgSH1GNY0PuHAKOIXmM3ucrgwdnUygvM+zRsck9fUGEhGzMX9Uiy+oWb7HrrNcLKqKFdUdvaXOmjo9TB6hjWjeTYFskIv+Ifk4J7WNl730vt/KouOkLGcvmY5squPMZnPCz+sjKwdADeV2zC/6joDRjqNDSzf3umyY54Nh8bZ2Aw90whWV9KWFiK/IdfBINCEh8fpwxwg55FpGwzs6EN26RzwtIYR5kUKzjjl8MaGTjDdZqTqJEIljnfe/dKy01kpg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(186003)(86362001)(316002)(2906002)(54906003)(478600001)(6506007)(55236004)(5660300002)(4744005)(7696005)(26005)(110136005)(8676002)(38070700005)(8936002)(4326008)(52536014)(71200400001)(76116006)(122000001)(38100700002)(66476007)(64756008)(66556008)(9686003)(66946007)(66446008)(33656002)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P7qPoMhS3AKFgVJg68PKSSCiUqr3KhRU9BwWqqRHul2ITf+d3dOsO3cOA9T6?=
 =?us-ascii?Q?+Y+JfWSETS7+eNohveqXQ63Vx5T//Lqt7ZCpYODVRwYAmZjbmSw+ORBD5ipa?=
 =?us-ascii?Q?ExktDsxFfCjq6T5FE+TxZ5W7TTZl0KvABzGe2pg6jkzPmuTxPniZ5W4QtWMu?=
 =?us-ascii?Q?IGNkuUpCdvxOK1Rq+71zOfHI2zhZQYn7QGbEhi4LcKx1V1pdAIgAuAbMTViT?=
 =?us-ascii?Q?OfSYLCNmBW1wkI/t33IpHUBdHDs6uGZ11bsVvwf+pQL38jPcorYOmeRKvzUZ?=
 =?us-ascii?Q?nrSuPhU74Q+vFs7DhRfikxff6zHSsAoWZFJVlU4tKj+ys+V0A3kGHKLJ+NPr?=
 =?us-ascii?Q?aPOmkRJo+Is3/91iCCOvx3ppXAeBhakKEYRD2Rf2WOL9gEm6aIGJz0fmo8Uz?=
 =?us-ascii?Q?iTC33QAnZTxfDkK+j3EpFrrLewZQmLBBZn/J1VCp525YibuFh6moY3kQB/Qc?=
 =?us-ascii?Q?qiFIqPaPi4OXJ0tbSyppzCb8jolbZ9s0I0qWp8hvofgPZLslmXeRkKijFrF1?=
 =?us-ascii?Q?kHtmhjV0k+rBBChAuHgndK27M/tHzZNahCHswTHMUb46VGkzlj2D8z4xpXPB?=
 =?us-ascii?Q?23CAaOXvy4PuGafKJtCM59jqWlnJyKliXwnCf1FFeZXcDx5TwnA+50GrdEWP?=
 =?us-ascii?Q?ylmFQIZa7IuFE1HSQyvC8OajRctS5KCbP0cAWAOMz45xZ0fTF8opYN7ADiCm?=
 =?us-ascii?Q?FJymiQcg8xPIqZxBMTMDiekgx/6rTz6EUxTi+gRcHwRQ11RSpi4aqGNL7aCA?=
 =?us-ascii?Q?aX863Biv1q3bIMaMIs+6jAI+k2yiQGDeFtn6X+vEWRgRgIGksISDja4Vt/ue?=
 =?us-ascii?Q?56eVshPQ+0tv1pxjOCT2gilbNjCZu65u5Anbk1UBwA3tNc2Wf77i8itRZxvq?=
 =?us-ascii?Q?UnXLFqg1Sgx5fzu/D5PkPRS3mNFO5w14L0+f7wA5SMFvER1jHajTm9kLxBp0?=
 =?us-ascii?Q?7FnWLFI0RAWgjLpY4hzEH3ap07ny9Vvw/yuzTPwqF+ZHhS/QVWpAuexMIy6q?=
 =?us-ascii?Q?uaBqtFuZmUAJOmFJ3SiAicozwX8vegXinfOZMq2othcI4qvhEOpRNSFwRoZT?=
 =?us-ascii?Q?iTTvQHu3roCIGR8+6Jlwa/YYlBJr/7hCOm2Sl+FALH+PnGKdw5/o7dig5fvK?=
 =?us-ascii?Q?yylyOfWwjSrMFJL1NUG2x9TMJ/PfjuGnVFm9xB5FO7NkTXXAyxUpl5+Ah2kU?=
 =?us-ascii?Q?HGpQBGJS8nZXI1flyg7qaZiVafWqBBJXsEncZtDM+MOojv+/wPY3i0IlS+MI?=
 =?us-ascii?Q?+yduv7RIixsP/pQoSrRwzkeooPlV2yYchzY5wzHk6fmc/hKQM1s8ReSSNYhG?=
 =?us-ascii?Q?E/dxCZRNSGTEVVn92tqQ6cDx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39896974-297a-4b7c-8c7c-08d9711c2f71
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 09:53:31.7110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bB13Rel/hoCGezIrv68xTKfteItwjqJ/KgEUvEGvvzyhifFZ7QLAGFTrsjZmN5XbHpHdNHeb0ZKb+TTlmVxekZiTq9D4ow/mkRb2h5JFK/g15GYEn892/X4ClFEqCHGb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6575
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

> From: Dan Carpenter, Sent: Monday, September 6, 2021 6:42 PM
>=20
> This loop is supposed to loop until if reads something other than
> CS_IDST or until it times out after 30,000 attempts.  But because of
> the || vs && bug, it will never time out and instead it will loop a
> minimum of 30,000 times.
>=20
> This bug is quite old but the code is only used in USB_DEVICE_TEST_MODE
> so it probably doesn't affect regular usage.
>=20
> Fixes: 96fe53ef5498 ("usb: gadget: r8a66597-udc: add support for TEST_MOD=
E")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

