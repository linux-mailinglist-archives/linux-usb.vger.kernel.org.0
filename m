Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DC242B2EF
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 04:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236878AbhJMC4v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Oct 2021 22:56:51 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:62651 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhJMC4u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Oct 2021 22:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1634093687; x=1634698487;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UJHXcEwS0/GT4CPt+KIIT2JgO8whECkpKSkSCJOcBvk=;
  b=ZAgoRGyZ37qUTUL79xlCW4egeokxrWuQ48jC/OjOq+UoD4x671tWRWGt
   zBVnugNHLfoN00TcV9O3EfTRLWZ/k+4S+Z+BBKSKAmbQxluX/qQxHSktu
   aqtm4eAcZ4MXdJIvi5cyjLqulckDeLsadZMFHbi89cfW9jTclwDaIJAcU
   Y=;
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 02:54:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHLdyYz0BUVKf25hPvTlMWdf6tUaecJsAqwZTiYhz8r96PJ1hcDeDLnoZgoJ2bqbIbSFyJjdcjx7hVJMZB7UZb4m4Unjz4wT8sj3W9xoqt1iqzLXjWLcCHO7ymg2+zF4nNt3z1uvbCfU+H5tqDtcQJuzgpuO9KOAUh1jD06rzNmp7FOxU3xVgm+HSUebY5yWJkUygV8mc5VHGKJ1JdLA8qIKjbNT/nb+oxQcsB+ZUyJgTsFmSfMBCJGeF6BbIpXh/U5NRMp0reSmBy8ZG8VxAManUfjxXnjPebFPC8uKllx+1CHUobBEMwP/EcXD44B0by0Kr9aO2Gs57Qjjr0dvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJHXcEwS0/GT4CPt+KIIT2JgO8whECkpKSkSCJOcBvk=;
 b=QnrrqDj9KCIvyOurFnGYH8yC3F+MeoW8Qtdvc1UNvvj67ihHbY97m6VU0i1JXI81E+prLk77h8bwXMOB5wU7yoddU/JcJeyaV5JPPPxzGp/xqnsBowM81bRhT9aIYzuFxx78UGB09B/AgVh+QGBR41dJQVYUGvdxLxW9ONW+fxUlJLpTHS9i931Z+SkT/7662wLn1BvkHJocOhfb9Gc87M6ntXIVUPMlI8AUtaLW9CqJvBAvOK+iQHPcCXHkFFMo3OJvf+eSJM6VFwH9RUZKubufmUOm3ALKTi9vj9uwwRlrNegUgkZB7FCilAZyr7KBqEhHP67LBE2tibunqqsCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM5PR02MB3163.namprd02.prod.outlook.com (2603:10b6:4:64::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.19; Wed, 13 Oct 2021 02:54:41 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::9a7:6922:a91f:8f95]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::9a7:6922:a91f:8f95%6]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 02:54:41 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Thread-Topic: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Thread-Index: AQHXo4UNlBSIOyDIIUmvyeFQTj9v7avE4aQAgAU44jCAAsKNAIACFPVwgACybICAAM+P4A==
Date:   Wed, 13 Oct 2021 02:54:41 +0000
Message-ID: <DM8PR02MB8198D91F5C88AAF18277FDCCE3B79@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-2-git-send-email-quic_linyyuan@quicinc.com>
 <YVwywFfe/x8OEHh8@kroah.com>
 <DM8PR02MB8198787E8C17F646B7DED9F4E3B39@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YWLk6IvBsgpT+s75@kroah.com>
 <DM8PR02MB8198EFA6BAF945770FEB2E87E3B69@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YWU5p9NRQ0DVEXT0@kroah.com>
