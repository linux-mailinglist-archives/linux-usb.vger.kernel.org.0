Return-Path: <linux-usb+bounces-14274-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D44E9640C3
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 11:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E7A1F22A24
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 09:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183CA18CC13;
	Thu, 29 Aug 2024 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="qLHyoChl"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF18018A924
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925580; cv=fail; b=FF87ZsH41WrN4eqtD/L6+Lo4d4A7p8xS9SNMV4WnPrgo3s6bhiHplZLhbMXEPDv2G7wHtvmx86/MmCVsuZeJCS6R7QkTOFOVhUCLxfRWdNP2dGKNv6NlEiG7LGbe9C+hdW/tHG1WqLxwHZjpQEX5dH+5KOkdp6tnW8a4LBA7O1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925580; c=relaxed/simple;
	bh=re4JOFd2X5TAwi+jTDzPiyvI0z7axwW1bf5qYFKtrB8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BC5E2LH9p6lVdsoWbdUQVQXlfCbCezhmZh4e5uqFp6VzN8Pl6Y+1kIoYJh9iw0MoVVmVJRR+MHeSga71rMhOUR4G94h83Ris49UU2fd5KaFG154r5PAUIpX7A03HgNfo2QaYO9A+mdG//zPpi7aBQFvn/TCVDyEWELjHr9TSqI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=qLHyoChl; arc=fail smtp.client-ip=40.107.243.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UO3OWcCSHBpeI7rrlvo3Wf4pezv5QAROeSXd7+pYm1czuxmYOocmkZXSfGyk+ZqG9/gGmpupSQfLCcA1g1RcZENs2fho1EEiIR8pFa8DzID84vZp/eh1ErNas4XvVZyyfeFjK4XSTk3f6SWatat2bIbq2cmfTP/FV7xnp2dp0grZy8gvhoq+7otkBTdU9RaX75hLh+ZmHyO/gnE8n1gUe8H1knCsSkhjMJNbONK8qG17H6Vrz7K+fvVbZ0NrOIXfmw1v0nj2k9cxlkxJs1w6k4I+hWWMaqW32ZCJROOY7v8680iwnN8AUebKURqoUbSXaG1eGZxB3tyQ84pdrHic4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za23v6j1YQZhu73w94/js+ENxUyYGQ9yCDZVTGJoASA=;
 b=tiPt8DbOBdQfgGeqSv7Ky2WkSwKyt3YI75oXSaPAnSAVNO/RyvMd0+1G/e9DYDPcqA5GSnISsyu91ymjU7U1M4qKTEY4PkZHx3NE3rAPtzah5szMmevWKaH5lAJimugSdWpPrARupWW3d6UkAPoCzYQU5Z9A1CuzvWixIlfRRoK2SwQGjVE6Fe97agBvV5hAFqsgXADLyt8D5f0HIM4xW6WQbZ41dUwnhu3xsW8LyBein01L9MJVX9RDbWNiiuf0kMhBeuruUF1gPhW5Ogx2EvjSZcumu4V2y9ih6/44660CuERhl7WtTMga2Nq7EKnZDaTQcrhjRAUGTMEZn38XTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gehealthcare.com; dmarc=pass action=none
 header.from=gehealthcare.com; dkim=pass header.d=gehealthcare.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za23v6j1YQZhu73w94/js+ENxUyYGQ9yCDZVTGJoASA=;
 b=qLHyoChlQ4jmvTIKE3tnvsMC9hGmT8hEQ0gE5PzByCn/WfuK522tIxwXVWxNlxi2+Xxy0uoM7caQa2Oub8++eDBDxyoPjt+FnYxuPYYOUAE55WqSktvKHZc/cdv6MDCUMtBTGb9CQvg/dbclPyDNCVo5yAj3QnCYjreObXzfdlVcNhGyAXOCM4f+4I9/zG9MxptqmiKe9ho+XBK7Ss7qw7sDIe3Rw9zILMRHIHPIXuYFf8oZ11Qo1Udof3slaze9LC8G3H3U8vGj59BeDCqIqPxOO8h1m1WcQbhqi+YvSnCWMqnOiHNhbILybg1H3BRsQBdXiRccQMXa/fspMBU8tA==
