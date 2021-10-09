Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27094276A9
	for <lists+linux-usb@lfdr.de>; Sat,  9 Oct 2021 04:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244159AbhJIC2M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 22:28:12 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:45633 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244102AbhJIC2M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Oct 2021 22:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1633746376; x=1634351176;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=No8xR3YthVEDpWbq40e23l8yrmvPLi7XxeMt0T0HX0E=;
  b=jNhwWMWramAsHISDjgqzqoXbU5UWdx5GWDkLAZhjanmDcvHXtFtS0DqB
   sTIfdfRVKnf64HOWzMPvCTpMN6oUPueKluomY0qU8se+L/0qEupMq7M+J
   lnwJ8GO419YQDjz745UUZy6cM7yikOZPo+v4NE5D9RIrlID/R40+jFlbd
   I=;
Received: from mail-bn1nam07lp2047.outbound.protection.outlook.com (HELO NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2021 02:26:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjvA2PAKgQY1G70/faHfUZC5LtdOwTTXPfDqihqXjQf0mwDrpei+LCUcN+Bjd+kfEpdFx7YvgRlD80k7oq+xdjPveiv00FvNOSAD7Gn2d7yTRpuMKHjdbxzAhvTOIMkssFi882y2dLuHuKTHorsLTlK5yOZh1wK9RRoW3kiT2HylJXcsAncARaEmSPUSuzjQ08tkswQtsEyt1nEAIAhDcp6V6NKV0wJf6CyqGafyffsfCsmfE5FFYK/IvEFYXv8DjtWws4YogP4w3mCF6UwxFJqCXK3R9OVKKbuB9ySz1cxvPz4n2f4J+zAbJchyr9rX0/lEN0HF7T+G0Uv6PBQH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=No8xR3YthVEDpWbq40e23l8yrmvPLi7XxeMt0T0HX0E=;
 b=HI+t0fOY7TxwZrEOVcdmVgUDIafjW/rw8Q9IwDFU8hzYbtJLUjmGOgmWNdJk5wwiYx/QpM0L+QGjrseyjipw8uClBjJk9ZkbSl0bnLQ7pOmm38vUrgtZDzueSE1n/7Yz5YudvnqPcWzecZyyGBBtQB3CQw6fICMK+KKatdWW10CbLy3hZj0dKHzAxtn9cZkRKP9PC2+rhcjnkd11iWD5faxKaWqGbr8+HbNCvCNzYQ4i1EUQXDBB0CILEzUpOsPLl7SVBlYiGR1ylyp4eeQkr5DNFtGaQ7R/Hg/0DHRdMU49VafWI4YzVygXAckm4SYeBneyLz+lrQUIZVsO88j03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM8PR02MB8199.namprd02.prod.outlook.com (2603:10b6:8:3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20; Sat, 9 Oct 2021 02:26:08 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::55a4:d8fe:170:4479]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::55a4:d8fe:170:4479%4]) with mapi id 15.20.4587.024; Sat, 9 Oct 2021
 02:26:07 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Thread-Topic: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Thread-Index: AQHXo4UNlBSIOyDIIUmvyeFQTj9v7avE4aQAgAU44jA=
