Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D337A471EC3
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 00:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhLLX1Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Dec 2021 18:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhLLX1Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Dec 2021 18:27:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A939C06173F
        for <linux-usb@vger.kernel.org>; Sun, 12 Dec 2021 15:27:23 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mwYFU-0002ec-LP; Mon, 13 Dec 2021 00:27:20 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mwYFT-0004nK-Oi; Mon, 13 Dec 2021 00:27:19 +0100
Date:   Mon, 13 Dec 2021 00:27:19 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH v5 7/7] usb: gadget: uvc: add format/frame handling code
Message-ID: <20211212232719.GA3912@pengutronix.de>
References: <20211209084322.2662616-1-m.grzeschik@pengutronix.de>
 <20211209084322.2662616-8-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20211209084322.2662616-8-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 00:22:43 up 2 days,  8:08, 16 users,  load average: 0.14, 0.13, 0.10
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ping

On Thu, Dec 09, 2021 at 09:43:22AM +0100, Michael Grzeschik wrote:
>The Hostside format selection is currently only done in userspace, as
>the events for SET_CUR and GET_CUR are allways moved to the application
>layer. Since the v4l2 device parses the configfs data, the format
>negotiation can be done in the kernel. This patch adds the functions to
>set the current configuration while continuing to forward all unknown
>events to the userspace level.
>
>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>---
>v1 -> v2:
>   - fixed the commit message
>   - changed pr_debug to pr_err in events_process_data
>   - aligned many indentations
>   - simplified uvc_events_process_data
>   - fixed uvc_fill_streaming_control calls in uvcg_video_init
>   - added setup_subcribed to decide if userspace takes over on EOPNOTSUPP
>   - added data_subscribed to decide if userspace takes over on EOPNOTSUPP
>   - removed duplicate send_response
>   - wrting fmt and frm in full
>v2 -> v3:
>   - added find_format_index to set the right probe
>v3 -> v4:
>   - add function find_ival_index and use for cur_ival
>   - fix swapped frame and format in uvc_events_process_data on uvc_fill_s=
treaming_control
>   - set proper resp.length on ep0 complete
>   - dropped setting cur_probe on set_format since function was removed
>   - added locking around getting correspondent cur_{frame,format,ival}
>v4 -> v5:
>   - fixed sparse errors reported by kernel test robot
>
> drivers/usb/gadget/function/f_uvc.c     | 234 +++++++++++++++++++++++-
> drivers/usb/gadget/function/uvc.h       |  19 ++
> drivers/usb/gadget/function/uvc_v4l2.c  |  66 ++++++-
> drivers/usb/gadget/function/uvc_video.c |  12 +-
> 4 files changed, 324 insertions(+), 7 deletions(-)
>

[snip]

> static void
> uvc_function_ep0_complete(struct usb_ep *ep, struct usb_request *req)
> {
> 	struct uvc_device *uvc =3D req->context;
> 	struct v4l2_event v4l2_event;
> 	struct uvc_event *uvc_event =3D (void *)&v4l2_event.u.data;
>+	struct uvc_request_data resp;
>+	int ret;
>
> 	if (uvc->event_setup_out) {
> 		uvc->event_setup_out =3D 0;
>
>+		memset(&resp, 0, sizeof(resp));
>+		resp.length =3D -EL2HLT;
>+
>+		ret =3D uvc_events_process_data(uvc, req);
>+		/* If we have no error on process */
>+		if (!ret) {
>+			resp.length =3D req->length;
>+			uvc_send_response(uvc, &resp);
>+			return;

I just found out, that depending on the host implementation, sending a
response persisting probe or commit is no valid. I will just keep it
aligned with the uvc-gadget implementation and fix it not to send any
response in that both cases.

>+		}
>+
>+		/* If we have a real error on process */
>+		if (ret !=3D -EOPNOTSUPP)
>+			return;
>+
>+		/* If we have -EOPNOTSUPP */
>+		if (!uvc->data_subscribed)
>+			return;
>+
>+		/* If we have data subscribed */
> 		memset(&v4l2_event, 0, sizeof(v4l2_event));
> 		v4l2_event.type =3D UVC_EVENT_DATA;
> 		uvc_event->data.length =3D req->actual;

Beside that, I hope somebody would help reviewing this, before I will
send v6.

Laurant? Do you have any thoughts on that whole stack?

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmG2hVMACgkQC+njFXoe
LGSMug//UlXaEhwG7VfccXZ7ZnAYeZ7n7u4Z0c7jswMFBZfeiImAx47tugo9YBKk
oD3sXczlSE4SmvyQ1Kzb7uyT6+zj++qfw7nC53Ztc8nOoaGQSZk70ms/RmonMt7Z
4V/KbCX/54lm8VqMzHaZPveTdUZ7jyuGc432FWqupr/fTXS1KdBxeDipZPJDbPQx
3QB4bFq4scnCfviP77KuiARbo4v/haJrHKVPQ1LKjzM/s9fsVaRzQhlbxiqjzodU
YipDPnFCUK/zE/2TVr3ceOOyENBA69qgewM8holoFuKr8VB2kyclK3DRwyHVVhhv
0nNV4crz74LWZlZOPjCJcQ1Gu02IKTZh34JEaSSRQJR9TlYC6WHlCnPBGzlrhcBp
8KWR5g0vzev035lhDZWTNrGhQYWE+8Tp/sjFr2UNXItyZDr/MIgqawXe+5xedu1P
zjWrd0CIZGad+68PsER33jI8ihtJd0ElcBGsySYkOE310d64R0GoEVWTA+bwZ6QM
uqrznQRYHpw0M/9AHebfSyMU+erQ6vOcZZp8AXqeY/OKZG20wjETDEqvG88aS52J
GwmHwQlDJsrfDLvuej40HnF8TkIPx9kpfKGSsxL0bHJ0bYyWiMGeChIGNmDEfx16
c/jlx63clSLkPGFffXv0UfziMnQTyv4HpqmViHJAkSbjDfwLHhc=
=coA1
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
