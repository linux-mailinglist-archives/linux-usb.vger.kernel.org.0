Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19441432B6B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 03:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhJSBR4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 21:17:56 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:29997 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhJSBRz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 21:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1634606144; x=1635210944;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ne2Lpmr3skMIMSHxrHNwAXzdX1/JVwEDiArMmreGKdU=;
  b=xmhGCIdfHxqbFfB5T1TfPdfwvjAlfqCaNz4iIaQtGXEkwXOURZuK+cBm
   Eon0LBB57B8v2ylbvAB6KkNkgVFWIisadEfa+A4w8xK8tDfu+0UO2uXbA
   Yftkcc6j59mqinjrBxQKjkCobB7wvY23nZzToZ3dW3ZCjLnp75SaRhttV
   g=;
Received: from mail-dm3nam07lp2044.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 01:15:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSHVurpDx0S5zR22QF0nFyVofiUsv2+WJcmNm3tWwBZu3bLto2aW4ZkiW3drrKXy2G3Xu5DL+7eI0rqmeqoGM4HtsEoCnT9QmHcPu3T+qlR6SpVPmpFVIetq+nP9YrjSKBd9bezDnQzxJgMYYzxFyvrEV3fhGMNqCE5D2RH9IaLd6AOmLHg4x8+3gqxZPrmps5g8tJfoM2v9rNXZ9V0XhO4hxOLtEluhya2nepoOk2KXAo4szH+APKN1hUcvo/MuI13lOzHpSvOlMO5tT6+cXWoTsjHzV2RR2R5qa5/rRdbPgeLOhyfsLstGu+zOQPHDlvfa3VbA66mI3YETCMhZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne2Lpmr3skMIMSHxrHNwAXzdX1/JVwEDiArMmreGKdU=;
 b=X3ViEJ/97jfpCuTaTf1OlsnzEKLBNYMNhgnfKlP5DiTlbZUgSVDMZxjjn7Oa1mIijLYh9I/7oBN+r5ocsDeVemhfSvJTWui4JXHjga/4nxfCiXITefjvCGsoOnvMZU9InH+lb7eUi85hCHV7pDxNOsybcU44Yf+t+BRqtmJDxGw8wrwSHJJKNYrrjvs36+SeKD8vW+ansv6zgEqcxvUBSeqrZsvvcSyE2O1SaHBEe72LFhDAORHG+Edq43zKxUNd+4TLOkzLA4l4P333GhzHJoid9uTVVYWSbBd3EaOOiUaG0Uao7+cDTEecqTma0r69ajtn1v0BEv2rGCxOPLP+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM5PR02MB3831.namprd02.prod.outlook.com (2603:10b6:4:b4::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 01:15:39 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::1c03:82ff:cc6c:f85c]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::1c03:82ff:cc6c:f85c%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 01:15:39 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <jackp@quicinc.com>
Subject: RE: [PATCH v10] usb: gadget: add configfs trace events
Thread-Topic: [PATCH v10] usb: gadget: add configfs trace events
Thread-Index: AQHXw+EkBtHWTK7vEEGbaZshiDypOqvZTxcAgAAy98A=
Date:   Tue, 19 Oct 2021 01:15:39 +0000
Message-ID: <DM8PR02MB8198EAD97F9BCDF6442AF92DE3BD9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1634534970-9198-1-git-send-email-quic_linyyuan@quicinc.com>
 <YW2L0sI1UVzc60yL@kroah.com>