Received: from PH0PR22MB3884.namprd22.prod.outlook.com (2603:10b6:510:2a1::22)
 by BL1PR22MB3659.namprd22.prod.outlook.com (2603:10b6:208:396::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 29 Aug
 2024 09:59:36 +0000
Received: from PH0PR22MB3884.namprd22.prod.outlook.com
 ([fe80::d41a:c85c:91fb:d6a4]) by PH0PR22MB3884.namprd22.prod.outlook.com
 ([fe80::d41a:c85c:91fb:d6a4%7]) with mapi id 15.20.7918.019; Thu, 29 Aug 2024
 09:59:36 +0000
From: "Pu, Hui" <Hui.Pu@gehealthcare.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: "peter.chen@kernel.org" <peter.chen@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-imx@nxp.com"
	<linux-imx@nxp.com>, "balbi@ti.com" <balbi@ti.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "jun.li@nxp.com"
	<jun.li@nxp.com>, "Ray, Ian" <ian.ray@gehealthcare.com>
Subject: RE: [PATCH 1/3] usb: chipidea: add USB PHY event
Thread-Topic: [PATCH 1/3] usb: chipidea: add USB PHY event
Thread-Index: AQJsAbGey8FVoTBfQHlZknJ9RZlU4rEYh8pAgANdWoCAAAsAoA==
Date: Thu, 29 Aug 2024 09:59:36 +0000
Message-ID:
 <PH0PR22MB3884B8DB024779C10A6DF489E1962@PH0PR22MB3884.namprd22.prod.outlook.com>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
 <PH0PR22MB3884EF3CBE887E4CF59654CFE1942@PH0PR22MB3884.namprd22.prod.outlook.com>
 <20240829091727.plsxzsvkevziitfi@hippo>
In-Reply-To: <20240829091727.plsxzsvkevziitfi@hippo>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gehealthcare.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3884:EE_|BL1PR22MB3659:EE_
x-ms-office365-filtering-correlation-id: 2d56dfe8-a423-410d-c95d-08dcc8114a05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?V3SwySQm3uEgDMuivw5842lrKvE/zmGB/wAne57XrwBh0CTh8n7uPhP4Rp1+?=
 =?us-ascii?Q?iwapfN70kyoZfI2k/i4xzeY76mSmju0+TIMji67RsfrUWvnd+DM55WySPlrz?=
 =?us-ascii?Q?pV1sC0L69gAcLPeEoU4r9k6zHa40RrYzAK157l8B2bH18lLiQBRi0yYTHVUI?=
 =?us-ascii?Q?slfVH/SereCqRxeBGv7HDVe7ejvVCQpvsx190t5nE3324CVvLB3wTMxKtLQH?=
 =?us-ascii?Q?MUPMRS4fxMfm7CRDrlFlLTmh3SkLw4FN6zFiGdx0S98ECQuGWh1MNz9zm4Y9?=
 =?us-ascii?Q?64+V2kQILySlbp+n+fSNzJ5YhfTs8MQVJyZ3I2TwKCYJLom0/2ztnULa37gb?=
 =?us-ascii?Q?Y3HmE7cH1mEq6iFlRtDBcZxlEAHLcyze9OHIZ5M+U/HHpQJrvVlJOW3Sybdm?=
 =?us-ascii?Q?dW4zaksS2L3yOXHbO9HVmtM2Q+OLgsZ24hc8tOBr9C3Vy8t5P2x7uzUpbh8d?=
 =?us-ascii?Q?n48yv9YXcADMkZGrMnQExHrhDWEgOMqx6ki80oThs8RoIJnMMhwxileIx357?=
 =?us-ascii?Q?vm4TKCUlVm2teJ8kcpAzTXXSV1CqQY6gjPOJyuU8H7TIBFs4TEl3ayaGtjCo?=
 =?us-ascii?Q?BDMFcve1tIZXjwUTrh9jVJ3M1vxgytlGiZ4AMzLU0q2pfXPMW0YgUP4sLObU?=
 =?us-ascii?Q?reVfhCvw0fspBwESnPm8tM2paKl9OILXYQANvRWpFRvAiRPyZyi54cfYDZ72?=
 =?us-ascii?Q?AuTmvERUvsOWwCy3mJpN0WIc+5xaTBZWdrZaZE0g+MZZrE/Jn9Vq8a5gdDzm?=
 =?us-ascii?Q?HQUV646gpyLBmgP8OM6Y/jw5kICxe/6rWqYjf8amMICWqo8f4euW3I8bdOOx?=
 =?us-ascii?Q?qzKF9RY32+98TXyTgtQToKjwQVDhJccfu6dXfcPW5UB73svMVHUPD1hwMggl?=
 =?us-ascii?Q?pozyAky1kOqeqL4B6Acd63ygWRo9mkSLIskLjINEYLyCP4mXWC6O029ZiGrg?=
 =?us-ascii?Q?6V//iR3REBAataBgOeRLlp6saxnuOEqVyctGGn8qF3qfBLjl9r5LuOKlw0JX?=
 =?us-ascii?Q?9A1/jS0cMJQo1gaNlD0AsmnFZiJq+f/B9FjbzhSTOMsYCU+Ix7IV+CO6rEBF?=
 =?us-ascii?Q?lT4gAay7CLyFJGo0bKZz0jmg0LgKjL+/jEVpv4cZHS/tOAOHwFxpdf4Ys8bd?=
 =?us-ascii?Q?tYEGGySNB9Z9DtiGRjaVx+LjWcFTw4fnwyVDOpVk0XzTO1qidKBLvhdqPap/?=
 =?us-ascii?Q?vNr29E6ruXHjdOC8GXLL2crfkadcrW0F42lt8G4/9d8ODMi7R+6n3iRRfeZf?=
 =?us-ascii?Q?WJ94AgL7yJLqN0Tl2jjsUIo597nOhn6tH79ddalgL0nquJ13bFJsHghNXLXK?=
 =?us-ascii?Q?8lzzPAoLOzRaxEq09cvLch4l0Og80ry1dpxnUFr/AfUJ6VvwDuA4fq540/jZ?=
 =?us-ascii?Q?KdaaNtZZEIopoY10SQZZpTZbYiae7QSfztImzoMYSMghMPqK1w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR22MB3884.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E72qK3pxnq8zITCSLVVaDyZTRrTja4/DjfYINK2cwGqeHkPS8t4uPDoOKsZu?=
 =?us-ascii?Q?KbOwBPpSbOfdcsMZzo1YjFtsduLNZIRxw3TDgihEIw0s66W+f8AyRU3Q/9fg?=
 =?us-ascii?Q?Hg4jm7mCFuesOYTCh1q+bY81fPweQhjk7CbYtHl99i/6T1GFyb0Uy+uf19FQ?=
 =?us-ascii?Q?z3Hrh00Cd2wSnUslaCyc/f6D5OFW4Rw8n6iX3k1yw/H6YPLe+XJien1tjtEp?=
 =?us-ascii?Q?sA9DB3pllsm0zdyHzmWYXPmK3FA42EnuZ0k5boIXMSG17OsRRE3M2YVys4BR?=
 =?us-ascii?Q?bXgpp13WsF/5qUnCdOvicKrxOpm7Vm6zwaDdCOn23PcIpoDJ8jH9u6GWsIzL?=
 =?us-ascii?Q?b69H+URRWUW/Zk9pllt3L0LChIXWz7yTTn2SISW1CwO290Tv8vEE56Bx2U3B?=
 =?us-ascii?Q?CR95M3TBFkeLzuxkYl4Yy1wb7uu+iV8YxdOcwD1bbkM85OV0Tw/kr5rLDrgc?=
 =?us-ascii?Q?Hqvjxs336MdGbR11CU3ciqO4KtE1TPUA4CoOInBo1dSTc7giCZHnIKDb5Pec?=
 =?us-ascii?Q?4xftePMrRkXfHV1bsAxqWT8El9GaoWYaaR01Q7G9YREwEHTt58dHKwSpS1Z/?=
 =?us-ascii?Q?/G9abeRd8MYwz5iXaSaCNf38MClCI2ljbv7aRqG2UJUGZ3OBjlDHRXp9N3Cj?=
 =?us-ascii?Q?mrp72E82yit/iI2HYAdBN/+G37llu9u+p4QcAjbj9TTaMV9PnMVNY2E0AceO?=
 =?us-ascii?Q?YwFsfBPj59dZndwMgfAkYAiFfubTEqWBuTyKSAnuT7X+0wE6qI/aHU/LskqJ?=
 =?us-ascii?Q?ocPqe3y44EOp6gy948F4IxwI+w+/2Easjba7lrXn83qP4DQziTkBk+1kmhRn?=
 =?us-ascii?Q?4iUHtjcJa5RiVcvzTsiJFSACLdekoV4l0mw+xmVl+iFvlISnGlqxOCGrSXfz?=
 =?us-ascii?Q?QJWmIKnaJKTm7PWrH7njX+C1wofnV2b7tBst7kdVqjTjwKMfFGVUV0W8KnjJ?=
 =?us-ascii?Q?NvILe84OoVRPhkaqup5ywH6VMmcwDGIj1r6BWzvggJ7rdhpk+mg3o7mXCj3i?=
 =?us-ascii?Q?0t23Dqk1kvHsuiO4j7Wcgs0Yd840/EPKh4BKlKkqkBMwhax6uG06IonncATl?=
 =?us-ascii?Q?N8OdgPj8GrzroJ5KR4BhHktEMuHVLghhL10g0bIi7PkOUBBnSESyJcFT0Ig1?=
 =?us-ascii?Q?4gUCLuW4E3PlS0+xMIGPiEScYL7frxoeZ8E5bLnSJvHZFCTy9+uFzNRlg865?=
 =?us-ascii?Q?QmSYa+/rXjTMRczaoiPjSs8itXQuQz6YdqTCHOdqE9B93JSfMvATOlYuDdX0?=
 =?us-ascii?Q?Cjluccjblg7ah62ROIQDpl7gkxelkREJAsyXRO91UZTsSAZnWSLiy+LxIaIS?=
 =?us-ascii?Q?ieOYwWq5+iTNC6H+y4D29ioR/NN5NQal13AAvl2hbN8l1cV4R3FJIykCsEPG?=
 =?us-ascii?Q?P+yuPJ5it+Jct5FJbTQ+kgfkW9DKc/dq8CIa+1sulFSrj/QAUXC1suHpYemK?=
 =?us-ascii?Q?MyCoT4shHCzEZaEJlcGy3s84Z8YKiGhGnVwwFG7biE6NodqW72fKxV55pkft?=
 =?us-ascii?Q?CExzrRVphoI8brpZl486rLWOcW4Is88/zbB9o44f564bjVxWL6Ht6MU0yvf/?=
 =?us-ascii?Q?ffMITrJfBXpe8JltvLgx5f+0zeId194R47Zu9ANR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3884.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d56dfe8-a423-410d-c95d-08dcc8114a05
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 09:59:36.1474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWK+VtSDpf9HTQ3W0hU4NjTqYjWH16c+9jz+5Os2TebEFjj1UV265SBCXwLm8Q/9/ZmwuNwGHYXIFg1YjSDbNE2wz/LCx4m8XeDPxRw7Gqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR22MB3659

Hi Xu Yang,

Thanks for reply.


> Hi Paul,
>=20
> On Tue, Aug 27, 2024 at 06:10:09AM +0000, Pu, Hui wrote:
> > > Add USB PHY event for below situation:
> > > - usb role changed
> > > - vbus connect
> > > - vbus disconnect
> > > - gadget driver is enumerated
> > >
> > > USB PHY driver can get the last event after above situation occurs
> > > and deal with different situations.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/chipidea/ci.h  | 18 ++++++++++++++++--
> > > drivers/usb/chipidea/udc.c | 10 ++++++++++
> > >  2 files changed, 26 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> > > index f210b7489fd5..d262b9df7b3d 100644
> > > --- a/drivers/usb/chipidea/ci.h
> > > +++ b/drivers/usb/chipidea/ci.h
> > > @@ -281,8 +281,19 @@ static inline int ci_role_start(struct ci_hdrc
> > > *ci, enum ci_role role)
> > >             return -ENXIO;
> > >
> > >     ret =3D ci->roles[role]->start(ci);
> > > -   if (!ret)
> > > -           ci->role =3D role;
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   ci->role =3D role;
> > > +
> > > +   if (ci->usb_phy) {
> > > +           if (role =3D=3D CI_ROLE_HOST)
> > > +                   usb_phy_set_event(ci->usb_phy, USB_EVENT_ID);
> > > +           else
> > > +                   /* in device mode but vbus is invalid*/
> > > +                   usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> > > +   }
> > > +
> > >     return ret;
> > >  }
> > >
> > > @@ -296,6 +307,9 @@ static inline void ci_role_stop(struct ci_hdrc *c=
i)
> > >     ci->role =3D CI_ROLE_END;
> > >
> > >     ci->roles[role]->stop(ci);
> > > +
> > > +   if (ci->usb_phy)
> > > +           usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> > >  }
> > >
> > >  static inline enum usb_role ci_role_to_usb_role(struct ci_hdrc *ci)
> > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > > index 54c09245ad05..d58355427eeb 100644
> > > --- a/drivers/usb/chipidea/udc.c
> > > +++ b/drivers/usb/chipidea/udc.c
> > > @@ -1718,6 +1718,13 @@ static int ci_udc_vbus_session(struct
> > > usb_gadget *_gadget, int is_active)
> > >             ret =3D ci->platdata->notify_event(ci,
> > >                             CI_HDRC_CONTROLLER_VBUS_EVENT);
> > >
> > > +   if (ci->usb_phy) {
> > > +           if (is_active)
> > > +                   usb_phy_set_event(ci->usb_phy, USB_EVENT_VBUS);
> > > +           else
> > > +                   usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> > > +   }
> > > +
> > >     if (ci->driver)
> > >             ci_hdrc_gadget_connect(_gadget, is_active);
> > >
> > > @@ -2034,6 +2041,9 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
> > >             if (USBi_PCI & intr) {
> > >                     ci->gadget.speed =3D hw_port_is_high_speed(ci) ?
> > >                             USB_SPEED_HIGH : USB_SPEED_FULL;
> > > +                   if (ci->usb_phy)
> > > +                           usb_phy_set_event(ci->usb_phy,
> > > +                                   USB_EVENT_ENUMERATED);
> > >                     if (ci->suspended) {
> > >                             if (ci->driver->resume) {
> > >                                     spin_unlock(&ci->lock);
> > > --
> > > 2.34.1
> >
> >
> > Hi guys,
> >
> > I'm not sure if I'm replying correctly, please correct me if any mistak=
e.
> > (I didn't find the cover letter in this thread.)
> >
> > This patchset has been merged on master branch, but only the 2/3 patch =
on
> linux-5.15.y and linux-6.1.y.
> > So, on 5.15.y and 6.1.y, there's a degradation on the i.MX6 devices tha=
t the
> usb hub cannot work well.
>=20
> Thanks for reporting this.
> Could the usb hub work well if you apply patch 1 and patch 3 to your kern=
el?


Yes, work well.

- Paul


>=20
> Thanks,
> Xu Yang
>=20
> >
> > - Paul

