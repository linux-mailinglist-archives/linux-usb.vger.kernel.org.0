Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93613F5BB9
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 12:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235953AbhHXKIX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 06:08:23 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:63011 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235808AbhHXKIV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 06:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1629799658; x=1630404458;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MRGVhbfV6MEk44mXcdUujans8dtEsny2S29slC6e0sE=;
  b=OK2xNs94Yzd25ugR6xxogzDcxn3DfAZd/M1Pf0i2Ka9UyrJrHe/+f/72
   rnKQd23W5P1BZDBeTWM+Zb78mxrZyHc1lEgDxCYgenMg74TSd7pfOlfl/
   Cvt30SYXHEf4wSlkMqO14+2kLPuNtX+7fJcZGiIv2uQ9pL/XwQBygOD54
   w=;
Received: from mail-mw2nam08lp2168.outbound.protection.outlook.com (HELO NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 10:07:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPdklT86mqvO/4jmQ4lHpmLYJql4W1FGK0eOA3qiThEySZ/pY++BmlladQamioF54HJGe1v8uB5MNFi9r7OlT48o6NH/QDNU/O3Sk9MAajLgKlGTttv9TgQAyoOe6TjQhRza27GBnd7V61E2DiX0hS/q6cb/dJepvEfln0xhO34X3PFd1TSWC7kqd3s6eJcYk9hqlsJQsGucRxmcMUSa4Bpc1crZ5u33ARrco0IupzyCGp9Z1+fz92LGzW9S01fHDUZ/gUYnRzX7MClAQEnsyD90b5upBpiEPKPNwR7OJv0ZgDNhZlzqhlPGv+0lqZ7P9diKkwyIGSlMl1SCFP9dqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRGVhbfV6MEk44mXcdUujans8dtEsny2S29slC6e0sE=;
 b=AgbgP5M1SEhrrddPMJcqS9y45blkb91APH+1zKUiPozpnXQ+Rc9WeCwtqklqywfoC6MiogOxK+GnfO9cC6PWSFR2RDIz8dgdWLKSdcq98JmmufbrZUJ6cw/QX3OXjacy0/0j8uW9Eqyz0EI+LMlUQSaLny0MCLXqdhGYIaT3tL/N5vSY8YtH8TpcZxMPlw3zrA7Jln/2K+tdfQB4Bo14rk7xLZ2BDwkT1f9//ndg3IcOX69vu3uigOlo/5QJpg0NgEflhYhY/zf+XkqEmUscJHBQyS3QcjnOqj5Zm2oNSlWyVWV6K/mpfVF9uYTbI4j0cvDWt/ATsZhtBl58OPFlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM5PR02MB3895.namprd02.prod.outlook.com (2603:10b6:4:b9::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.23; Tue, 24 Aug 2021 10:07:35 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::a4c9:aa6f:5c26:fc82]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::a4c9:aa6f:5c26:fc82%4]) with mapi id 15.20.4436.021; Tue, 24 Aug 2021
 10:07:35 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
Thread-Topic: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
Thread-Index: AQHXmJvUhjN5FCEeAEaBj3/pk39s6quCxI0AgAAD1gD//6L9gA==
Date:   Tue, 24 Aug 2021 10:07:35 +0000
Message-ID: <DM8PR02MB8198A157E55EBBD710905781E3C59@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
 <1629777281-30188-2-git-send-email-quic_linyyuan@quicinc.com>
 <8735qz8deg.fsf@kernel.org> <87lf4r6y9s.fsf@kernel.org>
In-Reply-To: <87lf4r6y9s.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9768cdb1-02d4-4923-c695-08d966e6ff14
x-ms-traffictypediagnostic: DM5PR02MB3895:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB389590131A31543F554DD96D9FC59@DM5PR02MB3895.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H+nySSaGngYGllKu7SiJ6ovRotJctgFXKM4ryBL1KUyCmZ0KDOQ5Yr/NJlNqzJdbdHwYFAJzdKs68V/7fw22B6IBvQROBM/ZRJ/fWF/UqO+mHWpEeRSGggaF/t5Rys5ulV6OGR3v8RbfcnharYK5kJM+vYJXqqKlKsG1WyJnKZfkZO59xgEWu4u5uUApLmE6SP5+9tROKrk+cwinNajug/Cn0hFi+FAWsqbWgZp0iQWV9xKFHi9OhTjSL6Z/ibgObxg8zHBSosPW6OYEY6MLxJkEABtVVC+BCzEAAHFdOWnn+AIuKAUH2FfKquJW9yE/H4nfoTunfl8JLGu26vGTcexlm14iZJdwyV3V2iPx3jC/uln/X2nM0eJ9bSuEMjoxUvGrJELXm7BvpeBc/ytYTnCCSQFtjyyvYY+2b3P5h3kZ2IDTOJjVWVBkwYLk1kobHWrvNL+8h7ZnP6pcA24EsUd3oVFYpzFxlnE2Qy/dhGot9A0NbyAurjRidFe9ivmRG5xtkQQGclkJ9OIOXzjHdMaVFCbjKQkeD9ufZin1YTs1iCTy/l6koHcFq0bTtKsvTc2Tanaf8xEgznZyPWKvMbqxmTqs7jRuu76CAuOgEz+IAcRjdKX3ro7JojmW6/42dLlLU3eXiKctB7xkGMoHsAWy+3nVh6LcEuX6pugxO2UQJITb3BgMEovPjAajy2nT++Y8XZB4n7TMuFtbnNMMNslQK912QsBsWG95A3fOPprWeHYhCYbw8KUduBccz1svFLADRUK8jHY3S9R1Q/ase7wZ6kTTqWIAk+Dh0uDf1M0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(64756008)(4326008)(66556008)(38070700005)(66446008)(66476007)(52536014)(966005)(5660300002)(55016002)(110136005)(83380400001)(8936002)(71200400001)(86362001)(2906002)(33656002)(76116006)(316002)(54906003)(186003)(9686003)(122000001)(66946007)(478600001)(38100700002)(8676002)(26005)(53546011)(6506007)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WqaeGcCFo3Jx108CfQlS8fwvWDq0oXiiee/umFaLgH2jwjI2Vx4Eo8/7dUwr?=
 =?us-ascii?Q?78853msh/5/4y4WsubB2HooCGVCXzKgQ/v/tOAcFbGZT+JKPsqXo/ko53wf8?=
 =?us-ascii?Q?UpXSCKFnTszFccaqOlD1rrdyJ73xPS6Sh394R3zLJHD+ijJdQXzLRojbpRVP?=
 =?us-ascii?Q?xqSrEEr9STLg3NylSl+JQQ7WYWIRjIrlW3UrELpqp37WM8rHClhyQJzDqWmg?=
 =?us-ascii?Q?MAvTfzvfVtTXEJfBPYhAFHeb28BqyxC+NaXuB+kG0nCApV6psjik/lDnq+NS?=
 =?us-ascii?Q?zAj4fPeTieXMK5GhdovbajPkoxuQPM70z751USh7DWr8efM6aTjG2YlmqMuf?=
 =?us-ascii?Q?Wl98hITFaAKnigKbsqT+ese3dAW/gjCirnytyGDnHqmwE2ClayOIiXvoAp7I?=
 =?us-ascii?Q?e2co9+A0jWjC+sgN/F4cXIj3UFE2pU2fntfJtAD92CkNP4325q3tQVuiJlnJ?=
 =?us-ascii?Q?j1yqPpI8n3Y7/CWtX5Uh1ca5L63fUkGADxkqyW8Y920ei9o3iJwrpNg5eN5T?=
 =?us-ascii?Q?Ipv/8xbEl+m7oKm3CY7UI44buzz8zXiVoiMTlsVPvBv7q6OQBtMzMe4csmfw?=
 =?us-ascii?Q?iJu4x+Fn9cOuUYdBxVOp1VRKVLdt2B3WfuIalzkpgY7VgeDNt4vW8gBkLGmn?=
 =?us-ascii?Q?vzLMKXmtQiKjm5RYkOM1vzdWx22mKK8bNgAhxkCN1uNFiEp/XmiITfsOh804?=
 =?us-ascii?Q?OjrYIuEKqkp3z6OEfEPYeep4Xt41Jy1V5rvihXYMa2N37hcWw/MYcH6xk0En?=
 =?us-ascii?Q?DTvIH4YJT3cL3xQaSWEuw4mHa0wJM8t7hGOevarI5rvIef7U0PKSmNDmBHub?=
 =?us-ascii?Q?NAUfZECl/JPZr9E8530fPsVpEdqTHwDDKiho+yno9AXV7j4eAnN+cOrDPdRG?=
 =?us-ascii?Q?bjZu/okQMEmyUMKuVHAvlJCOyb5t/4ZioY7xD9ENxKWBF3I7oCgrISZ5iu7d?=
 =?us-ascii?Q?JCuJNWRBcXYdidh1QAKLROLJlX1aZjm0gmtpx5r8HZr6aYDTg39qVVHj1Dja?=
 =?us-ascii?Q?tHgEZ8QL5eGL8IVCCz2ZozO9Qamx6Uupp70q90S/ATMBooDux8xCn1DuizGb?=
 =?us-ascii?Q?9a6kTluB9UuYRxj9u7lG7v10FcrzuOpShkj6vEGwnOEJEo6aLPr70G6Xqbfs?=
 =?us-ascii?Q?yiT6ICrrvT5UvWl4xhtrMJX6jwF6sd7N2rWP5UCzieuF3kXDvaqTA3b13sOw?=
 =?us-ascii?Q?JCz19FWUKdy94x7GQ8gIxher5fQlQTPmEk9o81W8er4o+VhhVLRGgQSmjGic?=
 =?us-ascii?Q?Zh4b/g5goWuDMqrRPm2+dvUhrHhAf2Ax8mYwwa+3CTGZmjvO5E7xMoQ/VyMS?=
 =?us-ascii?Q?ZMw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9768cdb1-02d4-4923-c695-08d966e6ff14
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 10:07:35.5597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /BEVIWTfSXD6fII4Q84eOizFJgc/XqkRkl83nlIHg0nNky26s7B+bLNr2eL51lRveboBLH5x3fi8oQZOLR/uOPFE+zhmwaNnQNBGccyEYMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3895
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org>
> Sent: Tuesday, August 24, 2021 4:29 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org
> Subject: Re: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
>=20
>=20
> Hi again,
>=20
> Felipe Balbi <balbi@kernel.org> writes:
> > Linyu Yuan <quic_linyyuan@quicinc.com> writes:
> >> add trace in function gadget_dev_desc_UDC_store()
> >> will show when user space enable/disable the gadget.
> >>
> >> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> >> ---
> >>  drivers/usb/gadget/Makefile         |  1 +
> >>  drivers/usb/gadget/configfs.c       |  3 +++
> >>  drivers/usb/gadget/configfs_trace.c |  7 +++++++
> >>  drivers/usb/gadget/configfs_trace.h | 39
> +++++++++++++++++++++++++++++++++++++
> >>  4 files changed, 50 insertions(+)
> >>  create mode 100644 drivers/usb/gadget/configfs_trace.c
> >>  create mode 100644 drivers/usb/gadget/configfs_trace.h
> >>
> >> diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
> >> index 130dad7..8e9c2b8 100644
> >> --- a/drivers/usb/gadget/Makefile
> >> +++ b/drivers/usb/gadget/Makefile
> >> @@ -9,5 +9,6 @@ ccflags-y				+=3D -
> I$(srctree)/drivers/usb/gadget/udc
> >>  obj-$(CONFIG_USB_LIBCOMPOSITE)	+=3D libcomposite.o
> >>  libcomposite-y			:=3D usbstring.o config.o epautoconf.o
> >>  libcomposite-y			+=3D composite.o functions.o configfs.o
> u_f.o
> >> +libcomposite-y			+=3D configfs_trace.o
> >>
> >>  obj-$(CONFIG_USB_GADGET)	+=3D udc/ function/ legacy/
> >> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/config=
fs.c
> >> index 477e72a..f7f3af8 100644
> >> --- a/drivers/usb/gadget/configfs.c
> >> +++ b/drivers/usb/gadget/configfs.c
> >> @@ -9,6 +9,7 @@
> >>  #include "configfs.h"
> >>  #include "u_f.h"
> >>  #include "u_os_desc.h"
> >> +#include "configfs_trace.h"
> >>
> >>  int check_user_usb_string(const char *name,
> >>  		struct usb_gadget_strings *stringtab_dev)
> >> @@ -270,6 +271,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct
> config_item *item,
> >>  	if (name[len - 1] =3D=3D '\n')
> >>  		name[len - 1] =3D '\0';
> >>
> >> +	trace_gadget_dev_desc_UDC_store(config_item_name(item),
> name);
> >
> > why tracing only the names? This gives us no insight into whatever bug
This patch only trace user space operation when enable a composition like b=
elow of android or similar thing in another way,

on property:sys.usb.config=3Dmtp && property:sys.usb.configfs=3D1
    write /config/usb_gadget/g1/configs/b.1/strings/0x409/configuration "mt=
p"
    symlink /config/usb_gadget/g1/functions/mtp.gs0 /config/usb_gadget/g1/c=
onfigs/b.1/f1
    write /config/usb_gadget/g1/UDC ${sys.usb.controller}

> > may happen and we may want to use trace events to debug. Rather, try to
> > think of trace events as tracking the lifetime of the UDC and
> > gadget. Trace values that may change over time.

UDC already have trace  https://git.kernel.org/pub/scm/linux/kernel/git/gre=
gkh/usb.git/tree/drivers/usb/gadget/udc/trace.h?h=3Dusb-linus
I can't confirm if I understand your comment correctly ?

> >
> > I also think that all three patches could be combined into a single
> > commit, but that's up to discussion.
>=20
> nevermind this last paragraph, just saw that Greg asked you to split ;-)
>=20
> The first paragraph remains valid, though
>=20
> --
> balbi
