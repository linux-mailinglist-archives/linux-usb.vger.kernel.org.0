Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B876BE0A9
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 06:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjCQFeJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 01:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjCQFeI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 01:34:08 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB8F61A9
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 22:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMDuvvAM3MVLzZA8VDJRh3vwNedlRME3piC04oxkyv16LfAQ24PLOtBqaeM2RcG3rDo97LgDTFUg17yJl4weMoVG2AbVA7lPNtGNBWxjCtHLvBffsK76D0EyTNaHOyStkDzza3EfM4Fsoy0MKUjpmihVA5Umh1cma1JOFJw6IeUlthIVGyBFxn5XwepIgJRqrZSKpGJ6Fa+I9LlkhQg/2XQboFGkS1vZM3eL1KDGI4SEeWv9xD7MjKmKnREHcgNl21Srs0xDB5jsMWZwZA4puvURyM/t9P1vcyx+4tQAnH9/GGNJihyGJ/Ml6DkkCP6uUGacntG0Dg4oq3nOAxoDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsHiN2JwbGAeCdaLVX1fmAZy7KGdtkL11UsU4f+xdbs=;
 b=LkYoBDt8F9HhkrfUSJxG69HvJJ6FSGPNzedkBhLdvAAVatvm28ugvjcyjMevIZTndRB0KR2KNaMxyRbOtZzW+tUU26rNgRPvsoXs5hv48g4Ced8tyK1zGoJ9E1OUcHQ7pN6xhOQ+kApD4qzoKmeTOSVr5grjwuaeZnslUlcJHN3q2WH/2HPmARA7z2j2sdSD/zsB08dJreWccXTyiCNeugMjDKH8o2/ANzYYBT6aXID+9oQnwVpxuEyvHFnwqM+YCRgDT3jSgKGrvf01cvSym1XVeJFa9T+97C/m2NR1zLz6Oidd6xcu3ove8zW49IX+7SbWssthH4Nj7aX3tvX7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsHiN2JwbGAeCdaLVX1fmAZy7KGdtkL11UsU4f+xdbs=;
 b=B63O54mPuKJNkNRfBKRFNQc+yeKeNexoPYOSv2tkkbMoSMTYuPsPd+T0HrKs8RZ6bY4czVRc9U6bDAOLLcX1dfs1/Ox5j1b1ZKSjA+4ns1bJUfrrxnwvJhCIm7L+9IFNb/CgoKiy9bcBLEMT0PLfQ7boyNRFD37qZa17B4vlRAM=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM9PR04MB7555.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 05:34:00 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 05:34:00 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -EINVAL
 if request role is the same with current role
Thread-Topic: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return
 -EINVAL if request role is the same with current role
Thread-Index: AQHZBJNydnXZsKXZC06uObPzR157y67IUZWAgDV/R1CAACIpgIAA9PXQgAAm4oCAAAtqEA==
Date:   Fri, 17 Mar 2023 05:34:00 +0000
Message-ID: <DB7PR04MB4505AB860947C96D6FD002EA8CBD9@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
 <20230210085505.GC1991028@nchen-desktop>
 <DB7PR04MB4505C0FFBA12A15D35A0BBED8CBC9@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <ZBMDf6P/xzCP+oOZ@kroah.com>
 <DB7PR04MB4505ED500F2FE7814C4B61688CBD9@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <ZBPxmYBESaEAOEZC@kroah.com>
