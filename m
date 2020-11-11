Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926B42AEAD9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 09:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgKKIJk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 03:09:40 -0500
Received: from mail-eopbgr150082.outbound.protection.outlook.com ([40.107.15.82]:53792
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725828AbgKKIJi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 03:09:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6M+huj6uFqthv1+6Jq/2sGNLh9FbkEV7n0xWVpNqavBFh4AKe0oeVIkLIWDUNilLO0L00dedpDAGlez3rnElINaLVRC3AxdDN46F855WFmcWC9rUS8Ik6k9sUK7EZrCEcze1q3q9a7jGgCkOY7GtgbFwPY/upV5Fz2LKea7RDcELtF/gGNmISfj6VGFvYbM/lh6KYZBvCBZ00a30Q+XRRNGkaaynCR6qEVLbv8sNe53VrORuixCC5FZE16X6v+ywlOSHP3V4hlpjRPyK7g7tuBFpruW4liGPSQrrO22dMxEuNuLcGWmAfK3rYSCEJ/bHGm7XE1kdgd4WSyrEuT+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiIsoPH7OWgaE/5w7gnAScWDv+3lWoIaqk9LTP+lCqc=;
 b=SH2JoWoOuz3bdwK9OzGqeJb4YUIKvOfRF3bqtlyY2Wc78zmo1wgorudZJyYOX0fyS1LSyPbntVJbGpx8r8XuOxeQRFEsUM3oZu0LpTG0g8qPy7NlCM3rhNf+30zzFMVHncbQCQHn+cZfcIZw4IPmoRdFWdnS2BXdYjS5nsQbCYg6urrEYcXcZ+7RSiiMbN2tBiFB4X87/SX7VjhXkzC0ltD0JpJU7r7Dz42S6IqYyEseJ7jGq7EdmWIqKf/muku6k2qcQJMy86xYMSpxWclSQdUTvPctLsbfYbCvOIwDf6E5gg5+wzMTkSEN5XVhc9LjmbGaMcdXHoSGJ9Gkur/5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiIsoPH7OWgaE/5w7gnAScWDv+3lWoIaqk9LTP+lCqc=;
 b=OuOdII+OlHh3kjFQSO8YSOiTi7/OPWqI9EYXQd8Dbbcjvo4cZeHIrrB0vnpPCsH9IZzoEct3jX3pYECUSb2xC3UeRWI/diS6TyR3HNhk9SbOnA1KncWFO9oE5TdRxZUL7QukclaFJYBiyC9ENlDdp9Z5SU5P/Xs1Aqhqv0qMPtU=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 08:07:43 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 08:07:43 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: host: imx21-hcd: Remove the driver
Thread-Topic: [PATCH] usb: host: imx21-hcd: Remove the driver
Thread-Index: AQHWttx5AefcqPS9vkKj6VweHKI2uanClZmA
Date:   Wed, 11 Nov 2020 08:07:42 +0000
Message-ID: <20201111080713.GG14896@b29397-desktop>
References: <20201109210813.21382-1-festevam@gmail.com>
In-Reply-To: <20201109210813.21382-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b6a5beb3-7b6d-464b-745c-08d88618dde4
x-ms-traffictypediagnostic: DB8PR04MB6859:
x-microsoft-antispam-prvs: <DB8PR04MB685915DC2E641D784126BCFB8BE80@DB8PR04MB6859.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:97;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2BoVhVO/kPQl7Jw7jtJRw0Rcd81DY4HVBqXQvoFDeU5eUO2WaSIbc/65LquzFTcHghAce99VNxAgGX+bi96W0uUpCKO2Mu8jo09iPwpwr3ibIgACFHZ8wajKFTAXdNw1QH+RufDo5AhHCtYeCrx/ycCVoXMLnan7OEyJk86zTcmRUJiHahcsuh1ihEwvQ5emYq7FVxw5kPvaSSbkEjbHqYKEioGF6rG0dj6wuR9sNvt8avoZHf86kBWxBz2q2EseYtYMGH9AWLqQcfFRqj2RVJWGJ1WMcteU9G/InXRXvAwFnuXoPJVdnfiY8xuVliOyxsi8AHH4PV/hQATUNq/sxg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(44832011)(1076003)(66556008)(66446008)(6916009)(316002)(8676002)(66946007)(53546011)(6512007)(33656002)(9686003)(76116006)(6506007)(4326008)(478600001)(71200400001)(91956017)(33716001)(86362001)(19627235002)(54906003)(2906002)(64756008)(83380400001)(26005)(66476007)(30864003)(186003)(6486002)(8936002)(5660300002)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: PQemlXidVtO+a6Mj8QLu3IdecnPZ59BJMpzRNOGgrfSKnrSD0ITurnYx2EJrauDpDU2fa19UGeKWKcV8N1oLjRy7T1e3lYQG2lhJa+spZQdJaK0yKRYdjUTjmvGn9TyDalcgX/LYGaZbSmp+KzJMkNQP7RkrACcotqiSdWtPshHdy2q0c4xAOBL2gfKvLWo42SteYnQ0Qea0CsC4CRsiHbqLSyyLsqE/wW+4yVQDU0JrzD1kmM7YVhXdYb1qcMT2GGC1EKabEOEiMYCEQqsTb/gun5zpOtAeGLqbh5R5O/JkuWDNnzUnUPDf/ajHCMdFSppadPe5zeTpklx2d5vnLYOYu4HuRnf6szykq4+YORcZC45SkEIMew+fWwxV/qcfzd9tYRtY5IEpxugf3Z1i9FJmWNNHqmmgV0wOTcxOiY/XHKeK9QZKhh8cz7ZVPMzojsJSBtgm/g2BjnwAyxC97Avx75NkX+QxXkRTqTFvUxCfznb2aP/CiRt5Y5+ELi7wsMF7goWvY86RiFM0c1lUfLeOYZv67KUVXrX6oeASkxnkTPVqvdg/tJoMPjo8kCx0Ee/sYqehjj05ojXMBXmNSdyg3yvAF1zUqaYa7uZhptFt+n84MnC/b94UXb0v8f0oOn4GRvEVHlRJBb5hZS1BMg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21EAFB74E23CC945A8DBCDBCF795ECBF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a5beb3-7b6d-464b-745c-08d88618dde4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 08:07:43.1575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rco4eoaL0cwKE5d451vplhUKaSfcSMHK/K+x56COFXUbo3Se6YeefWlw5WjvTALFVpnvu3Mp3Bz01ynTvkqULg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6859
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-09 18:08:13, Fabio Estevam wrote:
> Since commit 4b563a066611 ("ARM: imx: Remove imx21 support") the imx21
> SoC is no longer supported.
>=20
> Get rid of its USB driver too, which is now unused.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Peter Chen <peter.chen@nxp.com>

> ---
>  drivers/usb/Makefile         |    1 -
>  drivers/usb/host/Kconfig     |   10 -
>  drivers/usb/host/Makefile    |    1 -
>  drivers/usb/host/imx21-dbg.c |  439 --------
>  drivers/usb/host/imx21-hcd.c | 1933 ----------------------------------
>  drivers/usb/host/imx21-hcd.h |  431 --------
>  6 files changed, 2815 deletions(-)
>  delete mode 100644 drivers/usb/host/imx21-dbg.c
>  delete mode 100644 drivers/usb/host/imx21-hcd.c
>  delete mode 100644 drivers/usb/host/imx21-hcd.h
>=20
> diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
> index 1c1c1d659394..ba5706ccc188 100644
> --- a/drivers/usb/Makefile
> +++ b/drivers/usb/Makefile
> @@ -30,7 +30,6 @@ obj-$(CONFIG_USB_ISP1362_HCD)	+=3D host/
>  obj-$(CONFIG_USB_U132_HCD)	+=3D host/
>  obj-$(CONFIG_USB_R8A66597_HCD)	+=3D host/
>  obj-$(CONFIG_USB_HWA_HCD)	+=3D host/
> -obj-$(CONFIG_USB_IMX21_HCD)	+=3D host/
>  obj-$(CONFIG_USB_FSL_USB2)	+=3D host/
>  obj-$(CONFIG_USB_FOTG210_HCD)	+=3D host/
>  obj-$(CONFIG_USB_MAX3421_HCD)	+=3D host/
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index ab12c4bf0ef1..a633e9c15f7e 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -741,16 +741,6 @@ config USB_RENESAS_USBHS_HCD
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called renesas-usbhs.
> =20
> -config USB_IMX21_HCD
> -	tristate "i.MX21 HCD support"
> -	depends on ARM && ARCH_MXC
> -	help
> -	  This driver enables support for the on-chip USB host in the
> -	  i.MX21 processor.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called "imx21-hcd".
> -
>  config USB_HCD_BCMA
>  	tristate "BCMA usb host driver"
>  	depends on BCMA
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index bc731332fed9..d03f6f0764d2 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -81,7 +81,6 @@ obj-$(CONFIG_USB_SL811_HCD)	+=3D sl811-hcd.o
>  obj-$(CONFIG_USB_SL811_CS)	+=3D sl811_cs.o
>  obj-$(CONFIG_USB_U132_HCD)	+=3D u132-hcd.o
>  obj-$(CONFIG_USB_R8A66597_HCD)	+=3D r8a66597-hcd.o
> -obj-$(CONFIG_USB_IMX21_HCD)	+=3D imx21-hcd.o
>  obj-$(CONFIG_USB_FSL_USB2)	+=3D fsl-mph-dr-of.o
>  obj-$(CONFIG_USB_EHCI_FSL)	+=3D fsl-mph-dr-of.o
>  obj-$(CONFIG_USB_EHCI_FSL)	+=3D ehci-fsl.o
> diff --git a/drivers/usb/host/imx21-dbg.c b/drivers/usb/host/imx21-dbg.c
> deleted file mode 100644
> index 02a1344fbd6a..000000000000
> --- a/drivers/usb/host/imx21-dbg.c
> +++ /dev/null
> @@ -1,439 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * Copyright (c) 2009 by Martin Fuzzey
> - */
> -
> -/* this file is part of imx21-hcd.c */
> -
> -#ifdef CONFIG_DYNAMIC_DEBUG
> -#define DEBUG
> -#endif
> -
> -#ifndef DEBUG
> -
> -static inline void create_debug_files(struct imx21 *imx21) { }
> -static inline void remove_debug_files(struct imx21 *imx21) { }
> -static inline void debug_urb_submitted(struct imx21 *imx21, struct urb *=
urb) {}
> -static inline void debug_urb_completed(struct imx21 *imx21, struct urb *=
urb,
> -	int status) {}
> -static inline void debug_urb_unlinked(struct imx21 *imx21, struct urb *u=
rb) {}
> -static inline void debug_urb_queued_for_etd(struct imx21 *imx21,
> -	struct urb *urb) {}
> -static inline void debug_urb_queued_for_dmem(struct imx21 *imx21,
> -	struct urb *urb) {}
> -static inline void debug_etd_allocated(struct imx21 *imx21) {}
> -static inline void debug_etd_freed(struct imx21 *imx21) {}
> -static inline void debug_dmem_allocated(struct imx21 *imx21, int size) {=
}
> -static inline void debug_dmem_freed(struct imx21 *imx21, int size) {}
> -static inline void debug_isoc_submitted(struct imx21 *imx21,
> -	int frame, struct td *td) {}
> -static inline void debug_isoc_completed(struct imx21 *imx21,
> -	int frame, struct td *td, int cc, int len) {}
> -
> -#else
> -
> -#include <linux/debugfs.h>
> -#include <linux/seq_file.h>
> -
> -static const char *dir_labels[] =3D {
> -	"TD 0",
> -	"OUT",
> -	"IN",
> -	"TD 1"
> -};
> -
> -static const char *speed_labels[] =3D {
> -	"Full",
> -	"Low"
> -};
> -
> -static const char *format_labels[] =3D {
> -	"Control",
> -	"ISO",
> -	"Bulk",
> -	"Interrupt"
> -};
> -
> -static inline struct debug_stats *stats_for_urb(struct imx21 *imx21,
> -	struct urb *urb)
> -{
> -	return usb_pipeisoc(urb->pipe) ?
> -		&imx21->isoc_stats : &imx21->nonisoc_stats;
> -}
> -
> -static void debug_urb_submitted(struct imx21 *imx21, struct urb *urb)
> -{
> -	stats_for_urb(imx21, urb)->submitted++;
> -}
> -
> -static void debug_urb_completed(struct imx21 *imx21, struct urb *urb, in=
t st)
> -{
> -	if (st)
> -		stats_for_urb(imx21, urb)->completed_failed++;
> -	else
> -		stats_for_urb(imx21, urb)->completed_ok++;
> -}
> -
> -static void debug_urb_unlinked(struct imx21 *imx21, struct urb *urb)
> -{
> -	stats_for_urb(imx21, urb)->unlinked++;
> -}
> -
> -static void debug_urb_queued_for_etd(struct imx21 *imx21, struct urb *ur=
b)
> -{
> -	stats_for_urb(imx21, urb)->queue_etd++;
> -}
> -
> -static void debug_urb_queued_for_dmem(struct imx21 *imx21, struct urb *u=
rb)
> -{
> -	stats_for_urb(imx21, urb)->queue_dmem++;
> -}
> -
> -static inline void debug_etd_allocated(struct imx21 *imx21)
> -{
> -	imx21->etd_usage.maximum =3D max(
> -			++(imx21->etd_usage.value),
> -			imx21->etd_usage.maximum);
> -}
> -
> -static inline void debug_etd_freed(struct imx21 *imx21)
> -{
> -	imx21->etd_usage.value--;
> -}
> -
> -static inline void debug_dmem_allocated(struct imx21 *imx21, int size)
> -{
> -	imx21->dmem_usage.value +=3D size;
> -	imx21->dmem_usage.maximum =3D max(
> -			imx21->dmem_usage.value,
> -			imx21->dmem_usage.maximum);
> -}
> -
> -static inline void debug_dmem_freed(struct imx21 *imx21, int size)
> -{
> -	imx21->dmem_usage.value -=3D size;
> -}
> -
> -
> -static void debug_isoc_submitted(struct imx21 *imx21,
> -	int frame, struct td *td)
> -{
> -	struct debug_isoc_trace *trace =3D &imx21->isoc_trace[
> -		imx21->isoc_trace_index++];
> -
> -	imx21->isoc_trace_index %=3D ARRAY_SIZE(imx21->isoc_trace);
> -	trace->schedule_frame =3D td->frame;
> -	trace->submit_frame =3D frame;
> -	trace->request_len =3D td->len;
> -	trace->td =3D td;
> -}
> -
> -static inline void debug_isoc_completed(struct imx21 *imx21,
> -	int frame, struct td *td, int cc, int len)
> -{
> -	struct debug_isoc_trace *trace, *trace_failed;
> -	int i;
> -	int found =3D 0;
> -
> -	trace =3D imx21->isoc_trace;
> -	for (i =3D 0; i < ARRAY_SIZE(imx21->isoc_trace); i++, trace++) {
> -		if (trace->td =3D=3D td) {
> -			trace->done_frame =3D frame;
> -			trace->done_len =3D len;
> -			trace->cc =3D cc;
> -			trace->td =3D NULL;
> -			found =3D 1;
> -			break;
> -		}
> -	}
> -
> -	if (found && cc) {
> -		trace_failed =3D &imx21->isoc_trace_failed[
> -					imx21->isoc_trace_index_failed++];
> -
> -		imx21->isoc_trace_index_failed %=3D ARRAY_SIZE(
> -						imx21->isoc_trace_failed);
> -		*trace_failed =3D *trace;
> -	}
> -}
> -
> -
> -static char *format_ep(struct usb_host_endpoint *ep, char *buf, int bufs=
ize)
> -{
> -	if (ep)
> -		snprintf(buf, bufsize, "ep_%02x (type:%02X kaddr:%p)",
> -			ep->desc.bEndpointAddress,
> -			usb_endpoint_type(&ep->desc),
> -			ep);
> -	else
> -		snprintf(buf, bufsize, "none");
> -	return buf;
> -}
> -
> -static char *format_etd_dword0(u32 value, char *buf, int bufsize)
> -{
> -	snprintf(buf, bufsize,
> -		"addr=3D%d ep=3D%d dir=3D%s speed=3D%s format=3D%s halted=3D%d",
> -		value & 0x7F,
> -		(value >> DW0_ENDPNT) & 0x0F,
> -		dir_labels[(value >> DW0_DIRECT) & 0x03],
> -		speed_labels[(value >> DW0_SPEED) & 0x01],
> -		format_labels[(value >> DW0_FORMAT) & 0x03],
> -		(value >> DW0_HALTED) & 0x01);
> -	return buf;
> -}
> -
> -static int debug_status_show(struct seq_file *s, void *v)
> -{
> -	struct imx21 *imx21 =3D s->private;
> -	int etds_allocated =3D 0;
> -	int etds_sw_busy =3D 0;
> -	int etds_hw_busy =3D 0;
> -	int dmem_blocks =3D 0;
> -	int queued_for_etd =3D 0;
> -	int queued_for_dmem =3D 0;
> -	unsigned int dmem_bytes =3D 0;
> -	int i;
> -	struct etd_priv *etd;
> -	u32 etd_enable_mask;
> -	unsigned long flags;
> -	struct imx21_dmem_area *dmem;
> -	struct ep_priv *ep_priv;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	etd_enable_mask =3D readl(imx21->regs + USBH_ETDENSET);
> -	for (i =3D 0, etd =3D imx21->etd; i < USB_NUM_ETD; i++, etd++) {
> -		if (etd->alloc)
> -			etds_allocated++;
> -		if (etd->urb)
> -			etds_sw_busy++;
> -		if (etd_enable_mask & (1<<i))
> -			etds_hw_busy++;
> -	}
> -
> -	list_for_each_entry(dmem, &imx21->dmem_list, list) {
> -		dmem_bytes +=3D dmem->size;
> -		dmem_blocks++;
> -	}
> -
> -	list_for_each_entry(ep_priv, &imx21->queue_for_etd, queue)
> -		queued_for_etd++;
> -
> -	list_for_each_entry(etd, &imx21->queue_for_dmem, queue)
> -		queued_for_dmem++;
> -
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -
> -	seq_printf(s,
> -		"Frame: %d\n"
> -		"ETDs allocated: %d/%d (max=3D%d)\n"
> -		"ETDs in use sw: %d\n"
> -		"ETDs in use hw: %d\n"
> -		"DMEM allocated: %d/%d (max=3D%d)\n"
> -		"DMEM blocks: %d\n"
> -		"Queued waiting for ETD: %d\n"
> -		"Queued waiting for DMEM: %d\n",
> -		readl(imx21->regs + USBH_FRMNUB) & 0xFFFF,
> -		etds_allocated, USB_NUM_ETD, imx21->etd_usage.maximum,
> -		etds_sw_busy,
> -		etds_hw_busy,
> -		dmem_bytes, DMEM_SIZE, imx21->dmem_usage.maximum,
> -		dmem_blocks,
> -		queued_for_etd,
> -		queued_for_dmem);
> -
> -	return 0;
> -}
> -DEFINE_SHOW_ATTRIBUTE(debug_status);
> -
> -static int debug_dmem_show(struct seq_file *s, void *v)
> -{
> -	struct imx21 *imx21 =3D s->private;
> -	struct imx21_dmem_area *dmem;
> -	unsigned long flags;
> -	char ep_text[40];
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	list_for_each_entry(dmem, &imx21->dmem_list, list)
> -		seq_printf(s,
> -			"%04X: size=3D0x%X "
> -			"ep=3D%s\n",
> -			dmem->offset, dmem->size,
> -			format_ep(dmem->ep, ep_text, sizeof(ep_text)));
> -
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -
> -	return 0;
> -}
> -DEFINE_SHOW_ATTRIBUTE(debug_dmem);
> -
> -static int debug_etd_show(struct seq_file *s, void *v)
> -{
> -	struct imx21 *imx21 =3D s->private;
> -	struct etd_priv *etd;
> -	char buf[60];
> -	u32 dword;
> -	int i, j;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	for (i =3D 0, etd =3D imx21->etd; i < USB_NUM_ETD; i++, etd++) {
> -		int state =3D -1;
> -		struct urb_priv *urb_priv;
> -		if (etd->urb) {
> -			urb_priv =3D etd->urb->hcpriv;
> -			if (urb_priv)
> -				state =3D urb_priv->state;
> -		}
> -
> -		seq_printf(s,
> -			"etd_num: %d\n"
> -			"ep: %s\n"
> -			"alloc: %d\n"
> -			"len: %d\n"
> -			"busy sw: %d\n"
> -			"busy hw: %d\n"
> -			"urb state: %d\n"
> -			"current urb: %p\n",
> -
> -			i,
> -			format_ep(etd->ep, buf, sizeof(buf)),
> -			etd->alloc,
> -			etd->len,
> -			etd->urb !=3D NULL,
> -			(readl(imx21->regs + USBH_ETDENSET) & (1 << i)) > 0,
> -			state,
> -			etd->urb);
> -
> -		for (j =3D 0; j < 4; j++) {
> -			dword =3D etd_readl(imx21, i, j);
> -			switch (j) {
> -			case 0:
> -				format_etd_dword0(dword, buf, sizeof(buf));
> -				break;
> -			case 2:
> -				snprintf(buf, sizeof(buf),
> -					"cc=3D0X%02X", dword >> DW2_COMPCODE);
> -				break;
> -			default:
> -				*buf =3D 0;
> -				break;
> -			}
> -			seq_printf(s,
> -				"dword %d: submitted=3D%08X cur=3D%08X [%s]\n",
> -				j,
> -				etd->submitted_dwords[j],
> -				dword,
> -				buf);
> -		}
> -		seq_printf(s, "\n");
> -	}
> -
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -
> -	return 0;
> -}
> -DEFINE_SHOW_ATTRIBUTE(debug_etd);
> -
> -static void debug_statistics_show_one(struct seq_file *s,
> -	const char *name, struct debug_stats *stats)
> -{
> -	seq_printf(s, "%s:\n"
> -		"submitted URBs: %lu\n"
> -		"completed OK: %lu\n"
> -		"completed failed: %lu\n"
> -		"unlinked: %lu\n"
> -		"queued for ETD: %lu\n"
> -		"queued for DMEM: %lu\n\n",
> -		name,
> -		stats->submitted,
> -		stats->completed_ok,
> -		stats->completed_failed,
> -		stats->unlinked,
> -		stats->queue_etd,
> -		stats->queue_dmem);
> -}
> -
> -static int debug_statistics_show(struct seq_file *s, void *v)
> -{
> -	struct imx21 *imx21 =3D s->private;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	debug_statistics_show_one(s, "nonisoc", &imx21->nonisoc_stats);
> -	debug_statistics_show_one(s, "isoc", &imx21->isoc_stats);
> -	seq_printf(s, "unblock kludge triggers: %lu\n", imx21->debug_unblocks);
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -
> -	return 0;
> -}
> -DEFINE_SHOW_ATTRIBUTE(debug_statistics);
> -
> -static void debug_isoc_show_one(struct seq_file *s,
> -	const char *name, int index, 	struct debug_isoc_trace *trace)
> -{
> -	seq_printf(s, "%s %d:\n"
> -		"cc=3D0X%02X\n"
> -		"scheduled frame %d (%d)\n"
> -		"submitted frame %d (%d)\n"
> -		"completed frame %d (%d)\n"
> -		"requested length=3D%d\n"
> -		"completed length=3D%d\n\n",
> -		name, index,
> -		trace->cc,
> -		trace->schedule_frame, trace->schedule_frame & 0xFFFF,
> -		trace->submit_frame, trace->submit_frame & 0xFFFF,
> -		trace->done_frame, trace->done_frame & 0xFFFF,
> -		trace->request_len,
> -		trace->done_len);
> -}
> -
> -static int debug_isoc_show(struct seq_file *s, void *v)
> -{
> -	struct imx21 *imx21 =3D s->private;
> -	struct debug_isoc_trace *trace;
> -	unsigned long flags;
> -	int i;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	trace =3D imx21->isoc_trace_failed;
> -	for (i =3D 0; i < ARRAY_SIZE(imx21->isoc_trace_failed); i++, trace++)
> -		debug_isoc_show_one(s, "isoc failed", i, trace);
> -
> -	trace =3D imx21->isoc_trace;
> -	for (i =3D 0; i < ARRAY_SIZE(imx21->isoc_trace); i++, trace++)
> -		debug_isoc_show_one(s, "isoc", i, trace);
> -
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -
> -	return 0;
> -}
> -DEFINE_SHOW_ATTRIBUTE(debug_isoc);
> -
> -static void create_debug_files(struct imx21 *imx21)
> -{
> -	struct dentry *root;
> -
> -	root =3D debugfs_create_dir(dev_name(imx21->dev), usb_debug_root);
> -	imx21->debug_root =3D root;
> -
> -	debugfs_create_file("status", S_IRUGO, root, imx21, &debug_status_fops)=
;
> -	debugfs_create_file("dmem", S_IRUGO, root, imx21, &debug_dmem_fops);
> -	debugfs_create_file("etd", S_IRUGO, root, imx21, &debug_etd_fops);
> -	debugfs_create_file("statistics", S_IRUGO, root, imx21,
> -			    &debug_statistics_fops);
> -	debugfs_create_file("isoc", S_IRUGO, root, imx21, &debug_isoc_fops);
> -}
> -
> -static void remove_debug_files(struct imx21 *imx21)
> -{
> -	debugfs_remove_recursive(imx21->debug_root);
> -}
> -
> -#endif
> -
> diff --git a/drivers/usb/host/imx21-hcd.c b/drivers/usb/host/imx21-hcd.c
> deleted file mode 100644
> index b2716cb72471..000000000000
> --- a/drivers/usb/host/imx21-hcd.c
> +++ /dev/null
> @@ -1,1933 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * USB Host Controller Driver for IMX21
> - *
> - * Copyright (C) 2006 Loping Dog Embedded Systems
> - * Copyright (C) 2009 Martin Fuzzey
> - * Originally written by Jay Monkman <jtm@lopingdog.com>
> - * Ported to 2.6.30, debugged and enhanced by Martin Fuzzey
> - */
> -
> -
> - /*
> -  * The i.MX21 USB hardware contains
> -  *    * 32 transfer descriptors (called ETDs)
> -  *    * 4Kb of Data memory
> -  *
> -  * The data memory is shared between the host and function controllers
> -  * (but this driver only supports the host controller)
> -  *
> -  * So setting up a transfer involves:
> -  *    * Allocating a ETD
> -  *    * Fill in ETD with appropriate information
> -  *    * Allocating data memory (and putting the offset in the ETD)
> -  *    * Activate the ETD
> -  *    * Get interrupt when done.
> -  *
> -  * An ETD is assigned to each active endpoint.
> -  *
> -  * Low resource (ETD and Data memory) situations are handled differentl=
y for
> -  * isochronous and non insosynchronous transactions :
> -  *
> -  * Non ISOC transfers are queued if either ETDs or Data memory are unav=
ailable
> -  *
> -  * ISOC transfers use 2 ETDs per endpoint to achieve double buffering.
> -  * They allocate both ETDs and Data memory during URB submission
> -  * (and fail if unavailable).
> -  */
> -
> -#include <linux/clk.h>
> -#include <linux/io.h>
> -#include <linux/kernel.h>
> -#include <linux/list.h>
> -#include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/usb.h>
> -#include <linux/usb/hcd.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/module.h>
> -
> -#include "imx21-hcd.h"
> -
> -#ifdef CONFIG_DYNAMIC_DEBUG
> -#define DEBUG
> -#endif
> -
> -#ifdef DEBUG
> -#define DEBUG_LOG_FRAME(imx21, etd, event) \
> -	(etd)->event##_frame =3D readl((imx21)->regs + USBH_FRMNUB)
> -#else
> -#define DEBUG_LOG_FRAME(imx21, etd, event) do { } while (0)
> -#endif
> -
> -static const char hcd_name[] =3D "imx21-hcd";
> -
> -static inline struct imx21 *hcd_to_imx21(struct usb_hcd *hcd)
> -{
> -	return (struct imx21 *)hcd->hcd_priv;
> -}
> -
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -/* Hardware access helpers			*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -
> -static inline void set_register_bits(struct imx21 *imx21, u32 offset, u3=
2 mask)
> -{
> -	void __iomem *reg =3D imx21->regs + offset;
> -	writel(readl(reg) | mask, reg);
> -}
> -
> -static inline void clear_register_bits(struct imx21 *imx21,
> -	u32 offset, u32 mask)
> -{
> -	void __iomem *reg =3D imx21->regs + offset;
> -	writel(readl(reg) & ~mask, reg);
> -}
> -
> -static inline void clear_toggle_bit(struct imx21 *imx21, u32 offset, u32=
 mask)
> -{
> -	void __iomem *reg =3D imx21->regs + offset;
> -
> -	if (readl(reg) & mask)
> -		writel(mask, reg);
> -}
> -
> -static inline void set_toggle_bit(struct imx21 *imx21, u32 offset, u32 m=
ask)
> -{
> -	void __iomem *reg =3D imx21->regs + offset;
> -
> -	if (!(readl(reg) & mask))
> -		writel(mask, reg);
> -}
> -
> -static void etd_writel(struct imx21 *imx21, int etd_num, int dword, u32 =
value)
> -{
> -	writel(value, imx21->regs + USB_ETD_DWORD(etd_num, dword));
> -}
> -
> -static u32 etd_readl(struct imx21 *imx21, int etd_num, int dword)
> -{
> -	return readl(imx21->regs + USB_ETD_DWORD(etd_num, dword));
> -}
> -
> -static inline int wrap_frame(int counter)
> -{
> -	return counter & 0xFFFF;
> -}
> -
> -static inline int frame_after(int frame, int after)
> -{
> -	/* handle wrapping like jiffies time_afer */
> -	return (s16)((s16)after - (s16)frame) < 0;
> -}
> -
> -static int imx21_hc_get_frame(struct usb_hcd *hcd)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -
> -	return wrap_frame(readl(imx21->regs + USBH_FRMNUB));
> -}
> -
> -static inline bool unsuitable_for_dma(dma_addr_t addr)
> -{
> -	return (addr & 3) !=3D 0;
> -}
> -
> -#include "imx21-dbg.c"
> -
> -static void nonisoc_urb_completed_for_etd(
> -	struct imx21 *imx21, struct etd_priv *etd, int status);
> -static void schedule_nonisoc_etd(struct imx21 *imx21, struct urb *urb);
> -static void free_dmem(struct imx21 *imx21, struct etd_priv *etd);
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -/* ETD management				*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	*/
> -
> -static int alloc_etd(struct imx21 *imx21)
> -{
> -	int i;
> -	struct etd_priv *etd =3D imx21->etd;
> -
> -	for (i =3D 0; i < USB_NUM_ETD; i++, etd++) {
> -		if (etd->alloc =3D=3D 0) {
> -			memset(etd, 0, sizeof(imx21->etd[0]));
> -			etd->alloc =3D 1;
> -			debug_etd_allocated(imx21);
> -			return i;
> -		}
> -	}
> -	return -1;
> -}
> -
> -static void disactivate_etd(struct imx21 *imx21, int num)
> -{
> -	int etd_mask =3D (1 << num);
> -	struct etd_priv *etd =3D &imx21->etd[num];
> -
> -	writel(etd_mask, imx21->regs + USBH_ETDENCLR);
> -	clear_register_bits(imx21, USBH_ETDDONEEN, etd_mask);
> -	writel(etd_mask, imx21->regs + USB_ETDDMACHANLCLR);
> -	clear_toggle_bit(imx21, USBH_ETDDONESTAT, etd_mask);
> -
> -	etd->active_count =3D 0;
> -
> -	DEBUG_LOG_FRAME(imx21, etd, disactivated);
> -}
> -
> -static void reset_etd(struct imx21 *imx21, int num)
> -{
> -	struct etd_priv *etd =3D imx21->etd + num;
> -	int i;
> -
> -	disactivate_etd(imx21, num);
> -
> -	for (i =3D 0; i < 4; i++)
> -		etd_writel(imx21, num, i, 0);
> -	etd->urb =3D NULL;
> -	etd->ep =3D NULL;
> -	etd->td =3D NULL;
> -	etd->bounce_buffer =3D NULL;
> -}
> -
> -static void free_etd(struct imx21 *imx21, int num)
> -{
> -	if (num < 0)
> -		return;
> -
> -	if (num >=3D USB_NUM_ETD) {
> -		dev_err(imx21->dev, "BAD etd=3D%d!\n", num);
> -		return;
> -	}
> -	if (imx21->etd[num].alloc =3D=3D 0) {
> -		dev_err(imx21->dev, "ETD %d already free!\n", num);
> -		return;
> -	}
> -
> -	debug_etd_freed(imx21);
> -	reset_etd(imx21, num);
> -	memset(&imx21->etd[num], 0, sizeof(imx21->etd[0]));
> -}
> -
> -
> -static void setup_etd_dword0(struct imx21 *imx21,
> -	int etd_num, struct urb *urb,  u8 dir, u16 maxpacket)
> -{
> -	etd_writel(imx21, etd_num, 0,
> -		((u32) usb_pipedevice(urb->pipe)) <<  DW0_ADDRESS |
> -		((u32) usb_pipeendpoint(urb->pipe) << DW0_ENDPNT) |
> -		((u32) dir << DW0_DIRECT) |
> -		((u32) ((urb->dev->speed =3D=3D USB_SPEED_LOW) ?
> -			1 : 0) << DW0_SPEED) |
> -		((u32) fmt_urb_to_etd[usb_pipetype(urb->pipe)] << DW0_FORMAT) |
> -		((u32) maxpacket << DW0_MAXPKTSIZ));
> -}
> -
> -/*
> - * Copy buffer to data controller data memory.
> - * We cannot use memcpy_toio() because the hardware requires 32bit write=
s
> - */
> -static void copy_to_dmem(
> -	struct imx21 *imx21, int dmem_offset, void *src, int count)
> -{
> -	void __iomem *dmem =3D imx21->regs + USBOTG_DMEM + dmem_offset;
> -	u32 word =3D 0;
> -	u8 *p =3D src;
> -	int byte =3D 0;
> -	int i;
> -
> -	for (i =3D 0; i < count; i++) {
> -		byte =3D i % 4;
> -		word +=3D (*p++ << (byte * 8));
> -		if (byte =3D=3D 3) {
> -			writel(word, dmem);
> -			dmem +=3D 4;
> -			word =3D 0;
> -		}
> -	}
> -
> -	if (count && byte !=3D 3)
> -		writel(word, dmem);
> -}
> -
> -static void activate_etd(struct imx21 *imx21, int etd_num, u8 dir)
> -{
> -	u32 etd_mask =3D 1 << etd_num;
> -	struct etd_priv *etd =3D &imx21->etd[etd_num];
> -
> -	if (etd->dma_handle && unsuitable_for_dma(etd->dma_handle)) {
> -		/* For non aligned isoc the condition below is always true */
> -		if (etd->len <=3D etd->dmem_size) {
> -			/* Fits into data memory, use PIO */
> -			if (dir !=3D TD_DIR_IN) {
> -				copy_to_dmem(imx21,
> -						etd->dmem_offset,
> -						etd->cpu_buffer, etd->len);
> -			}
> -			etd->dma_handle =3D 0;
> -
> -		} else {
> -			/* Too big for data memory, use bounce buffer */
> -			enum dma_data_direction dmadir;
> -
> -			if (dir =3D=3D TD_DIR_IN) {
> -				dmadir =3D DMA_FROM_DEVICE;
> -				etd->bounce_buffer =3D kmalloc(etd->len,
> -								GFP_ATOMIC);
> -			} else {
> -				dmadir =3D DMA_TO_DEVICE;
> -				etd->bounce_buffer =3D kmemdup(etd->cpu_buffer,
> -								etd->len,
> -								GFP_ATOMIC);
> -			}
> -			if (!etd->bounce_buffer) {
> -				dev_err(imx21->dev, "failed bounce alloc\n");
> -				goto err_bounce_alloc;
> -			}
> -
> -			etd->dma_handle =3D
> -				dma_map_single(imx21->dev,
> -						etd->bounce_buffer,
> -						etd->len,
> -						dmadir);
> -			if (dma_mapping_error(imx21->dev, etd->dma_handle)) {
> -				dev_err(imx21->dev, "failed bounce map\n");
> -				goto err_bounce_map;
> -			}
> -		}
> -	}
> -
> -	clear_toggle_bit(imx21, USBH_ETDDONESTAT, etd_mask);
> -	set_register_bits(imx21, USBH_ETDDONEEN, etd_mask);
> -	clear_toggle_bit(imx21, USBH_XFILLSTAT, etd_mask);
> -	clear_toggle_bit(imx21, USBH_YFILLSTAT, etd_mask);
> -
> -	if (etd->dma_handle) {
> -		set_register_bits(imx21, USB_ETDDMACHANLCLR, etd_mask);
> -		clear_toggle_bit(imx21, USBH_XBUFSTAT, etd_mask);
> -		clear_toggle_bit(imx21, USBH_YBUFSTAT, etd_mask);
> -		writel(etd->dma_handle, imx21->regs + USB_ETDSMSA(etd_num));
> -		set_register_bits(imx21, USB_ETDDMAEN, etd_mask);
> -	} else {
> -		if (dir !=3D TD_DIR_IN) {
> -			/* need to set for ZLP and PIO */
> -			set_toggle_bit(imx21, USBH_XFILLSTAT, etd_mask);
> -			set_toggle_bit(imx21, USBH_YFILLSTAT, etd_mask);
> -		}
> -	}
> -
> -	DEBUG_LOG_FRAME(imx21, etd, activated);
> -
> -#ifdef DEBUG
> -	if (!etd->active_count) {
> -		int i;
> -		etd->activated_frame =3D readl(imx21->regs + USBH_FRMNUB);
> -		etd->disactivated_frame =3D -1;
> -		etd->last_int_frame =3D -1;
> -		etd->last_req_frame =3D -1;
> -
> -		for (i =3D 0; i < 4; i++)
> -			etd->submitted_dwords[i] =3D etd_readl(imx21, etd_num, i);
> -	}
> -#endif
> -
> -	etd->active_count =3D 1;
> -	writel(etd_mask, imx21->regs + USBH_ETDENSET);
> -	return;
> -
> -err_bounce_map:
> -	kfree(etd->bounce_buffer);
> -
> -err_bounce_alloc:
> -	free_dmem(imx21, etd);
> -	nonisoc_urb_completed_for_etd(imx21, etd, -ENOMEM);
> -}
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	*/
> -/* Data memory management			*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	*/
> -
> -static int alloc_dmem(struct imx21 *imx21, unsigned int size,
> -		      struct usb_host_endpoint *ep)
> -{
> -	unsigned int offset =3D 0;
> -	struct imx21_dmem_area *area;
> -	struct imx21_dmem_area *tmp;
> -
> -	size +=3D (~size + 1) & 0x3; /* Round to 4 byte multiple */
> -
> -	if (size > DMEM_SIZE) {
> -		dev_err(imx21->dev, "size=3D%d > DMEM_SIZE(%d)\n",
> -			size, DMEM_SIZE);
> -		return -EINVAL;
> -	}
> -
> -	list_for_each_entry(tmp, &imx21->dmem_list, list) {
> -		if ((size + offset) < offset)
> -			goto fail;
> -		if ((size + offset) <=3D tmp->offset)
> -			break;
> -		offset =3D tmp->size + tmp->offset;
> -		if ((offset + size) > DMEM_SIZE)
> -			goto fail;
> -	}
> -
> -	area =3D kmalloc(sizeof(struct imx21_dmem_area), GFP_ATOMIC);
> -	if (area =3D=3D NULL)
> -		return -ENOMEM;
> -
> -	area->ep =3D ep;
> -	area->offset =3D offset;
> -	area->size =3D size;
> -	list_add_tail(&area->list, &tmp->list);
> -	debug_dmem_allocated(imx21, size);
> -	return offset;
> -
> -fail:
> -	return -ENOMEM;
> -}
> -
> -/* Memory now available for a queued ETD - activate it */
> -static void activate_queued_etd(struct imx21 *imx21,
> -	struct etd_priv *etd, u32 dmem_offset)
> -{
> -	struct urb_priv *urb_priv =3D etd->urb->hcpriv;
> -	int etd_num =3D etd - &imx21->etd[0];
> -	u32 maxpacket =3D etd_readl(imx21, etd_num, 1) >> DW1_YBUFSRTAD;
> -	u8 dir =3D (etd_readl(imx21, etd_num, 2) >> DW2_DIRPID) & 0x03;
> -
> -	dev_dbg(imx21->dev, "activating queued ETD %d now DMEM available\n",
> -		etd_num);
> -	etd_writel(imx21, etd_num, 1,
> -	    ((dmem_offset + maxpacket) << DW1_YBUFSRTAD) | dmem_offset);
> -
> -	etd->dmem_offset =3D dmem_offset;
> -	urb_priv->active =3D 1;
> -	activate_etd(imx21, etd_num, dir);
> -}
> -
> -static void free_dmem(struct imx21 *imx21, struct etd_priv *etd)
> -{
> -	struct imx21_dmem_area *area;
> -	struct etd_priv *tmp;
> -	int found =3D 0;
> -	int offset;
> -
> -	if (!etd->dmem_size)
> -		return;
> -	etd->dmem_size =3D 0;
> -
> -	offset =3D etd->dmem_offset;
> -	list_for_each_entry(area, &imx21->dmem_list, list) {
> -		if (area->offset =3D=3D offset) {
> -			debug_dmem_freed(imx21, area->size);
> -			list_del(&area->list);
> -			kfree(area);
> -			found =3D 1;
> -			break;
> -		}
> -	}
> -
> -	if (!found)  {
> -		dev_err(imx21->dev,
> -			"Trying to free unallocated DMEM %d\n", offset);
> -		return;
> -	}
> -
> -	/* Try again to allocate memory for anything we've queued */
> -	list_for_each_entry_safe(etd, tmp, &imx21->queue_for_dmem, queue) {
> -		offset =3D alloc_dmem(imx21, etd->dmem_size, etd->ep);
> -		if (offset >=3D 0) {
> -			list_del(&etd->queue);
> -			activate_queued_etd(imx21, etd, (u32)offset);
> -		}
> -	}
> -}
> -
> -static void free_epdmem(struct imx21 *imx21, struct usb_host_endpoint *e=
p)
> -{
> -	struct imx21_dmem_area *area, *tmp;
> -
> -	list_for_each_entry_safe(area, tmp, &imx21->dmem_list, list) {
> -		if (area->ep =3D=3D ep) {
> -			dev_err(imx21->dev,
> -				"Active DMEM %d for disabled ep=3D%p\n",
> -				area->offset, ep);
> -			list_del(&area->list);
> -			kfree(area);
> -		}
> -	}
> -}
> -
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	*/
> -/* End handling 				*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	*/
> -
> -/* Endpoint now idle - release its ETD(s) or assign to queued request */
> -static void ep_idle(struct imx21 *imx21, struct ep_priv *ep_priv)
> -{
> -	int i;
> -
> -	for (i =3D 0; i < NUM_ISO_ETDS; i++) {
> -		int etd_num =3D ep_priv->etd[i];
> -		struct etd_priv *etd;
> -		if (etd_num < 0)
> -			continue;
> -
> -		etd =3D &imx21->etd[etd_num];
> -		ep_priv->etd[i] =3D -1;
> -
> -		free_dmem(imx21, etd); /* for isoc */
> -
> -		if (list_empty(&imx21->queue_for_etd)) {
> -			free_etd(imx21, etd_num);
> -			continue;
> -		}
> -
> -		dev_dbg(imx21->dev,
> -			"assigning idle etd %d for queued request\n", etd_num);
> -		ep_priv =3D list_first_entry(&imx21->queue_for_etd,
> -			struct ep_priv, queue);
> -		list_del(&ep_priv->queue);
> -		reset_etd(imx21, etd_num);
> -		ep_priv->waiting_etd =3D 0;
> -		ep_priv->etd[i] =3D etd_num;
> -
> -		if (list_empty(&ep_priv->ep->urb_list)) {
> -			dev_err(imx21->dev, "No urb for queued ep!\n");
> -			continue;
> -		}
> -		schedule_nonisoc_etd(imx21, list_first_entry(
> -			&ep_priv->ep->urb_list, struct urb, urb_list));
> -	}
> -}
> -
> -static void urb_done(struct usb_hcd *hcd, struct urb *urb, int status)
> -__releases(imx21->lock)
> -__acquires(imx21->lock)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	struct ep_priv *ep_priv =3D urb->ep->hcpriv;
> -	struct urb_priv *urb_priv =3D urb->hcpriv;
> -
> -	debug_urb_completed(imx21, urb, status);
> -	dev_vdbg(imx21->dev, "urb %p done %d\n", urb, status);
> -
> -	kfree(urb_priv->isoc_td);
> -	kfree(urb->hcpriv);
> -	urb->hcpriv =3D NULL;
> -	usb_hcd_unlink_urb_from_ep(hcd, urb);
> -	spin_unlock(&imx21->lock);
> -	usb_hcd_giveback_urb(hcd, urb, status);
> -	spin_lock(&imx21->lock);
> -	if (list_empty(&ep_priv->ep->urb_list))
> -		ep_idle(imx21, ep_priv);
> -}
> -
> -static void nonisoc_urb_completed_for_etd(
> -	struct imx21 *imx21, struct etd_priv *etd, int status)
> -{
> -	struct usb_host_endpoint *ep =3D etd->ep;
> -
> -	urb_done(imx21->hcd, etd->urb, status);
> -	etd->urb =3D NULL;
> -
> -	if (!list_empty(&ep->urb_list)) {
> -		struct urb *urb =3D list_first_entry(
> -					&ep->urb_list, struct urb, urb_list);
> -
> -		dev_vdbg(imx21->dev, "next URB %p\n", urb);
> -		schedule_nonisoc_etd(imx21, urb);
> -	}
> -}
> -
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	*/
> -/* ISOC Handling ... 				*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	*/
> -
> -static void schedule_isoc_etds(struct usb_hcd *hcd,
> -	struct usb_host_endpoint *ep)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	struct ep_priv *ep_priv =3D ep->hcpriv;
> -	struct etd_priv *etd;
> -	struct urb_priv *urb_priv;
> -	struct td *td;
> -	int etd_num;
> -	int i;
> -	int cur_frame;
> -	u8 dir;
> -
> -	for (i =3D 0; i < NUM_ISO_ETDS; i++) {
> -too_late:
> -		if (list_empty(&ep_priv->td_list))
> -			break;
> -
> -		etd_num =3D ep_priv->etd[i];
> -		if (etd_num < 0)
> -			break;
> -
> -		etd =3D &imx21->etd[etd_num];
> -		if (etd->urb)
> -			continue;
> -
> -		td =3D list_entry(ep_priv->td_list.next, struct td, list);
> -		list_del(&td->list);
> -		urb_priv =3D td->urb->hcpriv;
> -
> -		cur_frame =3D imx21_hc_get_frame(hcd);
> -		if (frame_after(cur_frame, td->frame)) {
> -			dev_dbg(imx21->dev, "isoc too late frame %d > %d\n",
> -				cur_frame, td->frame);
> -			urb_priv->isoc_status =3D -EXDEV;
> -			td->urb->iso_frame_desc[
> -				td->isoc_index].actual_length =3D 0;
> -			td->urb->iso_frame_desc[td->isoc_index].status =3D -EXDEV;
> -			if (--urb_priv->isoc_remaining =3D=3D 0)
> -				urb_done(hcd, td->urb, urb_priv->isoc_status);
> -			goto too_late;
> -		}
> -
> -		urb_priv->active =3D 1;
> -		etd->td =3D td;
> -		etd->ep =3D td->ep;
> -		etd->urb =3D td->urb;
> -		etd->len =3D td->len;
> -		etd->dma_handle =3D td->dma_handle;
> -		etd->cpu_buffer =3D td->cpu_buffer;
> -
> -		debug_isoc_submitted(imx21, cur_frame, td);
> -
> -		dir =3D usb_pipeout(td->urb->pipe) ? TD_DIR_OUT : TD_DIR_IN;
> -		setup_etd_dword0(imx21, etd_num, td->urb, dir, etd->dmem_size);
> -		etd_writel(imx21, etd_num, 1, etd->dmem_offset);
> -		etd_writel(imx21, etd_num, 2,
> -			(TD_NOTACCESSED << DW2_COMPCODE) |
> -			((td->frame & 0xFFFF) << DW2_STARTFRM));
> -		etd_writel(imx21, etd_num, 3,
> -			(TD_NOTACCESSED << DW3_COMPCODE0) |
> -			(td->len << DW3_PKTLEN0));
> -
> -		activate_etd(imx21, etd_num, dir);
> -	}
> -}
> -
> -static void isoc_etd_done(struct usb_hcd *hcd, int etd_num)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	int etd_mask =3D 1 << etd_num;
> -	struct etd_priv *etd =3D imx21->etd + etd_num;
> -	struct urb *urb =3D etd->urb;
> -	struct urb_priv *urb_priv =3D urb->hcpriv;
> -	struct td *td =3D etd->td;
> -	struct usb_host_endpoint *ep =3D etd->ep;
> -	int isoc_index =3D td->isoc_index;
> -	unsigned int pipe =3D urb->pipe;
> -	int dir_in =3D usb_pipein(pipe);
> -	int cc;
> -	int bytes_xfrd;
> -
> -	disactivate_etd(imx21, etd_num);
> -
> -	cc =3D (etd_readl(imx21, etd_num, 3) >> DW3_COMPCODE0) & 0xf;
> -	bytes_xfrd =3D etd_readl(imx21, etd_num, 3) & 0x3ff;
> -
> -	/* Input doesn't always fill the buffer, don't generate an error
> -	 * when this happens.
> -	 */
> -	if (dir_in && (cc =3D=3D TD_DATAUNDERRUN))
> -		cc =3D TD_CC_NOERROR;
> -
> -	if (cc =3D=3D TD_NOTACCESSED)
> -		bytes_xfrd =3D 0;
> -
> -	debug_isoc_completed(imx21,
> -		imx21_hc_get_frame(hcd), td, cc, bytes_xfrd);
> -	if (cc) {
> -		urb_priv->isoc_status =3D -EXDEV;
> -		dev_dbg(imx21->dev,
> -			"bad iso cc=3D0x%X frame=3D%d sched frame=3D%d "
> -			"cnt=3D%d len=3D%d urb=3D%p etd=3D%d index=3D%d\n",
> -			cc,  imx21_hc_get_frame(hcd), td->frame,
> -			bytes_xfrd, td->len, urb, etd_num, isoc_index);
> -	}
> -
> -	if (dir_in) {
> -		clear_toggle_bit(imx21, USBH_XFILLSTAT, etd_mask);
> -		if (!etd->dma_handle)
> -			memcpy_fromio(etd->cpu_buffer,
> -				imx21->regs + USBOTG_DMEM + etd->dmem_offset,
> -				bytes_xfrd);
> -	}
> -
> -	urb->actual_length +=3D bytes_xfrd;
> -	urb->iso_frame_desc[isoc_index].actual_length =3D bytes_xfrd;
> -	urb->iso_frame_desc[isoc_index].status =3D cc_to_error[cc];
> -
> -	etd->td =3D NULL;
> -	etd->urb =3D NULL;
> -	etd->ep =3D NULL;
> -
> -	if (--urb_priv->isoc_remaining =3D=3D 0)
> -		urb_done(hcd, urb, urb_priv->isoc_status);
> -
> -	schedule_isoc_etds(hcd, ep);
> -}
> -
> -static struct ep_priv *alloc_isoc_ep(
> -	struct imx21 *imx21, struct usb_host_endpoint *ep)
> -{
> -	struct ep_priv *ep_priv;
> -	int i;
> -
> -	ep_priv =3D kzalloc(sizeof(struct ep_priv), GFP_ATOMIC);
> -	if (!ep_priv)
> -		return NULL;
> -
> -	for (i =3D 0; i < NUM_ISO_ETDS; i++)
> -		ep_priv->etd[i] =3D -1;
> -
> -	INIT_LIST_HEAD(&ep_priv->td_list);
> -	ep_priv->ep =3D ep;
> -	ep->hcpriv =3D ep_priv;
> -	return ep_priv;
> -}
> -
> -static int alloc_isoc_etds(struct imx21 *imx21, struct ep_priv *ep_priv)
> -{
> -	int i, j;
> -	int etd_num;
> -
> -	/* Allocate the ETDs if required */
> -	for (i =3D 0; i < NUM_ISO_ETDS; i++) {
> -		if (ep_priv->etd[i] < 0) {
> -			etd_num =3D alloc_etd(imx21);
> -			if (etd_num < 0)
> -				goto alloc_etd_failed;
> -
> -			ep_priv->etd[i] =3D etd_num;
> -			imx21->etd[etd_num].ep =3D ep_priv->ep;
> -		}
> -	}
> -	return 0;
> -
> -alloc_etd_failed:
> -	dev_err(imx21->dev, "isoc: Couldn't allocate etd\n");
> -	for (j =3D 0; j < i; j++) {
> -		free_etd(imx21, ep_priv->etd[j]);
> -		ep_priv->etd[j] =3D -1;
> -	}
> -	return -ENOMEM;
> -}
> -
> -static int imx21_hc_urb_enqueue_isoc(struct usb_hcd *hcd,
> -				     struct usb_host_endpoint *ep,
> -				     struct urb *urb, gfp_t mem_flags)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	struct urb_priv *urb_priv;
> -	unsigned long flags;
> -	struct ep_priv *ep_priv;
> -	struct td *td =3D NULL;
> -	int i;
> -	int ret;
> -	int cur_frame;
> -	u16 maxpacket;
> -
> -	urb_priv =3D kzalloc(sizeof(struct urb_priv), mem_flags);
> -	if (urb_priv =3D=3D NULL)
> -		return -ENOMEM;
> -
> -	urb_priv->isoc_td =3D kcalloc(urb->number_of_packets, sizeof(struct td)=
,
> -				    mem_flags);
> -	if (urb_priv->isoc_td =3D=3D NULL) {
> -		ret =3D -ENOMEM;
> -		goto alloc_td_failed;
> -	}
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	if (ep->hcpriv =3D=3D NULL) {
> -		ep_priv =3D alloc_isoc_ep(imx21, ep);
> -		if (ep_priv =3D=3D NULL) {
> -			ret =3D -ENOMEM;
> -			goto alloc_ep_failed;
> -		}
> -	} else {
> -		ep_priv =3D ep->hcpriv;
> -	}
> -
> -	ret =3D alloc_isoc_etds(imx21, ep_priv);
> -	if (ret)
> -		goto alloc_etd_failed;
> -
> -	ret =3D usb_hcd_link_urb_to_ep(hcd, urb);
> -	if (ret)
> -		goto link_failed;
> -
> -	urb->status =3D -EINPROGRESS;
> -	urb->actual_length =3D 0;
> -	urb->error_count =3D 0;
> -	urb->hcpriv =3D urb_priv;
> -	urb_priv->ep =3D ep;
> -
> -	/* allocate data memory for largest packets if not already done */
> -	maxpacket =3D usb_maxpacket(urb->dev, urb->pipe, usb_pipeout(urb->pipe)=
);
> -	for (i =3D 0; i < NUM_ISO_ETDS; i++) {
> -		struct etd_priv *etd =3D &imx21->etd[ep_priv->etd[i]];
> -
> -		if (etd->dmem_size > 0 && etd->dmem_size < maxpacket) {
> -			/* not sure if this can really occur.... */
> -			dev_err(imx21->dev, "increasing isoc buffer %d->%d\n",
> -				etd->dmem_size, maxpacket);
> -			ret =3D -EMSGSIZE;
> -			goto alloc_dmem_failed;
> -		}
> -
> -		if (etd->dmem_size =3D=3D 0) {
> -			etd->dmem_offset =3D alloc_dmem(imx21, maxpacket, ep);
> -			if (etd->dmem_offset < 0) {
> -				dev_dbg(imx21->dev, "failed alloc isoc dmem\n");
> -				ret =3D -EAGAIN;
> -				goto alloc_dmem_failed;
> -			}
> -			etd->dmem_size =3D maxpacket;
> -		}
> -	}
> -
> -	/* calculate frame */
> -	cur_frame =3D imx21_hc_get_frame(hcd);
> -	i =3D 0;
> -	if (list_empty(&ep_priv->td_list)) {
> -		urb->start_frame =3D wrap_frame(cur_frame + 5);
> -	} else {
> -		urb->start_frame =3D wrap_frame(list_entry(ep_priv->td_list.prev,
> -				struct td, list)->frame + urb->interval);
> -
> -		if (frame_after(cur_frame, urb->start_frame)) {
> -			dev_dbg(imx21->dev,
> -				"enqueue: adjusting iso start %d (cur=3D%d) asap=3D%d\n",
> -				urb->start_frame, cur_frame,
> -				(urb->transfer_flags & URB_ISO_ASAP) !=3D 0);
> -			i =3D DIV_ROUND_UP(wrap_frame(
> -					cur_frame - urb->start_frame),
> -					urb->interval);
> -
> -			/* Treat underruns as if URB_ISO_ASAP was set */
> -			if ((urb->transfer_flags & URB_ISO_ASAP) ||
> -					i >=3D urb->number_of_packets) {
> -				urb->start_frame =3D wrap_frame(urb->start_frame
> -						+ i * urb->interval);
> -				i =3D 0;
> -			}
> -		}
> -	}
> -
> -	/* set up transfers */
> -	urb_priv->isoc_remaining =3D urb->number_of_packets - i;
> -	td =3D urb_priv->isoc_td;
> -	for (; i < urb->number_of_packets; i++, td++) {
> -		unsigned int offset =3D urb->iso_frame_desc[i].offset;
> -		td->ep =3D ep;
> -		td->urb =3D urb;
> -		td->len =3D urb->iso_frame_desc[i].length;
> -		td->isoc_index =3D i;
> -		td->frame =3D wrap_frame(urb->start_frame + urb->interval * i);
> -		td->dma_handle =3D urb->transfer_dma + offset;
> -		td->cpu_buffer =3D urb->transfer_buffer + offset;
> -		list_add_tail(&td->list, &ep_priv->td_list);
> -	}
> -
> -	dev_vdbg(imx21->dev, "setup %d packets for iso frame %d->%d\n",
> -		urb->number_of_packets, urb->start_frame, td->frame);
> -
> -	debug_urb_submitted(imx21, urb);
> -	schedule_isoc_etds(hcd, ep);
> -
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -	return 0;
> -
> -alloc_dmem_failed:
> -	usb_hcd_unlink_urb_from_ep(hcd, urb);
> -
> -link_failed:
> -alloc_etd_failed:
> -alloc_ep_failed:
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -	kfree(urb_priv->isoc_td);
> -
> -alloc_td_failed:
> -	kfree(urb_priv);
> -	return ret;
> -}
> -
> -static void dequeue_isoc_urb(struct imx21 *imx21,
> -	struct urb *urb, struct ep_priv *ep_priv)
> -{
> -	struct urb_priv *urb_priv =3D urb->hcpriv;
> -	struct td *td, *tmp;
> -	int i;
> -
> -	if (urb_priv->active) {
> -		for (i =3D 0; i < NUM_ISO_ETDS; i++) {
> -			int etd_num =3D ep_priv->etd[i];
> -			if (etd_num !=3D -1 && imx21->etd[etd_num].urb =3D=3D urb) {
> -				struct etd_priv *etd =3D imx21->etd + etd_num;
> -
> -				reset_etd(imx21, etd_num);
> -				free_dmem(imx21, etd);
> -			}
> -		}
> -	}
> -
> -	list_for_each_entry_safe(td, tmp, &ep_priv->td_list, list) {
> -		if (td->urb =3D=3D urb) {
> -			dev_vdbg(imx21->dev, "removing td %p\n", td);
> -			list_del(&td->list);
> -		}
> -	}
> -}
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -/* NON ISOC Handling ... 			*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -
> -static void schedule_nonisoc_etd(struct imx21 *imx21, struct urb *urb)
> -{
> -	unsigned int pipe =3D urb->pipe;
> -	struct urb_priv *urb_priv =3D urb->hcpriv;
> -	struct ep_priv *ep_priv =3D urb_priv->ep->hcpriv;
> -	int state =3D urb_priv->state;
> -	int etd_num =3D ep_priv->etd[0];
> -	struct etd_priv *etd;
> -	u32 count;
> -	u16 etd_buf_size;
> -	u16 maxpacket;
> -	u8 dir;
> -	u8 bufround;
> -	u8 datatoggle;
> -	u8 interval =3D 0;
> -	u8 relpolpos =3D 0;
> -
> -	if (etd_num < 0) {
> -		dev_err(imx21->dev, "No valid ETD\n");
> -		return;
> -	}
> -	if (readl(imx21->regs + USBH_ETDENSET) & (1 << etd_num))
> -		dev_err(imx21->dev, "submitting to active ETD %d\n", etd_num);
> -
> -	etd =3D &imx21->etd[etd_num];
> -	maxpacket =3D usb_maxpacket(urb->dev, pipe, usb_pipeout(pipe));
> -	if (!maxpacket)
> -		maxpacket =3D 8;
> -
> -	if (usb_pipecontrol(pipe) && (state !=3D US_CTRL_DATA)) {
> -		if (state =3D=3D US_CTRL_SETUP) {
> -			dir =3D TD_DIR_SETUP;
> -			if (unsuitable_for_dma(urb->setup_dma))
> -				usb_hcd_unmap_urb_setup_for_dma(imx21->hcd,
> -					urb);
> -			etd->dma_handle =3D urb->setup_dma;
> -			etd->cpu_buffer =3D urb->setup_packet;
> -			bufround =3D 0;
> -			count =3D 8;
> -			datatoggle =3D TD_TOGGLE_DATA0;
> -		} else {	/* US_CTRL_ACK */
> -			dir =3D usb_pipeout(pipe) ? TD_DIR_IN : TD_DIR_OUT;
> -			bufround =3D 0;
> -			count =3D 0;
> -			datatoggle =3D TD_TOGGLE_DATA1;
> -		}
> -	} else {
> -		dir =3D usb_pipeout(pipe) ? TD_DIR_OUT : TD_DIR_IN;
> -		bufround =3D (dir =3D=3D TD_DIR_IN) ? 1 : 0;
> -		if (unsuitable_for_dma(urb->transfer_dma))
> -			usb_hcd_unmap_urb_for_dma(imx21->hcd, urb);
> -
> -		etd->dma_handle =3D urb->transfer_dma;
> -		etd->cpu_buffer =3D urb->transfer_buffer;
> -		if (usb_pipebulk(pipe) && (state =3D=3D US_BULK0))
> -			count =3D 0;
> -		else
> -			count =3D urb->transfer_buffer_length;
> -
> -		if (usb_pipecontrol(pipe)) {
> -			datatoggle =3D TD_TOGGLE_DATA1;
> -		} else {
> -			if (usb_gettoggle(
> -					urb->dev,
> -					usb_pipeendpoint(urb->pipe),
> -					usb_pipeout(urb->pipe)))
> -				datatoggle =3D TD_TOGGLE_DATA1;
> -			else
> -				datatoggle =3D TD_TOGGLE_DATA0;
> -		}
> -	}
> -
> -	etd->urb =3D urb;
> -	etd->ep =3D urb_priv->ep;
> -	etd->len =3D count;
> -
> -	if (usb_pipeint(pipe)) {
> -		interval =3D urb->interval;
> -		relpolpos =3D (readl(imx21->regs + USBH_FRMNUB) + 1) & 0xff;
> -	}
> -
> -	/* Write ETD to device memory */
> -	setup_etd_dword0(imx21, etd_num, urb, dir, maxpacket);
> -
> -	etd_writel(imx21, etd_num, 2,
> -		(u32) interval << DW2_POLINTERV |
> -		((u32) relpolpos << DW2_RELPOLPOS) |
> -		((u32) dir << DW2_DIRPID) |
> -		((u32) bufround << DW2_BUFROUND) |
> -		((u32) datatoggle << DW2_DATATOG) |
> -		((u32) TD_NOTACCESSED << DW2_COMPCODE));
> -
> -	/* DMA will always transfer buffer size even if TOBYCNT in DWORD3
> -	   is smaller. Make sure we don't overrun the buffer!
> -	 */
> -	if (count && count < maxpacket)
> -		etd_buf_size =3D count;
> -	else
> -		etd_buf_size =3D maxpacket;
> -
> -	etd_writel(imx21, etd_num, 3,
> -		((u32) (etd_buf_size - 1) << DW3_BUFSIZE) | (u32) count);
> -
> -	if (!count)
> -		etd->dma_handle =3D 0;
> -
> -	/* allocate x and y buffer space at once */
> -	etd->dmem_size =3D (count > maxpacket) ? maxpacket * 2 : maxpacket;
> -	etd->dmem_offset =3D alloc_dmem(imx21, etd->dmem_size, urb_priv->ep);
> -	if (etd->dmem_offset < 0) {
> -		/* Setup everything we can in HW and update when we get DMEM */
> -		etd_writel(imx21, etd_num, 1, (u32)maxpacket << 16);
> -
> -		dev_dbg(imx21->dev, "Queuing etd %d for DMEM\n", etd_num);
> -		debug_urb_queued_for_dmem(imx21, urb);
> -		list_add_tail(&etd->queue, &imx21->queue_for_dmem);
> -		return;
> -	}
> -
> -	etd_writel(imx21, etd_num, 1,
> -		(((u32) etd->dmem_offset + (u32) maxpacket) << DW1_YBUFSRTAD) |
> -		(u32) etd->dmem_offset);
> -
> -	urb_priv->active =3D 1;
> -
> -	/* enable the ETD to kick off transfer */
> -	dev_vdbg(imx21->dev, "Activating etd %d for %d bytes %s\n",
> -		etd_num, count, dir !=3D TD_DIR_IN ? "out" : "in");
> -	activate_etd(imx21, etd_num, dir);
> -
> -}
> -
> -static void nonisoc_etd_done(struct usb_hcd *hcd, int etd_num)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	struct etd_priv *etd =3D &imx21->etd[etd_num];
> -	struct urb *urb =3D etd->urb;
> -	u32 etd_mask =3D 1 << etd_num;
> -	struct urb_priv *urb_priv =3D urb->hcpriv;
> -	int dir;
> -	int cc;
> -	u32 bytes_xfrd;
> -	int etd_done;
> -
> -	disactivate_etd(imx21, etd_num);
> -
> -	dir =3D (etd_readl(imx21, etd_num, 0) >> DW0_DIRECT) & 0x3;
> -	cc =3D (etd_readl(imx21, etd_num, 2) >> DW2_COMPCODE) & 0xf;
> -	bytes_xfrd =3D etd->len - (etd_readl(imx21, etd_num, 3) & 0x1fffff);
> -
> -	/* save toggle carry */
> -	usb_settoggle(urb->dev, usb_pipeendpoint(urb->pipe),
> -		      usb_pipeout(urb->pipe),
> -		      (etd_readl(imx21, etd_num, 0) >> DW0_TOGCRY) & 0x1);
> -
> -	if (dir =3D=3D TD_DIR_IN) {
> -		clear_toggle_bit(imx21, USBH_XFILLSTAT, etd_mask);
> -		clear_toggle_bit(imx21, USBH_YFILLSTAT, etd_mask);
> -
> -		if (etd->bounce_buffer) {
> -			memcpy(etd->cpu_buffer, etd->bounce_buffer, bytes_xfrd);
> -			dma_unmap_single(imx21->dev,
> -				etd->dma_handle, etd->len, DMA_FROM_DEVICE);
> -		} else if (!etd->dma_handle && bytes_xfrd) {/* PIO */
> -			memcpy_fromio(etd->cpu_buffer,
> -				imx21->regs + USBOTG_DMEM + etd->dmem_offset,
> -				bytes_xfrd);
> -		}
> -	}
> -
> -	kfree(etd->bounce_buffer);
> -	etd->bounce_buffer =3D NULL;
> -	free_dmem(imx21, etd);
> -
> -	urb->error_count =3D 0;
> -	if (!(urb->transfer_flags & URB_SHORT_NOT_OK)
> -			&& (cc =3D=3D TD_DATAUNDERRUN))
> -		cc =3D TD_CC_NOERROR;
> -
> -	if (cc !=3D 0)
> -		dev_vdbg(imx21->dev, "cc is 0x%x\n", cc);
> -
> -	etd_done =3D (cc_to_error[cc] !=3D 0);	/* stop if error */
> -
> -	switch (usb_pipetype(urb->pipe)) {
> -	case PIPE_CONTROL:
> -		switch (urb_priv->state) {
> -		case US_CTRL_SETUP:
> -			if (urb->transfer_buffer_length > 0)
> -				urb_priv->state =3D US_CTRL_DATA;
> -			else
> -				urb_priv->state =3D US_CTRL_ACK;
> -			break;
> -		case US_CTRL_DATA:
> -			urb->actual_length +=3D bytes_xfrd;
> -			urb_priv->state =3D US_CTRL_ACK;
> -			break;
> -		case US_CTRL_ACK:
> -			etd_done =3D 1;
> -			break;
> -		default:
> -			dev_err(imx21->dev,
> -				"Invalid pipe state %d\n", urb_priv->state);
> -			etd_done =3D 1;
> -			break;
> -		}
> -		break;
> -
> -	case PIPE_BULK:
> -		urb->actual_length +=3D bytes_xfrd;
> -		if ((urb_priv->state =3D=3D US_BULK)
> -		    && (urb->transfer_flags & URB_ZERO_PACKET)
> -		    && urb->transfer_buffer_length > 0
> -		    && ((urb->transfer_buffer_length %
> -			 usb_maxpacket(urb->dev, urb->pipe,
> -				       usb_pipeout(urb->pipe))) =3D=3D 0)) {
> -			/* need a 0-packet */
> -			urb_priv->state =3D US_BULK0;
> -		} else {
> -			etd_done =3D 1;
> -		}
> -		break;
> -
> -	case PIPE_INTERRUPT:
> -		urb->actual_length +=3D bytes_xfrd;
> -		etd_done =3D 1;
> -		break;
> -	}
> -
> -	if (etd_done)
> -		nonisoc_urb_completed_for_etd(imx21, etd, cc_to_error[cc]);
> -	else {
> -		dev_vdbg(imx21->dev, "next state=3D%d\n", urb_priv->state);
> -		schedule_nonisoc_etd(imx21, urb);
> -	}
> -}
> -
> -
> -static struct ep_priv *alloc_ep(void)
> -{
> -	int i;
> -	struct ep_priv *ep_priv;
> -
> -	ep_priv =3D kzalloc(sizeof(struct ep_priv), GFP_ATOMIC);
> -	if (!ep_priv)
> -		return NULL;
> -
> -	for (i =3D 0; i < NUM_ISO_ETDS; ++i)
> -		ep_priv->etd[i] =3D -1;
> -
> -	return ep_priv;
> -}
> -
> -static int imx21_hc_urb_enqueue(struct usb_hcd *hcd,
> -				struct urb *urb, gfp_t mem_flags)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	struct usb_host_endpoint *ep =3D urb->ep;
> -	struct urb_priv *urb_priv;
> -	struct ep_priv *ep_priv;
> -	struct etd_priv *etd;
> -	int ret;
> -	unsigned long flags;
> -
> -	dev_vdbg(imx21->dev,
> -		"enqueue urb=3D%p ep=3D%p len=3D%d "
> -		"buffer=3D%p dma=3D%pad setupBuf=3D%p setupDma=3D%pad\n",
> -		urb, ep,
> -		urb->transfer_buffer_length,
> -		urb->transfer_buffer, &urb->transfer_dma,
> -		urb->setup_packet, &urb->setup_dma);
> -
> -	if (usb_pipeisoc(urb->pipe))
> -		return imx21_hc_urb_enqueue_isoc(hcd, ep, urb, mem_flags);
> -
> -	urb_priv =3D kzalloc(sizeof(struct urb_priv), mem_flags);
> -	if (!urb_priv)
> -		return -ENOMEM;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	ep_priv =3D ep->hcpriv;
> -	if (ep_priv =3D=3D NULL) {
> -		ep_priv =3D alloc_ep();
> -		if (!ep_priv) {
> -			ret =3D -ENOMEM;
> -			goto failed_alloc_ep;
> -		}
> -		ep->hcpriv =3D ep_priv;
> -		ep_priv->ep =3D ep;
> -	}
> -
> -	ret =3D usb_hcd_link_urb_to_ep(hcd, urb);
> -	if (ret)
> -		goto failed_link;
> -
> -	urb->status =3D -EINPROGRESS;
> -	urb->actual_length =3D 0;
> -	urb->error_count =3D 0;
> -	urb->hcpriv =3D urb_priv;
> -	urb_priv->ep =3D ep;
> -
> -	switch (usb_pipetype(urb->pipe)) {
> -	case PIPE_CONTROL:
> -		urb_priv->state =3D US_CTRL_SETUP;
> -		break;
> -	case PIPE_BULK:
> -		urb_priv->state =3D US_BULK;
> -		break;
> -	}
> -
> -	debug_urb_submitted(imx21, urb);
> -	if (ep_priv->etd[0] < 0) {
> -		if (ep_priv->waiting_etd) {
> -			dev_dbg(imx21->dev,
> -				"no ETD available already queued %p\n",
> -				ep_priv);
> -			debug_urb_queued_for_etd(imx21, urb);
> -			goto out;
> -		}
> -		ep_priv->etd[0] =3D alloc_etd(imx21);
> -		if (ep_priv->etd[0] < 0) {
> -			dev_dbg(imx21->dev,
> -				"no ETD available queueing %p\n", ep_priv);
> -			debug_urb_queued_for_etd(imx21, urb);
> -			list_add_tail(&ep_priv->queue, &imx21->queue_for_etd);
> -			ep_priv->waiting_etd =3D 1;
> -			goto out;
> -		}
> -	}
> -
> -	/* Schedule if no URB already active for this endpoint */
> -	etd =3D &imx21->etd[ep_priv->etd[0]];
> -	if (etd->urb =3D=3D NULL) {
> -		DEBUG_LOG_FRAME(imx21, etd, last_req);
> -		schedule_nonisoc_etd(imx21, urb);
> -	}
> -
> -out:
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -	return 0;
> -
> -failed_link:
> -failed_alloc_ep:
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -	kfree(urb_priv);
> -	return ret;
> -}
> -
> -static int imx21_hc_urb_dequeue(struct usb_hcd *hcd, struct urb *urb,
> -				int status)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	unsigned long flags;
> -	struct usb_host_endpoint *ep;
> -	struct ep_priv *ep_priv;
> -	struct urb_priv *urb_priv =3D urb->hcpriv;
> -	int ret =3D -EINVAL;
> -
> -	dev_vdbg(imx21->dev, "dequeue urb=3D%p iso=3D%d status=3D%d\n",
> -		urb, usb_pipeisoc(urb->pipe), status);
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	ret =3D usb_hcd_check_unlink_urb(hcd, urb, status);
> -	if (ret)
> -		goto fail;
> -	ep =3D urb_priv->ep;
> -	ep_priv =3D ep->hcpriv;
> -
> -	debug_urb_unlinked(imx21, urb);
> -
> -	if (usb_pipeisoc(urb->pipe)) {
> -		dequeue_isoc_urb(imx21, urb, ep_priv);
> -		schedule_isoc_etds(hcd, ep);
> -	} else if (urb_priv->active) {
> -		int etd_num =3D ep_priv->etd[0];
> -		if (etd_num !=3D -1) {
> -			struct etd_priv *etd =3D &imx21->etd[etd_num];
> -
> -			disactivate_etd(imx21, etd_num);
> -			free_dmem(imx21, etd);
> -			etd->urb =3D NULL;
> -			kfree(etd->bounce_buffer);
> -			etd->bounce_buffer =3D NULL;
> -		}
> -	}
> -
> -	urb_done(hcd, urb, status);
> -
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -	return 0;
> -
> -fail:
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -	return ret;
> -}
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -/* Interrupt dispatch	 			*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -
> -static void process_etds(struct usb_hcd *hcd, struct imx21 *imx21, int s=
of)
> -{
> -	int etd_num;
> -	int enable_sof_int =3D 0;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	for (etd_num =3D 0; etd_num < USB_NUM_ETD; etd_num++) {
> -		u32 etd_mask =3D 1 << etd_num;
> -		u32 enabled =3D readl(imx21->regs + USBH_ETDENSET) & etd_mask;
> -		u32 done =3D readl(imx21->regs + USBH_ETDDONESTAT) & etd_mask;
> -		struct etd_priv *etd =3D &imx21->etd[etd_num];
> -
> -
> -		if (done) {
> -			DEBUG_LOG_FRAME(imx21, etd, last_int);
> -		} else {
> -/*
> - * Kludge warning!
> - *
> - * When multiple transfers are using the bus we sometimes get into a sta=
te
> - * where the transfer has completed (the CC field of the ETD is !=3D 0x0=
F),
> - * the ETD has self disabled but the ETDDONESTAT flag is not set
> - * (and hence no interrupt occurs).
> - * This causes the transfer in question to hang.
> - * The kludge below checks for this condition at each SOF and processes =
any
> - * blocked ETDs (after an arbitrary 10 frame wait)
> - *
> - * With a single active transfer the usbtest test suite will run for day=
s
> - * without the kludge.
> - * With other bus activity (eg mass storage) even just test1 will hang w=
ithout
> - * the kludge.
> - */
> -			u32 dword0;
> -			int cc;
> -
> -			if (etd->active_count && !enabled) /* suspicious... */
> -				enable_sof_int =3D 1;
> -
> -			if (!sof || enabled || !etd->active_count)
> -				continue;
> -
> -			cc =3D etd_readl(imx21, etd_num, 2) >> DW2_COMPCODE;
> -			if (cc =3D=3D TD_NOTACCESSED)
> -				continue;
> -
> -			if (++etd->active_count < 10)
> -				continue;
> -
> -			dword0 =3D etd_readl(imx21, etd_num, 0);
> -			dev_dbg(imx21->dev,
> -				"unblock ETD %d dev=3D0x%X ep=3D0x%X cc=3D0x%02X!\n",
> -				etd_num, dword0 & 0x7F,
> -				(dword0 >> DW0_ENDPNT) & 0x0F,
> -				cc);
> -
> -#ifdef DEBUG
> -			dev_dbg(imx21->dev,
> -				"frame: act=3D%d disact=3D%d"
> -				" int=3D%d req=3D%d cur=3D%d\n",
> -				etd->activated_frame,
> -				etd->disactivated_frame,
> -				etd->last_int_frame,
> -				etd->last_req_frame,
> -				readl(imx21->regs + USBH_FRMNUB));
> -			imx21->debug_unblocks++;
> -#endif
> -			etd->active_count =3D 0;
> -/* End of kludge */
> -		}
> -
> -		if (etd->ep =3D=3D NULL || etd->urb =3D=3D NULL) {
> -			dev_dbg(imx21->dev,
> -				"Interrupt for unexpected etd %d"
> -				" ep=3D%p urb=3D%p\n",
> -				etd_num, etd->ep, etd->urb);
> -			disactivate_etd(imx21, etd_num);
> -			continue;
> -		}
> -
> -		if (usb_pipeisoc(etd->urb->pipe))
> -			isoc_etd_done(hcd, etd_num);
> -		else
> -			nonisoc_etd_done(hcd, etd_num);
> -	}
> -
> -	/* only enable SOF interrupt if it may be needed for the kludge */
> -	if (enable_sof_int)
> -		set_register_bits(imx21, USBH_SYSIEN, USBH_SYSIEN_SOFINT);
> -	else
> -		clear_register_bits(imx21, USBH_SYSIEN, USBH_SYSIEN_SOFINT);
> -
> -
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -}
> -
> -static irqreturn_t imx21_irq(struct usb_hcd *hcd)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	u32 ints =3D readl(imx21->regs + USBH_SYSISR);
> -
> -	if (ints & USBH_SYSIEN_HERRINT)
> -		dev_dbg(imx21->dev, "Scheduling error\n");
> -
> -	if (ints & USBH_SYSIEN_SORINT)
> -		dev_dbg(imx21->dev, "Scheduling overrun\n");
> -
> -	if (ints & (USBH_SYSISR_DONEINT | USBH_SYSISR_SOFINT))
> -		process_etds(hcd, imx21, ints & USBH_SYSISR_SOFINT);
> -
> -	writel(ints, imx21->regs + USBH_SYSISR);
> -	return IRQ_HANDLED;
> -}
> -
> -static void imx21_hc_endpoint_disable(struct usb_hcd *hcd,
> -				      struct usb_host_endpoint *ep)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	unsigned long flags;
> -	struct ep_priv *ep_priv;
> -	int i;
> -
> -	if (ep =3D=3D NULL)
> -		return;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -	ep_priv =3D ep->hcpriv;
> -	dev_vdbg(imx21->dev, "disable ep=3D%p, ep->hcpriv=3D%p\n", ep, ep_priv)=
;
> -
> -	if (!list_empty(&ep->urb_list))
> -		dev_dbg(imx21->dev, "ep's URB list is not empty\n");
> -
> -	if (ep_priv !=3D NULL) {
> -		for (i =3D 0; i < NUM_ISO_ETDS; i++) {
> -			if (ep_priv->etd[i] > -1)
> -				dev_dbg(imx21->dev, "free etd %d for disable\n",
> -					ep_priv->etd[i]);
> -
> -			free_etd(imx21, ep_priv->etd[i]);
> -		}
> -		kfree(ep_priv);
> -		ep->hcpriv =3D NULL;
> -	}
> -
> -	for (i =3D 0; i < USB_NUM_ETD; i++) {
> -		if (imx21->etd[i].alloc && imx21->etd[i].ep =3D=3D ep) {
> -			dev_err(imx21->dev,
> -				"Active etd %d for disabled ep=3D%p!\n", i, ep);
> -			free_etd(imx21, i);
> -		}
> -	}
> -	free_epdmem(imx21, ep);
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -}
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -/* Hub handling		 			*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -
> -static int get_hub_descriptor(struct usb_hcd *hcd,
> -			      struct usb_hub_descriptor *desc)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	desc->bDescriptorType =3D USB_DT_HUB; /* HUB descriptor */
> -	desc->bHubContrCurrent =3D 0;
> -
> -	desc->bNbrPorts =3D readl(imx21->regs + USBH_ROOTHUBA)
> -		& USBH_ROOTHUBA_NDNSTMPRT_MASK;
> -	desc->bDescLength =3D 9;
> -	desc->bPwrOn2PwrGood =3D 0;
> -	desc->wHubCharacteristics =3D (__force __u16) cpu_to_le16(
> -		HUB_CHAR_NO_LPSM |	/* No power switching */
> -		HUB_CHAR_NO_OCPM);	/* No over current protection */
> -
> -	desc->u.hs.DeviceRemovable[0] =3D 1 << 1;
> -	desc->u.hs.DeviceRemovable[1] =3D ~0;
> -	return 0;
> -}
> -
> -static int imx21_hc_hub_status_data(struct usb_hcd *hcd, char *buf)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	int ports;
> -	int changed =3D 0;
> -	int i;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -	ports =3D readl(imx21->regs + USBH_ROOTHUBA)
> -		& USBH_ROOTHUBA_NDNSTMPRT_MASK;
> -	if (ports > 7) {
> -		ports =3D 7;
> -		dev_err(imx21->dev, "ports %d > 7\n", ports);
> -	}
> -	for (i =3D 0; i < ports; i++) {
> -		if (readl(imx21->regs + USBH_PORTSTAT(i)) &
> -			(USBH_PORTSTAT_CONNECTSC |
> -			USBH_PORTSTAT_PRTENBLSC |
> -			USBH_PORTSTAT_PRTSTATSC |
> -			USBH_PORTSTAT_OVRCURIC |
> -			USBH_PORTSTAT_PRTRSTSC)) {
> -
> -			changed =3D 1;
> -			buf[0] |=3D 1 << (i + 1);
> -		}
> -	}
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -
> -	if (changed)
> -		dev_info(imx21->dev, "Hub status changed\n");
> -	return changed;
> -}
> -
> -static int imx21_hc_hub_control(struct usb_hcd *hcd,
> -				u16 typeReq,
> -				u16 wValue, u16 wIndex, char *buf, u16 wLength)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	int rc =3D 0;
> -	u32 status_write =3D 0;
> -
> -	switch (typeReq) {
> -	case ClearHubFeature:
> -		dev_dbg(imx21->dev, "ClearHubFeature\n");
> -		switch (wValue) {
> -		case C_HUB_OVER_CURRENT:
> -			dev_dbg(imx21->dev, "    OVER_CURRENT\n");
> -			break;
> -		case C_HUB_LOCAL_POWER:
> -			dev_dbg(imx21->dev, "    LOCAL_POWER\n");
> -			break;
> -		default:
> -			dev_dbg(imx21->dev, "    unknown\n");
> -			rc =3D -EINVAL;
> -			break;
> -		}
> -		break;
> -
> -	case ClearPortFeature:
> -		dev_dbg(imx21->dev, "ClearPortFeature\n");
> -		switch (wValue) {
> -		case USB_PORT_FEAT_ENABLE:
> -			dev_dbg(imx21->dev, "    ENABLE\n");
> -			status_write =3D USBH_PORTSTAT_CURCONST;
> -			break;
> -		case USB_PORT_FEAT_SUSPEND:
> -			dev_dbg(imx21->dev, "    SUSPEND\n");
> -			status_write =3D USBH_PORTSTAT_PRTOVRCURI;
> -			break;
> -		case USB_PORT_FEAT_POWER:
> -			dev_dbg(imx21->dev, "    POWER\n");
> -			status_write =3D USBH_PORTSTAT_LSDEVCON;
> -			break;
> -		case USB_PORT_FEAT_C_ENABLE:
> -			dev_dbg(imx21->dev, "    C_ENABLE\n");
> -			status_write =3D USBH_PORTSTAT_PRTENBLSC;
> -			break;
> -		case USB_PORT_FEAT_C_SUSPEND:
> -			dev_dbg(imx21->dev, "    C_SUSPEND\n");
> -			status_write =3D USBH_PORTSTAT_PRTSTATSC;
> -			break;
> -		case USB_PORT_FEAT_C_CONNECTION:
> -			dev_dbg(imx21->dev, "    C_CONNECTION\n");
> -			status_write =3D USBH_PORTSTAT_CONNECTSC;
> -			break;
> -		case USB_PORT_FEAT_C_OVER_CURRENT:
> -			dev_dbg(imx21->dev, "    C_OVER_CURRENT\n");
> -			status_write =3D USBH_PORTSTAT_OVRCURIC;
> -			break;
> -		case USB_PORT_FEAT_C_RESET:
> -			dev_dbg(imx21->dev, "    C_RESET\n");
> -			status_write =3D USBH_PORTSTAT_PRTRSTSC;
> -			break;
> -		default:
> -			dev_dbg(imx21->dev, "    unknown\n");
> -			rc =3D -EINVAL;
> -			break;
> -		}
> -
> -		break;
> -
> -	case GetHubDescriptor:
> -		dev_dbg(imx21->dev, "GetHubDescriptor\n");
> -		rc =3D get_hub_descriptor(hcd, (void *)buf);
> -		break;
> -
> -	case GetHubStatus:
> -		dev_dbg(imx21->dev, "  GetHubStatus\n");
> -		*(__le32 *) buf =3D 0;
> -		break;
> -
> -	case GetPortStatus:
> -		dev_dbg(imx21->dev, "GetPortStatus: port: %d, 0x%x\n",
> -		    wIndex, USBH_PORTSTAT(wIndex - 1));
> -		*(__le32 *) buf =3D readl(imx21->regs +
> -			USBH_PORTSTAT(wIndex - 1));
> -		break;
> -
> -	case SetHubFeature:
> -		dev_dbg(imx21->dev, "SetHubFeature\n");
> -		switch (wValue) {
> -		case C_HUB_OVER_CURRENT:
> -			dev_dbg(imx21->dev, "    OVER_CURRENT\n");
> -			break;
> -
> -		case C_HUB_LOCAL_POWER:
> -			dev_dbg(imx21->dev, "    LOCAL_POWER\n");
> -			break;
> -		default:
> -			dev_dbg(imx21->dev, "    unknown\n");
> -			rc =3D -EINVAL;
> -			break;
> -		}
> -
> -		break;
> -
> -	case SetPortFeature:
> -		dev_dbg(imx21->dev, "SetPortFeature\n");
> -		switch (wValue) {
> -		case USB_PORT_FEAT_SUSPEND:
> -			dev_dbg(imx21->dev, "    SUSPEND\n");
> -			status_write =3D USBH_PORTSTAT_PRTSUSPST;
> -			break;
> -		case USB_PORT_FEAT_POWER:
> -			dev_dbg(imx21->dev, "    POWER\n");
> -			status_write =3D USBH_PORTSTAT_PRTPWRST;
> -			break;
> -		case USB_PORT_FEAT_RESET:
> -			dev_dbg(imx21->dev, "    RESET\n");
> -			status_write =3D USBH_PORTSTAT_PRTRSTST;
> -			break;
> -		default:
> -			dev_dbg(imx21->dev, "    unknown\n");
> -			rc =3D -EINVAL;
> -			break;
> -		}
> -		break;
> -
> -	default:
> -		dev_dbg(imx21->dev, "  unknown\n");
> -		rc =3D -EINVAL;
> -		break;
> -	}
> -
> -	if (status_write)
> -		writel(status_write, imx21->regs + USBH_PORTSTAT(wIndex - 1));
> -	return rc;
> -}
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -/* Host controller management 			*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -
> -static int imx21_hc_reset(struct usb_hcd *hcd)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	unsigned long timeout;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	/* Reset the Host controller modules */
> -	writel(USBOTG_RST_RSTCTRL | USBOTG_RST_RSTRH |
> -		USBOTG_RST_RSTHSIE | USBOTG_RST_RSTHC,
> -		imx21->regs + USBOTG_RST_CTRL);
> -
> -	/* Wait for reset to finish */
> -	timeout =3D jiffies + HZ;
> -	while (readl(imx21->regs + USBOTG_RST_CTRL) !=3D 0) {
> -		if (time_after(jiffies, timeout)) {
> -			spin_unlock_irqrestore(&imx21->lock, flags);
> -			dev_err(imx21->dev, "timeout waiting for reset\n");
> -			return -ETIMEDOUT;
> -		}
> -		spin_unlock_irq(&imx21->lock);
> -		schedule_timeout_uninterruptible(1);
> -		spin_lock_irq(&imx21->lock);
> -	}
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -	return 0;
> -}
> -
> -static int imx21_hc_start(struct usb_hcd *hcd)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	unsigned long flags;
> -	int i, j;
> -	u32 hw_mode =3D USBOTG_HWMODE_CRECFG_HOST;
> -	u32 usb_control =3D 0;
> -
> -	hw_mode |=3D ((imx21->pdata->host_xcvr << USBOTG_HWMODE_HOSTXCVR_SHIFT)=
 &
> -			USBOTG_HWMODE_HOSTXCVR_MASK);
> -	hw_mode |=3D ((imx21->pdata->otg_xcvr << USBOTG_HWMODE_OTGXCVR_SHIFT) &
> -			USBOTG_HWMODE_OTGXCVR_MASK);
> -
> -	if (imx21->pdata->host1_txenoe)
> -		usb_control |=3D USBCTRL_HOST1_TXEN_OE;
> -
> -	if (!imx21->pdata->host1_xcverless)
> -		usb_control |=3D USBCTRL_HOST1_BYP_TLL;
> -
> -	if (imx21->pdata->otg_ext_xcvr)
> -		usb_control |=3D USBCTRL_OTC_RCV_RXDP;
> -
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	writel((USBOTG_CLK_CTRL_HST | USBOTG_CLK_CTRL_MAIN),
> -		imx21->regs + USBOTG_CLK_CTRL);
> -	writel(hw_mode, imx21->regs + USBOTG_HWMODE);
> -	writel(usb_control, imx21->regs + USBCTRL);
> -	writel(USB_MISCCONTROL_SKPRTRY  | USB_MISCCONTROL_ARBMODE,
> -		imx21->regs + USB_MISCCONTROL);
> -
> -	/* Clear the ETDs */
> -	for (i =3D 0; i < USB_NUM_ETD; i++)
> -		for (j =3D 0; j < 4; j++)
> -			etd_writel(imx21, i, j, 0);
> -
> -	/* Take the HC out of reset */
> -	writel(USBH_HOST_CTRL_HCUSBSTE_OPERATIONAL | USBH_HOST_CTRL_CTLBLKSR_1,
> -		imx21->regs + USBH_HOST_CTRL);
> -
> -	/* Enable ports */
> -	if (imx21->pdata->enable_otg_host)
> -		writel(USBH_PORTSTAT_PRTPWRST | USBH_PORTSTAT_PRTENABST,
> -			imx21->regs + USBH_PORTSTAT(0));
> -
> -	if (imx21->pdata->enable_host1)
> -		writel(USBH_PORTSTAT_PRTPWRST | USBH_PORTSTAT_PRTENABST,
> -			imx21->regs + USBH_PORTSTAT(1));
> -
> -	if (imx21->pdata->enable_host2)
> -		writel(USBH_PORTSTAT_PRTPWRST | USBH_PORTSTAT_PRTENABST,
> -			imx21->regs + USBH_PORTSTAT(2));
> -
> -
> -	hcd->state =3D HC_STATE_RUNNING;
> -
> -	/* Enable host controller interrupts */
> -	set_register_bits(imx21, USBH_SYSIEN,
> -		USBH_SYSIEN_HERRINT |
> -		USBH_SYSIEN_DONEINT | USBH_SYSIEN_SORINT);
> -	set_register_bits(imx21, USBOTG_CINT_STEN, USBOTG_HCINT);
> -
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -
> -	return 0;
> -}
> -
> -static void imx21_hc_stop(struct usb_hcd *hcd)
> -{
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&imx21->lock, flags);
> -
> -	writel(0, imx21->regs + USBH_SYSIEN);
> -	clear_register_bits(imx21, USBOTG_CINT_STEN, USBOTG_HCINT);
> -	clear_register_bits(imx21, USBOTG_CLK_CTRL_HST | USBOTG_CLK_CTRL_MAIN,
> -					USBOTG_CLK_CTRL);
> -	spin_unlock_irqrestore(&imx21->lock, flags);
> -}
> -
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -/* Driver glue		 			*/
> -/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -
> -static const struct hc_driver imx21_hc_driver =3D {
> -	.description =3D hcd_name,
> -	.product_desc =3D "IMX21 USB Host Controller",
> -	.hcd_priv_size =3D sizeof(struct imx21),
> -
> -	.flags =3D HCD_DMA | HCD_USB11,
> -	.irq =3D imx21_irq,
> -
> -	.reset =3D imx21_hc_reset,
> -	.start =3D imx21_hc_start,
> -	.stop =3D imx21_hc_stop,
> -
> -	/* I/O requests */
> -	.urb_enqueue =3D imx21_hc_urb_enqueue,
> -	.urb_dequeue =3D imx21_hc_urb_dequeue,
> -	.endpoint_disable =3D imx21_hc_endpoint_disable,
> -
> -	/* scheduling support */
> -	.get_frame_number =3D imx21_hc_get_frame,
> -
> -	/* Root hub support */
> -	.hub_status_data =3D imx21_hc_hub_status_data,
> -	.hub_control =3D imx21_hc_hub_control,
> -
> -};
> -
> -static struct mx21_usbh_platform_data default_pdata =3D {
> -	.host_xcvr =3D MX21_USBXCVR_TXDIF_RXDIF,
> -	.otg_xcvr =3D MX21_USBXCVR_TXDIF_RXDIF,
> -	.enable_host1 =3D 1,
> -	.enable_host2 =3D 1,
> -	.enable_otg_host =3D 1,
> -
> -};
> -
> -static int imx21_remove(struct platform_device *pdev)
> -{
> -	struct usb_hcd *hcd =3D platform_get_drvdata(pdev);
> -	struct imx21 *imx21 =3D hcd_to_imx21(hcd);
> -	struct resource *res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0)=
;
> -
> -	remove_debug_files(imx21);
> -	usb_remove_hcd(hcd);
> -
> -	if (res !=3D NULL) {
> -		clk_disable_unprepare(imx21->clk);
> -		clk_put(imx21->clk);
> -		iounmap(imx21->regs);
> -		release_mem_region(res->start, resource_size(res));
> -	}
> -
> -	kfree(hcd);
> -	return 0;
> -}
> -
> -
> -static int imx21_probe(struct platform_device *pdev)
> -{
> -	struct usb_hcd *hcd;
> -	struct imx21 *imx21;
> -	struct resource *res;
> -	int ret;
> -	int irq;
> -
> -	printk(KERN_INFO "%s\n", imx21_hc_driver.product_desc);
> -
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENODEV;
> -	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
> -	hcd =3D usb_create_hcd(&imx21_hc_driver,
> -		&pdev->dev, dev_name(&pdev->dev));
> -	if (hcd =3D=3D NULL) {
> -		dev_err(&pdev->dev, "Cannot create hcd (%s)\n",
> -		    dev_name(&pdev->dev));
> -		return -ENOMEM;
> -	}
> -
> -	imx21 =3D hcd_to_imx21(hcd);
> -	imx21->hcd =3D hcd;
> -	imx21->dev =3D &pdev->dev;
> -	imx21->pdata =3D dev_get_platdata(&pdev->dev);
> -	if (!imx21->pdata)
> -		imx21->pdata =3D &default_pdata;
> -
> -	spin_lock_init(&imx21->lock);
> -	INIT_LIST_HEAD(&imx21->dmem_list);
> -	INIT_LIST_HEAD(&imx21->queue_for_etd);
> -	INIT_LIST_HEAD(&imx21->queue_for_dmem);
> -	create_debug_files(imx21);
> -
> -	res =3D request_mem_region(res->start, resource_size(res), hcd_name);
> -	if (!res) {
> -		ret =3D -EBUSY;
> -		goto failed_request_mem;
> -	}
> -
> -	imx21->regs =3D ioremap(res->start, resource_size(res));
> -	if (imx21->regs =3D=3D NULL) {
> -		dev_err(imx21->dev, "Cannot map registers\n");
> -		ret =3D -ENOMEM;
> -		goto failed_ioremap;
> -	}
> -
> -	/* Enable clocks source */
> -	imx21->clk =3D clk_get(imx21->dev, NULL);
> -	if (IS_ERR(imx21->clk)) {
> -		dev_err(imx21->dev, "no clock found\n");
> -		ret =3D PTR_ERR(imx21->clk);
> -		goto failed_clock_get;
> -	}
> -
> -	ret =3D clk_set_rate(imx21->clk, clk_round_rate(imx21->clk, 48000000));
> -	if (ret)
> -		goto failed_clock_set;
> -	ret =3D clk_prepare_enable(imx21->clk);
> -	if (ret)
> -		goto failed_clock_enable;
> -
> -	dev_info(imx21->dev, "Hardware HC revision: 0x%02X\n",
> -		(readl(imx21->regs + USBOTG_HWMODE) >> 16) & 0xFF);
> -
> -	ret =3D usb_add_hcd(hcd, irq, 0);
> -	if (ret !=3D 0) {
> -		dev_err(imx21->dev, "usb_add_hcd() returned %d\n", ret);
> -		goto failed_add_hcd;
> -	}
> -	device_wakeup_enable(hcd->self.controller);
> -
> -	return 0;
> -
> -failed_add_hcd:
> -	clk_disable_unprepare(imx21->clk);
> -failed_clock_enable:
> -failed_clock_set:
> -	clk_put(imx21->clk);
> -failed_clock_get:
> -	iounmap(imx21->regs);
> -failed_ioremap:
> -	release_mem_region(res->start, resource_size(res));
> -failed_request_mem:
> -	remove_debug_files(imx21);
> -	usb_put_hcd(hcd);
> -	return ret;
> -}
> -
> -static struct platform_driver imx21_hcd_driver =3D {
> -	.driver =3D {
> -		   .name =3D hcd_name,
> -		   },
> -	.probe =3D imx21_probe,
> -	.remove =3D imx21_remove,
> -	.suspend =3D NULL,
> -	.resume =3D NULL,
> -};
> -
> -module_platform_driver(imx21_hcd_driver);
> -
> -MODULE_DESCRIPTION("i.MX21 USB Host controller");
> -MODULE_AUTHOR("Martin Fuzzey");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:imx21-hcd");
> diff --git a/drivers/usb/host/imx21-hcd.h b/drivers/usb/host/imx21-hcd.h
> deleted file mode 100644
> index 96d16752a73e..000000000000
> --- a/drivers/usb/host/imx21-hcd.h
> +++ /dev/null
> @@ -1,431 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> -/*
> - * Macros and prototypes for i.MX21
> - *
> - * Copyright (C) 2006 Loping Dog Embedded Systems
> - * Copyright (C) 2009 Martin Fuzzey
> - * Originally written by Jay Monkman <jtm@lopingdog.com>
> - * Ported to 2.6.30, debugged and enhanced by Martin Fuzzey
> - */
> -
> -#ifndef __LINUX_IMX21_HCD_H__
> -#define __LINUX_IMX21_HCD_H__
> -
> -#ifdef CONFIG_DYNAMIC_DEBUG
> -#define DEBUG
> -#endif
> -
> -#include <linux/platform_data/usb-mx2.h>
> -
> -#define NUM_ISO_ETDS 	2
> -#define USB_NUM_ETD	32
> -#define DMEM_SIZE   	4096
> -
> -/* Register definitions */
> -#define USBOTG_HWMODE		0x00
> -#define USBOTG_HWMODE_ANASDBEN		(1 << 14)
> -#define USBOTG_HWMODE_OTGXCVR_SHIFT	6
> -#define USBOTG_HWMODE_OTGXCVR_MASK	(3 << 6)
> -#define USBOTG_HWMODE_OTGXCVR_TD_RD	(0 << 6)
> -#define USBOTG_HWMODE_OTGXCVR_TS_RD	(2 << 6)
> -#define USBOTG_HWMODE_OTGXCVR_TD_RS	(1 << 6)
> -#define USBOTG_HWMODE_OTGXCVR_TS_RS	(3 << 6)
> -#define USBOTG_HWMODE_HOSTXCVR_SHIFT	4
> -#define USBOTG_HWMODE_HOSTXCVR_MASK	(3 << 4)
> -#define USBOTG_HWMODE_HOSTXCVR_TD_RD	(0 << 4)
> -#define USBOTG_HWMODE_HOSTXCVR_TS_RD	(2 << 4)
> -#define USBOTG_HWMODE_HOSTXCVR_TD_RS	(1 << 4)
> -#define USBOTG_HWMODE_HOSTXCVR_TS_RS	(3 << 4)
> -#define USBOTG_HWMODE_CRECFG_MASK	(3 << 0)
> -#define USBOTG_HWMODE_CRECFG_HOST	(1 << 0)
> -#define USBOTG_HWMODE_CRECFG_FUNC	(2 << 0)
> -#define USBOTG_HWMODE_CRECFG_HNP	(3 << 0)
> -
> -#define USBOTG_CINT_STAT	0x04
> -#define USBOTG_CINT_STEN	0x08
> -#define USBOTG_ASHNPINT			(1 << 5)
> -#define USBOTG_ASFCINT			(1 << 4)
> -#define USBOTG_ASHCINT			(1 << 3)
> -#define USBOTG_SHNPINT			(1 << 2)
> -#define USBOTG_FCINT			(1 << 1)
> -#define USBOTG_HCINT			(1 << 0)
> -
> -#define USBOTG_CLK_CTRL		0x0c
> -#define USBOTG_CLK_CTRL_FUNC		(1 << 2)
> -#define USBOTG_CLK_CTRL_HST		(1 << 1)
> -#define USBOTG_CLK_CTRL_MAIN		(1 << 0)
> -
> -#define USBOTG_RST_CTRL		0x10
> -#define USBOTG_RST_RSTI2C		(1 << 15)
> -#define USBOTG_RST_RSTCTRL		(1 << 5)
> -#define USBOTG_RST_RSTFC		(1 << 4)
> -#define USBOTG_RST_RSTFSKE		(1 << 3)
> -#define USBOTG_RST_RSTRH		(1 << 2)
> -#define USBOTG_RST_RSTHSIE		(1 << 1)
> -#define USBOTG_RST_RSTHC		(1 << 0)
> -
> -#define USBOTG_FRM_INTVL    	0x14
> -#define USBOTG_FRM_REMAIN   	0x18
> -#define USBOTG_HNP_CSR	    	0x1c
> -#define USBOTG_HNP_ISR	    	0x2c
> -#define USBOTG_HNP_IEN	    	0x30
> -
> -#define USBOTG_I2C_TXCVR_REG(x)	(0x100 + (x))
> -#define USBOTG_I2C_XCVR_DEVAD		0x118
> -#define USBOTG_I2C_SEQ_OP_REG		0x119
> -#define USBOTG_I2C_SEQ_RD_STARTAD	0x11a
> -#define USBOTG_I2C_OP_CTRL_REG	     	0x11b
> -#define USBOTG_I2C_SCLK_TO_SCK_HPER  	0x11e
> -#define USBOTG_I2C_MASTER_INT_REG    	0x11f
> -
> -#define USBH_HOST_CTRL		0x80
> -#define USBH_HOST_CTRL_HCRESET			(1 << 31)
> -#define USBH_HOST_CTRL_SCHDOVR(x)		((x) << 16)
> -#define USBH_HOST_CTRL_RMTWUEN			(1 << 4)
> -#define USBH_HOST_CTRL_HCUSBSTE_RESET		(0 << 2)
> -#define USBH_HOST_CTRL_HCUSBSTE_RESUME		(1 << 2)
> -#define USBH_HOST_CTRL_HCUSBSTE_OPERATIONAL	(2 << 2)
> -#define USBH_HOST_CTRL_HCUSBSTE_SUSPEND	(3 << 2)
> -#define USBH_HOST_CTRL_CTLBLKSR_1		(0 << 0)
> -#define USBH_HOST_CTRL_CTLBLKSR_2		(1 << 0)
> -#define USBH_HOST_CTRL_CTLBLKSR_3		(2 << 0)
> -#define USBH_HOST_CTRL_CTLBLKSR_4		(3 << 0)
> -
> -#define USBH_SYSISR		0x88
> -#define USBH_SYSISR_PSCINT		(1 << 6)
> -#define USBH_SYSISR_FMOFINT		(1 << 5)
> -#define USBH_SYSISR_HERRINT		(1 << 4)
> -#define USBH_SYSISR_RESDETINT		(1 << 3)
> -#define USBH_SYSISR_SOFINT		(1 << 2)
> -#define USBH_SYSISR_DONEINT		(1 << 1)
> -#define USBH_SYSISR_SORINT		(1 << 0)
> -
> -#define USBH_SYSIEN	    	0x8c
> -#define USBH_SYSIEN_PSCINT		(1 << 6)
> -#define USBH_SYSIEN_FMOFINT		(1 << 5)
> -#define USBH_SYSIEN_HERRINT		(1 << 4)
> -#define USBH_SYSIEN_RESDETINT		(1 << 3)
> -#define USBH_SYSIEN_SOFINT		(1 << 2)
> -#define USBH_SYSIEN_DONEINT		(1 << 1)
> -#define USBH_SYSIEN_SORINT		(1 << 0)
> -
> -#define USBH_XBUFSTAT	    	0x98
> -#define USBH_YBUFSTAT	    	0x9c
> -#define USBH_XYINTEN	    	0xa0
> -#define USBH_XFILLSTAT	    	0xa8
> -#define USBH_YFILLSTAT	    	0xac
> -#define USBH_ETDENSET	    	0xc0
> -#define USBH_ETDENCLR	    	0xc4
> -#define USBH_IMMEDINT	    	0xcc
> -#define USBH_ETDDONESTAT    	0xd0
> -#define USBH_ETDDONEEN	    	0xd4
> -#define USBH_FRMNUB	    	0xe0
> -#define USBH_LSTHRESH	    	0xe4
> -
> -#define USBH_ROOTHUBA	    	0xe8
> -#define USBH_ROOTHUBA_PWRTOGOOD_MASK	(0xff)
> -#define USBH_ROOTHUBA_PWRTOGOOD_SHIFT	(24)
> -#define USBH_ROOTHUBA_NOOVRCURP	(1 << 12)
> -#define USBH_ROOTHUBA_OVRCURPM		(1 << 11)
> -#define USBH_ROOTHUBA_DEVTYPE		(1 << 10)
> -#define USBH_ROOTHUBA_PWRSWTMD		(1 << 9)
> -#define USBH_ROOTHUBA_NOPWRSWT		(1 << 8)
> -#define USBH_ROOTHUBA_NDNSTMPRT_MASK	(0xff)
> -
> -#define USBH_ROOTHUBB		0xec
> -#define USBH_ROOTHUBB_PRTPWRCM(x)	(1 << ((x) + 16))
> -#define USBH_ROOTHUBB_DEVREMOVE(x)	(1 << (x))
> -
> -#define USBH_ROOTSTAT		0xf0
> -#define USBH_ROOTSTAT_CLRRMTWUE	(1 << 31)
> -#define USBH_ROOTSTAT_OVRCURCHG	(1 << 17)
> -#define USBH_ROOTSTAT_DEVCONWUE	(1 << 15)
> -#define USBH_ROOTSTAT_OVRCURI		(1 << 1)
> -#define USBH_ROOTSTAT_LOCPWRS		(1 << 0)
> -
> -#define USBH_PORTSTAT(x)	(0xf4 + ((x) * 4))
> -#define USBH_PORTSTAT_PRTRSTSC		(1 << 20)
> -#define USBH_PORTSTAT_OVRCURIC		(1 << 19)
> -#define USBH_PORTSTAT_PRTSTATSC	(1 << 18)
> -#define USBH_PORTSTAT_PRTENBLSC	(1 << 17)
> -#define USBH_PORTSTAT_CONNECTSC	(1 << 16)
> -#define USBH_PORTSTAT_LSDEVCON		(1 << 9)
> -#define USBH_PORTSTAT_PRTPWRST		(1 << 8)
> -#define USBH_PORTSTAT_PRTRSTST		(1 << 4)
> -#define USBH_PORTSTAT_PRTOVRCURI	(1 << 3)
> -#define USBH_PORTSTAT_PRTSUSPST	(1 << 2)
> -#define USBH_PORTSTAT_PRTENABST	(1 << 1)
> -#define USBH_PORTSTAT_CURCONST		(1 << 0)
> -
> -#define USB_DMAREV		0x800
> -#define USB_DMAINTSTAT	    	0x804
> -#define USB_DMAINTSTAT_EPERR		(1 << 1)
> -#define USB_DMAINTSTAT_ETDERR		(1 << 0)
> -
> -#define USB_DMAINTEN	    	0x808
> -#define USB_DMAINTEN_EPERRINTEN	(1 << 1)
> -#define USB_DMAINTEN_ETDERRINTEN	(1 << 0)
> -
> -#define USB_ETDDMAERSTAT    	0x80c
> -#define USB_EPDMAERSTAT	    	0x810
> -#define USB_ETDDMAEN	    	0x820
> -#define USB_EPDMAEN	    	0x824
> -#define USB_ETDDMAXTEN	    	0x828
> -#define USB_EPDMAXTEN	    	0x82c
> -#define USB_ETDDMAENXYT	    	0x830
> -#define USB_EPDMAENXYT	    	0x834
> -#define USB_ETDDMABST4EN    	0x838
> -#define USB_EPDMABST4EN	    	0x83c
> -
> -#define USB_MISCCONTROL	    	0x840
> -#define USB_MISCCONTROL_ISOPREVFRM	(1 << 3)
> -#define USB_MISCCONTROL_SKPRTRY	(1 << 2)
> -#define USB_MISCCONTROL_ARBMODE	(1 << 1)
> -#define USB_MISCCONTROL_FILTCC		(1 << 0)
> -
> -#define USB_ETDDMACHANLCLR  	0x848
> -#define USB_EPDMACHANLCLR   	0x84c
> -#define USB_ETDSMSA(x)	    	(0x900 + ((x) * 4))
> -#define USB_EPSMSA(x)	    	(0x980 + ((x) * 4))
> -#define USB_ETDDMABUFPTR(x) 	(0xa00 + ((x) * 4))
> -#define USB_EPDMABUFPTR(x)  	(0xa80 + ((x) * 4))
> -
> -#define USB_ETD_DWORD(x, w)	(0x200 + ((x) * 16) + ((w) * 4))
> -#define DW0_ADDRESS	0
> -#define	DW0_ENDPNT	7
> -#define	DW0_DIRECT	11
> -#define	DW0_SPEED	13
> -#define DW0_FORMAT	14
> -#define DW0_MAXPKTSIZ	16
> -#define DW0_HALTED	27
> -#define	DW0_TOGCRY	28
> -#define	DW0_SNDNAK	30
> -
> -#define DW1_XBUFSRTAD	0
> -#define DW1_YBUFSRTAD	16
> -
> -#define DW2_RTRYDELAY	0
> -#define DW2_POLINTERV	0
> -#define DW2_STARTFRM	0
> -#define DW2_RELPOLPOS	8
> -#define DW2_DIRPID	16
> -#define	DW2_BUFROUND	18
> -#define DW2_DELAYINT	19
> -#define DW2_DATATOG	22
> -#define DW2_ERRORCNT	24
> -#define	DW2_COMPCODE	28
> -
> -#define DW3_TOTBYECNT	0
> -#define DW3_PKTLEN0	0
> -#define DW3_COMPCODE0	12
> -#define DW3_PKTLEN1	16
> -#define DW3_BUFSIZE	21
> -#define DW3_COMPCODE1	28
> -
> -#define USBCTRL		    	0x600
> -#define USBCTRL_I2C_WU_INT_STAT	(1 << 27)
> -#define USBCTRL_OTG_WU_INT_STAT	(1 << 26)
> -#define USBCTRL_HOST_WU_INT_STAT	(1 << 25)
> -#define USBCTRL_FNT_WU_INT_STAT	(1 << 24)
> -#define USBCTRL_I2C_WU_INT_EN		(1 << 19)
> -#define USBCTRL_OTG_WU_INT_EN		(1 << 18)
> -#define USBCTRL_HOST_WU_INT_EN		(1 << 17)
> -#define USBCTRL_FNT_WU_INT_EN		(1 << 16)
> -#define USBCTRL_OTC_RCV_RXDP		(1 << 13)
> -#define USBCTRL_HOST1_BYP_TLL		(1 << 12)
> -#define USBCTRL_OTG_BYP_VAL(x)		((x) << 10)
> -#define USBCTRL_HOST1_BYP_VAL(x)	((x) << 8)
> -#define USBCTRL_OTG_PWR_MASK		(1 << 6)
> -#define USBCTRL_HOST1_PWR_MASK		(1 << 5)
> -#define USBCTRL_HOST2_PWR_MASK		(1 << 4)
> -#define USBCTRL_USB_BYP			(1 << 2)
> -#define USBCTRL_HOST1_TXEN_OE		(1 << 1)
> -
> -#define USBOTG_DMEM		0x1000
> -
> -/* Values in TD blocks */
> -#define TD_DIR_SETUP	    0
> -#define TD_DIR_OUT	    1
> -#define TD_DIR_IN	    2
> -#define TD_FORMAT_CONTROL   0
> -#define TD_FORMAT_ISO	    1
> -#define TD_FORMAT_BULK	    2
> -#define TD_FORMAT_INT	    3
> -#define TD_TOGGLE_CARRY	    0
> -#define TD_TOGGLE_DATA0	    2
> -#define TD_TOGGLE_DATA1	    3
> -
> -/* control transfer states */
> -#define US_CTRL_SETUP	2
> -#define US_CTRL_DATA	1
> -#define US_CTRL_ACK	0
> -
> -/* bulk transfer main state and 0-length packet */
> -#define US_BULK		1
> -#define US_BULK0	0
> -
> -/*ETD format description*/
> -#define IMX_FMT_CTRL   0x0
> -#define IMX_FMT_ISO    0x1
> -#define IMX_FMT_BULK   0x2
> -#define IMX_FMT_INT    0x3
> -
> -static char fmt_urb_to_etd[4] =3D {
> -/*PIPE_ISOCHRONOUS*/ IMX_FMT_ISO,
> -/*PIPE_INTERRUPT*/ IMX_FMT_INT,
> -/*PIPE_CONTROL*/ IMX_FMT_CTRL,
> -/*PIPE_BULK*/ IMX_FMT_BULK
> -};
> -
> -/* condition (error) CC codes and mapping (OHCI like) */
> -
> -#define TD_CC_NOERROR		0x00
> -#define TD_CC_CRC		0x01
> -#define TD_CC_BITSTUFFING	0x02
> -#define TD_CC_DATATOGGLEM	0x03
> -#define TD_CC_STALL		0x04
> -#define TD_DEVNOTRESP		0x05
> -#define TD_PIDCHECKFAIL		0x06
> -/*#define TD_UNEXPECTEDPID	0x07 - reserved, not active on MX2*/
> -#define TD_DATAOVERRUN		0x08
> -#define TD_DATAUNDERRUN		0x09
> -#define TD_BUFFEROVERRUN	0x0C
> -#define TD_BUFFERUNDERRUN	0x0D
> -#define	TD_SCHEDULEOVERRUN	0x0E
> -#define TD_NOTACCESSED		0x0F
> -
> -static const int cc_to_error[16] =3D {
> -	/* No  Error  */ 0,
> -	/* CRC Error  */ -EILSEQ,
> -	/* Bit Stuff  */ -EPROTO,
> -	/* Data Togg  */ -EILSEQ,
> -	/* Stall      */ -EPIPE,
> -	/* DevNotResp */ -ETIMEDOUT,
> -	/* PIDCheck   */ -EPROTO,
> -	/* UnExpPID   */ -EPROTO,
> -	/* DataOver   */ -EOVERFLOW,
> -	/* DataUnder  */ -EREMOTEIO,
> -	/* (for hw)   */ -EIO,
> -	/* (for hw)   */ -EIO,
> -	/* BufferOver */ -ECOMM,
> -	/* BuffUnder  */ -ENOSR,
> -	/* (for HCD)  */ -ENOSPC,
> -	/* (for HCD)  */ -EALREADY
> -};
> -
> -/* HCD data associated with a usb core URB */
> -struct urb_priv {
> -	struct urb *urb;
> -	struct usb_host_endpoint *ep;
> -	int active;
> -	int state;
> -	struct td *isoc_td;
> -	int isoc_remaining;
> -	int isoc_status;
> -};
> -
> -/* HCD data associated with a usb core endpoint */
> -struct ep_priv {
> -	struct usb_host_endpoint *ep;
> -	struct list_head td_list;
> -	struct list_head queue;
> -	int etd[NUM_ISO_ETDS];
> -	int waiting_etd;
> -};
> -
> -/* isoc packet */
> -struct td {
> -	struct list_head list;
> -	struct urb *urb;
> -	struct usb_host_endpoint *ep;
> -	dma_addr_t dma_handle;
> -	void *cpu_buffer;
> -	int len;
> -	int frame;
> -	int isoc_index;
> -};
> -
> -/* HCD data associated with a hardware ETD */
> -struct etd_priv {
> -	struct usb_host_endpoint *ep;
> -	struct urb *urb;
> -	struct td *td;
> -	struct list_head queue;
> -	dma_addr_t dma_handle;
> -	void *cpu_buffer;
> -	void *bounce_buffer;
> -	int alloc;
> -	int len;
> -	int dmem_size;
> -	int dmem_offset;
> -	int active_count;
> -#ifdef DEBUG
> -	int activated_frame;
> -	int disactivated_frame;
> -	int last_int_frame;
> -	int last_req_frame;
> -	u32 submitted_dwords[4];
> -#endif
> -};
> -
> -/* Hardware data memory info */
> -struct imx21_dmem_area {
> -	struct usb_host_endpoint *ep;
> -	unsigned int offset;
> -	unsigned int size;
> -	struct list_head list;
> -};
> -
> -#ifdef DEBUG
> -struct debug_usage_stats {
> -	unsigned int value;
> -	unsigned int maximum;
> -};
> -
> -struct debug_stats {
> -	unsigned long submitted;
> -	unsigned long completed_ok;
> -	unsigned long completed_failed;
> -	unsigned long unlinked;
> -	unsigned long queue_etd;
> -	unsigned long queue_dmem;
> -};
> -
> -struct debug_isoc_trace {
> -	int schedule_frame;
> -	int submit_frame;
> -	int request_len;
> -	int done_frame;
> -	int done_len;
> -	int cc;
> -	struct td *td;
> -};
> -#endif
> -
> -/* HCD data structure */
> -struct imx21 {
> -	spinlock_t lock;
> -	struct device *dev;
> -	struct usb_hcd *hcd;
> -	struct mx21_usbh_platform_data *pdata;
> -	struct list_head dmem_list;
> -	struct list_head queue_for_etd; /* eps queued due to etd shortage */
> -	struct list_head queue_for_dmem; /* etds queued due to dmem shortage */
> -	struct etd_priv etd[USB_NUM_ETD];
> -	struct clk *clk;
> -	void __iomem *regs;
> -#ifdef DEBUG
> -	struct dentry *debug_root;
> -	struct debug_stats nonisoc_stats;
> -	struct debug_stats isoc_stats;
> -	struct debug_usage_stats etd_usage;
> -	struct debug_usage_stats dmem_usage;
> -	struct debug_isoc_trace isoc_trace[20];
> -	struct debug_isoc_trace isoc_trace_failed[20];
> -	unsigned long debug_unblocks;
> -	int isoc_trace_index;
> -	int isoc_trace_index_failed;
> -#endif
> -};
> -
> -#endif
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
