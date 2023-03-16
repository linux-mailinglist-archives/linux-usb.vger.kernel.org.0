Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34A756BCBB1
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 10:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbjCPJ57 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 05:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjCPJ5p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 05:57:45 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2045.outbound.protection.outlook.com [40.107.6.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B55B9527
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 02:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DV1uP6uW2VG3uo6DqZzHBXnOFNTNy8Kh6a9ALOv1oZMTnYM2lYRWEIXFLOMcJmjMjGt1jcLY1I3eZJjJqmHKqu+G4Qv2nH1NVJGwhSqruvXEwI6WC/DMcG6M+qSFdBkrg9aNUqkL02g7ZqxZEN6irp2O0n3JwQ9wq6qkkYHnqrycJxQS99SP519L67jDhOK/Df46z7WwLfrDiV4YiIwCOH8QCmTCkvUykmDz/tRcT8biNoNjwEqlh9xEkDspvETF+m5rt593SuXpj75/zCeFDA16Iba4AZwJdfxtqPvnu5nayu5OhwGrubKSbuVJiI9WG/2unwAAGMBp39NAr+q24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv8bC2OCECbgZwTqa3sxlhuyfFMU6gcza0/JWQLAs+M=;
 b=aMnmg4VVcNlKyeawZM5ercJlOVgEZY/qRnCp4uYQiN5zfqnyzCHcMOGYtLEkQ3b4EEBMIjQWtDYsjUEwPDBZdrVwubvOsJUSIf+l74FMacXN9y9/buc7dADAVzvP/BlPiyQ+SKKgmggNhYDpTZ92+5RVIc5JuhxXD/kOK9KlFSUZEMy2CkT4IJ77j03U6l68rFVx4E4tJy17I/zPkbi7nikFVdXmm0+FVSBkWyyTn/54LKKgkUsocPvAL6Ev03b1ixtRqKh9QMbBIaVQxFlJW/wAR6TmxELvtAT3ktbNnqas+bZsDhC6vaqfxXloWZ+Zljl5UTuX9QAqMwyRgYlNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv8bC2OCECbgZwTqa3sxlhuyfFMU6gcza0/JWQLAs+M=;
 b=i0/dcD+AOQDMnSE2SgFXft4QBxra/56AtO0QoN6GH8GQ6asD794qrGCm1Uyrb9O31C0q9MYYPeEN8wsiHNRLsAmOK+B0Tb3zxhSKaw8hNq2XLTiPjtMwcTdbqX2gSsr9zResm6mrkMUkgtl1CP933YNp9SN7VbRYD0VjEzFGBDE=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PA4PR04MB9365.eurprd04.prod.outlook.com (2603:10a6:102:2a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 09:57:05 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.029; Thu, 16 Mar 2023
 09:57:05 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -EINVAL
 if request role is the same with current role
Thread-Topic: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return
 -EINVAL if request role is the same with current role
Thread-Index: AQHZBJNydnXZsKXZC06uObPzR157y67IUZWAgDV/R1A=
Date:   Thu, 16 Mar 2023 09:57:05 +0000
Message-ID: <DB7PR04MB4505C0FFBA12A15D35A0BBED8CBC9@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
 <20230210085505.GC1991028@nchen-desktop>
In-Reply-To: <20230210085505.GC1991028@nchen-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|PA4PR04MB9365:EE_
x-ms-office365-filtering-correlation-id: 84a787e0-a1f7-41c4-5be7-08db2604cc91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: POmqjusNV3D1XyO9chQICuLPuQHdLOAPigl93Kh40MnXb4qIlGxEYrOGee1wtqg4e9H39ZS/kxYsC13iyONNN9DSCYYouNU4XeLDafSM0kBojd+37vy4L6rmCVVtzIxWyqZCP8t4pHOvP0dmraVXIFun9m8Z2ZL2kkFLm1BQfCtvCV4PQD2IFeyo9/cAyWQ8UoE0QroFy5ZtqjxycZDJAijVv+TpjPxI7TpaApiS0ypYSoNO2jfiyMK8T2XMkehcpr+iwu5jNWhsn8VffZdSlS2k76if0kta6GEW7EP+Pxjh9Cp3lpB/RTvSC8Fka7O4q3bg4n1P7tplFSSvNXCNP6NDOZfLrVzCDZza83eM2dFwWjuyacSo+B9Hf204JM4vzB/1QAm0t0n0PmbuDK4JU5WpcEEplHD4g79Wso76PP15x9NAAPwc9QJAWKRpdm3esGgvsn3TxpRiOZaOV8gTK+uK3xxUV0eQZJasgo8MZkw+zyCAhXDC2crB478x60S+YIueYpnb+Xpp8KTiGbY0EeoPWdviawfND9QFxrcKVKSrFK7dky+g/ePWdzrFq3aBtkmUi2vf0ts2MCk3xqI0JEOEh2Co+6fZAakbRWwASOxqOksLBzEgqE3yCjkbskFmbrn3ag49A6W6qaidH3sLrZS1dgdoMXDBDEJ3vw/nTMEwAQ7v+poL6Xps8E8OP32KnueIBE4eVjFHMiCLgbuBnQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199018)(2906002)(41300700001)(122000001)(5660300002)(66946007)(52536014)(64756008)(86362001)(55016003)(66556008)(38070700005)(6916009)(54906003)(33656002)(4326008)(66446008)(71200400001)(316002)(8936002)(9686003)(83380400001)(76116006)(38100700002)(8676002)(66476007)(478600001)(186003)(26005)(6506007)(53546011)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s2J3+QZ7eWrEcyv1rcMO/5bJDW7Bzue/JWSCaH8TW4BtHkQGohEisA8PZwZ2?=
 =?us-ascii?Q?C8cO04nb63O6aXJboXjl/Ye2XQevZHP+H1aSMa6SVhjWsTKBG+z/xEu4ANVT?=
 =?us-ascii?Q?s07Eb9BKtaLotDe74tK0czet2iKsgPHaPGGiPwnUopJEWiujtYeU7W0baL9P?=
 =?us-ascii?Q?nqnkvL6uQznPMvgsJ2c0LZj4XTKftJOr5oqJqGHjJph2EIMVaoZz684gjvcJ?=
 =?us-ascii?Q?6QUCaw0RUxWM8dK9o2ssloRcS4Oe9KyScYx+u+xFpYxIVgX62lnCoaP2ArS3?=
 =?us-ascii?Q?jyZgClX7iA0RusjNsBjIvGbvbPCNUJOx2zH7ujPuoCRoKEqC6qOGHSuRvihJ?=
 =?us-ascii?Q?UItOSrlemBj1QBCaGP/w8VMiSUlcSWs6F0bXqJ/cDvh0uvQwkArSx2wkYfSn?=
 =?us-ascii?Q?CDRmarROMx9fPDwHjdH7/BGYcYvmhIrNQ8iOkNcc4tff4TSFjZkCCrNw3dqm?=
 =?us-ascii?Q?VpHsir+MLMGMJCdpTJYFEQXtfRlBpSPN2Cw7HlwREKNHupdlnDD/6di9YLwO?=
 =?us-ascii?Q?Di4MWsViLIA2Tc9rtVCTUKGxK01eHj8WAnqLXHqklYnfC8U1DYfWprhIl1GH?=
 =?us-ascii?Q?L2vg0GIAYvSHxRMN5bOTabEZVZQAJ3i21jyzzsMTr1jGxTotzOFh6htbQfLG?=
 =?us-ascii?Q?Je7VvRY3W6Aab4jFHV2jitK30hMKZ02EerU1XRWzIb+uUQxe5z2mZJT01omK?=
 =?us-ascii?Q?coJbVrCFHdV0jOrwxRdN18ZQOxqYy6Aeh8xdDl8Lt1VgAK7olnVpbJvy+ker?=
 =?us-ascii?Q?YHa779ncO2rF82KHjfV5iW2xonEcZ7ZpgmoFuUARE23Tj6DgkySSM0d83Mm7?=
 =?us-ascii?Q?O3omTUMDIV+2woio8UN5P+zTu0x8scYAw1IcCoPVi0MZBhLtioWsqLAcX3nq?=
 =?us-ascii?Q?hBqIWeZMI+2nsvTTOKPg02dmpvHDWLJI4aXAYWP933EKat8GT689qHBIC1cE?=
 =?us-ascii?Q?utTC8epP9+wd3A6nrhsJBzy+01momI+kheP7D5xrSF7U17pBLt+es7HQmxQr?=
 =?us-ascii?Q?8JHHzJKaD6pML2K9AOTQ9mqyHpXkTqxa8KffMd3PJlBwm1GOCs1earEEM+qM?=
 =?us-ascii?Q?zFdKI7bHzATMD3RcZylf5wIkdVmUEPMdGgL/x+DFFFn6y9+aVMXeZMxLDbrC?=
 =?us-ascii?Q?XUhLvLxYrEWvS/N3A5b2qndgNMVLrS3SzH2Iu6vKKmtqTi5Qf2prOissFilO?=
 =?us-ascii?Q?y3XZ4uHUky45vukyjWZKLvJo05tvW2KEibF58paogcLb+THz7dpO00IO88SC?=
 =?us-ascii?Q?FJqCPGdR26vvrJ19Fp5FJsUdVGghQYomH6mswYt5sN3fjq4Zp+XJYosBbDdz?=
 =?us-ascii?Q?zF1u/GcFhdnSU2XIFuxFUyeOYkniXqLGxsRy1AZnjmYxNGqDhJhJVCrt7HSi?=
 =?us-ascii?Q?j4WCqsjWl48PIAVw2GvIpXzpgMe1vsg32HPJVuuschuiLNbDyojyZfMv3jZY?=
 =?us-ascii?Q?I54GPzMGYP2fzvxqWccqoSaa1d4cuWv0UJbl8Boq7gjwxbcq0A3LGmZmn6Z2?=
 =?us-ascii?Q?1A8RFOPthuaV9BaKrL47sQRxW88EPlMpoj+M4mB+WejbacPSwjCzMV04hEDh?=
 =?us-ascii?Q?1tQXWudI17s1lUG1mls=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a787e0-a1f7-41c4-5be7-08db2604cc91
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 09:57:05.6547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVvMR5hF3DEpHTHaOif8z7yEtWozEECEtSbtWqkcSvIQoHPcZPwKi4X1v2lPrsOX25q11fPYmwJE+/Fi4WQv9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9365
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> -----Original Message-----
> From: Peter Chen <peter.chen@kernel.org>
> Sent: Friday, February 10, 2023 4:55 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx <=
linux-imx@nxp.com>; Jun Li <jun.li@nxp.com>
> Subject: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -EINVA=
L if request role is the same with current role
>=20
> Caution: EXT Email
>=20
> On 22-11-30 16:12:29, Xu Yang wrote:
> > It should not return -EINVAL if the request role is the same with curre=
nt
> > role, return non-error and without do anything instead.
> >
> > Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> > cc: <stable@vger.kernel.org>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> Acked-by: Peter Chen <peter.chen@kernel.org>

Could you please add these three patches to your repo?

Thanks,
Xu Yang

>=20
> Peter
> >
> > ---
> > changes since v1:
> > - no change
> > ---
> >  drivers/usb/chipidea/core.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 484b1cd23431..fcb175b22188 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -984,9 +984,12 @@ static ssize_t role_store(struct device *dev,
> >                            strlen(ci->roles[role]->name)))
> >                       break;
> >
> > -     if (role =3D=3D CI_ROLE_END || role =3D=3D ci->role)
> > +     if (role =3D=3D CI_ROLE_END)
> >               return -EINVAL;
> >
> > +     if (role =3D=3D ci->role)
> > +             return n;
> > +
> >       pm_runtime_get_sync(dev);
> >       disable_irq(ci->irq);
> >       ci_role_stop(ci);
> > --
> > 2.34.1
> >
>=20
> --
>=20
> Thanks,
> Peter Chen
