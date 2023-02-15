Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A198697808
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 09:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233880AbjBOIUE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 03:20:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233890AbjBOIUB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 03:20:01 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C521D36442
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 00:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhausB3qT1TnVG+dCvnY0koiZcbYmZaAIsJUCYWOJygLwOvuOAC0kB/SkLCv4+U7Z0XJpSEh95CGaVDaOwLZlBtGvTRZ2njReLwRy0RKpmt2mU5AuTr/pxbaMfrbHOjN/FOouh/wCTAK2NFnG9frTtaplmYPeZRP8lsn9NM9p36KaoJMJUzPlTcSAYGNI643ouH/jBJryevdW1tusYk63DsEbPG1lJtBnV/jutUaJy8gpNrh6HyfI6bgMAbUuFOEtY8O9MxwsB5DxL8Ux/ebYvBOMQfinuwniDr7IkMxKERsjs9sG13wy9pRMtD1qvWx5/IQud6zBlbP66XLO0AeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DD91646CcTOazOURuF9gkuL3ZjmCd/1kq28SDB9nd5s=;
 b=XNFoLhHld+aHRnAKNzRrbD0G1aY543gIlJOTXKECJ8+HtgJgtBbDvgGLizrC9f7rRkzG/sb2Fsdbm5ck9KReaHIhC8Cg3Jxr2RVFtEKspAiILIpiZX1w+tWz1UgAVBZ/Gqd4q/KfWyxUCF/VXxGj1DxIRGuPv8532IDpoX1xneHOGLadb/6y+foBVfsk6zJFEdTuzo6+8y/0a+h8rBgP4ksHz1vz3N/LM/uxh23ckZMtvahBDp53kD/QWOyIbmzQOC8/enm0bdpfSmMu8YPgXXzzWeEvGcTA7fiowaWaUo7S6zoms4OV6sIagfwqlMTDYtQYVkmkpoA37581PxOGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DD91646CcTOazOURuF9gkuL3ZjmCd/1kq28SDB9nd5s=;
 b=Q9rYk52zeG1v+bgf10+nlAyepEn6sQApzulj7C/jNW8awaIv/xi4Tn+Rh1wu6sPhl0ao3N7r9G1Rx19FKqGzfKhMoWNr2d1ste2N5Nvqi/YqmUq70JDtE6LDIFeyVw5cFJDDKm8FtYkhWIecw6J3gu4ba/TRD1EmwrZfdJZN7pk=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DB9PR04MB8155.eurprd04.prod.outlook.com (2603:10a6:10:24d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Wed, 15 Feb 2023 08:19:55 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 08:19:55 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v4] usb: typec: tcpm: fix create duplicate
 source-capabilities file
Thread-Topic: [EXT] Re: [PATCH v4] usb: typec: tcpm: fix create duplicate
 source-capabilities file
Thread-Index: AQHZQQEbTqxDkQujokG0WliZe/92567Pp+sAgAAAqyA=
Date:   Wed, 15 Feb 2023 08:19:54 +0000
Message-ID: <DB7PR04MB45059DE22555A746E8489EB88CA39@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230215054951.238394-1-xu.yang_2@nxp.com>
 <Y+yTdHxWPZSjVYvU@kroah.com>
