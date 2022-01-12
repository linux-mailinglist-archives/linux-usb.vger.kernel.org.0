Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F42E48C4F1
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 14:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353642AbiALNgJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 08:36:09 -0500
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:52510
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1353635AbiALNgE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Jan 2022 08:36:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoXGhpqIUfId1s17xTNdFfLg0fm8oDI2o45/1/MoqWpwvMI2RVlEvlZ8If8OfQ2+9QCYPYDrQ2eSthdHdQrt4dJzJW/bQsWzXmW8AZ4ur+6DDAgGnP14w+RxYpkR5QND4LpbfO3AhkhE8BqoKUBwyEJaaA66Mf2eBPFoaScqVyL00YoTknVoWk45F8uT2Eg67qu3wSVy3+5S1WpPzdoJvxgaXmboAyU8XNNFyWiOxZijN6Iwbr9jWUCAYO5po2q4mI961KwpFHtjoVrravRbx+yyUP+g1jyWUqGjuJR4aKXxiO/WGzkKpY+ooRPP2nJM5ueR+/HYCuCu0Q3Yl03l/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOmhq9ocoKPR6VczQkPTH+d1NcUVBWxl4Qgi6iF9E/8=;
 b=Gk1cROK9LD2GeiMaYNCX5fRL9cNnsrHWhzqICaSK9cVPxHYYF9t5zYi0SgL0KrRHSn6OjwOQPOGv+bUWi9n6qf/9Z7exiAnaBKprfF4cOSNcuZQslzywVxmEVYnieFBjPwVdy9iLcrCBGFlWiaU40jD6g55L+3BeijNgjFaeAfEDCXkECWIMCrKCDObOHdyV0znb25elWCK3olxbMA0lF3kFJYznoDrBhCJJcLfVCuy4PzUnR+/Yfc+Kcy/I7DvCGX1gUgpX9KJaM0dj3FWx8NovuyV6h6XG+ruJfZwNH4baAB2JwnhSPMfg12PJv823/aPkqcpsPO8xEfyTWkyYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOmhq9ocoKPR6VczQkPTH+d1NcUVBWxl4Qgi6iF9E/8=;
 b=SxaOjPneNqgJpPvKknG3oMS8hssUEdP91I8Os0EFwj19AU3qdVammz7gg1InrgigWd/l0ioR84FgalAiBbERS+loHgxAPvXf1P+vVlRs8V0G3MiD3+maE5fFJ/8awyWUJlgyg7DIm/m1fBiyL0pLiyhozrM4CDyS5ur0Xq6CU7k=
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com (2603:10a6:803:49::27)
 by VI1PR0402MB3565.eurprd04.prod.outlook.com (2603:10a6:803:12::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 13:36:02 +0000
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::ad9d:c232:8a80:f8f2]) by VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::ad9d:c232:8a80:f8f2%4]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 13:36:02 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     Frank Li <frank.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Zhi Li <lznuaa@gmail.com>
Subject: RE: xhci crash at xhci_disable_hub_port_wake when system suspend.
Thread-Topic: xhci crash at xhci_disable_hub_port_wake when system suspend.
Thread-Index: AdgD3VfMVBJx3GKFRn+PRgFnr8FjngCQPoUAABHzOAAAUyOhAAABJQXg
Date:   Wed, 12 Jan 2022 13:36:02 +0000
Message-ID: <VI1PR04MB4333F89471E833AA5BAEFED389529@VI1PR04MB4333.eurprd04.prod.outlook.com>
References: <PAXPR04MB91861A98BE9D240FFEC1D560884D9@PAXPR04MB9186.eurprd04.prod.outlook.com>
 <20220110123350.GA4302@Peter>
 <3588ae48-e40e-1c9c-c841-cf54f59ad70b@linux.intel.com>
 <20220112124820.GA3796@Peter>
