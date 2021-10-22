Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47FA24374F7
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 11:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhJVJp1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 05:45:27 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:3208 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbhJVJp1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Oct 2021 05:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1634895789; x=1635500589;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ABfoY4yoiKCxgeFXqS5bDDLy48ePpjN7YSJSx1UE6u0=;
  b=dkP1cZI10TsjucrLwlrlHNJaxfV13CWFkYis0vAxyWU6+bFlVzqA5wcd
   cvkD1IvM0VmPNyRyQd9q3JpWz0xuTp4MG+Fpaowucx98LQV9bqk4r4HDE
   i8/47ctJhfCOOuKt4o/HvvpIUrTgjUtlz6NsM00AO03K48hc8oywY2RUo
   I=;
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2021 09:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALoNWi3mTpSIroOV1uONJ/0qjnbri235U2WT7VTn1fIzrCNzbM2XDhph4WIKo0Y3QCvj3qSE8ePVJexSdwN2tPdZcShAko6rOLPU1w8CtPayEdrwGvLnMKncEo8/RK7ySumR+wygngDdEQoopLP18+zHPiDqnmjTLBPJZ4UOnYJn6KToZvnLK8me1CS23SKosHCbCJP9EkOgOZd5CKH7ft4M4jLHCBgWY14wbQXhQD3pmfeVdtqE6sAiOLyGbV3xBG+2ysjo1v2b37SsNOhP2VOgl7dxI4C55okK5nROFsHleCSUK3+qF4Kf7ji9E9G1jwZLSeSGA8297wfdqLvfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABfoY4yoiKCxgeFXqS5bDDLy48ePpjN7YSJSx1UE6u0=;
 b=NxzIFUlDV5iHux+Pi7Q6C4FbUeZi/iPTLBIaoA5Ng9OeF4dLTtWnzFymqqBHmVCXbanKVgiIdYtVW+HBF2HoJNC91W8wFi2tkINkC3M7of+KDaHMhEpOiFqxmc0JJ1ebuaWqV9XyDWAJLh/O7pY6jkraQJezAXwF1byW4CZ8IykmIX2Z/rmThpbDD9Jb31+YDmoEvOZ6RIGeB8Ke+LldeiU07goiBHyU8B9I2LqiN81nQH5newM1SWPczEBVrvZrEY/KwlKqm4SRgL5IgESmRDQMA4Z25FrT4SQL2if8q36RZnciFM22sG+bLAHydB/gu0dDPtB95ovApk1vfg/xQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM5PR02MB3161.namprd02.prod.outlook.com (2603:10b6:4:61::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Fri, 22 Oct 2021 09:43:06 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::1c03:82ff:cc6c:f85c]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::1c03:82ff:cc6c:f85c%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 09:43:06 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <jackp@quicinc.com>
Subject: RE: [PATCH v12 4/4] usb: gadget: add configfs trace events
Thread-Topic: [PATCH v12 4/4] usb: gadget: add configfs trace events
Thread-Index: AQHXxOz+/CjIc0ubmkGRF0x0mmpb+6vfN7KA//+PNKA=
Date:   Fri, 22 Oct 2021 09:43:06 +0000
Message-ID: <DM8PR02MB819899D34E5ADA3DD250CCC9E3809@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1634649997-28745-1-git-send-email-quic_linyyuan@quicinc.com>
 <1634649997-28745-5-git-send-email-quic_linyyuan@quicinc.com>
 <YXKCcT3FVxRVkUZo@kroah.com>