In-Reply-To: <Y+yTdHxWPZSjVYvU@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|DB9PR04MB8155:EE_
x-ms-office365-filtering-correlation-id: 731c252e-2d5f-4822-770d-08db0f2d6b38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E4gXb57NEWAcmusc3hlIsJbtaItWz1T2d4xCuWwhpPkns4QfjLkN0uaRZoDECtQsINgZITlhkyFYV2xZ1120h09WUo85OG0MCyry/YswbmDJpiUmRIc5bV3wQzGaFiVOyYgahjDhaw/0cK5xe53kXsts4xtajnwcC9O7C2u6dW0CZiUw8LkQAkjzClirfIirgt5Cb+U1L9vf780Ar1Z0s0wuS/3iUburoCF30iTKl0EJKzW/YcwMe8XWXIf47EME8c13dEtifhD65PQ6NqXqQQvf8XFenlecxBHCNuM97RpUmn0dKc+oNkBcwz9LwaMCJjPNuV5NLqlz69UtGqeD28WOKu7VEg8q591SgDgoTafC4XwXaV1nImUaUhSbSbcWLphpMiG1VamGgQ3cYDk2VsR5gpy/h1ktzMSGyIUc5sJalg/EdS0Kq1pSsHfzFEpLNM0E9+hcDLPU8z1aJFAzIJi6GNDLrHBrnE3HAPcUP15fYk3Pk4AwzSyF3/3y/YoW7Pyz2aHzkRPb+EZ7M+psI8EbzyqGJV+7gALieaFkvFwz+BPFS6LIQERs+d6FiptV49qijFXO3oAsj08/eEM3iEyrteo104/JYch6AQeXPkxBJM/5Gvb7oeneXRAXLrsflYOLrYdU4H7r6kQwjaeRmvMiWLfjgNgwR+e0YOF59GZ5KTqizZm20dAecuh6oTO9/bZy+8r8Z+OX96F2WIO6aQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199018)(2906002)(5660300002)(52536014)(41300700001)(8936002)(38100700002)(38070700005)(33656002)(122000001)(66446008)(64756008)(66556008)(66476007)(66946007)(6916009)(76116006)(86362001)(4326008)(54906003)(316002)(71200400001)(8676002)(55016003)(7696005)(26005)(53546011)(478600001)(6506007)(9686003)(83380400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g7C4ULZrM2jiubY02aPDSjuoCWN4kv3t7L18IgcHXeGzbeqF7HPtRQkRwNBj?=
 =?us-ascii?Q?v6BY7yMdNWCDN/GCtv6QDRvHampZh9g2W1Kcd/5GmUi8OTuqc6waskDt3fLn?=
 =?us-ascii?Q?0bfD4Bmerh1QKHXob+HZrkCXLRMVtzq+qNuXO1VFExo2O1psIaKQTxhkPUn7?=
 =?us-ascii?Q?gv8932ffA6kPBWN/WQlfJ1VTcSR26AkRznuqlUXzPKr+L71D+APRqjLi6nCR?=
 =?us-ascii?Q?MxW8/t5TDLomYHOhhF/cIUXda0YQZWCbsha7oyHZeD92+xslyL3aabpXb6+a?=
 =?us-ascii?Q?x5UcesHNZ52H1vZdWrWR7B1K5EY9guTMOfDFU2SUG4QyDijTZlJ+4EmszNMP?=
 =?us-ascii?Q?h/T+qpqKysgZB4PskOllcvcfhdJCuRZIGCwtf0QFkkRhiUjv+rFiU6ePNA6j?=
 =?us-ascii?Q?wJMRmNS2JdSQnd3HhzIfm1vccC3VzPBr4k88zv4qxaVe32QAUaxI1eeHo3IA?=
 =?us-ascii?Q?Gw80mphYPd9y813UNcq6D6bjgn2QQ0D9gkrVKCyfR3sOQfA1AOjThMf0+nub?=
 =?us-ascii?Q?bkVFANV9tmdxMyMq0G8qYOvvJ8NrwLMkANzLlSJrsqEzK08OwXxI4bt/9tD+?=
 =?us-ascii?Q?eqIb4dWrC8Te2qb2g0+yRKT6RSU3ULNbgFhZrQTr32dQmRbv/UOHnDB47lIA?=
 =?us-ascii?Q?pgCmmtYVWkse7Ec/4fhAgDMUK2S8QMYqaiZ0djFwaTCIz5RkOcffij9mIGVR?=
 =?us-ascii?Q?0OrQqRoCrFCDppu+myHAWlxN+KTKjfWH4ErnqX8uJPqY3lbeDqdmg2zmUYzu?=
 =?us-ascii?Q?fMzVHdvj2I9HB03fILPuilLoMIB1moHoQRYnRZTcnuYW3N6wX1j/53CwhvRB?=
 =?us-ascii?Q?J0VadMht+dAjLP8PZx99zKvV7ypVhbIxSX3/Po3faBON+KIDSqrHFMgDGvGf?=
 =?us-ascii?Q?5TTSWwPYQee1WSfMv//0QmlLERFc8b7CgsXHHjCGVYiqMRjx8/YPyLxOOrZA?=
 =?us-ascii?Q?Yjb98UsCrNKNqgQ730Dv09VD32VpZXbOhFi5CTIt2xm+RSFaAmy+mx1OQwQK?=
 =?us-ascii?Q?Brk/5tY3dToXsyLeGNfL6ax/LuUsYk4SE99eOHKOROQ54XSKtIGpzD8GZVEB?=
 =?us-ascii?Q?sHhrZ79ShBpnQjxqgAIAi3x1g7WsxzQZsOLMnwqYYflX2RFTtUJ4v70pT36x?=
 =?us-ascii?Q?deXk2tgFMOQDuyZnTyUldfWa8DjSS0CH9iJEWYDXsxSdP1IKEB4JOgtEyESq?=
 =?us-ascii?Q?NUQP42G9emZKuuAMe3y+ycxvcTfyqrV/Lzn3558JKEHQJHFoeCmCf+2jncuz?=
 =?us-ascii?Q?OwgRub1f3lYFBU2e4ZiCh8JUz/BCy7DNPcPavOQBDtGSb5M3rG5xxLgONLk3?=
 =?us-ascii?Q?9PSdHd7n8o++5C+vNiLEspwFIDHnIFCu5k9p8MJ3Rqx9gqqO+lsTaQ2IzQA0?=
 =?us-ascii?Q?X/kUSXl7Y/mdd752W8E8V+2gmdIx1FyIp9k4u8cu6XSzAhxBaxxWCDK4/JoY?=
 =?us-ascii?Q?j50fEd2S11KUUMRpo40uZHOUHEL+uzpGHW3E+XGU1h3TIeE+G1AuRxyKHlsq?=
 =?us-ascii?Q?qYI66Dq6zbq6cmcUEm3d8ONgosmBl7GLidnwme0RIonCImfJN2k6vZ/bU0R9?=
 =?us-ascii?Q?+X2sxEUZ2hiQZKSKUUU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 731c252e-2d5f-4822-770d-08db0f2d6b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 08:19:54.9396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxmWUQIx4TQjiz3AVFLJNQs3qY0tFddH7fsI+xDH7rj/2aiMIi6m3u6btNTpAvBaYrodDCYGYyGlrzz15Sbtvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8155
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
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Wednesday, February 15, 2023 4:10 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: linux@roeck-us.net; heikki.krogerus@linux.intel.com; linux-usb@vger.k=
ernel.org; dl-linux-imx <linux-imx@nxp.com>;
> Jun Li <jun.li@nxp.com>
> Subject: [EXT] Re: [PATCH v4] usb: typec: tcpm: fix create duplicate sour=
ce-capabilities file
>=20
> Caution: EXT Email
>=20
> On Wed, Feb 15, 2023 at 01:49:51PM +0800, Xu Yang wrote:
> > The kernel will dump in the below cases:
> > sysfs: cannot create duplicate filename
> > '/devices/virtual/usb_power_delivery/pd1/source-capabilities'
> >
> > 1. After soft reset has completed, an Explicit Contract negotiation occ=
urs.
> > The sink device will receive source capabilitys again. This will cause
> > a duplicate source-capabilities file be created.
> > 2. Power swap twice on a device that is initailly sink role.
> >
> > This will unregister existing capabilities when above cases occurs.
> >
> > Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Cap=
abilities")
> > cc: <stable@vger.kernel.org>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > changelogs:
> > v2: unregister existing capabilities on specific cases
> > v3: add changelog and modify commit message
> > v4: reset port->partner_source_caps to NULL
> > ---
>=20
> Given the churn on this, and the seemingly lack-of-testing, I'll wait
> until after -rc1 is out before applying this, is that ok?

Sure.=20
This patch works fine in my previous testing. But it failed at a specific
case today. I'll be carful in the future.

Thanks,
Xu Yang

>=20
> thanks,
>=20
> greg k-h
