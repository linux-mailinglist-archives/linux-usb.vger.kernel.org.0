Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D580429C1F
	for <lists+linux-usb@lfdr.de>; Tue, 12 Oct 2021 05:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhJLD4h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 23:56:37 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:4901 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbhJLD4g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Oct 2021 23:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1634010875; x=1634615675;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d7pzerhSMH4WfR2WH/+AcMKpG30xj4yJime4YaAMkTM=;
  b=KjQj/sNxCab7JzO2y8/79lcUocWKk5YoaD79ZMndM8Fe719L14ldjiNG
   a3tZs3zrJ4vG7qpqo2nJzvujdB7etGQtBkmRtxRQpv7eEaKbV4KYwoYhw
   DXDWPA1XST06H0JFTtbghyIKIAkKwZ1bYDruPDsf2GHHg0eMOQp/xsLV6
   4=;
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2021 03:54:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1Rpn9evYkTMmtaOX76ZjDGOIgpy4bernjok9/PLI4p96FGm5L2ErwTID6i82s11gSIKWUgWT8kF4cXNlcpl+myBWUjwjCGKAI7Q6nxf/s/uRzkg0IvNYcY6A1O8jXVVdbYmCeHPoLTNfck/BGHJBWObOeWI+KrofssaoGWpRqOLT33PgoydnJ+7b18tEcmE/ahIkQwM4r4jKhWwcT96KuV0RBKN7xoC9o0TCGMPInZZdDOrw/y0Yas7Z7sZNJ6paWws1wPC3v3z/q0PnavakexXZBccMlBQAI6DE6QqGHY/U9gSNwFBAa3FHMGWRD4q92khatAYDAbaCSCYf8PFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7pzerhSMH4WfR2WH/+AcMKpG30xj4yJime4YaAMkTM=;
 b=KG0+4O5FnIE7nZnyqGGaR09ZbUvpIgbMsySkCIcwHBrT78Tc4xKen2jGgsc54H8zr5RSfqJ5pJNu9jPsb2ICQL6TTj/r4uO+sMvZf/fylxSC4Elpd5a3Tnu56y0kWTzZSPqvj4Ru8ZknP/p0V/FDEUb8LO49Dac0a+UP6FM/utU3BjRLc4FiIcAOjO3N//RqiWCzIsGmLLjdWYuPVQIdNI03U4xH8PyZNPup6Ob7RBqr0gZLCj/uDhqrNLCS6K9L40RMm0m5H04rW6SBS6NGHjTQNFkL7lYt8E6z13oEnr2WvTh0PX/vTGaUMEm4z73U/GSOFm9HOCXyjHTAICVAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM6PR02MB6297.namprd02.prod.outlook.com (2603:10b6:5:1d3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25; Tue, 12 Oct 2021 03:54:29 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::9a7:6922:a91f:8f95]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::9a7:6922:a91f:8f95%6]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 03:54:29 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Thread-Topic: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Thread-Index: AQHXo4UNlBSIOyDIIUmvyeFQTj9v7avE4aQAgAU44jCAAsKNAIACFPVw
Date:   Tue, 12 Oct 2021 03:54:29 +0000
Message-ID: <DM8PR02MB8198EFA6BAF945770FEB2E87E3B69@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-2-git-send-email-quic_linyyuan@quicinc.com>
 <YVwywFfe/x8OEHh8@kroah.com>
 <DM8PR02MB8198787E8C17F646B7DED9F4E3B39@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YWLk6IvBsgpT+s75@kroah.com>
