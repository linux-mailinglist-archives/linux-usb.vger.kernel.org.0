Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2CD4047DF
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 11:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhIIJjE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 05:39:04 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:60513 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhIIJjD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 05:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1631180274; x=1631785074;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SBj4zsscagjqQ34CcZErDJ3v3Z3iO7gMdXEcFzYB7Vo=;
  b=GHQVwb81ntCw1XtfR5yayOsjFmqNKiZwz8co7JMCPi0dl6zd7caIoJdV
   PU/QAxgWST7OvVrzu34yan7ezaJvG1eYQABwQFjU1YDP9E+FtBu6oOhM5
   fvuzrjF1E9RDyZ3JB+5crTYGsnl0+ii6CvA/28JJcI/BdpfRvfrPNuw7b
   w=;
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 09:37:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mg8e/puD2DbgsKN6Avu9HLObnoHlrHRYJGIeiSOS+JnDg/gpukhRW29Mey/g30+Y+V1a9obIAEaof6gkr79tg6PtOrsN/gP2zWb2e1QWbrSwy6ep6gd56MrdpPPbuBPU4ztWp8B+aB2R1Pw9YZmTf2fypRkJwGwvHd0+/3yJCiSWxQsW7Ch45OtIi3RO1D1VAMYesyxLPQXDDhNrceJEZRMXNhh8J8stEmMJrwdUvBfqI9Gokb83Fkt6N/SycowOGZl0a/7AURme9dQalz/7T7Q39y3LRBJUMc1WBcUxAWw//RSUw9AE9Lb98xLiXUva7gRSHqG4E/1ooleCBCxO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=SBj4zsscagjqQ34CcZErDJ3v3Z3iO7gMdXEcFzYB7Vo=;
 b=ORXWQS9xLTc63Nb1z2z1cG3366VxvDm49mzUGvO5s/1er0M5AvURYPg5CX9E46tCvJjJN7NOeiF9Qjj+pKWVvE7Wc7MgJTRzN17O3ThjVQAQPNQzgyzPXRnmG8spgER/HwxBckIZrcVAov9NSZGMKaKT0q+vrcyh38sOHPrkUOtlkAYSHYiSD26NFA0OW/m6vIeg2gxqNbk1+Xr55aqdO46PZVwgSnJulZViPsXqbb+dJ26INZZkiBBLvuUputBFT9iGU7f6FQ6gnogPd/LXdAudg0xYn3F5caSHoUnncKuIutHyPG/C+hKSWiOwS2/hcyUUFQt2w/u4jiyGGvLePg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM6PR02MB5787.namprd02.prod.outlook.com (2603:10b6:5:179::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22; Thu, 9 Sep 2021 09:37:48 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::19bd:f5d4:bf47:a8ce]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::19bd:f5d4:bf47:a8ce%3]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 09:37:48 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Thread-Topic: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Thread-Index: AQHXpT353plWr6c52Ui+Me9fB9ClQaubrb8A//+b6ACAAHxtAP//kPuwgACB0QD//5jS4A==
Date:   Thu, 9 Sep 2021 09:37:48 +0000
Message-ID: <DM8PR02MB8198BC47C3C0598542B51A8BE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1631166347-25021-1-git-send-email-quic_linyyuan@quicinc.com>
 <YTmlbFw9DufQc6gU@kroah.com>
 <DM8PR02MB819856E1A159D7D3F820555FE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YTm51tmCXRtKZIcx@kroah.com>
 <DM8PR02MB8198F1672DD3A8179B5DF097E3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
 <87bl52b0i9.fsf@kernel.org>