In-Reply-To: <YXKCcT3FVxRVkUZo@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad20c3c5-b0c9-4017-d069-08d9954059dc
x-ms-traffictypediagnostic: DM5PR02MB3161:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB31616B93B2034143CB6A3F369F809@DM5PR02MB3161.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wZcY8T43J197XpxXck9zEAACqpWiPl8tbGzPSgrwXb6IHniFidciv5eOamT79oAlKsjLB735KYJwq0AxjVP1ti8+lxYBAVCO2dhK8TMXNEsIp6mKxskiMHW2IrbS1RmDLBx/W+4plmzHguKlzHdsU+7R6ax0E8MeQ7XtUBc4DYWxHSPvi0ginzt8gQHIlDeESYoAQLVl3hkg6tq5GHVGcbo/hWxC2lS54lniGDo3I5hQtZxQsiLT9xujbiYhWDE7iQnoGrQu9J9+BOvrmlg8hipVGZNNo75EH2UTtYt/GTfV2Cnux8jk4uWOHtmXGx8M8UBUDZuT07J1FSZAQd3CuRCb05+3QXwBXwVzVZh4PAbHxnvwhIavfV+9TR71l9Ty2bpiYTx1pYfVTWdgA7iBOE80Y0Su7fSJSjjzmVU5vlKps5fM20jyt3+AHxdXuLy6q5LQhu/0zqC60d8x9au355VgFxzQ7zNdhhRfjoqrMxJ3Yh8+X+IhQpDm6zKM6kKgCrF8wqJtVijvPV4P0hRM1ewmd5K4RmN89yKaP5vd/AGxsclIWy770vUISqqokmt6T0KouJ2iTRYNlxLRh7rmu2MzjhDsZPlpaKqSiN6Nkhxvl5jLwz74yLM4R1m1wZVtCQl/QORaimFMHgOA31Mqyr7mePVAdv5gGl6cTuoGDWL4eqoEDddu+W5fEHjN4PZ6wmb49i5WZK+qLmx6ohmStQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(53546011)(6506007)(8936002)(52536014)(64756008)(83380400001)(8676002)(86362001)(76116006)(66476007)(71200400001)(33656002)(55016002)(66946007)(66446008)(122000001)(107886003)(9686003)(54906003)(186003)(110136005)(316002)(66556008)(4326008)(26005)(38070700005)(38100700002)(5660300002)(508600001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?teD/U3L4kmcBnRSppWwYOPh0FZ8qa91w97sv5Yu3ST0CJWwp+s7iCXxFM5Y7?=
 =?us-ascii?Q?G21/Kf+OMGoUkW81eXSvcIKCOAmDBQl/B0ikh7ZA46qa2X4bLI4Lt6pLJUZs?=
 =?us-ascii?Q?TjgGdJFGnY+RP9nZIoyyCd+P1FyMaXH5teSv4gL4hxDwyPX2AvLvwqO826Tl?=
 =?us-ascii?Q?F+18RLkChzZFky6qLum7RHuA+CWJXOw9qwti9/ulwPlNSnjWPyXYSKXpJo/+?=
 =?us-ascii?Q?gYs+6mxKdcfoUZ5Mw54eTt6Skvv1cy0YmbOO4Act9vTGwQRPxECXebeGiaQm?=
 =?us-ascii?Q?9i/v/f96SQ7ScJdPPsNlwVBfBRW5hVdAlddXXuKJYl2MOmPopfd4BWCQ7mIt?=
 =?us-ascii?Q?u3BVIJqNcfV4jwoVkaot43y4VVLj2aVU76QsRjeDU49PIrQXcNI+7agSiz8N?=
 =?us-ascii?Q?ok5spj8Wd/QsNVW67184j8ANgRWU2ynHRzsPTVrs6NWBHLE0cSneXIevGSeU?=
 =?us-ascii?Q?JhP8h6m0tbomnr2H3Q77cJOicF0V4EgZxLYgwUFd+MkFv7VJBEiAQ8ZdCWKl?=
 =?us-ascii?Q?BN/R0BKxBfxABUzJv9c3vnRKkDjiUtghcDtRsaLzsjpvP1hMgnNJqoJLvmiz?=
 =?us-ascii?Q?91h20ehndqfSJphUOc14BPJH2aWDuGzJlvvYtNTcDXNIbSMIS5Bmf1wV1zs0?=
 =?us-ascii?Q?9otCx7AMrt9DOvG4+L60gBYZWRDmqja4bUdtjl/iF2IDdahPAI89hEM7PyT6?=
 =?us-ascii?Q?25tBhFmYceRqIomtj1SZM15mHETl1zaShxEb8q+YL8LVg31KcHkkwJsv5+OK?=
 =?us-ascii?Q?SjIZYg9dPgVs96x8l6gUk6pXPHxKrvQBKZXOTkIR7w55IzcscdkGMthos1oV?=
 =?us-ascii?Q?dHMUrxMmkccy+Zu11+Q3DDfO2dphISt69xHOG8JCxw3raglcj1i5KJ43ZDyI?=
 =?us-ascii?Q?CT5rhu/aKOe/HLXKmXr3yPTa8o2rjXdAcM51vG4WM6Ien06gTgMWtXCU2E2u?=
 =?us-ascii?Q?YLs0bSX380xzCQaaFOoEtM6lF2ShsYFtH8lsg5SV+G4SB9GYpDxFhW09dw+q?=
 =?us-ascii?Q?LPcqREh6nkyf1lNfhAPTyPAy7sjZnRW5q3VVzB49/4BSsCRDT6wCLHPfkyT3?=
 =?us-ascii?Q?+Wnp30pW0po+zK7aP0h6ERImMUZ221w6XedsPDi+Xl2Vvzvh2H9rb8fBVu1Y?=
 =?us-ascii?Q?UMYnDuHmDfU1uUFPQUBCF7AwTIEhkxZwago+GAAdq3wKSlK2uPTpdaUomhVZ?=
 =?us-ascii?Q?NYFLBG025/Ts321hRuTmh7zF+nY7b/S9pAVOehDwDcfpohcywKIRPf3pH+wZ?=
 =?us-ascii?Q?jkrhJDDRHu3O8L+sA0p+lwepNqqoVxUnyQOBTUUmmKypIQN6EmrmgzdbHRFB?=
 =?us-ascii?Q?zyI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad20c3c5-b0c9-4017-d069-08d9954059dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 09:43:06.5813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: linyyuan@qti.qualcomm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3161
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Friday, October 22, 2021 5:21 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org; Jack Pham
> <jackp@quicinc.com>
> Subject: Re: [PATCH v12 4/4] usb: gadget: add configfs trace events
>=20
> On Tue, Oct 19, 2021 at 09:26:37PM +0800, Linyu Yuan wrote:
> > in case of USB Gadget functions configure through configfs from
> > a complicated user space program, when switch function from one to
> another,
> > if it failed, it is better to find out what action was done to configfs
> > from user space program.
> >
> > this change add some trace events which enable/disable a function,
> > it including add/remove configuration, bind/unbind UDC,
> > and some attribute files write operation.
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
> > v11: split to 3 changes, remove read trace, change trace event print fo=
rmat
> > v12: allocate trace string array per gadget driver
> >
> >  drivers/usb/gadget/configfs.c       |  17 ++++
> >  drivers/usb/gadget/configfs_trace.h | 168
> ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 185 insertions(+)
> >  create mode 100644 drivers/usb/gadget/configfs_trace.h
> >
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configf=
s.c
> > index 27aa569..6e7d1b1 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -29,6 +29,7 @@ int check_user_usb_string(const char *name,
> >
> >  #define MAX_NAME_LEN	40
> >  #define MAX_USB_STRING_LANGS 2
> > +#define MAX_TRACE_STR_LEN	512
> >
> >  static const struct usb_descriptor_header *otg_desc[2];
> >
> > @@ -51,6 +52,9 @@ struct gadget_info {
> >  	char qw_sign[OS_STRING_QW_SIGN_LEN];
> >  	spinlock_t spinlock;
> >  	bool unbind;
> > +#ifdef CONFIG_TRACING
> > +	char trace_string[MAX_TRACE_STR_LEN];
> > +#endif
> >  };
> >
> >  static inline struct gadget_info *to_gadget_info(struct config_item *i=
tem)
> > @@ -102,6 +106,10 @@ struct gadget_config_name {
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
> > @@ -212,6 +220,7 @@ static ssize_t
> gadget_dev_desc_bcdDevice_store(struct config_item *item,
> >
> >  	mutex_lock(&gi->lock);
> >  	gi->cdev.desc.bcdDevice =3D cpu_to_le16(bcdDevice);
> > +	trace_gadget_dev_desc_bcdDevice_store(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return len;
> >  }
> > @@ -232,6 +241,7 @@ static ssize_t
> gadget_dev_desc_bcdUSB_store(struct config_item *item,
> >
> >  	mutex_lock(&gi->lock);
> >  	gi->cdev.desc.bcdUSB =3D cpu_to_le16(bcdUSB);
> > +	trace_gadget_dev_desc_bcdUSB_store(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return len;
> >  }
> > @@ -254,6 +264,7 @@ static int unregister_gadget(struct gadget_info *gi=
)
> >  {
> >  	int ret;
> >
> > +	trace_unregister_gadget(gi);
> >  	if (!gi->composite.gadget_driver.udc_name)
> >  		return -ENODEV;
> >
> > @@ -300,6 +311,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct
> config_item *item,
> >  			goto err;
> >  		}
> >  	}
> > +	trace_gadget_dev_desc_UDC_store(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return len;
> >  err:
> > @@ -342,6 +354,7 @@ static ssize_t
> gadget_dev_desc_max_speed_store(struct config_item *item,
> >
> >  	gi->composite.gadget_driver.max_speed =3D gi-
> >composite.max_speed;
> >
> > +	trace_gadget_dev_desc_max_speed_store(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return len;
> >  err:
> > @@ -465,6 +478,7 @@ static int config_usb_cfg_link(
> >  	list_add_tail(&f->list, &cfg->func_list);
> >  	ret =3D 0;
> >  out:
> > +	trace_config_usb_cfg_link(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return ret;
> >  }
> > @@ -496,6 +510,7 @@ static void config_usb_cfg_unlink(
> >  		if (f->fi =3D=3D fi) {
> >  			list_del(&f->list);
> >  			usb_put_function(f);
> > +			trace_config_usb_cfg_unlink(gi);
> >  			mutex_unlock(&gi->lock);
> >  			return;
> >  		}
> > @@ -533,6 +548,7 @@ static ssize_t
> gadget_config_desc_MaxPower_store(struct config_item *item,
> >  		return -ERANGE;
> >  	mutex_lock(&gi->lock);
> >  	cfg->c.MaxPower =3D val;
> > +	trace_gadget_config_desc_MaxPower_store(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return len;
> >  }
> > @@ -562,6 +578,7 @@ static ssize_t
> gadget_config_desc_bmAttributes_store(struct config_item *item,
> >  		return -EINVAL;
> >  	mutex_lock(&gi->lock);
> >  	cfg->c.bmAttributes =3D val;
> > +	trace_gadget_config_desc_bmAttributes_store(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return len;
> >  }
> > diff --git a/drivers/usb/gadget/configfs_trace.h
> b/drivers/usb/gadget/configfs_trace.h
> > new file mode 100644
> > index 0000000..d36c61f
> > --- /dev/null
> > +++ b/drivers/usb/gadget/configfs_trace.h
> > @@ -0,0 +1,168 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights rese=
rved.
> > + */
> > +
> > +#ifdef CONFIGFS_TRACE_STRING
> > +#undef CONFIGFS_TRACE_STRING
> > +
> > +#ifdef CONFIG_TRACING
> > +static __maybe_unused char *configfs_trace_string(struct gadget_info
> *gi)
> > +{
> > +	struct usb_configuration *uc;
> > +	struct config_usb_cfg *cfg;
> > +	struct usb_function *f;
> > +	size_t len =3D sizeof(gi->trace_string) - 1;
> > +	int n =3D 0;
> > +
> > +	if (list_empty(&gi->cdev.configs)) {
> > +		strcat(gi->trace_string, "empty");
> > +		return gi->trace_string;
> > +	}
> > +
> > +	list_for_each_entry(uc, &gi->cdev.configs, list) {
> > +		cfg =3D container_of(uc, struct config_usb_cfg, c);
> > +
> > +		n +=3D scnprintf(gi->trace_string + n, len - n,
> > +			"{%d %02x %d ",
> > +			uc->bConfigurationValue,
> > +			uc->bmAttributes,
> > +			uc->MaxPower);
> > +
> > +		list_for_each_entry(f, &cfg->func_list, list)
> > +			n +=3D scnprintf(gi->trace_string + n,
> > +				len - n, "%s,", f->name);
> > +
> > +		list_for_each_entry(f, &cfg->c.functions, list)
> > +			n +=3D scnprintf(gi->trace_string + n,
> > +				len - n, "%s,", f->name);
> > +
> > +		n +=3D scnprintf(gi->trace_string + n, len - n, "};");
> > +	}
> > +
> > +	return gi->trace_string;
>=20
> I still do not see where you are locking anything to protect the walking
> of these lists.
>=20
> Where is that now happening?
With patch#3, my design is all data was protect by gi->lock mutex lock.
Now trace_string is allocated per instance, it also protected by gi->lock.
>=20
> thanks,
>=20
> greg k-h