In-Reply-To: <YWU5p9NRQ0DVEXT0@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a48382a9-0af6-41b6-c3fa-08d98df4cdbc
x-ms-traffictypediagnostic: DM5PR02MB3163:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB316318E61BFE79877750C9919FB79@DM5PR02MB3163.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WPyRGKdltieE0UkgQv4BATdlLoOBbnkh+3zw6Cm1vo72sLwwhzwmHtVDx6VCJSOIj8kWpsL8Tom+U19I/ROYxXsP/gDP/9Pxb4/jM9d3gzLyOtpjrsUE5JKcgTa7EjwjkBjAMQI7RWij4fqBNqEMLPbQq3e9JGLtnqGYEdrMY4ciuh94pRpGYlObmDniGIclYNBI3pr/SuoAhMPFvcoLNWeI8LPTeQ4xl/YSWxvkWs2wn1KOSiCOljQjWfecKDozS+4Lfv7XSPSqiyEDsLZPHQ1ii1NpzUGfBsgiJ9FyexWczMFqnrMsbUvKxgfCEXe2HgduXLEGZzP6papfzogrj49E+CR+Fv/IO5OOoO3nd/ZFObi6hcIrEFNIUse32TKvFIApV/O4c3mqBIO+iMD8/Q1LEwvzcHvGB4GVfbhbrKU5Kfo5/WftyqKvBSInVYS4ztGgHGxh0Z3ZCq2WOEg3FOnlzgNPhGsiPrjKlD8M0mpakTQ9nkup8GfQEcDAoQNAfJFYjtB0g6Mmq4boH0N3eUu7Apnde66OPsatPlf/JfUSz23apAyChRlBrKYzBJ1qFTyBEhMrtRq4Bx4HyGe7x039rIpW8Uac0fK9ndN/NCJHqGlpIWKLMisuZe1hKBB/wt3dV096HcBahHxU//qdkO4d1oYemIOfEcvWIySvuCTUcliS9oIT4HmflRjk6ihluk5UtmbOoiEzsrKGGCLPHw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(122000001)(508600001)(38100700002)(83380400001)(5660300002)(8936002)(110136005)(316002)(54906003)(26005)(76116006)(38070700005)(9686003)(66476007)(66446008)(55016002)(86362001)(186003)(53546011)(4326008)(8676002)(66946007)(66556008)(71200400001)(33656002)(7696005)(2906002)(64756008)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mR4CFl5/SGW4V0Jmjp7xnqI1hUZ9cnHqQbJdviZVqFJgGzS/sgH7wraX0Gww?=
 =?us-ascii?Q?tnvTPUwfSsr/VLI/9praRiiDynrmnOzzvgEvS8agGSj/zU7lXcQP1PPdfM1e?=
 =?us-ascii?Q?IqPhEa0ISp3/tvnQr/XVtpu9XwO9YFtnNaqW2qXc4uSvrE9+WTTbiabvB7QW?=
 =?us-ascii?Q?XUrXEg8N1lGCvK+DCdKMTCflKfLQtmEqV9UROJOE3PgmhAqgLNPWYA+i/PyS?=
 =?us-ascii?Q?uYd0qCZJTCpy/cpOCrlDlGt+wJe+hqeXREAqfUw/R9kGWX2hUCiADmftecuJ?=
 =?us-ascii?Q?W6P6D///5nQ7GgaB4rAf9hq4fP5/frgfKaaJzFlqmgMcnS1eE8ouRL3B1Fco?=
 =?us-ascii?Q?a13/DbTyHGUruffZXUW+6o6WRtBZKuiF3PMALRota4IN0vJvnHejeNGJ+Sik?=
 =?us-ascii?Q?PPXSYc0Qlk4vRTsaE79fCxGF/7UfIojftmmzxfvChDF38V/JCQjGwWmCjPxu?=
 =?us-ascii?Q?ILM0etgBiwt75pGSHay9m3ATVlXXqYHvgCDZzpsnRLgLeERf4NdnF+Y6QV3W?=
 =?us-ascii?Q?s6jHN3c7Ms/kLy9Mv6T/HOCw3wCKB3OK21FEpxED+mMep8rFMAUzB2KAF8Ld?=
 =?us-ascii?Q?Yk4xCs4OklN95BHlK44tvcIWI2oJWbLQ1KzJcU65m7xABbKp8L1fDJnC4DkD?=
 =?us-ascii?Q?wMREuhrda4dH2AIFwAcDKDoJ5DKCm1uxXpUSON6GMp1AJNuduPTBmnnsYhyy?=
 =?us-ascii?Q?erusxI9JA6vxDzvJ7jy0i5oNlnXjX+7WkWNdO4s2J2T+cVTQqVQfdX+jwsAl?=
 =?us-ascii?Q?LtgaFRPuqc2320T5FriTmbQZoSKdUOGCBdrktA9Q43+W4I7JDY584mhWDgnH?=
 =?us-ascii?Q?4Xbb1EdqpoF4tNj9NZb4xSp9yZZM44xQQCbcClUkRa9Fe+pW7L7dovr4Pe87?=
 =?us-ascii?Q?PCwX6byaQfts5UR3flMamZjYbxYqzbcW5D3h82+Q9Zgn7sfq2yUMFi3p99JU?=
 =?us-ascii?Q?6h8EoFQALEAcbnjh1UIS6zukZ8EEAOUT/rj/05IGg46SQmMtKaMdfDZEX6xl?=
 =?us-ascii?Q?XY+jmixk4zH+TxjZFkJmY2c+0ZlZ9rGqIWBWgwUbgx+Wims0hi0GMdq0Uzzm?=
 =?us-ascii?Q?fWw1sS24SFZXhLmhO3/C2sBTr9wyDH1iQDHiJLaeiUIhMLsFglTgU/meJ6MV?=
 =?us-ascii?Q?U8bk0qSBjgQvBGDxSZh5PLl28MD+HeExzyUfvjx74fuaLF23jaxPDa1KfpmD?=
 =?us-ascii?Q?cwnQlHaXaEDtLVJmUEpRDbbMkfBKJlWM0BFOODbG6E7zJ7eVBuKJDwqIy1nW?=
 =?us-ascii?Q?/GvIbBNAZ9/4XANuPuKIQEtxZDs3w4eyTp+j/Zg133f0PEC0ADFXXZRDozgZ?=
 =?us-ascii?Q?0MY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48382a9-0af6-41b6-c3fa-08d98df4cdbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 02:54:41.2265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AaHlxmDqIWkIgvt6nCikLPXNILoWlCKwmtWVg8Vg3RLwDuLy0SYpQpEaLZ35/ZpB+Ts4N9bKtx6nTxyzFJOtWuS6Aqjoc2p3X8lTefta8Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3163
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Tuesday, October 12, 2021 3:31 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operat=
ion
> of usb_function
>=20
> On Tue, Oct 12, 2021 at 03:54:29AM +0000, Linyu Yuan (QUIC) wrote:
> > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Sent: Sunday, October 10, 2021 9:05 PM
> > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > > Subject: Re: [PATCH v5 1/3] usb: gadget: configfs: avoid list move
> operation
> > > of usb_function
> > >
> > > On Sat, Oct 09, 2021 at 02:26:07AM +0000, Linyu Yuan (QUIC) wrote:
> > > > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Sent: Tuesday, October 5, 2021 7:11 PM
> > > > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > > > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > > > > Subject: Re: [PATCH v5 1/3] usb: gadget: configfs: avoid list mov=
e
> > > operation
> > > > > of usb_function
> > > > >
> > > > > On Tue, Sep 07, 2021 at 09:09:35AM +0800, Linyu Yuan wrote:
> > > > > > add a new list which link all usb_function at configfs layers,
> > > > > > it means that after link a function a configuration,
> > > > > > from configfs layer, we can still found all functions,
> > > > > > it will allow trace all functions from configfs.
> > > > >
> > > > > I am sorry, but I do not understand this paragraph.  Can you try
> > > > > rewording it?
> > > > >
> > > > > >
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > >
> > > > > How did the kernel test robot report this?  You are adding a new
> > > > > function here, it is not a bug you are fixing, right?
> > > > >
> > > > >
> > > > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > > > > ---
> > > > > > v2: fix unused cfg variable warning
> > > > > > v3: add struct inside configfs.c
> > > > > > v4: no change
> > > > > > v5: lost v2 fix, add it again
> > > > > >
> > > > > >  drivers/usb/gadget/configfs.c | 55 ++++++++++++++++++++++++-
> -----
> > > ----
> > > > > ---------
> > > > > >  1 file changed, 31 insertions(+), 24 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/gadget/configfs.c
> > > b/drivers/usb/gadget/configfs.c
> > > > > > index 477e72a..5b2e6f9 100644
> > > > > > --- a/drivers/usb/gadget/configfs.c
> > > > > > +++ b/drivers/usb/gadget/configfs.c
> > > > > > @@ -58,6 +58,11 @@ static inline struct gadget_info
> > > > > *to_gadget_info(struct config_item *item)
> > > > > >  	return container_of(to_config_group(item), struct
> gadget_info,
> > > > > group);
> > > > > >  }
> > > > > >
> > > > > > +struct config_usb_function {
> > > > > > +	struct list_head list;
> > > > > > +	struct usb_function *f;
> > > > > > +};
> > > > >
> > > > > What lock protects this list?
> > > > >
> > > > > > +
> > > > > >  struct config_usb_cfg {
> > > > > >  	struct config_group group;
> > > > > >  	struct config_group strings_group;
> > > > > > @@ -420,7 +425,7 @@ static int config_usb_cfg_link(
> > > > > >  	struct usb_function_instance *fi =3D container_of(group,
> > > > > >  			struct usb_function_instance, group);
> > > > > >  	struct usb_function_instance *a_fi;
> > > > > > -	struct usb_function *f;
> > > > > > +	struct config_usb_function *cf;
> > > > > >  	int ret;
> > > > > >
> > > > > >  	mutex_lock(&gi->lock);
> > > > > > @@ -438,21 +443,29 @@ static int config_usb_cfg_link(
> > > > > >  		goto out;
> > > > > >  	}
> > > > > >
> > > > > > -	list_for_each_entry(f, &cfg->func_list, list) {
> > > > > > -		if (f->fi =3D=3D fi) {
> > > > > > +	list_for_each_entry(cf, &cfg->func_list, list) {
> > > > > > +		if (cf->f->fi =3D=3D fi) {
> > > > > >  			ret =3D -EEXIST;
> > > > > >  			goto out;
> > > > > >  		}
> > > > > >  	}
> > > > > >
> > > > > > -	f =3D usb_get_function(fi);
> > > > > > -	if (IS_ERR(f)) {
> > > > > > -		ret =3D PTR_ERR(f);
> > > > > > +	cf =3D kzalloc(sizeof(*cf), GFP_KERNEL);
> > > > >
> > > > > Why "kzalloc" and not "kmalloc"?
> > > > >
> > > > > I don't understand why you are moving everything to a single list=
 in
> the
> > > > > system, what is wrong with the existing per-device one?
> > > > Thanks Greg,
> > > >
> > > > Let me explain what I want to do in this  change,
> > > >
> > > > For original code,  when add a function to configuration, it will a=
dd
> function
> > > > struct usb_function {
> > > > ...
> > > > struct list_head		list; [1]
> > > > };
> > > > to following list,
> > > > struct config_usb_cfg {
> > > > ...
> > > > 	struct list_head func_list; [2]
> > > > };
> > > > Then when bind happen, it will move [1] to following list,
> > > > struct usb_configuration {
> > > > ...
> > > > struct list_head	functions; [3]
> > > > };
> > > >
> > > > When unbind, it will move [1] back to [2].
> > > >
> > > > We can see list [1] move between two list head, it is not easy to t=
race.
> > > >
> > > > And when I add trace, I only want to get trace info from structure
> defined
> > > in configfs.c,
> > > >
> > > > So I add a new list which ONLY add/remove to head [2] and it repres=
ent
> a
> > > function in configfs layer.
> > > > And original list [1] will ONLY add/remove to head [3].
> > >
> > > I am sorry, but I still do not understand.  These are different types=
 of
> > > things that you are now putting all on the same list?
> > >
> > > What prevents your trace functions from working today with the existi=
ng
> > > code?  What can you not get access to?
> > >
> > > All you say here is "it is not easy to trace", but that does not expl=
ain
> > > _what_ you are missing and why you need to change that.
> >
> > Consider the list is moving between two list heads,
> > if I trace each function, It may duplicate or missing some function.
> > This is my simple reason.
>=20
> How can the list move when you are tracing?
>=20
> I'm sorry, I do not understand.
Thanks, I can consider it as only two list heads and there is no movement b=
etween them.
>=20
> greg k-h