In-Reply-To: <YW2L0sI1UVzc60yL@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f9d9f99-abff-4fcf-c69e-08d9929df6c7
x-ms-traffictypediagnostic: DM5PR02MB3831:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB3831B2EB3962945083A3B07D9FBD9@DM5PR02MB3831.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fnK4KwZbNXxb3VNfQW+ND3y2f2bIxQP9PoskQE1jsRD5e+oevYkwDy9W+sM6+iICQ0UYTmetHx5gqYH9WcIfo+y8ewuGuXGdYJ3ds270IIwd0+bO/vW0mO6UdwSVEM58gyHOo5LRrQSFs1NwAsXQukKKabcKfQVyr9iUN3L7oHVzHN+B6N3evmSI31vu21lJJOsqkoTzMPhq6rUO8RGPfOYAEA/iuFKs+9L4GCwltYUfgP4X3giscBw4rfiZPLQ1zV2FEArk34GrKMVcAXStgY/gnmHmMLcmYU85YwxDeF3bTn4p3ctBxGBZOsRWvbDMtUcm6C592W8xZODrSr1v9l7z2gixuvRA3MNPvbm7LsnIeltM0cl89QzYcrh58vat8LIWs+dy3TAipbRN75GKStK4jbCVZGzXr4EIV/UPosbB5KTZTH2xbeqABZAkFrEazvsIOKgNYkGc2iVOABQV1DYfzv8w8eQ98SbOoYjQgxV0D8fBNZt52zV5WeSbSSV1spd90qbxNdmImonH2Jt1wLKiHxdkaDDz49edMOwz3NjKno48senRFOCRkyhcdIAG2Ns3LhawHJnCacLkcTX3qu8A5cZ1Q6dQfwblzInGsOnpw8woMNwTC6omOCQsvg1bDth3lNvT2mP/BoGAOD2SxaQN1J+GlV8YDGQpZ+s8GE0RXLfoYCxsWQJVOUsx3PysPCG2EI+rYJvYZL1Bs98vPnLAAENBjZJzMpgQEDNQ/xrHIXfg8zqUWtnc/VstN1kS6EO3m+UbCYG32K4hYuoexy/h6jwCxqr1zAX9G5cta4g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(64756008)(4326008)(66476007)(508600001)(8676002)(71200400001)(54906003)(66946007)(2906002)(110136005)(83380400001)(6506007)(316002)(38070700005)(966005)(55016002)(66446008)(66556008)(5660300002)(52536014)(8936002)(86362001)(122000001)(9686003)(53546011)(7696005)(26005)(186003)(38100700002)(33656002)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xiVDz0oh85dmvCphUB5KDhRkpKl+hCyGP1RyZioblwZsu7egcTZHz7cPdXFu?=
 =?us-ascii?Q?cl0VGDXWQGpLDFBCSozgW8UDrOr0ZVKh1x3pLrSu/MsQzT2ilrR4HHC4HAeY?=
 =?us-ascii?Q?+GJFvNlOLbhpmaMsayf0uKsulsQi2CRR6e+Wv7C/eES4KUrfVRMElJspl98I?=
 =?us-ascii?Q?BTQUOXCO4Vk1z+kxS95Uc8AHgfDpKtirS/3KdZ5AbOyq4DAM+IoWy1jd1fAx?=
 =?us-ascii?Q?BzMtr5aPYVOuA1DN++2bh5dmdjM8oat/sJdsar+CJgb3fRHTKX5aiFyfQtNR?=
 =?us-ascii?Q?sOBDs2HS3AhtL+bHUHrxv3sacYlSadtvFAIeZg5EWuXchaFsTRXGk6EP6efI?=
 =?us-ascii?Q?QURImr8YqrjcirWrPArqQ6hkB8C4wihSPWk+sKRZVrbVqMaL0R7LeRkqJ0WK?=
 =?us-ascii?Q?hDLGMArfQLpUE6LjMEOZLTu6QaHT3TstgWJ+QQ+QwjCHtkKGYc2pIx6EufAv?=
 =?us-ascii?Q?kF4inXRIG20BUzIBg+HgrtugRxEdNiG++0vMabhasXX2Ej6XbA1/9RzSMzU5?=
 =?us-ascii?Q?527w/jSobFt8xAK49axVVAL+dl1TBRz3gJ7NLE9U0MEOCT86dNaccsgjMVLz?=
 =?us-ascii?Q?dfBT8LC66kabziENKgwpoCXUI9QEABEwl4PQGKzNhEsynkTutKX32duGzudr?=
 =?us-ascii?Q?HLV/qtDlnxgB+juzhgYCXWrtiAcDGLkHX61Ef1xns+5ENVV5aAtYJF3u3nYT?=
 =?us-ascii?Q?m7BiZx+OFXmKg4nDtamqwDJBTRFAEe/5oy3UyQ8iR4ivBwyrB5dsxeDso2xQ?=
 =?us-ascii?Q?GIfxjtYK1zdd11WVcejqESDbuvewfkibC+XsKQqWP5vzUecZamYHGu9686Ze?=
 =?us-ascii?Q?PExoRgDJMpwuUa6E1jXbvAarYtDDTfbnKm7DIKjMd4ERbZN5o34l3ATqzQ/o?=
 =?us-ascii?Q?Zh3AkeQl6Z+R7Xo/b5M9jSyflDYUFFxETvUW5LQ2LldO0czlkiDaDt7cGWfL?=
 =?us-ascii?Q?7g+B7VXfkvDszPpfwb17VkkOuHuJQH0qDz7W7eay3JXtup3pNFVatlEDyumQ?=
 =?us-ascii?Q?1taKJ6/wxIcfVmtbLdEOdiSzV8wH60nWKsjUX7EfBt4EMhW/Irbyec3Uel92?=
 =?us-ascii?Q?cLGZNYt9AK4e8Xl4ya5biBh68yCZsh6TSnfgJMDYSSTNok9pjMkYcZD6aaOB?=
 =?us-ascii?Q?Bkp5Pa6y2bM4ps3ewhyo/69h7nagVT9sMWdxlVkh93HtM+lRF3aBuUlWCyal?=
 =?us-ascii?Q?E+3kOZ2QRoRL07pOwOKInqrZR5ansM9j2KF7q1W/5GT0bk6ztLU7wXukM4Uj?=
 =?us-ascii?Q?nX8B5LnLdhEUoxt9YeApisecb0Uu28PtBrQEIEnXDvSYtL+PFbaxGXToIFLZ?=
 =?us-ascii?Q?ZyM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9d9f99-abff-4fcf-c69e-08d9929df6c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 01:15:39.6130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHGymzbtbDDTrrSNUIyVcc9jGT+EQSCSFEyF+WwfqyRKSS5lWQxsRkcDZZjhe2qLvFQpRTHl8iN62d5czX1qPi3lmFDQb/N6CI9juc8tIEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3831
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Monday, October 18, 2021 11:00 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org; Jack Pham
> <jackp@quicinc.com>
> Subject: Re: [PATCH v10] usb: gadget: add configfs trace events
>=20
> On Mon, Oct 18, 2021 at 01:29:30PM +0800, Linyu Yuan wrote:
> > in case of USB Gadget functions configure through configfs from
> > a complicated user space program, when switch function from one to
> another,
> > if it failed, it is better to find out what action was done to configfs
> > from user space program.
> >
> > this change add most trace events which enable/disable a function,
> > it including add/remove configuration, bind/unbind UDC,
> > and write/read some attributes.
> >
> > Suggested-by: Felipe Balbi <balbi@kernel.org>
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: fix two issue Reported-by: kernel test robot <lkp@intel.com>
> > v3: do not move private structure to configfs.h
> > v4: add missing new file configfs_trace.h
> > v5: lost some change of v2, add it again
> > v6: fix comments from Greg Kroah-Hartman
> > v7: three minor changes according to coding rules
> > v8: change two trace location
> > v9: fix when config is empty
> > v10: fix wrong api in v9
> >
> >  drivers/usb/gadget/configfs.c       |  43 ++++++--
> >  drivers/usb/gadget/configfs_trace.h | 196
> ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 230 insertions(+), 9 deletions(-)
> >  create mode 100644 drivers/usb/gadget/configfs_trace.h
> >
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configf=
s.c
> > index 477e72a..0e7feaa 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -73,6 +73,11 @@ static inline struct config_usb_cfg
> *to_config_usb_cfg(struct config_item *item)
> >  			group);
> >  }
> >
> > +static inline struct gadget_info *cfg_to_gadget_info(struct config_usb=
_cfg
> *cfg)
> > +{
> > +	return container_of(cfg->c.cdev, struct gadget_info, cdev);
> > +}
> > +
> >  struct gadget_strings {
> >  	struct usb_gadget_strings stringtab_dev;
> >  	struct usb_string strings[USB_GADGET_FIRST_AVAIL_IDX];
> > @@ -97,6 +102,10 @@ struct gadget_config_name {
> >  	struct list_head list;
> >  };
> >
> > +#define CONFIGFS_TRACE_STRING
> > +#define CREATE_TRACE_POINTS
> > +#include "configfs_trace.h"
> > +
> >  #define USB_MAX_STRING_WITH_NULL_LEN
> 	(USB_MAX_STRING_LEN+1)
> >
> >  static int usb_string_copy(const char *s, char **s_copy)
> > @@ -205,6 +214,7 @@ static ssize_t
> gadget_dev_desc_bcdDevice_store(struct config_item *item,
> >  		return ret;
> >
> >  	to_gadget_info(item)->cdev.desc.bcdDevice =3D
> cpu_to_le16(bcdDevice);
> > +	trace_gadget_dev_desc_bcdDevice_store(to_gadget_info(item));
> >  	return len;
> >  }
> >
> > @@ -222,6 +232,7 @@ static ssize_t
> gadget_dev_desc_bcdUSB_store(struct config_item *item,
> >  		return ret;
> >
> >  	to_gadget_info(item)->cdev.desc.bcdUSB =3D cpu_to_le16(bcdUSB);
> > +	trace_gadget_dev_desc_bcdUSB_store(to_gadget_info(item));
> >  	return len;
> >  }
> >
> > @@ -234,6 +245,7 @@ static ssize_t gadget_dev_desc_UDC_show(struct
> config_item *item, char *page)
> >  	mutex_lock(&gi->lock);
> >  	udc_name =3D gi->composite.gadget_driver.udc_name;
> >  	ret =3D sprintf(page, "%s\n", udc_name ?: "");
> > +	trace_gadget_dev_desc_UDC_show(gi);
>=20
> Why are you traceing things that you have full control over in
> userspace?  You can read this data out there, why do you need to trace
> this here?
Last time, if I understand comment from Felipe Balbi correctly, he suggest =
also add trace for show,
https://lore.kernel.org/linux-usb/87h7ff6rb2.fsf@kernel.org/

I prefer no trace for show, will remove next version.
>=20
> >  	mutex_unlock(&gi->lock);
> >
> >  	return ret;
> > @@ -243,6 +255,7 @@ static int unregister_gadget(struct gadget_info *gi=
)
> >  {
> >  	int ret;
> >
> > +	trace_unregister_gadget(gi);
> >  	if (!gi->composite.gadget_driver.udc_name)
> >  		return -ENODEV;
> >
> > @@ -289,6 +302,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct
> config_item *item,
> >  			goto err;
> >  		}
> >  	}
> > +	trace_gadget_dev_desc_UDC_store(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return len;
> >  err:
> > @@ -302,6 +316,7 @@ static ssize_t
> gadget_dev_desc_max_speed_show(struct config_item *item,
> >  {
> >  	enum usb_device_speed speed =3D to_gadget_info(item)-
> >composite.max_speed;
> >
> > +	trace_gadget_dev_desc_max_speed_show(to_gadget_info(item));
> >  	return sprintf(page, "%s\n", usb_speed_string(speed));
>=20
> Same here, why trace a configfs show callback?  You can get this same
> information just by reading the configfs file.
Will remove next version.
>=20
> >  }
> >
> > @@ -331,6 +346,7 @@ static ssize_t
> gadget_dev_desc_max_speed_store(struct config_item *item,
> >
> >  	gi->composite.gadget_driver.max_speed =3D gi-
> >composite.max_speed;
> >
> > +	trace_gadget_dev_desc_max_speed_store(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return len;
> >  err:
> > @@ -413,8 +429,7 @@ static int config_usb_cfg_link(
> >  	struct config_item *usb_func_ci)
> >  {
> >  	struct config_usb_cfg *cfg =3D to_config_usb_cfg(usb_cfg_ci);
> > -	struct usb_composite_dev *cdev =3D cfg->c.cdev;
> > -	struct gadget_info *gi =3D container_of(cdev, struct gadget_info, cde=
v);
> > +	struct gadget_info *gi =3D cfg_to_gadget_info(cfg);
> >
> >  	struct config_group *group =3D to_config_group(usb_func_ci);
> >  	struct usb_function_instance *fi =3D container_of(group,
> > @@ -455,6 +470,7 @@ static int config_usb_cfg_link(
> >  	list_add_tail(&f->list, &cfg->func_list);
> >  	ret =3D 0;
> >  out:
> > +	trace_config_usb_cfg_link(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return ret;
> >  }
> > @@ -464,8 +480,7 @@ static void config_usb_cfg_unlink(
> >  	struct config_item *usb_func_ci)
> >  {
> >  	struct config_usb_cfg *cfg =3D to_config_usb_cfg(usb_cfg_ci);
> > -	struct usb_composite_dev *cdev =3D cfg->c.cdev;
> > -	struct gadget_info *gi =3D container_of(cdev, struct gadget_info, cde=
v);
> > +	struct gadget_info *gi =3D cfg_to_gadget_info(cfg);
>=20
> Why not make this a 2 patch series, the first one adds the
> cfg_to_gadget_info() function, and the second the traces.  That way it's
> easier to review.
Thanks, will do it next version.
>=20
> And why so many versions of the patch so quickly?
Sorry to bring too much Nosie to you.
Each time after send, I found a new minor issue, fix it and send a new patc=
h,   will carefully review before send patch next time.
>=20
> thanks,
>=20
> greg k-h