In-Reply-To: <ZBPxmYBESaEAOEZC@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AM9PR04MB7555:EE_
x-ms-office365-filtering-correlation-id: 544d49b8-5063-49db-e50d-08db26a93627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pVgRmnARIW8ZYn6pr7mvNLfXEsvCCRyu/mQaOgbeG7kD0HD7Oofa3D0ARbNaf4naMu0xqH8FGMwKjv0XFkT5IrD2NnI4DEe8YhreZOx3tWmIzF7ZMMvVPhKLO89e3w28MwLxvlTKMrEIWR5sGiSyjI+MWG/RgL8UrPtWh5XQ5CuKN60htQPfCCYpHW7rDnadUUgUlCo/kBFZVgMs1dcpYuo0izX1+FCw1lyieWMsiP+TZwOiP/SqpK0xKrvdC9rKafpblTG6YD0vS3EN0/rQ/MiNno1M7eDf7rc741nBlnhyT3PQc+44zrucpkyNkMb/YjMqU+XM5m57ZrkJ41mHpkFTmSRYYXtve35j/QNpZ38EEi5uFGHswT9F21YAb2yBOnDZw7eZWTWtlkVcz7vV3DMqRPi9gLgQ4HiMl92d/G6VTK/9B50q0Fx71vPz1C4qbZAt9cYO3r+fkbwYds7aOOg2SOmJ0EQB+a4yd63oryoPorz91NX4ENrFq5b0mzDk8IEPuGwp9X9y3rjJQ2khSuPOah9V8fraFbWx+s4astY/f7xSwOdRwb17LShEHesHeAhyBGStVyV7fdo1e7Jb3RnzVXZp/rKBCpXwh6TyhsYmzkIngIb12atDLBk4UYNLYQGrXu2AhGGalo1dqu3vqd8zX/zTKyDkQf9AOfkUhb9wRxTaryLSSPQHww2ktVGw33gaye9qeq0W7o7alFduFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(2906002)(5660300002)(55016003)(38070700005)(33656002)(86362001)(122000001)(38100700002)(83380400001)(7696005)(66476007)(66446008)(64756008)(8676002)(66556008)(6916009)(66946007)(76116006)(4326008)(478600001)(316002)(186003)(54906003)(53546011)(8936002)(52536014)(9686003)(71200400001)(26005)(41300700001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3Vjuy3yvUaXNNFpWOukrj+/epe4ACl1SrqPVqxLeCqnjWH9OakMiUUPnw/pM?=
 =?us-ascii?Q?MamXH4nyFV2WlUgdzIV+oJUZ3TkrnvGtOJ8xKN4tN1da8hEdxo1FusSicV4l?=
 =?us-ascii?Q?SwzHxDE8lXROr2XDNUEUd0YsjtqpimjmkfJNwjAmqBN6kEuxb90Y7/yrENtd?=
 =?us-ascii?Q?3XhJMfccKv33PWzhMI+Q2ydU1b5Jh4Q3gj9pP2hHXK5dHm0NbW2DCldQ+c0R?=
 =?us-ascii?Q?4nlk17McFa/U/nA0upIiGN40tHgwTAYHlimeLXy0naCkby5v+6ygr5miCUri?=
 =?us-ascii?Q?hq9VgLMAIiAOzwi1wOPKq1ibf39mGY7a5xl9Wuk9d4SvxmxG5m7Lfc+N5Q32?=
 =?us-ascii?Q?M6K0obvsneqlkOG4CTsshiMpVyiYUvq/EuGOab+fMDa84JWTKnkBoxNHEqf8?=
 =?us-ascii?Q?PJujxR5YWCqqZduDDWi6ISnId8l5EQBAfwJizZWgWOAT4oVUfgX1yb+rK83M?=
 =?us-ascii?Q?0DDrfNPubauYsh8Rifnwg7Tw6Y792U9AGMeS9bEcrGZ6/iCNFCq6AVQiRs6A?=
 =?us-ascii?Q?Pbz6oXFsBg33ZVCRvXwedm9xF2xgRyD07K8wVeRtQ64kDF/CXMWNeyG6fxce?=
 =?us-ascii?Q?W8MB21vcb4AZ7a8jrcKrdQmOcc9lJ1UHjMkieLIvOgPL0jb1B37zk1dvalvG?=
 =?us-ascii?Q?BtQrV+qQjw8nfULJMxe18tXIgs2sNYD07V2flShkshGcvxbfI4C6a9QXFjLA?=
 =?us-ascii?Q?QuuUpTq4zmbgkNiGzf6ckNVJMUe+H8kXZR83TiLbrQemXRyWNYAMlqOOcveZ?=
 =?us-ascii?Q?6pIcVuTHSm54Gmk4Nw4+qPiZzhVvtpj0SL7liCDlVD0oYWAcFW7NXMjVGDg/?=
 =?us-ascii?Q?FWrSExwGZgRskh3BXjIYyZLiqtsqi6qGM+9gKkBdg+ICDBgkMQzfOVZ+Pjpg?=
 =?us-ascii?Q?i1g7ubk1lFmbMfFFK5HS35Mpvs5epRoWalnGuI3EPkdqpIfM3tfcKqtpEdPZ?=
 =?us-ascii?Q?4hY3x1zyvZR1x2AAVr/IBOWXPbQb1bpnrQDqVKfqV4+1gDgXh0LRKBm2p8Ma?=
 =?us-ascii?Q?OswQOPTdJHuZGbVW4gseKej8ZDiCtECMO9rKGCnKIH2z/ZzkOfTn8+khVRF0?=
 =?us-ascii?Q?B8QlSzwOrsTASs4ppt0g90xy++1Ihz3AZgCyRRT2zm7yhqXNHe/0OoVlwQ+7?=
 =?us-ascii?Q?6MWIRGEeO1Tt2s58C0jhTeltJTYfMTke3giW6hM/UeKb2wcPQKMXEwrxLJmt?=
 =?us-ascii?Q?S1homdI1jpKkU8n8wTNfjpuINOJs0xqtGn5ETSM08kVX/6dGOVzSzJZiML1q?=
 =?us-ascii?Q?XtVK9G5G/4Xo6y+GH1IF1nPBTSwDyKVJsiQaEF+BoIH9TBtoZjg75UdYnlwo?=
 =?us-ascii?Q?mX3R1VnjeCQ00DCR/xd8rkFZz/nJGmPboZIyVkivH468/He4BfcyIOuRILyj?=
 =?us-ascii?Q?1HiLRaYw23slrbG2/hzhS5ZOCeSYo514zad9KO+0A2RrYUwFkP6t4sQwgVBT?=
 =?us-ascii?Q?5UQGePqvy1xo8srxT8OOkgnWoHrfuyk8H6fjtnnyaswoZW38j+CriwSuLykN?=
 =?us-ascii?Q?jg+O7mN+sM90JyM2AWy2vvm6ZpMvgx8PsVsXpEALclkyjPWj2kLNoqoruBye?=
 =?us-ascii?Q?RzXrMtEEodesBNCTt74=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544d49b8-5063-49db-e50d-08db26a93627
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 05:34:00.2657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yokdZlbm96KgDtfCVZ+hLT2wMdujOMb5z1pqU25/LPQYAUdXFTR5GYcMoixovOW2P3O9e+7KMVdkfZ3RmHvtSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7555
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
> From: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
> Sent: Friday, March 17, 2023 12:51 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: Peter Chen <peter.chen@kernel.org>; linux-usb@vger.kernel.org; dl-lin=
ux-imx <linux-imx@nxp.com>; Jun Li
> <jun.li@nxp.com>
> Subject: Re: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -E=
INVAL if request role is the same with current role
>=20
> Caution: EXT Email
>=20
> On Fri, Mar 17, 2023 at 02:37:47AM +0000, Xu Yang wrote:
> > Hi Greg,
> >
> > > -----Original Message-----
> > > From: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
> > > Sent: Thursday, March 16, 2023 7:55 PM
> > > To: Xu Yang <xu.yang_2@nxp.com>
> > > Cc: Peter Chen <peter.chen@kernel.org>; linux-usb@vger.kernel.org; dl=
-linux-imx <linux-imx@nxp.com>; Jun Li
> > > <jun.li@nxp.com>
> > > Subject: Re: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't retur=
n -EINVAL if request role is the same with current
> role
> > >
> > > Caution: EXT Email
> > >
> > > On Thu, Mar 16, 2023 at 09:57:05AM +0000, Xu Yang wrote:
> > > > Hi Greg,
> > > >
> > > > > -----Original Message-----
> > > > > From: Peter Chen <peter.chen@kernel.org>
> > > > > Sent: Friday, February 10, 2023 4:55 PM
> > > > > To: Xu Yang <xu.yang_2@nxp.com>
> > > > > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-lin=
ux-imx <linux-imx@nxp.com>; Jun Li
> > > <jun.li@nxp.com>
> > > > > Subject: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't retur=
n -EINVAL if request role is the same with current
> role
> > > > >
> > > > > Caution: EXT Email
> > > > >
> > > > > On 22-11-30 16:12:29, Xu Yang wrote:
> > > > > > It should not return -EINVAL if the request role is the same wi=
th current
> > > > > > role, return non-error and without do anything instead.
> > > > > >
> > > > > > Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> > > > > > cc: <stable@vger.kernel.org>
> > > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > >
> > > > > Acked-by: Peter Chen <peter.chen@kernel.org>
> > > >
> > > > Could you please add these three patches to your repo?
> > >
> > > Can you please resend them, I don't seem to have them anymore.  Also
> > > split this into 2 different series, one for bugfixes-only, that needs=
 to
> > > go to Linus for 6.3-final, and the others that are new features, to g=
o
> > > for 6.4-rc1.
> >
> > Patch 2/3 is a bugfix, but it depends on patch 1/3. I cannot simply
> > separate them. After I resend them, could you please let them all go
> > to Linus for 6.4-rc1?
>=20
> Resend and I will review, but that sounds like you also need to mark
> patch 1 as a fix, and then patch 3 is not part of the series and can be
> separate, right?

Yes, understood.

Thanks

>=20
> What would you do if you were in my position here?  Make it easy for
> maintainers please :)
>=20
> thanks,
>=20
> greg k-h
