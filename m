Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61BFE3F71DA
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 11:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239729AbhHYJip (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 05:38:45 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:37496 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239718AbhHYJim (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 05:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1629884277; x=1630489077;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Vi5FTG4LNkIg/cy++t9dtDpBVqnNh4rtqs2ZFoY8D3k=;
  b=HMPLp78T1JD18vDkyCLLzRVJJ+Bcyl/QeyIA4botrKhZQEC/jHy1JHKl
   1XpAZp8avdCtci0qIzPMKg0A/+b06rYjIAIZ5AuPKMksEAeu0EskQ2jKc
   a3UVxi9SwyOX9RtUc6T3HVci/grH9bL17jUK9XAQY3vMAuTnwGLsxBHAw
   w=;
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 09:37:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCBvXdtnazrWnYOYqLgyL03ZaiqKIvAAh4gbvbep12x6oUtK+2yynsIo68ZF9maef0aYEvfa0SwMGm9uDDqwRKgRTF3FEy5peYrbEMGQMGgby7kmfv6fNBEMrmdY2jS4xJOSysp2eQI3hkx0+pnj9O8Owl0WAwk+mmZfKsI/4MbTXwj4B3Y+2IVlMSOeX9su2+UaZI21+57zwnj7W18zEiLzS5S/wQpuWlwO2hif+QO0XPPkBmcBzmVBXgt18rAAijFLQ4mOGLwnWlx0GvEGQZoVFZKfJA8eM6xnDcf9+8s6GOmOozJS+v5SpeGVb5jCps68hEv1uAtGO7oaEjQohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vi5FTG4LNkIg/cy++t9dtDpBVqnNh4rtqs2ZFoY8D3k=;
 b=ZnD/lSt/LKYM1AMB31NTrOYNkmCxY2Wj3jXU5cPXKAEsktxwCfyEcIkK/dd+Oz2iRKZdGYT2UeN431Bpr+j9780pZbn+v7Ju08yItkzlFDiqs5aYVCyYmTWX35LzvZF9m8AWnfcL4b/mzjuas3OAkGeflGsASdiUiTZvhbS3G2w2YGVCS+FzX6uIbnoC+aSZcPY/gFfa+b9fRb6ilVxGSvetKDFtzcunHSwP56sqgxCfgtn3NZxXaf8XcheWfsaAGwUIvz1El6GVbBb2q5/GRiE6j/1wV3tKL5T+ubaMtIUvv7VJMY0b5qxPxCZK8A9XcMaBI/QBxDMK3/b0958tBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM6PR02MB7098.namprd02.prod.outlook.com (2603:10b6:5:251::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Wed, 25 Aug 2021 09:37:54 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::a4c9:aa6f:5c26:fc82]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::a4c9:aa6f:5c26:fc82%4]) with mapi id 15.20.4436.021; Wed, 25 Aug 2021
 09:37:54 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
Thread-Topic: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
Thread-Index: AQHXmJvUhjN5FCEeAEaBj3/pk39s6quCxI0AgAAD1gD//6L9gIAAggWAgAEFvVA=
Date:   Wed, 25 Aug 2021 09:37:54 +0000
Message-ID: <DM8PR02MB81987A1D7C679D73867482F3E3C69@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
 <1629777281-30188-2-git-send-email-quic_linyyuan@quicinc.com>
 <8735qz8deg.fsf@kernel.org> <87lf4r6y9s.fsf@kernel.org>
 <DM8PR02MB8198A157E55EBBD710905781E3C59@DM8PR02MB8198.namprd02.prod.outlook.com>
 <87h7ff6rb2.fsf@kernel.org>