In-Reply-To: <YWLk6IvBsgpT+s75@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3666d8f3-2b4d-43bb-0afb-08d98d33fe53
x-ms-traffictypediagnostic: DM6PR02MB6297:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB6297699F440AA83C1FF43EA19FB69@DM6PR02MB6297.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eXex+1Vni7zCKXphs517hvXiw2fA+e17A4WMDJ5LhHJgRNzFKECji/p83yhQdNv9rtIDpeDIfbFUv6hZ9xWiiZ3vs4+GHmZF6ya3H4aW+cTWTX7i+zdZzHKI5NFQ5RLHTH1elN/Ji3VAgbWI1kUqem/Pto+gO6txPeLCN3P6ypNvH5Za3YwqdWp35YqcfBwEUtvxF5Ok/RvWTYkMNLEM73CnwG4ciUVWYN4SftSz17dYZ3iHeFUlo6+JTzmrSLaqwTXPfEr/LtG5DFqus/KyyJgjuO2NQpftxjBhHZstMCUDpdVWe0PvcKp40J3ouuTjHDV/mhetyAcWC0jw9ZDA3dZRLpoKJLCxrHwEliOXaW0+4k/Ve1FG4YbvPWdRZ58pGmL8VCvI429Zuo+fmBnBg6EXBDMeqCRGBcMrP1yh3rhNmx5gwWuGChJlQUa8ZHNecqJLl+BpLb5Ec/xBsr6VpBehe/0hmsdSayrejEJcpfVqTuDZH1lMxTY6eocT/1NRvJ2bu5p0BSdPh5CCrmvBh4x82HHRZ2DUjjdHP/H/s+bGgc3Ok8+iwl9Upb7vNBKfvOHqmg4EIPvG799muPCP7/kbvkEA+izgwrnhn4isZQECv+yMHHFzkNjInKA050BqVpCYmgduSdLwF++3YreYRSKjv4vUH+EuYPjIrf7nkIEaSgeb3Vwf7KVGdbaYYdEjro5NvougUDwK2kGgLWt5Nw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(8676002)(83380400001)(54906003)(110136005)(8936002)(2906002)(316002)(86362001)(66946007)(186003)(66446008)(64756008)(66556008)(66476007)(33656002)(52536014)(55016002)(76116006)(122000001)(38070700005)(71200400001)(5660300002)(26005)(4326008)(508600001)(7696005)(6506007)(9686003)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Otg0nCR+gnC/atsLwLtZM0Rn8gfKQckb1JpA0ix/NlAy/nXAVN0t091Ejn/H?=
 =?us-ascii?Q?xOSLCpo3rCtX9v4WalQl4mRNjSqTJIXwGR9TPp7GoOK7kDwcIioFjU79bwf5?=
 =?us-ascii?Q?hKw52ran874hD9g3UTUEDjBCuvhbljS/9wkzZVP5blQYLt3fwBHkysV23q99?=
 =?us-ascii?Q?vtzgiFKTC43by97kqBIZoLxckiO5NsTCAhtZAsuO/cqkhS5pPZelfy1AHNgQ?=
 =?us-ascii?Q?BDherHujGMzipllwIpHuw7rhsO0ahu+0jeN9lbXtlEm0gG/g9K6cnJygNadE?=
 =?us-ascii?Q?HRUKURII1z8d2v6jEic5N6QXb/B3kL1Q1I5pt5RRXW4y9BZLNdKL+dcS16xO?=
 =?us-ascii?Q?LBv7D1NZsOqIjaAE4lS9h8WuwKmrgs6Q1nPTiv6LZmbi4opAwh8OYNWSqido?=
 =?us-ascii?Q?DwNb4/wX+iShzV1DpX90Exc2qhvBomVIexAkHmFgGlIiP5kYZXBh/z+UQPso?=
 =?us-ascii?Q?DrlXuCOK37pwN9vMheryxAjbKjTbxG8fUU/X7b16SImmrDvkyAstXqFJKLYj?=
 =?us-ascii?Q?JdUYXj4+qA0oOD7/o3HTaGis5Nt1qmUpXaAqfs3qPR2iwUzFi8U+8bTGX9JA?=
 =?us-ascii?Q?4vEygdmtHwpjhDGPkQZA+YnZkv6HAa0yJEAgktdLSXc5lVQYmo7DT5oF1lx4?=
 =?us-ascii?Q?WrMYoF8IG88BLk6xJnpgFUY4x6oClEer0rsoIFOtb600unv0GldhJmAXBPVs?=
 =?us-ascii?Q?DGp1GlFrunHNKO+5bdzq6hfYcJxxXKti9oZLn6zX78/Kw+eAmiyhnCcN/8p3?=
 =?us-ascii?Q?c+wtbLL7D0aPTPZsiSJkwSP6gjjg1Gll1eu+fXWkll2fl5CMsv0mXFozdQp/?=
 =?us-ascii?Q?vMyVgmhTmlhba3CHI/kLGe4+nS5r/oobBNDQR5U+130D0v9Y1vhSPfNcs+Ul?=
 =?us-ascii?Q?lHQ4ipd1XSy8g/E8XmOAPiTTQ/H8GanSYj3x6t5CvHbcLxDk8UiItT2rGoEJ?=
 =?us-ascii?Q?QGXIrgqK+EgEymeLzURDtOKqUzZQ/2lvmy/jo/4AtZrX/K74XPu+2qFRc68y?=
 =?us-ascii?Q?A39TIR2jBqDX09YfpeVWF0QtbubJnGJU73fFgqpLWydkGQWBfrIbR4n/kUpK?=
 =?us-ascii?Q?5fRRTcFW3TcsYedbTVkFFg8gQBXuDV8mlXoUbXQ9jNB/QxKgNCjV/Uw4AmV2?=
 =?us-ascii?Q?BKLxoB7eMFTP9zWBLStYOsFNKQqpm42tra0DkF0a28LCN5fnHLtbl49k8R/g?=
 =?us-ascii?Q?yNO2QBkEpjiaHWrkzFPFkaUNopV+Kn3fYiZkh5+LUmscoXOZ7+AuC6ZGAqbt?=
 =?us-ascii?Q?sTDLTiFrElSM78GPDvtXX8UmLsGXkV/mTo4VrbIQdZ9HfuddF/PJXm2n2C0T?=
 =?us-ascii?Q?laQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3666d8f3-2b4d-43bb-0afb-08d98d33fe53
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 03:54:29.8045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fqp/4U/gbQ2QgaaYRf2R2R5NIQuAIl450C5z9v9HPBv7hd30wc6qysc0WUj90tj9tNm5SfkeW8wMqEYowkDp0MDyM/nGPGJMJtQ5zgjq1cU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6297
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Sunday, October 10, 2021 9:05 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operat=
ion
> of usb_function
>=20
> On Sat, Oct 09, 2021 at 02:26:07AM +0000, Linyu Yuan (QUIC) wrote:
> > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Sent: Tuesday, October 5, 2021 7:11 PM
> > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > > Subject: Re: [PATCH v5 1/3] usb: gadget: configfs: avoid list move
> operation
> > > of usb_function
> > >
> > > On Tue, Sep 07, 2021 at 09:09:35AM +0800, Linyu Yuan wrote:
> > > > add a new list which link all usb_function at configfs layers,
> > > > it means that after link a function a configuration,
> > > > from configfs layer, we can still found all functions,
> > > > it will allow trace all functions from configfs.
> > >
> > > I am sorry, but I do not understand this paragraph.  Can you try
> > > rewording it?
> > >
> > > >
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > How did the kernel test robot report this?  You are adding a new
> > > function here, it is not a bug you are fixing, right?
> > >
> > >
> > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > > ---
> > > > v2: fix unused cfg variable warning
> > > > v3: add struct inside configfs.c
> > > > v4: no change
> > > > v5: lost v2 fix, add it again
> > > >
> > > >  drivers/usb/gadget/configfs.c | 55 ++++++++++++++++++++++++------
> ----
> > > ---------
> > > >  1 file changed, 31 insertions(+), 24 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/gadget/configfs.c
> b/drivers/usb/gadget/configfs.c
> > > > index 477e72a..5b2e6f9 100644
> > > > --- a/drivers/usb/gadget/configfs.c
> > > > +++ b/drivers/usb/gadget/configfs.c
> > > > @@ -58,6 +58,11 @@ static inline struct gadget_info
> > > *to_gadget_info(struct config_item *item)
> > > >  	return container_of(to_config_group(item), struct gadget_info,
> > > group);
> > > >  }
> > > >
> > > > +struct config_usb_function {
> > > > +	struct list_head list;
> > > > +	struct usb_function *f;
> > > > +};
> > >
> > > What lock protects this list?
> > >
> > > > +
> > > >  struct config_usb_cfg {
> > > >  	struct config_group group;
> > > >  	struct config_group strings_group;
> > > > @@ -420,7 +425,7 @@ static int config_usb_cfg_link(
> > > >  	struct usb_function_instance *fi =3D container_of(group,
> > > >  			struct usb_function_instance, group);
> > > >  	struct usb_function_instance *a_fi;
> > > > -	struct usb_function *f;
> > > > +	struct config_usb_function *cf;
> > > >  	int ret;
> > > >
> > > >  	mutex_lock(&gi->lock);
> > > > @@ -438,21 +443,29 @@ static int config_usb_cfg_link(
> > > >  		goto out;
> > > >  	}
> > > >
> > > > -	list_for_each_entry(f, &cfg->func_list, list) {
> > > > -		if (f->fi =3D=3D fi) {
> > > > +	list_for_each_entry(cf, &cfg->func_list, list) {
> > > > +		if (cf->f->fi =3D=3D fi) {
> > > >  			ret =3D -EEXIST;
> > > >  			goto out;
> > > >  		}
> > > >  	}
> > > >
> > > > -	f =3D usb_get_function(fi);
> > > > -	if (IS_ERR(f)) {
> > > > -		ret =3D PTR_ERR(f);
> > > > +	cf =3D kzalloc(sizeof(*cf), GFP_KERNEL);
> > >
> > > Why "kzalloc" and not "kmalloc"?
> > >
> > > I don't understand why you are moving everything to a single list in =
the
> > > system, what is wrong with the existing per-device one?
> > Thanks Greg,
> >
> > Let me explain what I want to do in this  change,
> >
> > For original code,  when add a function to configuration, it will add f=
unction
> > struct usb_function {
> > ...
> > struct list_head		list; [1]
> > };
> > to following list,
> > struct config_usb_cfg {
> > ...
> > 	struct list_head func_list; [2]
> > };
> > Then when bind happen, it will move [1] to following list,
> > struct usb_configuration {
> > ...
> > struct list_head	functions; [3]
> > };
> >
> > When unbind, it will move [1] back to [2].
> >
> > We can see list [1] move between two list head, it is not easy to trace=
.
> >
> > And when I add trace, I only want to get trace info from structure defi=
ned
> in configfs.c,
> >
> > So I add a new list which ONLY add/remove to head [2] and it represent =
a
> function in configfs layer.
> > And original list [1] will ONLY add/remove to head [3].
>=20
> I am sorry, but I still do not understand.  These are different types of
> things that you are now putting all on the same list?
>=20
> What prevents your trace functions from working today with the existing
> code?  What can you not get access to?
>=20
> All you say here is "it is not easy to trace", but that does not explain
> _what_ you are missing and why you need to change that.

Consider the list is moving between two list heads,
if I trace each function, It may duplicate or missing some function.
This is my simple reason.

>=20
> thanks,
>=20
> greg k-h