In-Reply-To: <87bl52b0i9.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f66ebda7-1822-4693-028b-08d973757c50
x-ms-traffictypediagnostic: DM6PR02MB5787:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB57875B105279C99D0CB332C09FD59@DM6PR02MB5787.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w9ylOFbzYqYiSy4W4DCocz/F9K5CwJhknIVSCb/Gy+GstT1O0R4jj8iLnycH0QAiR+Qdxm3/zHTpkzLtdJ298eL5RySDXVk/RXzHp1tffTVxINYpGXMpY1Rix6QfNMHdelXmmRBwljeeTjESznnQHKjOWeLuWY/jY4FgNClzLDRzPOwq2TItUoqyV1Qd2JxpgG0mZdbe2UY4l/AJz646PHil6/OG5mI9iwAG/rI91TpNP7wSxJUbt2A04wQTRZoWhsPwR/jkQVSXEFGZetk5t51Yxyrs+2vzZrYRRJ5MlUZbXw6RmL7V7y/pBwHcDZyl0/xVWOSI+umf6P3UJ2FTomsZm3GR+esRCjjr8F+0NpLGbU5FCKtNRrqQ8lf539TfiFElua4hPryNKERVn1muXd3Mv++VsUar5riDe03tbxhB++0gNBTCaIUciWS2yqsHZMt92kaAxrYg0BPIfSYBYa30HIOuav9C1euXqirLpskKcq6RYMjhlNwHBW4/vD39Z6gxLMifZuNzfBP920QS82rWoXsBPTdIvCppYg8tckYZty72QRInIAvCe25ex7gFrvODieB0aY/xbJDSbFFwk305NpNfpFM4OzOJ7JBgkAA7E48u/DrCRAi3Zm9hk9LteYr4Unm4pF8qsAJJ1/0vRbF5dj0hDhYvUVQ77OknET/j0DrcuG/OG+Dl8mUEnMld6pnTGgZ2vlj/5u1iv00hZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(6506007)(53546011)(83380400001)(4326008)(478600001)(8936002)(38070700005)(55016002)(5660300002)(9686003)(7696005)(316002)(54906003)(52536014)(122000001)(76116006)(38100700002)(8676002)(71200400001)(66946007)(66446008)(66556008)(64756008)(33656002)(66476007)(110136005)(186003)(26005)(86362001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CYAZ+WNpgTlVGo1KUYN/fDNfmgDzcDsbEbkKQxQ3ksJD/9vfqXw8NFRWw9BO?=
 =?us-ascii?Q?6r9OHz7LqBA+vDM7zjfsjeqJ/XxF2F4Ryl6e9eVZ/xbZrK+rVZzfEhrTBdVk?=
 =?us-ascii?Q?hIBMEuCWpfO1aM3YxcijzhLfKzp7wXtHK5atDBWcxCsbniPs/XzzhisiHe8j?=
 =?us-ascii?Q?arnh7RKqaEnAENDKTRdkTSB345CfDsnsZ/BeSknlbsG3t8bzAK9odr7BBhbm?=
 =?us-ascii?Q?y5xJOm2JTkjbpj1/tKnlVM+uvy2R07waRixJq3zzCsyuOH/TPRs7doCip0gs?=
 =?us-ascii?Q?Qww1OlM/z8M4vGMGR4aVh7IoBijW5fpm993fafyIOPape6Vv5HuGYw6g6Myq?=
 =?us-ascii?Q?RuXTiWIS4jfziw5f3IJa6Y8Prn9VtxYzFjjJt8gRrAM2ux1jRJsFU/wR1KwT?=
 =?us-ascii?Q?1Kz3OGExsJZk2UPwP8CPc7TSjeSaZzinHSIAS7g3I/v+9uSpbD8Hshtezd3p?=
 =?us-ascii?Q?lesEsjoqDuNBw7u4sRMjg3RW7TKCRQxlavwEr2frKnvNVyVT5dtPr7mkrVCO?=
 =?us-ascii?Q?wqcwPXTPqXGipyu92MleQjqCC9Ypht+SN+nre3ZseFw1Lnn8Di3Q4AAzSwFM?=
 =?us-ascii?Q?qtopqLaoXtIrqd8+/VwWnteLFyDgTXzYJAyGI7wlMBrJQgLlkOL6E/gYkf9r?=
 =?us-ascii?Q?XWfm3va+hK0IYYDc6R+8BIIXanG5J1yrSLvFAL+THKdpzekk6QN3iWz3O2F4?=
 =?us-ascii?Q?Lok1zuiv1eQT52jsY9weJ4Wegzqg2/OXJ/EqewDuAto5JvrIrcHmJbFKAizV?=
 =?us-ascii?Q?wPkgYh2fve9SXTYOx4eGUKmmHsSDEjps0VcoaK2Y02D6zIQ+VZYdogHndVlf?=
 =?us-ascii?Q?Oi6l76HEqx6nKQIyMD3GpNJBmOZ3UhAr436hhKoTEyUgDsC7R4d86HW07LoU?=
 =?us-ascii?Q?4ePcBo3YvaaFRlAb1hKhYuUJG3/RGSkSA0ZvjDfIKpwYJEL96ua2E3Dp+TtX?=
 =?us-ascii?Q?r0iduNQchZdgfYcPFKPtvsDCKv496/87hwJIX5ZGjmnYm5VjynVjKRdrexkD?=
 =?us-ascii?Q?WVgIK0n/HknAX/7oRbV/yz3phN7+FeEMlIIlT0Mwa5PLLDWvPVO60CnnYdLm?=
 =?us-ascii?Q?RemC30YtHxCxchP+m8+NV92tJ9+oVDhvvUchG+Vta8eQu8K+5alQoGsg3Q2T?=
 =?us-ascii?Q?3bAKXznSKpC7IqYl+n/p6+mx/plKutauGSNFDZzaZbPodCxVcYdnMzzkwrWh?=
 =?us-ascii?Q?9KUtmYoUIp2KomglkhHALKwU36ipg8e9ddCznm0Orb013EaQFdhpQJxexcdP?=
 =?us-ascii?Q?Wn3GRDbvT4+7xfaEgPALqa1JCqhdEVEAf1kkXvcwumeocAY2x4mDso+Niglz?=
 =?us-ascii?Q?VBk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f66ebda7-1822-4693-028b-08d973757c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 09:37:48.2636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6bN5MKTqYmZOP5JqaiV6I6z6bVpyNe+qLZ1cP29lc7axPgV9E1HT2GEQn+o/XD8fIl7gGMGxJuDiI/adStSlnm69DgoS8VdZuqGm9H0QbCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5787
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Felipe Balbi <balbi@kernel.org>
> Sent: Thursday, September 9, 2021 4:45 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org
> Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
>=20
>=20
> "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com> writes:
>=20
> >> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> Sent: Thursday, September 9, 2021 3:38 PM
> >> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> >> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> >> Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exi=
t
> >>
> >> On Thu, Sep 09, 2021 at 07:17:57AM +0000, Linyu Yuan (QUIC) wrote:
> >> >
> >> >
> >> > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> > > Sent: Thursday, September 9, 2021 2:11 PM
> >> > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> >> > > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> >> > > Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after=
 exit
> >> > >
> >> > > On Thu, Sep 09, 2021 at 01:45:47PM +0800, Linyu Yuan wrote:
> >> > > > change device release function to clear gadget pointer.
> >> > >
> >> > > That does not properly describe what and why this change is needed=
.
> >> > >
> >> > > >
> >> > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> >> > > > ---
> >> > > >  drivers/usb/dwc3/gadget.c | 5 +++--
> >> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> >> > > >
> >> > > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget=
.c
> >> > > > index 804b505..e2ab5f6 100644
> >> > > > --- a/drivers/usb/dwc3/gadget.c
> >> > > > +++ b/drivers/usb/dwc3/gadget.c
> >> > > > @@ -4188,9 +4188,10 @@ static int dwc3_gadget_get_irq(struct
> dwc3
> >> > > *dwc)
> >> > > >
> >> > > >  static void dwc_gadget_release(struct device *dev)
> >> > > >  {
> >> > > > -	struct usb_gadget *gadget =3D container_of(dev, struct
> usb_gadget,
> >> > > dev);
> >> > > > +	struct dwc3 *dwc =3D dev_get_platdata(dev);
> >> > >
> >> > > Are you sure this is the same?
> >> > Yes, in dwc3_gadget_init()
> >> > 	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
> >> > 	dev				=3D &dwc->gadget->dev;
> >> > 	dev->platform_data		=3D dwc;
> >> >
> >> > here original code use follow container_of, it use same dev,
> >> > container_of(dev, struct usb_gadget, dev);
> >> > >
> >> > > >
> >> > > > -	kfree(gadget);
> >> > > > +	kfree(dwc->gadget);
> >> > > > +	dwc->gadget =3D NULL;
> >> > >
> >> > > Why set this to NULL?  Who cares about this now?  What changed to
> >> make
> >> > > it required?
> >> > It better to set to NULL for better understanding.
> >>
> >> Understanding of what?  What issue does this fix?  You need a reason t=
o
> >> make this, or any, kernel change.
> >
> > Sorry, let explain, for example, when do role switch, we can check it
> > value to make sure it switch complete,
> >
> > If we do not set to NULL, it will be invalid.
>=20
> Using this pointer as a role switch flag seems fragile, though.
Hi Felipe,
I update a v2 patch, no, I didn't use this pointer for role switch, just us=
ed to check role switch status, make sure it complete.

    when do role switch from device to host mode,
    first disable device mode, currently there is no better way to
    confirm when gadget was complete removed.

    change device release function to clear gadget pointer,
    this will confirm device stop complete when it is NULL.
>=20
> --
> balbi
