Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C3A430350
	for <lists+linux-usb@lfdr.de>; Sat, 16 Oct 2021 17:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237748AbhJPPbi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Oct 2021 11:31:38 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:49081 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbhJPPbh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 Oct 2021 11:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1634398170; x=1635002970;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V8Qj0wKE5oUvsQ6tH2Li4WJLC7O9cZwFaLlJruCczE8=;
  b=VMa4rhz0s8pkD0frHS1CAT2dvcrgF2SlTYM3n0TpN2GuX/6QOHo/bvyC
   s0fXC/nZUF6GWejBZpQBUzpRuF3NjP+3y6EQRnVfOguieHyjF1PSH9VN/
   5LmjqusVs9ougFexXd8AblHIAHsETbHldARe8UWLjDZL9BJLPlJFqcxAt
   8=;
Received: from mail-dm3nam07lp2049.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2021 15:29:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3ikrCT5eBePgxyNSY/EyWYMgooqoiybWR2NyxYLQrnYi/eolShJaS6J3ik3ZWOsZiCKVRlWQmF4WpWTD8Hk1Cy3F56lUXJX/+BeJixibHsNF6rUFtuqVyvlLjd4GYGxAg3AgQB82kZ/skysWc9uoD0KrwgCxXF/gb/T551n57GSa9Pgaw+uj+t2BYWD+ikwC3XfyJkvhpNsJuDpp78+JdMAPEhWmSGel9WLsIditsDvZLeZScKr9gFLS8oUsGIRnB1UtM+Jocs3VepokK+mXWcYiNYVR9mlYxwDS5o1fhCIgymffnCfLA7Gx3BiOCBl6lSd2ksyHAy/CJFwe/FXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8Qj0wKE5oUvsQ6tH2Li4WJLC7O9cZwFaLlJruCczE8=;
 b=m7DYoGvy8ntM7nwuG59izl3M04J7RNB/ILnh/CGkHE3CbesAKBi9gO6++If/uC8wwW7XlKIhdlaquB2GxNaf8CHIQ7xcTnK26L3z8rD+zH5UU0cv22yd6OMnLisSUvw89DCQQ1nlcf9DCvYNMNIGegahKNTyLtQPru0pejE2qpwnEj7zWi2LYWMF/ZgZcHs5UFVoNuKCEy+NzsPJKv3ViO3EQJr7l26QTNQuwvZzlJlMZCGu9G7/tocfClxdKPGD/79wD3BQdoj++HJ7aFvFpkH+PbiuX+B54fWa7q+X/z5JDzjW80YaL2NIwe8U70Bqaz4XJJpbKAttznr2BO6u2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BL3PR02MB8201.namprd02.prod.outlook.com (2603:10b6:208:338::17)
 by BL3PR02MB8161.namprd02.prod.outlook.com (2603:10b6:208:35c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Sat, 16 Oct
 2021 15:29:27 +0000
Received: from BL3PR02MB8201.namprd02.prod.outlook.com
 ([fe80::51fb:e0d:4b5e:4cfd]) by BL3PR02MB8201.namprd02.prod.outlook.com
 ([fe80::51fb:e0d:4b5e:4cfd%5]) with mapi id 15.20.4608.018; Sat, 16 Oct 2021
 15:29:26 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v5 3/3] usb: gadget: configfs: add some trace event
Thread-Topic: [PATCH v5 3/3] usb: gadget: configfs: add some trace event
Thread-Index: AQHXo4UQHddSKHPT9EqYg2oVp5RXDKvE4x0AgBEaK7A=
Date:   Sat, 16 Oct 2021 15:29:26 +0000
Message-ID: <BL3PR02MB8201BDCA2A46C85F94BC5E47E3BA9@BL3PR02MB8201.namprd02.prod.outlook.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-4-git-send-email-quic_linyyuan@quicinc.com>
 <YVwz/EY4A/y4rY48@kroah.com>