In-Reply-To: <20220112124820.GA3796@Peter>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28fe4018-16b4-4de9-eae0-08d9d5d079ba
x-ms-traffictypediagnostic: VI1PR0402MB3565:EE_
x-microsoft-antispam-prvs: <VI1PR0402MB356513008A04C4C6B89539B189529@VI1PR0402MB3565.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q3uOB3M5wf73bwVteWnlnLftqe6DpDgmlcvRT6rtv7cHBXn7nT+rtfVfc08b7H/tMhNjU0/3KTHrAFqyIFOgZ+mvLzSMgwkKxkuKewQuXrtU9VBl6Ecabdr8eUdZtuqhQ0b/9POXWxB5p2oyLkNdTc4aoWcUfhJP21npZ/S203bZc0Vc1FOCxDh1b2lL34ybJ4rpRCYFQtYWb3YSzLW5Oqad8Me4JdcagDSjETwvCgL4biaeEPTEFE/YT6sziOrZbVwCuQXyj+Vc1EVpUuHJY+UwVmui/hC+W57pd4aCTLJbiT/uhHAQ8vQ/t3sWTSUfzbUSVTIpEwXQk2jLZR3MpWr7oJeWP3v5jKuw+IP/50+I1h5q9Ly8oEZ0oKlmSnQwvkeWezDqW6XFmukR4Vvfjf4jZE8P8kwdyxuLqhnOUEO5uVLYk8Z67GJ6uGZCdllbrFbXNKiglPi4n8lq5ewFKw7lXBMsqcKzSObXIQZsEblthYOgTTnx0kIcCr89DSrEJI1mUkKCTbiCUUTIktOzVvAj+eBCAocErlFPySvmcHgWIsaIWajvOzBqJNtK4x36bo7GdKDJgJY64E+2B/XZLSP2T4iVDxtvShwXgpkE0k4ATXmwEGuUqa4YDDJbpbaOGJlWZ+whKoKneS9PdzSAfdKed0/d4ZCXVldfz2EmRrmKBB+bWZIKVgosQv2w4oxPY4Uz6upRJsiM8R2lU86OMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4333.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(316002)(66946007)(33656002)(66476007)(55016003)(66556008)(66446008)(9686003)(38100700002)(5660300002)(4326008)(86362001)(52536014)(38070700005)(122000001)(76116006)(54906003)(110136005)(15650500001)(8936002)(186003)(7696005)(71200400001)(44832011)(53546011)(6506007)(26005)(2906002)(83380400001)(8676002)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jdcpOBwnQa4xw4TteUe39fM65IQHOZAA3rFyvIUAoWnFvG2sMRfI5E3nbmog?=
 =?us-ascii?Q?JpSMG8ju+2/bXgEsUPxDAy4RED8MAxoxyYKIyNn1CZZIIfZQBnFKhGfZmbSS?=
 =?us-ascii?Q?3oOP6cRqO6ug0MsqJsdauNt58ovFyisDf9vA5STg4TKFJwahkUuhA3sKSpeL?=
 =?us-ascii?Q?fyEy5FWTVLmXH2JQyUzs5vye8ylQKNbiOFyZboc7P3AUeDOK57SJQI6VOoRL?=
 =?us-ascii?Q?20OpDV3JCHa2K1N3/ivNfCq9dnlwUCKWwQwUDMml7U/uLCuxTAVdX1f7feOh?=
 =?us-ascii?Q?h7Xcxy5ad/jamcF37YKNS+mJ5bwkLvcoUN20ySXPXvcACuc6RrsqZByswD4Q?=
 =?us-ascii?Q?x2kcmOVlkPx2VAlojiyL6lnp0bFdc0R9KiJz3i4ql9UGtHCLx8/5EjJMhwQZ?=
 =?us-ascii?Q?UlERaitjjyNapUz8RbNc8VTuWVLQDRKMZi54TTWzcmaxuWEVZdmH1iA8pJYV?=
 =?us-ascii?Q?KtZ654hF7KAEpjMRc/WZ9GsIQdKqitb0WD77WoPMFEe6vfm1LWFly8F+DYRe?=
 =?us-ascii?Q?vwagWIxov1IsF3naPIIjR3ioCbDYoP6Uehk7R5AY8cdDdhww72WLJNt2xsRi?=
 =?us-ascii?Q?6mMoSCU6gncBJXqypKTjYgV2GhU/UXiMTL4D1QBvML8YhXC9psYejd4eSGhT?=
 =?us-ascii?Q?kthR7Ac/iT7ve3ZB9wVwoBitKb4XPLU127s1ACs44hv+MCSjt1niuOgxHX3E?=
 =?us-ascii?Q?gYxpts9CxSQrSirxrNnDIjr8md/KqGolCUpjwlAfV05BmfjlNCOyXMl9NsFo?=
 =?us-ascii?Q?ZD/JqzFaoRCkTyRuN9rlTLOYIibOmjdJR3CR/yqOfvQRkHr08kmHfF7z9q6S?=
 =?us-ascii?Q?XcrJSDWVWXdPePhNGKDDrGajVWglhfDcN7ruf9k3q3sdgVryF+dnR8m7jSTp?=
 =?us-ascii?Q?HUPv8D6bEitTfDOz5Ge0Xj6lQs1i3ewxOdkkXrb9G0bUSQqca4y1j5DkFO+B?=
 =?us-ascii?Q?xO6esqD65HagSs26DC0gFD3Cm2aAuDdHfVPBNUp7zBJiI1Xof5poAwFkePM2?=
 =?us-ascii?Q?Dd2oxlk53xbd83pLY3KL/JzmZpy2XGFKpScHHFqWjgbZNSrZ1tXrLEvT/aPn?=
 =?us-ascii?Q?ehATSupvRZ8oOeIy9FdH4DgQNj7E1VcXV7iE/zZ4vSWWik4zK3lPyVNLVUC1?=
 =?us-ascii?Q?9YcCwSlERrak6OyxeF83O33wlKuckB9vM0dYm2Tyi0ORetu1pK4D6LIIIIfU?=
 =?us-ascii?Q?IaNqBFSNs7hrM7gBnJjWE53Z7f//A7DLJjgUKiM0OMe2R2rK2Mo7Q2KW9JpR?=
 =?us-ascii?Q?Z6/cFrOQDcNPv15N7RDu9NLTRgQWI0ZKYF5Bw7LzYeU3NMSx8YqDVfWAkd2M?=
 =?us-ascii?Q?/mY7gp+dS3VSx05nLjXCKdBqDrVOR+Ko/uFJmQCZE5KRAwQHzan7JGmrOUI+?=
 =?us-ascii?Q?3ol9nKBOsC0s7os1piUnmiP1R6Y3bLVlAue6jTETREm9slOaJYy00atbq/OP?=
 =?us-ascii?Q?YFwDILF2exdWP4ffm+TvOqhp1ynH9/uSX/Nf5uS3zXi1UhTXxT4wXbO0fx6Y?=
 =?us-ascii?Q?3y6wBulhxhqvlTlZ+T7hG6QlrOBfhyl8fcoX8RZw19OmjEv0rgLe+utDPw?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fe4018-16b4-4de9-eae0-08d9d5d079ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 13:36:02.1061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wPYdo7Ax+XhRCLI47eqv7LkqaIcjIL176o/+4uogve/h+qybEHyTeXqszTt48JVO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3565
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Peter Chen <peter.chen@kernel.org>
> Sent: Wednesday, January 12, 2022 8:48 PM
> To: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Frank Li <frank.li@nxp.com>; linux-usb@vger.kernel.org; Jun Li
> <jun.li@nxp.com>; Zhi Li <lznuaa@gmail.com>
> Subject: Re: xhci crash at xhci_disable_hub_port_wake when system suspend=
.
>=20
> On 22-01-10 23:07:48, Mathias Nyman wrote:
> > On 10.1.2022 14.33, Peter Chen wrote:
> > > On 22-01-07 15:58:26, Frank Li wrote:
> > >> Mathias Nyman
> > >>
> > >> 	Recently we found a crash at xhci_disable_hub_port_wake when system
> suspend if enable remote wake up.
> > >>
> > >> 	Basial flow is.
> > >>
> > >> 	1. run time suspend call xhci_suspend, xhci parent devices gate the
> clock.
> > >> 	2. echo mem >/sys/power/state, system _device_suspend call
> xhci_suspend
> > >> 	3. xhci_suspend call xhci_disable_hub_port_wake, which access
> register, but clock already gated by run time pm.
> > >>
> > >> 	Why find this issue now, that is because previous power domain driv=
er
> will call run time resume before it. But the below commit remove it.
> > >>
> > >> c1df456d0f06eb9275c1cd4c66548fc5738ea428
> > >> Author: Ulf Hansson ulf.hansson@linaro.org
> > >> Date:   Thu Mar 4 20:28:43 2021 +0100
> > >>
> > >>     PM: domains: Don't runtime resume devices at genpd_prepare()
> > >>
> > >>
> > >>
> > >> According to HCD_FLAG_HW_ACCESSIBLE logic, xhci should not access
> hardware when second time call xhci_suspend without call xhci_resume.
> > >>
> > >>         xhci_disable_hub_port_wake(xhci, &xhci->usb3_rhub,
> do_wakeup);
> > >>         xhci_disable_hub_port_wake(xhci, &xhci->usb2_rhub,
> > >> do_wakeup);
> > >>
> > >>         if (!HCD_HW_ACCESSIBLE(hcd))
> > >>                 return 0;
> > >>
> > >>         .....
> > >>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> > >>         clear_bit(HCD_FLAG_HW_ACCESSIBLE,
> > >> &xhci->shared_hcd->flags);
> > >>
> > >> I am not sure if it is safe to move xhci_disable_hub_port_wake after
> HCD_HW_ACCESSIBLE check, Or need add additional run_time_resume before it=
.
> >
> > We probably need to runtime resume first in case we need to adjust the
> > wakeup settings
> >
> > >
> > > Frank, I prefer adding runtime resume at xhci-plat.c like below,
> > > let's see what Mathias says.
> > >
> > >
> > > diff --git a/drivers/usb/host/xhci-plat.c
> > > b/drivers/usb/host/xhci-plat.c index c1edcc9b13ce..47a5a10381a7
> > > 100644
> > > --- a/drivers/usb/host/xhci-plat.c
> > > +++ b/drivers/usb/host/xhci-plat.c
> > > @@ -440,6 +440,9 @@ static int __maybe_unused xhci_plat_suspend(struc=
t
> device *dev)
> > >  	ret =3D xhci_priv_suspend_quirk(hcd);
> > >  	if (ret)
> > >  		return ret;
> > > +
> > > +	if (pm_runtime_suspended(dev))
> > > +		pm_runtime_resume(dev);
> > >  	/*
> > >  	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
> > >  	 * to do wakeup during suspend.
> > >
> >
> > Yes, looks like a solution to me.
> > Just checked that driver-api/pm/devices.rst also suggest calling
> > pm_runtime_resume() in ->suspend callback if device needs to adjust
> > wakeup capabilities.
> >
> > Frank Li, does this work for you?
> >
> > Peter, if we now make sure xhci host is not runtime suspended at
> > system suspend, does it mean that the !HCD_HW_ACCESSIBLE(hcd) check
> > you added to xhci_suspend() is no longer needed?
>=20
> Yes, it is no longer needed if xhci host is not runtime suspended.

Looks like existing non xhci-plat user(xhci-tegra) is also calling xhci_res=
ume()
before calling xhci_suspend(), so it's safe to remove it.

Li Jun
=20
>=20
> --
>=20
> Thanks,
> Peter Chen

