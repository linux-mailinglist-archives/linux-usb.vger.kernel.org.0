Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88D1427787
	for <lists+linux-usb@lfdr.de>; Sat,  9 Oct 2021 07:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhJIFa7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Oct 2021 01:30:59 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:32375 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhJIFa6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Oct 2021 01:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1633757342; x=1634362142;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jOhby8JcCq5evpZoTUEjuIRL3wVAwYaPJKWkVpQi1Vg=;
  b=cqvEtoQM5PKs6XsDlMfhGHlXvuZK+zX1sJb9TBrDvtwqLPOQ2EgjdOZW
   i6KQlcFJw2LOQJ8p+HhfMDlxsy4+Lhafjm0W+E4aqxIT6PTPqwS6585tf
   UI1+/dcHrP/9bsDLTLYX+8qlE24rLMiS5LeCwKHpCLcCrSvd92zUgrHoB
   U=;
Received: from mail-bn1nam07lp2045.outbound.protection.outlook.com (HELO NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2021 05:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6DLgX9iXZ4q0fuCVAz0U4crULHD2RWzqCURMPFZnNTR+/5wNHE85yKGsEhEN5wL2u/Yed/u/3gq5fxrkdy/lf1WwxtSYg5OEB5awD8sCI3TziAJLh2zxbjrltE9NOvrx8Oq38MwNVtDKYo1JnmffKmhKb5r3HR4mEZyiiQwAkY77QYLQr4ff2hJj/JhvEZqd4kTqnWdQKc3JjqW4YVoCXy/wqcsJvdRaEwpjsMS6XZjkYnlQrHweLEjYw/pwC7RkPB+AqWA7qUHZqKbbbtiZFZBN9PBWw61GyGBY1AR4im2FJt1jHE8qCOfgJ1BV+q4xmZ0lL2iUTO3ms9xXVjbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOhby8JcCq5evpZoTUEjuIRL3wVAwYaPJKWkVpQi1Vg=;
 b=lbrxZRpStfUWdxSRkjzD96nGSyAikWyJCWx/+OCJMooOFLagRGSLukZrsy5Vet14LtYGmaY0GQQgVqWNhVpS3zCtVYzynl0+RN6mJ+cqyKxB27YSQGRXaqq1zjmH4ioA/OvJIn0VW0Tb342oDAdF5KfMH3YjwBG06nl4n5eMihG7hcMpkxVL484Bx/L2KMxENdgnf5e9qeRfqwJ1MV98CCyywkpd+/Aq8Jg/G45KqHgyhvHfZmTBsW0YGGh0w7MJY9oN1UrZdrBzDeERvEqpvpYHBIGxHu7ffcFf/04tJ2kQUhnwlc89CzoB4GtexTtrRaFCmEH2aUX7WBzbFI5C6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BL3PR02MB8201.namprd02.prod.outlook.com (2603:10b6:208:338::17)
 by BL0PR02MB3828.namprd02.prod.outlook.com (2603:10b6:207:44::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Sat, 9 Oct
 2021 05:28:56 +0000
Received: from BL3PR02MB8201.namprd02.prod.outlook.com
 ([fe80::51fb:e0d:4b5e:4cfd]) by BL3PR02MB8201.namprd02.prod.outlook.com
 ([fe80::51fb:e0d:4b5e:4cfd%6]) with mapi id 15.20.4587.024; Sat, 9 Oct 2021
 05:28:56 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Thread-Topic: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Thread-Index: AQHXo4UNlBSIOyDIIUmvyeFQTj9v7avE4aQAgAVw6/A=
Date:   Sat, 9 Oct 2021 05:28:56 +0000
Message-ID: <BL3PR02MB820103E260254CF9D4C9998EE3B39@BL3PR02MB8201.namprd02.prod.outlook.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-2-git-send-email-quic_linyyuan@quicinc.com>
 <YVwywFfe/x8OEHh8@kroah.com>
In-Reply-To: <YVwywFfe/x8OEHh8@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c1ef71e-4711-49f7-849b-08d98ae5b0bb
x-ms-traffictypediagnostic: BL0PR02MB3828:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB382862716ECF1B01FBA9CBEE9FB39@BL0PR02MB3828.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AwaFpkfeg0h3JT4LQjyozC6vuzrduNION8IN2xoipQ4QwELTUj4Cjb3pEcmIdKrWyPcJMwWorMarvWtKzt4stX0G8e4v19eEIccnLhkvB61CMlRVhkJqemwqvKRLAt1/EDt5EqZsA+kLLHisSA1H2aaiWYeHo2ljAt64ZPkwzkgQxvNf+sD70zRQTRXLKHXC4rHxn9qrkTTnFxKHs0tjN+fEZkgdRB/m4s1WExXi/dSTVG94BAhkSWrDhwi3z+QVJ7g6ePod6S4fuxzl69iVXh0dUdnPlGcLKKuUFdpFy9WQ+DBVCCY+fuUVsjZjPq1QGaaofoJH9vFo0Ts/ZEVyOOHiEx1+A2aZXIyQ4CJOWeC5+yZ4mbzqZpl66wj2gOZU7N/Or6UYAhR2yakHclTR+6UvX7E6uUinehjZtJGs9AbECMQNmn/Ts4iuvsvThiPNzv0r+xowKEd6WlMnXUWAmJXz1A6mFmU7shfUr+m7CJtAKzRvxTdHRiau+XwRD4t5L6bn7jNp/he7E/zTEP6xIhkd6a0zguqzeuvhuRULQ9ZlrsBwNkyvfB1K4XQnsN/UF5f7t7rYsGdyXLJ0JPZBg14GtDF4J2sGZx7NuWNCKn30MxuvPqyviAGpeCQAi61AZO8OqDE0f9mXIEcvYMKBjFTvdio1p9iux/DaSCZ2rERS1Rm8P3Ixbnp+1rwd4mmLHqNLs5ccDT/H1XIUC1tW3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB8201.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(71200400001)(5660300002)(110136005)(66556008)(64756008)(66446008)(76116006)(38070700005)(66946007)(7696005)(508600001)(54906003)(8936002)(9686003)(6506007)(38100700002)(86362001)(52536014)(26005)(55016002)(122000001)(4326008)(8676002)(186003)(83380400001)(53546011)(316002)(33656002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q3IDlHKPAgaBQo0dASfXZSQT5dP6fytxiT27oNw2hBjwnmhzlUrbfl/HFoRe?=
 =?us-ascii?Q?2xR+XFSMSYYmwUna314JUcMLvCQRKAl9QxxtW8KCw939PpniGtRdrUucRbjs?=
 =?us-ascii?Q?96NZCenzOicW6/lnet5c1FL1a2WcMo0sJW0ZnmGZCpOPi1ATqvPh4IBSuI/n?=
 =?us-ascii?Q?CWLtgmDHZaGvdvjXWuWy6uu0iXtFoUGmlMLtzyKceJmPC4L5fzUHEpHMq4ks?=
 =?us-ascii?Q?VbWuFW5nMEsykJrXzVWyq9E6HFJ5CvQ6FHECVjMsy9vLJpI5kAfgGDIfx7N2?=
 =?us-ascii?Q?YdG1VHUaHbmhsz1UPwtCqW4cq10x6GXiFtlcv6E29k91MJpdTfgfeoJbPBaU?=
 =?us-ascii?Q?CfJQrFBPGuGoqgAqxYzM96X1f6V4D9+n3uSGrGgA80Zo7pjC2d07ZX9vIKFX?=
 =?us-ascii?Q?MDVnwqE/KgNWEpCJ+CHi+RfqzMdRsEyL36lSx5cA5lAnQp04IV0nFyG2EVmi?=
 =?us-ascii?Q?/KrVt39dnV3lrlKuK8WzjbD7PJE2VVZ0vGeDvYfe4EuM1DAIvUdHJlSYuCxd?=
 =?us-ascii?Q?GEFZabS4K/CA9rG3Se17X/y5uLswtzNeJRPQ41phtwY4XOwQo7/M+7tBLJyq?=
 =?us-ascii?Q?7oG47cPyj2iKy7995OMtMA+hxC+gZAaURPeYDjMvWF9dRTMf/x48o9Ywad0j?=
 =?us-ascii?Q?+rKsXTTc+KHHQVS7/hbiFZ5+OeUIFT1BZBd/9V72T2n0ce9WeUOh9ePmd2qq?=
 =?us-ascii?Q?AJpytMot2BrKmRgjHxEFThmDa1ICQn5DjQiFsLo1H+JW1/dp4nhfB1FnbKEB?=
 =?us-ascii?Q?Ivure51tmuMQBmJfhzRJR19R2IQbRkavmUZbrbX336PtumPPM5YJrofFDh0r?=
 =?us-ascii?Q?3SCuxHBy1TAz6A3sS+WKs6CEMeCdng0E8vnBqCAd6QwQJJCxPO/9vSU04Ist?=
 =?us-ascii?Q?2wZZN17zRliL3g7o9b7eWF4YNqM+RsJHG7zHdCUWc6BgLTj/fNGhM9RIqZht?=
 =?us-ascii?Q?rz081RtqX3dj74NoNbfr4Zstq8anF9AfxAy7bOUkgNr0jNVV1d32Kjzt9L8i?=
 =?us-ascii?Q?ZoAZK8WdpPqpb10b2718aN+Pxl6P6vI/eTgSg7Z98kPyfJLHqU7jmt4Kivvn?=
 =?us-ascii?Q?unXb0eEarfgTzlBfaOgJSbp0EK1C6TXDgvG/prhchBz2yrdpSJhzxH74IszT?=
 =?us-ascii?Q?Tji4db0ZBHjTYD5GGJrhRl4gyisZCU3QKOrcCwRBBu2e1ihK0Yh5zPVZjPW9?=
 =?us-ascii?Q?fRDSsp9H0GdD3PwIAV51ourI46x1sbPWtyFSydeb4mwpt0RtKoqwdW6+vtIt?=
 =?us-ascii?Q?fB6w4wfIwEhlq4tqwVcQBmn7FOcz3cwRvt4BaAOptLAo2qez6P0PaScGZ897?=
 =?us-ascii?Q?xZE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB8201.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1ef71e-4711-49f7-849b-08d98ae5b0bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2021 05:28:56.6201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qM3zJJA6M+FjdnsMU0IV4Q3IkMLxg0ZcbnV9kIZ795aGJjqwoVBmMUIqvdFGz2xRe5mEENd7T8P433j+azu2iO+LGqnm6hnl4ttbNq6to/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3828
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Tuesday, October 5, 2021 7:11 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operat=
ion
> of usb_function
>=20
> On Tue, Sep 07, 2021 at 09:09:35AM +0800, Linyu Yuan wrote:
> > add a new list which link all usb_function at configfs layers,
> > it means that after link a function a configuration,
> > from configfs layer, we can still found all functions,
> > it will allow trace all functions from configfs.
>=20
> I am sorry, but I do not understand this paragraph.  Can you try
> rewording it?
Thanks, will update next version.
>=20
> >
> > Reported-by: kernel test robot <lkp@intel.com>
>=20
> How did the kernel test robot report this?  You are adding a new
> function here, it is not a bug you are fixing, right?
Thanks, will remove next version.
>=20
>=20
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: fix unused cfg variable warning
> > v3: add struct inside configfs.c
> > v4: no change
> > v5: lost v2 fix, add it again
> >
> >  drivers/usb/gadget/configfs.c | 55 ++++++++++++++++++++++++----------
> ---------
> >  1 file changed, 31 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configf=
s.c
> > index 477e72a..5b2e6f9 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -58,6 +58,11 @@ static inline struct gadget_info
> *to_gadget_info(struct config_item *item)
> >  	return container_of(to_config_group(item), struct gadget_info,
> group);
> >  }
> >
> > +struct config_usb_function {
> > +	struct list_head list;
> > +	struct usb_function *f;
> > +};
>=20
> What lock protects this list?
Currently like string list, there is no protection method,
I guess original author hope it can protect by following lock,
struct gadget_info {
...
	struct mutex lock;
};
>=20
> > +
> >  struct config_usb_cfg {
> >  	struct config_group group;
> >  	struct config_group strings_group;
> > @@ -420,7 +425,7 @@ static int config_usb_cfg_link(
> >  	struct usb_function_instance *fi =3D container_of(group,
> >  			struct usb_function_instance, group);
> >  	struct usb_function_instance *a_fi;
> > -	struct usb_function *f;
> > +	struct config_usb_function *cf;
> >  	int ret;
> >
> >  	mutex_lock(&gi->lock);
> > @@ -438,21 +443,29 @@ static int config_usb_cfg_link(
> >  		goto out;
> >  	}
> >
> > -	list_for_each_entry(f, &cfg->func_list, list) {
> > -		if (f->fi =3D=3D fi) {
> > +	list_for_each_entry(cf, &cfg->func_list, list) {
> > +		if (cf->f->fi =3D=3D fi) {
> >  			ret =3D -EEXIST;
> >  			goto out;
> >  		}
> >  	}
> >
> > -	f =3D usb_get_function(fi);
> > -	if (IS_ERR(f)) {
> > -		ret =3D PTR_ERR(f);
> > +	cf =3D kzalloc(sizeof(*cf), GFP_KERNEL);
>=20
> Why "kzalloc" and not "kmalloc"?
Thanks, will change next version.
>=20
> I don't understand why you are moving everything to a single list in the
> system, what is wrong with the existing per-device one?
>=20
> thanks,
>=20
> greg k-h
