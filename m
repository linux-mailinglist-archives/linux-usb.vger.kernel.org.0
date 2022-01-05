Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1B8485214
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jan 2022 12:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbiAELy5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 06:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbiAELyz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jan 2022 06:54:55 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABC0C061761
        for <linux-usb@vger.kernel.org>; Wed,  5 Jan 2022 03:54:54 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1n54sX-0004BM-8j; Wed, 05 Jan 2022 12:54:53 +0100
Received: from mgr by pty.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1n54sV-003fLT-Vs; Wed, 05 Jan 2022 12:54:52 +0100
Date:   Wed, 5 Jan 2022 12:54:51 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH v5 7/7] usb: gadget: uvc: add format/frame handling code
Message-ID: <YdWHC29gbI1mKOj7@pengutronix.de>
References: <20211209084322.2662616-1-m.grzeschik@pengutronix.de>
 <20211209084322.2662616-8-m.grzeschik@pengutronix.de>
 <20211212232719.GA3912@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OSOFu+fqREuV3u+8"
Content-Disposition: inline
In-Reply-To: <20211212232719.GA3912@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:51:51 up 139 days,  4:25, 28 users,  load average: 1.43, 1.20,
 0.63
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--OSOFu+fqREuV3u+8
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Since this series did not get any feedback and the mentioned code needs
to be fixed I will just start the new year with a fresh v6 series.

On Mon, Dec 13, 2021 at 12:27:19AM +0100, Michael Grzeschik wrote:
>Ping
>
>On Thu, Dec 09, 2021 at 09:43:22AM +0100, Michael Grzeschik wrote:
>>The Hostside format selection is currently only done in userspace, as
>>the events for SET_CUR and GET_CUR are allways moved to the application
>>layer. Since the v4l2 device parses the configfs data, the format
>>negotiation can be done in the kernel. This patch adds the functions to
>>set the current configuration while continuing to forward all unknown
>>events to the userspace level.
>>
>>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>>---
>>v1 -> v2:
>>  - fixed the commit message
>>  - changed pr_debug to pr_err in events_process_data
>>  - aligned many indentations
>>  - simplified uvc_events_process_data
>>  - fixed uvc_fill_streaming_control calls in uvcg_video_init
>>  - added setup_subcribed to decide if userspace takes over on EOPNOTSUPP
>>  - added data_subscribed to decide if userspace takes over on EOPNOTSUPP
>>  - removed duplicate send_response
>>  - wrting fmt and frm in full
>>v2 -> v3:
>>  - added find_format_index to set the right probe
>>v3 -> v4:
>>  - add function find_ival_index and use for cur_ival
>>  - fix swapped frame and format in uvc_events_process_data on uvc_fill_s=
treaming_control
>>  - set proper resp.length on ep0 complete
>>  - dropped setting cur_probe on set_format since function was removed
>>  - added locking around getting correspondent cur_{frame,format,ival}
>>v4 -> v5:
>>  - fixed sparse errors reported by kernel test robot
>>
>>drivers/usb/gadget/function/f_uvc.c     | 234 +++++++++++++++++++++++-
>>drivers/usb/gadget/function/uvc.h       |  19 ++
>>drivers/usb/gadget/function/uvc_v4l2.c  |  66 ++++++-
>>drivers/usb/gadget/function/uvc_video.c |  12 +-
>>4 files changed, 324 insertions(+), 7 deletions(-)
>>
>
>[snip]
>
>>static void
>>uvc_function_ep0_complete(struct usb_ep *ep, struct usb_request *req)
>>{
>>	struct uvc_device *uvc =3D req->context;
>>	struct v4l2_event v4l2_event;
>>	struct uvc_event *uvc_event =3D (void *)&v4l2_event.u.data;
>>+	struct uvc_request_data resp;
>>+	int ret;
>>
>>	if (uvc->event_setup_out) {
>>		uvc->event_setup_out =3D 0;
>>
>>+		memset(&resp, 0, sizeof(resp));
>>+		resp.length =3D -EL2HLT;
>>+
>>+		ret =3D uvc_events_process_data(uvc, req);
>>+		/* If we have no error on process */
>>+		if (!ret) {
>>+			resp.length =3D req->length;
>>+			uvc_send_response(uvc, &resp);
>>+			return;
>
>I just found out, that depending on the host implementation, sending a
>response persisting probe or commit is no valid. I will just keep it
>aligned with the uvc-gadget implementation and fix it not to send any
>response in that both cases.
>
>>+		}
>>+
>>+		/* If we have a real error on process */
>>+		if (ret !=3D -EOPNOTSUPP)
>>+			return;
>>+
>>+		/* If we have -EOPNOTSUPP */
>>+		if (!uvc->data_subscribed)
>>+			return;
>>+
>>+		/* If we have data subscribed */
>>		memset(&v4l2_event, 0, sizeof(v4l2_event));
>>		v4l2_event.type =3D UVC_EVENT_DATA;
>>		uvc_event->data.length =3D req->actual;
>
>Beside that, I hope somebody would help reviewing this, before I will
>send v6.
>
>Laurant? Do you have any thoughts on that whole stack?
>
>Thanks,
>Michael
>
>--=20
>Pengutronix e.K.                           |                             |
>Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |



--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--OSOFu+fqREuV3u+8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmHVhwgACgkQC+njFXoe
LGRZ0A/9E0O0luP5Nj1Wr/LwhkifNhQ8npBPirzrPZbaQhCqyZO13qkHj/yZfHaz
C8vaU3ZvL80ul22z9duMG3UqpX2QCI3t5RWlJEJzvRs32FlibiBPUI29A3cdRug5
aj2y3teoKgQrqOwpju2/52JwiYGN2+6ibX0oXwOJgc8W75IZ4fQ1ThAIv67KiOYm
yDOn3tRRcbIHgila6SQBsfi9mRLTF58rTq842PqZcCFMHnEJskBfTBY5gmBYtVZS
sXgWxc/5jXX5k6SsBqZi5kOF4bW6oPmXgcg5zhHITWdV+pALqsra2oSkCtW1l/Nz
xye6QQr1v5FjtQa7TdBvNsXr/zgTvELppmXD91inDcKeyFc7hD8Ao6W3dqpyg+hT
mcH8lSmEunFgZ7DCduBtEq9Gr7Gx2ud1C79GovTcbWZuQDKlUD+BAwQDAc0kbUOf
vvHUctELuUrojUOWtMrdKgvcTxfAHjpCmdGQSEGb7//pDLx5hs1CyT6pDvg3O4kn
OfY3I8rJsy4dF13rdXbj4cTRkr3q4+wdzl98IMllOLJ7C+G9inW1dL6/w5nCko9s
/VDvLWeX36/0WnI9rQz3L6P15b7bgIGjb14/fLGSvl5DAAs5qtveDuTio9pVIHE1
bj19gRsg6C+xPlHUcSegTtcYXGpSiAPrr4AT/zCmIQSRiCkAjHg=
=LkUl
-----END PGP SIGNATURE-----

--OSOFu+fqREuV3u+8--
