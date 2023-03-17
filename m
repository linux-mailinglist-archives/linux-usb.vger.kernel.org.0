Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542716BE11F
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 07:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjCQGQs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 02:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjCQGQr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 02:16:47 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2046.outbound.protection.outlook.com [40.107.6.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A603B6EB6
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 23:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ibaq3czE+uIdR3WL41wyo1E93DSUPGHoypH3nVQARMNGzDRP8iIzDP/W+tLgfT39MXP0MX/z5JamAunkeQalAU42F0kuUNg08aT9BoY4S4sB+mkSEs3uMWr/naCXDBX3XkArgXp8r1fC0I2zZgDrLp4fncpSqZ50K5QpuWWoao0bdoXt/ervq4QBHYVItLys3x31fTFyZTDgO4oBDWzQEkMYrDFEqxlvkmrGQc3cSjw4qVOeU9NAztYTVXtZfWuGbXv/EGhD65u03avxaAGS/jeA5kFrbQi/1uHvLsag186CcMQS6HzFJotGNMkJF5Q6s3oYpCUHoFaHIcwdRjTD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/ipLlhs9PFkIgMmNme/yU51bnOD+ZbPR2UjFARV75A=;
 b=NIdb/6BQgrGaRNWFc08yJ/kfge/+TZ6if2NA3VxzcQYNMtdWP+s+PkciqnuReGvYhveV4EXhSmq6t7aKCYXtOADsVmbDHIKhcHgrOFUMBEZjP1Nr6Mp/EdRw77SznISkY2Pur3VZduKKM9rpMaiH0wz58wgC0FYDsBZY9A0zTSGlnF/bOMM80YEplhGhe0KZ/5O6n0Um1I5jc7HbkB9rDtmI4R7KUxr8tNhcDiQRfaxVZB5g6AXr2u/8Qr+R4IZTu6p4RS1pozOZ86PQWXwqfA3ibrEfmrLphS2RgxLkzcqgwy3lOaEaInBMvtic328jLeFkRxGUsDL1sKaxZLGy+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/ipLlhs9PFkIgMmNme/yU51bnOD+ZbPR2UjFARV75A=;
 b=bEF0NtQwBcBXhgD9FjuivsllfQzjMcR8uIbrMCVamgZEjpXBcAEas1g8KBgBYzPIDNl+ghMQXXIDfxaNyGbBjogiqZPlCpvlr1Bcz8mgIysEHx31v89fJDKE2dHfitbB9rXwhZpIWf7izZu34ikMIreHt6awH3i8Z8TdB3F/Qu4=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS5PR04MB9873.eurprd04.prod.outlook.com (2603:10a6:20b:672::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Fri, 17 Mar
 2023 06:16:43 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 06:16:43 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH RESEND v2 2/2] usb: chipidea: core: fix possible
 concurrent when switch role
Thread-Topic: [EXT] Re: [PATCH RESEND v2 2/2] usb: chipidea: core: fix
 possible concurrent when switch role
Thread-Index: AQHZWJRTfqod/HYwDUyNM6ILfsBLr67+erkAgAADteA=
Date:   Fri, 17 Mar 2023 06:16:42 +0000
Message-ID: <DB7PR04MB4505C1EF495BE8416DCDAFB08CBD9@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230317055203.2366868-1-xu.yang_2@nxp.com>
 <20230317055203.2366868-3-xu.yang_2@nxp.com> <ZBQCRDYjXQOXLtVe@kroah.com>
In-Reply-To: <ZBQCRDYjXQOXLtVe@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS5PR04MB9873:EE_
x-ms-office365-filtering-correlation-id: db3d9c62-0941-4487-2b57-08db26af2da9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GmFlopunPYH7+UcENdxunECrabW2u1Tt666Ys98ocy5cWXvThvJuYmz03Aig4GnkSItOx5Xsctfd4qoTSFafW5YO7L99uCHJnO6Jew9X4om4oyQuZ9I8z/69ldspD24Wly/WtTTdxGhk/AY+qAtnl0/ZvOwjkUocrmnfD5eaFrFi3GkbS+9Mqy4IK6jsNT9aWoFwZ885GxC+SnIPDWiMZW/pDqyZRaPiMCCbJsOoQj3TCgie0nMrXYyOZbyEUFTOyGjzXcDle78RifAhyUgIFTK07IeUavuYjemGu9E0eB7sB36D8cBeTCy9VISpR80fK7UyOlZn22FCTmxL3ZtbxIZ3YhWBEa4wKLaVCgpz/QpEsJnit+QytBCCZ5/6YbeCSw9AUC4KvHf5/YBYlNVUiE0hzrOJ5uB32tUuimlUOiq5q7VD1oiuSZB11HFuvUMbHu37Rw88i3AWqrdZWpTtlbNad3kVqc1lWbQCkcIwOKXXp2FsUkTEOkKzwBH0q4NRy6KL2haCjXu0NKsAeEhA/2CzW/AjzdvSe3GVJugrsIRqDF14/vVuIb0fzG1xKEGvQJd7fZzJKIDNjrEZp1PbZwIzUYsqPvth1Fiw+qH0HUU1zhOn60dddV8ceVda+W8a5EjCtDzkckV9oqf9xIEwNFF8NRrkxIuebpWnHpLmSaGds1f36/i/90WHL0rCQs+4okIwYp7MClAq7YsU1fvxRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199018)(33656002)(83380400001)(54906003)(316002)(6506007)(8936002)(186003)(26005)(71200400001)(66476007)(7696005)(9686003)(52536014)(38070700005)(5660300002)(53546011)(41300700001)(478600001)(2906002)(86362001)(66556008)(66446008)(6916009)(8676002)(4326008)(76116006)(38100700002)(66946007)(64756008)(55016003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ongmooyXEtiYPNqyhqFVz7eAlwKcXV1Xp+jYk+1dbla/CwkaMc3V4BaqmHrb?=
 =?us-ascii?Q?1HVgJNSuLFQ1u/iqTkRHE+POJf+9SeO4XyCsJ92efc5VXWPF90Z1Z2xHcnmE?=
 =?us-ascii?Q?hQg6Nt1hpj9xqNMvM0kamXbJh3vO+j95kyliJgEaqGA85hCrXwc1h9rI5fy9?=
 =?us-ascii?Q?Wm297ydQ8ccZV8D/vITpCQ3qvQCt94ZIqIsK8V+DdLSlAFNdN1kto5z+3LNb?=
 =?us-ascii?Q?Vm9LoYHvgwFwFHB72/NlRZTunmIfxtG/l8vslnEaEjcpjHTzNo5PDSMbI1gD?=
 =?us-ascii?Q?a3bl4jXcoEiQKymilJxcK2Ijde2BZnZGs9uVTHsIvwFKmZ+qp6HjJfthFnci?=
 =?us-ascii?Q?WcOzgz0T321hxU2gX/2cT/ejjeYftnZTnXPu5NYRUbfUcsbaZ+CJLoh6f4BB?=
 =?us-ascii?Q?rheX+51ILcibfuvjhg5A4+b8GpxFAVT9E8Z54PtAWJ8c+xkKIxVr3INWjUEQ?=
 =?us-ascii?Q?hJch2fu0eS8n+pukEdGdrHUdF4GDXkaP0FbyUVRnN5YbqoA4rjt2EJWt/cYP?=
 =?us-ascii?Q?SB1lWD9Gw4QOhlTevmzT76zC3eKx7huE+/Ey28VThoiehUcG9NtCnIRTAxP9?=
 =?us-ascii?Q?SWS8WqfHdNeroo9Ip1rLoybrNP9y580foLHJ+2BuSsDWdV3q2NXEp9pYz/yU?=
 =?us-ascii?Q?p9HDRFssFUdcGR9hT19uqlk3Wvg55NpzyBCQzg1enKCEjh5kDtJ5qc1Y3Njk?=
 =?us-ascii?Q?jF4uWd1QoXBJ5BDc9Of9L9fkMLGYJGx0YZAqEW9O9bQ6TmgkcPEXUhc4/p8n?=
 =?us-ascii?Q?xBsYfA3jWhx4QxXNvH6m087SceyFEq2DhNuKEzoms9S/LW9+tx87TDe1fVYy?=
 =?us-ascii?Q?fP1rT03dndc9YyKA0JvEIANNzBeQhho0MTGcj/OQM+4TqyoVQGi3IdfQiJGh?=
 =?us-ascii?Q?OuH/o5SGYW2XVlfBVh6x5mNXuYeAFwFkOAahbjArPWmqe8OobjdVqQn6uor8?=
 =?us-ascii?Q?ryAzQS4DsAr32lCgcoJjVwQRGVoyT98TDOyWZZIVBKb2YJuZluAeaHOqoP0U?=
 =?us-ascii?Q?hcRiStpKjpgAsB/goIEO8hgpLJWIh9dTxXDbMCoHYErkI0836JWSbQN29PUU?=
 =?us-ascii?Q?CThkPH+0EefHxQtz4mxAKzokPv540Hczqx8PMJxByEF/LyZrlHaf3Ph46EGq?=
 =?us-ascii?Q?cZ+Jyi3lTm2C+icGKBmeddHmiXdRRmtcKQmwlGKpHp/I+G+Hz9jS14wvHEZQ?=
 =?us-ascii?Q?OTDZW06TmJoJORR6LLWn81udcfpMprl/acHFVwG/VXCwX1u6TjJ5ESH6oJpI?=
 =?us-ascii?Q?+B2pmXlVdqmNuukyXSFJrsSST0X7UnPFMxP2Y+3SWHEtn3Tfz1LWsSPJomwb?=
 =?us-ascii?Q?OUtwDcIlUuE3kv5J2JSt7ggrYtttMGUu1tRfuT69MP3qvRCJFDJxzeIMoRzc?=
 =?us-ascii?Q?3rFHaxMr9u2fmYss3IFi1EL3MkDpvpImkBhETJzLEOZrM2gBbhBMLKZ6uAYG?=
 =?us-ascii?Q?ovzNVPZkLFkHSTH6gy6hPn1Q7iyJ1Pz86dKmmsZM3Uq44VB/1wv8pqQL8Ffi?=
 =?us-ascii?Q?hmcadlM1eCg57ma118dlAfaFwTn3SiBJCtgGDmigMFkbZ0KHfmQ2e4eiEVYG?=
 =?us-ascii?Q?YFqVe+JWOhl1rNAqwuaaae6PPfYN7KPhMfCVi9fz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3d9c62-0941-4487-2b57-08db26af2da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 06:16:42.9938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RC2aYqKEeooXliOROCalwitV7jnZUkeOJCCwIvGrp6iOtjC7Ia61HH6twNxHkpHdD3Is2c93bLewETxhVpk3Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9873
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Friday, March 17, 2023 2:02 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: peter.chen@kernel.org; linux-usb@vger.kernel.org; dl-linux-imx <linux=
-imx@nxp.com>; Jun Li <jun.li@nxp.com>
> Subject: [EXT] Re: [PATCH RESEND v2 2/2] usb: chipidea: core: fix possibl=
e concurrent when switch role
>=20
> Caution: EXT Email
>=20
> On Fri, Mar 17, 2023 at 01:52:03PM +0800, Xu Yang wrote:
> > The user may call role_store() when driver is handling
> > ci_handle_id_switch() which is triggerred by otg event or power lost
> > event. Unfortunately, the controller may go into chaos in this case.
> > Fix this by protecting it with mutex lock.
> >
> > Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> > cc: <stable@vger.kernel.org>
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > changes since v1:
> > - modify description for mutex member
> > - wrap role variable in ci_handle_id_switch() too
>=20
> There are 2 "v2 2/2" patches here, which one is correct?

Sorry, it's my mistake.

>=20
> Can you send a v3 with just the needed patches?

V3 has been sent.

Thanks,
Xu Yang

>=20
> thanks,
>=20
> greg k-h