In-Reply-To: <87h7ff6rb2.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 982ae6e7-4cef-4f23-51dc-08d967ac03d4
x-ms-traffictypediagnostic: DM6PR02MB7098:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB70985FE3C129D8EBF1A8F83F9FC69@DM6PR02MB7098.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZrB5ZXp4W4iK3s2S3r2Tm7ear+EZqXAKIV1EiAr8231863GouXf94NS9TFHxs53f62zRs0kFPZsoGyV3sTxJYW14tzrJd211/oQiR6FwiWGTX1Q4z7EdcRd6flNCZ9oB4UEsIRwnDB+uqLPbop7BF4TqBKns6TdURDOiSOdNtXQb0Q9phO4Y/7/wJ5Ov1ymWj4p3wsg8pcBgh4hb5tysFZTO+ZcpuC1BWramYuFOoE9W9jtZSBdJZc4dPorIusvRui6bFA5/XJcNTL0C8wxf1q8FtX7rPHE5OcLnwyYgab7n2FoUoWEJ1eEG+MHf6ya8qI/oYPdx6z7N7MfbNVMpJwTumrbRACfA2GixI2ftoHI1V/qVvPEQydA30Hs1haxGmvUAFdj70/qa62lemF44bdnTWxeZ6BseDolm3GOMHGDxWwXUSHfeVPyevWDCAnvh2BqnnYSqSnm6AsVFDiDY0w6Vx/8Do4nJ10jyg8hL5aRulc7ELoHE6o3WaWsrbd3HLdeGuRXEr7G3/raMm+b1z5OGCcVqoHJ1up11czAHqS7VojOVHiH9qAWCGT7eVwAoy5XbQsYHVnU6LoLk/9L6w6GKRMTGvZeaEZIi3ZjJZMecdAV0WSO67wd5aASKhnbMYPDy0BHoX8MaJ4Yzpt5r7j9wYKVvAhZ+ipabwGTUVA0o02T+xBsgFNWPAfPxjsN3gwqGzVeoDWuSVBwru6UC7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(8676002)(8936002)(33656002)(83380400001)(38100700002)(122000001)(86362001)(2906002)(71200400001)(53546011)(7696005)(54906003)(6506007)(9686003)(5660300002)(55016002)(38070700005)(478600001)(52536014)(66556008)(76116006)(66946007)(26005)(4326008)(110136005)(64756008)(66446008)(186003)(66476007)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vK2Z5emLFeJVUTC8pIi7H3dzM3YMBCSyG1jhUCzayaoOPX/5Pm2DIBeVTBn1?=
 =?us-ascii?Q?uMoJzoxiJbRc1yG95/LpjK1nc1SsJEpERCVoDmj6GrRNe2I6kGiYtfFW9zDN?=
 =?us-ascii?Q?v0k1mTyUte2OPVyxb97y1M6FkzBCunmgVXaJ/tnX3ystRUvy8GsjXO1+DFwH?=
 =?us-ascii?Q?p/75ZklzF2OUGAKboboDJ/q5ky3jBOM5ONJk5zehYcrXlS6sOBbDzI7rxdK4?=
 =?us-ascii?Q?k7KcNXFldXi6FmJzv/PssVIH8vS+PgGnbyelTjK3v9ZehGsT4ZmW+KSVs+q3?=
 =?us-ascii?Q?3IqE1ZI4TQrqIcm0MSlBcBQflM2ES1RBOvRzjHTEno2ZQAVmtHodbLB5XRK/?=
 =?us-ascii?Q?pj18zyByYgakJU0H8Djzrv32tMCOIBVlw0HGlmDC71QSxUhmmEWOvtIy2B6J?=
 =?us-ascii?Q?GiLic83V046bzL5c5SvUp0A3DMBqLg+u+lp/QO/zb9xxXdDMHuSsTvwWdu81?=
 =?us-ascii?Q?rh04qbN+B9O+oBz1n/1UpqUyU9leTeFBY6YlU0dOwwvOqVFYQlxWVBvQNy0Z?=
 =?us-ascii?Q?gV7rfI/AyEElkp3S4ORftsciAkaqmaqI+2+2xjNUTnbhl4tL4pRtMPFCMIG5?=
 =?us-ascii?Q?jbFJkrl5GZJwbNba6qIfxw3RhU+GFdQPC/+UW8vwDI8oF/XIvnlyy1VDrIdV?=
 =?us-ascii?Q?QB3NVGwONGzW5mHNn8mWLSDH7dUAu4Kc7VohcUTGYNiP0xmfdpamWknPwPSY?=
 =?us-ascii?Q?PBqazouarwouJxnjY0HpKBpAiCnwgNMuxGiQldq6vQBBW1v7Nt1++i/5q6+1?=
 =?us-ascii?Q?M0/xyWZY4OMpplvrRi+U8q8qp6xh+UFpoBNtBfHTYyJWIdRMIPQYKwNBcN4u?=
 =?us-ascii?Q?oAmpKwDltGlZLefiV1GHzF6xoa+g7Cgs8ervQkvHAsd9F6q1k2DSDX9AM0nw?=
 =?us-ascii?Q?ZeMDcJkOrA5d9uxsIVMUdBVckC5keeeOO31306gC5CXM2iik1lOW00k+vrZ7?=
 =?us-ascii?Q?LDnbaoPiBkU6Q4idjTVlMuuOIZJkR0UIF5RamVKdyAQlre27IHSjC1NrtGrd?=
 =?us-ascii?Q?GPyaivxR8SZihUqwkBKlPvpeHDcPKiWB7tPA+iauwCxOTHsCz7XHes0DV8mD?=
 =?us-ascii?Q?Zw0kTe/V4YBgFQUZ4EgTVEbiA22IcNWeFcG73jpPMqZzjqvN3TZEcN589vlP?=
 =?us-ascii?Q?pkeJzBJQsT9SrQeZeuB0tGL+8dTUonfKUnxASOD0fD5oKHmgDtZbkZSYMO9s?=
 =?us-ascii?Q?4l4v8pHdOf5O5VhbyLleYrcD6In1Z/QHTIVbrCTXktEzvVDWdO6VxhGZdoUz?=
 =?us-ascii?Q?ShuKPUGHbpPq7ALhjauY51IlISk/i3jiKBPLTbfk9ssoFd3zyR7kIpo8v8zB?=
 =?us-ascii?Q?jlo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982ae6e7-4cef-4f23-51dc-08d967ac03d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 09:37:54.5350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iAE6Vg0xRxx19JpTGOl16lCkpeAOOHB1hk7DTpQTZi8qtVqqpHrg8cNdUG/pRQueY+W6Q0chzNy6PESFhhNkSxgBBxZ1irE5oIKDQcd0HEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7098
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> From: Felipe Balbi <balbi@kernel.org>
> Sent: Tuesday, August 24, 2021 6:42 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org
> Subject: Re: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
>=20
>=20
> Hi,
>=20
> "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com> writes:
> >> Felipe Balbi <balbi@kernel.org> writes:
> >> > Linyu Yuan <quic_linyyuan@quicinc.com> writes:
> >> >> add trace in function gadget_dev_desc_UDC_store()
> >> >> will show when user space enable/disable the gadget.
> >> >>
> >> >> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> >> >> ---
> >> >>  drivers/usb/gadget/Makefile         |  1 +
> >> >>  drivers/usb/gadget/configfs.c       |  3 +++
> >> >>  drivers/usb/gadget/configfs_trace.c |  7 +++++++
> >> >>  drivers/usb/gadget/configfs_trace.h | 39
> >> +++++++++++++++++++++++++++++++++++++
> >> >>  4 files changed, 50 insertions(+)
> >> >>  create mode 100644 drivers/usb/gadget/configfs_trace.c
> >> >>  create mode 100644 drivers/usb/gadget/configfs_trace.h
> >> >>
> >> >> diff --git a/drivers/usb/gadget/Makefile
> b/drivers/usb/gadget/Makefile
> >> >> index 130dad7..8e9c2b8 100644
> >> >> --- a/drivers/usb/gadget/Makefile
> >> >> +++ b/drivers/usb/gadget/Makefile
> >> >> @@ -9,5 +9,6 @@ ccflags-y				+=3D -
> >> I$(srctree)/drivers/usb/gadget/udc
> >> >>  obj-$(CONFIG_USB_LIBCOMPOSITE)	+=3D libcomposite.o
> >> >>  libcomposite-y			:=3D usbstring.o config.o epautoconf.o
> >> >>  libcomposite-y			+=3D composite.o functions.o configfs.o
> >> u_f.o
> >> >> +libcomposite-y			+=3D configfs_trace.o
> >> >>
> >> >>  obj-$(CONFIG_USB_GADGET)	+=3D udc/ function/ legacy/
> >> >> diff --git a/drivers/usb/gadget/configfs.c
> b/drivers/usb/gadget/configfs.c
> >> >> index 477e72a..f7f3af8 100644
> >> >> --- a/drivers/usb/gadget/configfs.c
> >> >> +++ b/drivers/usb/gadget/configfs.c
> >> >> @@ -9,6 +9,7 @@
> >> >>  #include "configfs.h"
> >> >>  #include "u_f.h"
> >> >>  #include "u_os_desc.h"
> >> >> +#include "configfs_trace.h"
> >> >>
> >> >>  int check_user_usb_string(const char *name,
> >> >>  		struct usb_gadget_strings *stringtab_dev)
> >> >> @@ -270,6 +271,8 @@ static ssize_t
> gadget_dev_desc_UDC_store(struct
> >> config_item *item,
> >> >>  	if (name[len - 1] =3D=3D '\n')
> >> >>  		name[len - 1] =3D '\0';
> >> >>
> >> >> +	trace_gadget_dev_desc_UDC_store(config_item_name(item),
> >> name);
> >> >
> >> > why tracing only the names? This gives us no insight into whatever b=
ug
> > This patch only trace user space operation when enable a composition
> > like below of android or similar thing in another way,
> >
> > on property:sys.usb.config=3Dmtp && property:sys.usb.configfs=3D1
> >     write /config/usb_gadget/g1/configs/b.1/strings/0x409/configuration
> "mtp"
> >     symlink /config/usb_gadget/g1/functions/mtp.gs0
> /config/usb_gadget/g1/configs/b.1/f1
> >     write /config/usb_gadget/g1/UDC ${sys.usb.controller}
>=20
> yeah, that's fine. I'm simply stating that you're missing an opportunity
> to get more data which may be relevant in the future. If you merely
> print the name of the UDC, you get zero information about the state of
> the UDC when the gadget started.
>=20
> You see, from that UDC_store function, you have access to the
> gadget_info, which gives you access to the usb_composite_driver and
> usb_composite_dev. Both of which contain valuable information about the
> state of the UDC.
>=20
> Instead of making a single trace that prints the name of the UDC when
> you call store, make a trace event class that takes a struct gadget_info
> pointer and extracts the information from it. Something like so:
>=20
> DECLARE_EVENT_CLASS(log_gadget_info,
> 	TP_PROTO(struct gadget_info *gi),
>         TP_ARGS(gi),
>         TP_STRUCT__entry(
>                 __string(drv_name, gi->composite->name)
>                 __string(udc_name, gi->cdev->gadget->name)
>=20

Do we need following two ?
>         	__field(bool, use_os_desc)
>                 __field(char, b_vendor_code)

>                 __field(bool, unbind)

why do you suggest following 4 fields ? it is not exist in gadget_info.
>                 __field(bool, sg_supported)
>                 __field(bool, is_otg)
>                 __field(bool, is_a_peripheral)
>                 __field(bool, b_hnp_enable)
>=20
> 		/*
>                  * and so on, anything that may come in handy should a
> 		 * bug happen here
>                  */
> 	),
> 	TP_fast_assign(
>         	__assign_str(drv_name, gi->composite->name)
>                 __assign_srt(udc_name, gi->cdev->gadget->name)
>=20
> 		__entry->use_os_desc =3D gi->use_os_desc;
>                 /* and so on */
> 	),
>         TP_printk("%s [%s]: ....",
>         	__get_str(udc_name), __get_str(drv_name), ....)
> );

the gadget_info have few info to trace, from my view only
struct gadget_info {
	struct config_group group;
	struct config_group functions_group;
	struct config_group configs_group;
	struct config_group strings_group;
	struct config_group os_desc_group;

	struct mutex lock;
	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
	struct list_head string_list;
	struct list_head available_func;

	struct usb_composite_driver composite;
	struct usb_composite_dev cdev;
	bool use_os_desc;
	char b_vendor_code;
	char qw_sign[OS_STRING_QW_SIGN_LEN];
	spinlock_t spinlock;
	bool unbind;
};
>=20
> Then you can easily add traces to several functions that use a similar
> argument:
>=20
> DEFINE_EVENT(log_gadget_info, gadget_dev_desc_UDC_store,
> 	TP_PROTO(struct gadget_info *gi),
>         TP_ARGS(gi)
> );
>=20

It is needed for show operation ?
> DEFINE_EVENT(log_gadget_info, gadget_dev_desc_UDC_show,
> 	TP_PROTO(struct gadget_info *gi),
>         TP_ARGS(gi)
> );
>=20
> DEFINE_EVENT(log_gadget_info, unregister_gadget,
> 	TP_PROTO(struct gadget_info *gi),
>         TP_ARGS(gi)
> );
>=20

Following operation also not needed, right ? according to my experience, it=
 is not change in project.
> DEFINE_EVENT(log_gadget_info, gadget_dev_desc_max_speed_show,
> 	TP_PROTO(struct gadget_info *gi),
>         TP_ARGS(gi)
> );
>=20
> DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bcdDevice_store,
> 	TP_PROTO(struct gadget_info *gi),
>         TP_ARGS(gi)
> );
>=20
> DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bcdUSB_store,
> 	TP_PROTO(struct gadget_info *gi),
>         TP_ARGS(gi)
> );
>=20
> DEFINE_EVENT(log_gadget_info, gadget_dev_desc_max_speed_show,
> 	TP_PROTO(struct gadget_info *gi),
>         TP_ARGS(gi)
> );
>=20
> DEFINE_EVENT(log_gadget_info, gadget_dev_desc_max_speed_store,
> 	TP_PROTO(struct gadget_info *gi),
>         TP_ARGS(gi)
> );
>=20
>=20
> and so on, for any other function that has direct access to a
> gadget_info pointer.
>=20
> --
> balbi