In-Reply-To: <YVwz/EY4A/y4rY48@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a83a569-ca96-4bae-6e03-08d990b9bd36
x-ms-traffictypediagnostic: BL3PR02MB8161:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL3PR02MB8161640702BB75DA92C804EA9FBA9@BL3PR02MB8161.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:281;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wSvUluvGoVUdPGq25sJgvEn7XpG24LLdTGZSPe2ND26uSf3RhwsAy9/trtGSimqVOg+JzqBvWSLTNIhvqMkp9vFMZdnBC2UW/P1+FfSYpHf7VbqlXh8emdxg3K06F/f8a1ajjAiU6eVK61s7RsS027emjjjvti060WH7MaRMRsMA5jiN+s/Et3kR18j8MLecTurQegr1dV8kd4aBnzNSUenLvaC72fQXe7DeUl1p53pY1N9nRe4YArCOirbSBQeSfsJVB1I32B3Azga3BYs/IhrpmQEFFsHQCH2IlEn9+OyAS1+5Bhkh12CU7lgylxvD6B5iusj3hYgfe4wGhxBkx2dF6R2hLDkVNbzwSdmelxrBVyGO/HJfrvcIFAuuFckv8eUs5r6wY1ogDAnh8A3vBKKqf0QLsqOZBUmjJobV1IKQyaRtR6Dl6QyGU8KIcqZ9AHiEyltZb2hlBKpqRFq8Lu8+na6YcjhPRRJwL0OB/sQzgw80MAgonsB9S7i900oneYp4m3mbb9RajK7K51K9fXGAtVuaIPrxEcbSR6jCVXeMl1ezOv6hR83cA9jrsYeYTK3ypbjJDDGNYDGkJw/qJiMBnqbT8nhCa50npS1g28VUhccJ7iuZtv4MonPyUf4eHdEwZmh/o2H6REvvgHYCigE2S6x96CZ/NTF47Lxw1YwMb6eAPrz63zx6bqcfc9cPqOU1IZ+81n0ZICZsMcmyWg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB8201.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(55016002)(508600001)(83380400001)(6506007)(64756008)(26005)(8676002)(5660300002)(8936002)(53546011)(71200400001)(122000001)(9686003)(2906002)(7696005)(38100700002)(186003)(38070700005)(316002)(4326008)(110136005)(54906003)(66556008)(33656002)(76116006)(66476007)(86362001)(66446008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x+boLjdkRXaIkzo2u5FORUqJA1/9uViLJacxp6coMz4GjTSeLLlERXve7MJY?=
 =?us-ascii?Q?HjOfi4yEQgUXaKvg8wMeno2M8FvZZFvLirgZZ0qy25pgREO75UbjcMEKdFop?=
 =?us-ascii?Q?PcNR+2ORSB5lpcUEzHu960svLlSkdCi9f8Xl45EU9/53us27RmjiNKPGVM+X?=
 =?us-ascii?Q?YicGaNvtBMXnbdAuOcv5CScR6tR50xceRJwSanQXsNHqdIpMR5EiYvuH3Q3x?=
 =?us-ascii?Q?dpiTDbB5OuLiXhjc0rTQaJ3mnzBB1Tjf7VuFjkKj+EieaKGw6dhO44gOuNBR?=
 =?us-ascii?Q?flR+1pF4g4+Cg/JcaCsOb+5AIp2s98eR0bJ54KaHAkZRg5cNFhN1URt9I27J?=
 =?us-ascii?Q?94lUEwwI77RNB8kw8wY+Haoe6iE3HX1Nlm7IqVabw8RylCC4zGNHKH5LCtu4?=
 =?us-ascii?Q?LtlqCFf8DU6t+PY3yJ/AK1DT4G8qcyPvYO7t/GPD4bP3xRj3+Y4sDM70z6tg?=
 =?us-ascii?Q?ReWMNgDo+KVNOjKE9+p0IWcbHg1kThQhiUlCU4sq8wpYN5x+OdI3RjtVWXlf?=
 =?us-ascii?Q?UclXnRAvTh2VeBStXkAdeMVoN3NWqvE8UHjLWZpreoIXgEy7QL3tyGxmrAll?=
 =?us-ascii?Q?Uuv1kvy+qz094I/fM0PIfcCUzIIyFYNupDitlzYgC47iSZQsH00fUSdUrJQP?=
 =?us-ascii?Q?Vxnv6gm2LWITp+bRktMFekyC7NY7HkLh38pWC5VLOXzMg2DgFPnymIsEnkeQ?=
 =?us-ascii?Q?CvXKRAjkj54kuuyWn82DsJXyizM149BtEe5OOnju37/nXl7ao9trBK8OoOUi?=
 =?us-ascii?Q?yZLW2BTIYfsckvTQ5qZK5QKrJJQSGLKsMTJTWkJ/VYW8GuZklZ7RwJ/Ik8xp?=
 =?us-ascii?Q?aWN2sJvmzhJnskbrZ7bqL63VUSXC8dcznqwfXQiBuq+wyALRPSWQ3ugnCE8L?=
 =?us-ascii?Q?9u0hBEqXjPTllNzCQVRhjE/iyW7nfBXIvQFKmeMglv17HHbB5UgBNM14Oetz?=
 =?us-ascii?Q?IPdQ89QvF30B/DiUTn3eBVayTCxABa4UUerHkePQQ4vFvhPcb0EOKa+V0mi/?=
 =?us-ascii?Q?zs8wn1tGaPHlCNMrBu18bPqS+Z5Qq2sSZpv7K8BFyNR/w2oryA4SUprBCy/O?=
 =?us-ascii?Q?cnljET47AONipPbKoYmEq4UbUG0x2uCGexY2cL+QBXARPbOQ4+A7Zr5/N+IS?=
 =?us-ascii?Q?MBhzT/4yFY9jAa4ocAPb1P1/3TnF9yCPlq4GOLn9ezvRM054T+Yo+3Lk3DuA?=
 =?us-ascii?Q?SwjuXqls/rGfHRJ2W51r0LbG7cTbvRvpaFlTZM8lG5/QM1zuKWXzF75Z34Mr?=
 =?us-ascii?Q?CVqx+RLWcCT8PNR04loifjK3Q8jI9sXbbaSMCc3XCkymQlSJmAAboK1ldhVt?=
 =?us-ascii?Q?WZg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB8201.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a83a569-ca96-4bae-6e03-08d990b9bd36
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2021 15:29:26.6132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NSEvbz1R120FRpVqrLcPwCEKeA0Ab6V6IR6IkAeknNg2dXV4DRPUCJZfxT6KmnQxieWNMAyllLqjHg3uzPAa/uTddnaF2qjlxMD87d0g/5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8161
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Tuesday, October 5, 2021 7:16 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH v5 3/3] usb: gadget: configfs: add some trace event
>=20
> On Tue, Sep 07, 2021 at 09:09:37AM +0800, Linyu Yuan wrote:
> > add UDC, cfg link/unlink and some attributes trace
> > to better trace gadget issues.
>=20
> Please document this a lot better.  What do these traces do and who is
> supposed to use them and what for?
>=20
>=20
> >
> > Suggested-by: Felipe Balbi <balbi@kernel.org>
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v3: build trace inside configfs.c
> > v4: no change
> > v5: lost v2 fix, add it again
> >
> >  drivers/usb/gadget/configfs.c       |  54 ++++++++++++
> >  drivers/usb/gadget/configfs_trace.h | 167
> ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 221 insertions(+)
> >  create mode 100644 drivers/usb/gadget/configfs_trace.h
> >
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configf=
s.c
> > index cea12c3..61a8908 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -103,6 +103,42 @@ struct gadget_config_name {
> >  	struct list_head list;
> >  };
> >
> > +#define MAX_CONFIGURAITON_STR_LEN	512
> > +
> > +static char *config_trace_string(struct gadget_info *gi)
> > +{
> > +	struct usb_configuration *uc;
> > +	struct config_usb_cfg *cfg;
> > +	struct config_usb_function *cf;
> > +	static char trs[MAX_CONFIGURAITON_STR_LEN];
>=20
> One buffer for all messages?  What locking do you have in place to
> handle things when multiple CPUs call this function at the same time?
>=20
> > +	size_t len =3D MAX_CONFIGURAITON_STR_LEN;
>=20
> Should be MAX_CONFIGURAITON_STR_LEN - 1, right?
>=20
> > +	int n =3D 0;
> > +
> > +	trs[0] =3D '\0';
>=20
> Why initialize just the first character
>=20
>=20
> > +
> > +	list_for_each_entry(uc, &gi->cdev.configs, list) {
> > +		cfg =3D container_of(uc, struct config_usb_cfg, c);
> > +
> > +		n +=3D scnprintf(trs + n, len - n,
> > +
> 	"group:%s,bConfigurationValue:%d,bmAttributes:%d,"
>=20
> No spaces in the trace message, is that normal?
>=20
> > +			"MaxPower:%d,",
>=20
> Please do not split strings across a line.
>=20
> > +			config_item_name(&cfg->group.cg_item),
> > +			uc->bConfigurationValue,
> > +			uc->bmAttributes,
> > +			uc->MaxPower);
> > +
> > +		n +=3D scnprintf(trs + n, len - n, "function:[");
> > +		list_for_each_entry(cf, &cfg->func_list, list)
> > +			n +=3D scnprintf(trs + n, len - n, "%s", cf->f->name);
> > +		n +=3D scnprintf(trs + n, len - n, "},");
> > +	}
> > +
> > +	return trs;
>=20
> Again, you return a pointer to a static structure, yet you have no locks
> at all.
Seem when trace function called, the preempt disabled.
Do we need to add a lock ?
>=20
> > +}
> > +
> > +#define CREATE_TRACE_POINTS
> > +#include "configfs_trace.h"
> > +
> >  #define USB_MAX_STRING_WITH_NULL_LEN
> 	(USB_MAX_STRING_LEN+1)
> >
> >  static int usb_string_copy(const char *s, char **s_copy)
> > @@ -210,6 +246,7 @@ static ssize_t
> gadget_dev_desc_bcdDevice_store(struct config_item *item,
> >  	if (ret)
> >  		return ret;
> >
> > +	trace_gadget_dev_desc_bcdDevice_store(to_gadget_info(item));
> >  	to_gadget_info(item)->cdev.desc.bcdDevice =3D
> cpu_to_le16(bcdDevice);
> >  	return len;
> >  }
> > @@ -228,6 +265,7 @@ static ssize_t
> gadget_dev_desc_bcdUSB_store(struct config_item *item,
> >  		return ret;
> >
> >  	to_gadget_info(item)->cdev.desc.bcdUSB =3D cpu_to_le16(bcdUSB);
> > +	trace_gadget_dev_desc_bcdUSB_store(to_gadget_info(item));
> >  	return len;
> >  }
> >
> > @@ -240,6 +278,7 @@ static ssize_t gadget_dev_desc_UDC_show(struct
> config_item *item, char *page)
> >  	mutex_lock(&gi->lock);
> >  	udc_name =3D gi->composite.gadget_driver.udc_name;
> >  	ret =3D sprintf(page, "%s\n", udc_name ?: "");
> > +	trace_gadget_dev_desc_UDC_show(gi);
> >  	mutex_unlock(&gi->lock);
> >
> >  	return ret;
> > @@ -249,6 +288,7 @@ static int unregister_gadget(struct gadget_info *gi=
)
> >  {
> >  	int ret;
> >
> > +	trace_unregister_gadget(gi);
> >  	if (!gi->composite.gadget_driver.udc_name)
> >  		return -ENODEV;
> >
> > @@ -276,6 +316,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct
> config_item *item,
> >  	if (name[len - 1] =3D=3D '\n')
> >  		name[len - 1] =3D '\0';
> >
> > +	trace_gadget_dev_desc_UDC_store(gi);
> > +
> >  	mutex_lock(&gi->lock);
> >
> >  	if (!strlen(name)) {
> > @@ -296,6 +338,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct
> config_item *item,
> >  		}
> >  	}
> >  	mutex_unlock(&gi->lock);
> > +
> > +	trace_gadget_dev_desc_UDC_store(gi);
> >  	return len;
> >  err:
> >  	kfree(name);
> > @@ -308,6 +352,7 @@ static ssize_t
> gadget_dev_desc_max_speed_show(struct config_item *item,
> >  {
> >  	enum usb_device_speed speed =3D to_gadget_info(item)-
> >composite.max_speed;
> >
> > +	trace_gadget_dev_desc_max_speed_show(to_gadget_info(item));
> >  	return sprintf(page, "%s\n", usb_speed_string(speed));
> >  }
> >
> > @@ -337,6 +382,8 @@ static ssize_t
> gadget_dev_desc_max_speed_store(struct config_item *item,
> >
> >  	gi->composite.gadget_driver.max_speed =3D gi-
> >composite.max_speed;
> >
> > +	trace_gadget_dev_desc_max_speed_store(gi);
> > +
> >  	mutex_unlock(&gi->lock);
> >  	return len;
> >  err:
> > @@ -468,6 +515,7 @@ static int config_usb_cfg_link(
> >  	list_add_tail(&cf->list, &cfg->func_list);
> >  	ret =3D 0;
> >  out:
> > +	trace_config_usb_cfg_link(gi);
> >  	mutex_unlock(&gi->lock);
> >  	return ret;
> >  }
> > @@ -500,10 +548,12 @@ static void config_usb_cfg_unlink(
> >  			list_del(&cf->list);
> >  			usb_put_function(cf->f);
> >  			kfree(cf);
> > +			trace_config_usb_cfg_unlink(gi);
> >  			mutex_unlock(&gi->lock);
> >  			return;
> >  		}
> >  	}
> > +	trace_config_usb_cfg_unlink(gi);
> >  	mutex_unlock(&gi->lock);
> >  	WARN(1, "Unable to locate function to unbind\n");
> >  }
> > @@ -518,6 +568,7 @@ static struct configfs_item_operations
> gadget_config_item_ops =3D {
> >  static ssize_t gadget_config_desc_MaxPower_show(struct config_item
> *item,
> >  		char *page)
> >  {
> > +
> 	trace_gadget_config_desc_MaxPower_show(to_config_usb_cfg(ite
> m)->gi);
> >  	return sprintf(page, "%u\n", to_config_usb_cfg(item)-
> >c.MaxPower);
> >  }
> >
> > @@ -532,12 +583,14 @@ static ssize_t
> gadget_config_desc_MaxPower_store(struct config_item *item,
> >  	if (DIV_ROUND_UP(val, 8) > 0xff)
> >  		return -ERANGE;
> >  	to_config_usb_cfg(item)->c.MaxPower =3D val;
> > +
> 	trace_gadget_config_desc_MaxPower_store(to_config_usb_cfg(ite
> m)->gi);
> >  	return len;
> >  }
> >
> >  static ssize_t gadget_config_desc_bmAttributes_show(struct config_item
> *item,
> >  		char *page)
> >  {
> > +
> 	trace_gadget_config_desc_bmAttributes_show(to_config_usb_cfg(i
> tem)->gi);
> >  	return sprintf(page, "0x%02x\n",
> >  		to_config_usb_cfg(item)->c.bmAttributes);
> >  }
> > @@ -556,6 +609,7 @@ static ssize_t
> gadget_config_desc_bmAttributes_store(struct config_item *item,
> >  				USB_CONFIG_ATT_WAKEUP))
> >  		return -EINVAL;
> >  	to_config_usb_cfg(item)->c.bmAttributes =3D val;
> > +
> 	trace_gadget_config_desc_bmAttributes_store(to_config_usb_cfg(i
> tem)->gi);
> >  	return len;
> >  }
> >
> > diff --git a/drivers/usb/gadget/configfs_trace.h
> b/drivers/usb/gadget/configfs_trace.h
> > new file mode 100644
> > index 0000000..59d73d5
> > --- /dev/null
> > +++ b/drivers/usb/gadget/configfs_trace.h
> > @@ -0,0 +1,167 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights rese=
rved.
>=20
> Wrong copyright notice, right?  I could be wrong, but you might want to
> check...
>=20
>=20
> thanks,
>=20
> greg k-h