Date:   Sat, 9 Oct 2021 02:26:07 +0000
Message-ID: <DM8PR02MB8198787E8C17F646B7DED9F4E3B39@DM8PR02MB8198.namprd02.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: c84e4c21-1ead-493b-b856-08d98acc26c6
x-ms-traffictypediagnostic: DM8PR02MB8199:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR02MB81991C0145370CD74B747B159FB39@DM8PR02MB8199.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pvrynquyYp4zl4B1PQCid4FCQjo3ENwoCYR8NXsZeTSzSjDTrSvopMh8fVzzqRBV1XS0ixClkkNh0A4g95+2VfNkku/lhTDkMr6jznRBaKzZVY6SvjYIOy5mZWj5ydCpvHAop2IA97T+qK5XAxMPzE33oD66jDV+WiSlGxjaFWj372IYeRBO7M5Ifg2sh9BYQtBkKEig49s21lNi4ShEvNhKViNFEuujNcsKeom2zQQLk1PovMZ+MBGzPEy03Bo+1HdurEhjjGAchGfvDyj8cbk4Hfoid6h/hR0zDC8XfcBfm7/V42EF75+5dpQaykobsXT6Xo+FIdmfGbsHPwhyjB2nKL9mxk7L9CYG5Era6Zx0OHDZR4aQ4BqOd/cz2iRyVnjTMIPpA0wBVpG12PdLvn2WUmsUDB/gGvLFxbMQupRUpuJf5v/IvPAxzu9p0a0xv5lT9Nb/mNPVoDHbTBRi4BX6WmTr8rwBBlEfg4NqMMjlgps32Mo1BATpOBS/sAef1z40BGfk/UgonmI3NI4Tt7ylDvcXNR9ZVX1JvrlWi7l7TmkkXtHlzmkRtmjp7B/Iii1Xb+WqM/why5v4/Ib6ghM5pQVv5ShYNJDK60/6ubrtCZZMjZixQXC4tpWNYvgMbsPkolrOX+dbNQLQxejyouCMAXbXjC9kSW1YvKdzkwnKDuGsI52LPF9aO4x3brYGP+Jk2s7b34VG9Xo5o2RWcA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(33656002)(86362001)(64756008)(186003)(7696005)(26005)(66476007)(71200400001)(8936002)(9686003)(38100700002)(66556008)(76116006)(66946007)(8676002)(122000001)(66446008)(55016002)(4326008)(53546011)(52536014)(508600001)(83380400001)(2906002)(5660300002)(54906003)(110136005)(6506007)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q97ZOjJvk6egXxeD3y68XwCQhWjFhgM8k85yhSPVJ9Dh/ztVwY5EabIgsg/+?=
 =?us-ascii?Q?CLQUEKKQH9utFATZWZCBdgDwpoekQ+dKnmqhzEPWe5I6U5QRQoYoozLC8smY?=
 =?us-ascii?Q?xOtD/tcQLl6wzIn8L3r+jIsWh7+70ApNfIHiD2L89yogJfVDJihyoZqKopH3?=
 =?us-ascii?Q?aexNhEQEZLKG1HK1DYyBaBIdFiIFw8ZGd3SBiJSp6EzYzcqIFXb4rer/bMu3?=
 =?us-ascii?Q?Qd8Y/lcOOcasWZ9/4XHuv3pTZkQvK98wv/spICNGC4tILFhs5/DDvei5Bbmb?=
 =?us-ascii?Q?QSZy8XLItJT5YQaANkZusgOeD+aQXpck8tLG/o0uPGaSYJnKd0kvEyxBGT6R?=
 =?us-ascii?Q?glWdqPmiskDRv8haG7+GAlDql7cx0zSOL1x3QytRgvykmkcylhiuVYvgXIll?=
 =?us-ascii?Q?V1JKN0REmSJNNQPEa5mDrNmPxwVRHrkBpvCK/+93vReJC1qVE8AKKiHJdzFp?=
 =?us-ascii?Q?jJtHlO1lhRe9T2KoTGLgMWFehKOc9Tdvboj88WBjVZ3Uk94PUfVV/ywYUVOV?=
 =?us-ascii?Q?1Kj4WQPIfrP3LzitvH/+m/+hHIvHlcu8JILxaj+SCPlzOtB50lhDteuXN68s?=
 =?us-ascii?Q?B8qy1GyDSP28AHjcRUfOVltA9YMtIr7m1LjHnrlZHrWzZ7TjGMD6/o5dJlUk?=
 =?us-ascii?Q?dJmjJS7BoY1JXG6RyU4Zq6KRPtHQylNmULT5QnpGbnJUH9AKzUBb9P18JxzI?=
 =?us-ascii?Q?0Mq1CZITpnS9AhQPQwdyzjJrInl+tDAs1v8EzkEWLZGuxqMSi92kNvTmhJry?=
 =?us-ascii?Q?SNi2r3R7423ZRR83qXcWsRzP6bbsOgAdcU5CpMbaKVAXlydzk9v/pBSGCgxC?=
 =?us-ascii?Q?2Q7IbT35R7yLGKquQhHqp98SHjhVLiF7Yo+HZZudAd3TCfs6FPJd6FVEzc4G?=
 =?us-ascii?Q?J7OMBqqfV5VTU9QhUDM18RBntr5mqLqxWA4HJJYa94OZd3K3UxBaKQqhsEul?=
 =?us-ascii?Q?GUybgExELNjoV0jRK+n+NjktKsdA5Rd/2ntZq+sU7QGeR8t0NiTLfMXshB3M?=
 =?us-ascii?Q?pmCG4oxhO5k7/a7DmAPqrRDsGf5m+EdFEJRxocMlCX0a7wx7nNYpkxe3v786?=
 =?us-ascii?Q?lGQeXvO68JQj1iNxBSHoFoOKvy60dWqM04ii91istGh+Tc/fFvTKaZQZnA5n?=
 =?us-ascii?Q?CnOc7IqMb66v2DZoCT6USaN5iWsslwvLzIS7Jn7A/XJoT6b6FSn1DhtI+0B/?=
 =?us-ascii?Q?bk+1pkdCd5wl6n0sN+0/ilSHntrO72OvR5UgXd9gpKHNnmCRIbjhNVE4X9a6?=
 =?us-ascii?Q?K6Pv4pJdQhyTD12948jXWqEFL+mdHCkiZqgxYsc/H3HPonml91+nSeylVHr/?=
 =?us-ascii?Q?HQQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84e4c21-1ead-493b-b856-08d98acc26c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2021 02:26:07.6631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KaFj2aWOO75d8ynVQcBRNz0IvHBZh9EgxfDqzXO9E/Yw4gMfsFl75aNZihPoBxkwZO9Oy4mmhyg4pLULbo+kBDt/H5JNDRMFwt4z55DKUZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8199
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
>=20
> >
> > Reported-by: kernel test robot <lkp@intel.com>
>=20
> How did the kernel test robot report this?  You are adding a new
> function here, it is not a bug you are fixing, right?
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
>=20
> I don't understand why you are moving everything to a single list in the
> system, what is wrong with the existing per-device one?
Thanks Greg,

Let me explain what I want to do in this  change,

For original code,  when add a function to configuration, it will add funct=
ion=20
struct usb_function {
...
struct list_head		list; [1]
};
to following list,
struct config_usb_cfg {
...
	struct list_head func_list; [2]
};
Then when bind happen, it will move [1] to following list,
struct usb_configuration {
...
struct list_head	functions; [3]
};

When unbind, it will move [1] back to [2].

We can see list [1] move between two list head, it is not easy to trace.

And when I add trace, I only want to get trace info from structure defined =
in configfs.c,

So I add a new list which ONLY add/remove to head [2] and it represent a fu=
nction in configfs layer.
And original list [1] will ONLY add/remove to head [3].

>=20
> thanks,
>=20
> greg k-h
