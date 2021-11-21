Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48414586DA
	for <lists+linux-usb@lfdr.de>; Sun, 21 Nov 2021 23:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhKUW6L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Nov 2021 17:58:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhKUW6K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Nov 2021 17:58:10 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C41DC061574
        for <linux-usb@vger.kernel.org>; Sun, 21 Nov 2021 14:55:05 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1movjg-0007rN-Kp; Sun, 21 Nov 2021 23:55:00 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1movjg-0003u4-9K; Sun, 21 Nov 2021 23:55:00 +0100
Date:   Sun, 21 Nov 2021 23:55:00 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH v3 7/7] usb: gadget: uvc: add format/frame handling code
Message-ID: <20211121225500.GB8504@pengutronix.de>
References: <20211117122435.2409362-1-m.grzeschik@pengutronix.de>
 <20211117122435.2409362-8-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <20211117122435.2409362-8-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 23:52:07 up 277 days,  2:16, 119 users,  load average: 0.03, 0.08,
 0.08
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 01:24:35PM +0100, Michael Grzeschik wrote:
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
>
> drivers/usb/gadget/function/f_uvc.c     | 232 +++++++++++++++++++++++-
> drivers/usb/gadget/function/uvc.h       |  18 ++
> drivers/usb/gadget/function/uvc_v4l2.c  |  52 +++++-
> drivers/usb/gadget/function/uvc_video.c |  12 +-
> 4 files changed, 305 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/func=
tion/f_uvc.c
>index f1fd44e6062980..62fef6e002271a 100644
>--- a/drivers/usb/gadget/function/f_uvc.c
>+++ b/drivers/usb/gadget/function/f_uvc.c
>@@ -16,7 +16,6 @@
> #include <linux/string.h>
> #include <linux/usb/ch9.h>
> #include <linux/usb/gadget.h>
>-#include <linux/usb/g_uvc.h>
> #include <linux/usb/video.h>
> #include <linux/vmalloc.h>
> #include <linux/wait.h>
>@@ -200,16 +199,228 @@ static const struct usb_descriptor_header * const u=
vc_ss_streaming[] =3D {
>  * Control requests
>  */
>
>+void uvc_fill_streaming_control(struct uvc_device *uvc,
>+			   struct uvc_streaming_control *ctrl,
>+			   int iframe, int iformat, unsigned int ival)
>+{
>+	struct uvcg_format *uformat;
>+	struct uvcg_frame *uframe;
>+
>+	/* Restrict the iformat, iframe and ival to valid values. Negative
>+	 * values for ifrmat and iframe will result in the maximum valid value
>+	 * being selected
>+	 */
>+	iformat =3D clamp((unsigned int)iformat, 1U,
>+			(unsigned int)uvc->header->num_fmt);
>+	uformat =3D find_format_by_index(uvc, iformat);
>+	if (!uformat)
>+		return;
>+
>+	iframe =3D clamp((unsigned int)iframe, 1U,
>+		       (unsigned int)uformat->num_frames);
>+	uframe =3D find_frame_by_index(uvc, uformat, iframe);
>+	if (!uframe)
>+		return;
>+
>+	ival =3D clamp((unsigned int)ival, 1U,
>+		     (unsigned int)uframe->frame.b_frame_interval_type);
>+	if (!uframe->dw_frame_interval[ival - 1])
>+		return;
>+
>+	memset(ctrl, 0, sizeof(*ctrl));
>+
>+	ctrl->bmHint =3D 1;
>+	ctrl->bFormatIndex =3D iformat;
>+	ctrl->bFrameIndex =3D iframe;
>+	ctrl->dwFrameInterval =3D uframe->dw_frame_interval[ival - 1];
>+	ctrl->dwMaxVideoFrameSize =3D
>+		uframe->frame.dw_max_video_frame_buffer_size;
>+
>+	if (uvc->video.ep->desc)
>+		ctrl->dwMaxPayloadTransferSize =3D
>+			uvc->video.ep->desc->wMaxPacketSize;
>+	ctrl->bmFramingInfo =3D 3;
>+	ctrl->bPreferedVersion =3D 1;
>+	ctrl->bMaxVersion =3D 1;
>+}
>+
>+static int uvc_events_process_data(struct uvc_device *uvc,
>+				   struct usb_request *req)
>+{
>+	struct uvc_video *video =3D &uvc->video;
>+	struct uvc_streaming_control *target;
>+	struct uvc_streaming_control *ctrl;
>+	struct uvcg_frame *uframe;
>+	struct uvcg_format *uformat;
>+
>+	switch (video->control) {
>+	case UVC_VS_PROBE_CONTROL:
>+		pr_debug("setting probe control, length =3D %d\n", req->actual);
>+		target =3D &video->probe;
>+		break;
>+
>+	case UVC_VS_COMMIT_CONTROL:
>+		pr_debug("setting commit control, length =3D %d\n", req->actual);
>+		target =3D &video->commit;
>+		break;
>+
>+	default:
>+		pr_err("setting unknown control, length =3D %d\n", req->actual);
>+		return -EOPNOTSUPP;
>+	}
>+
>+	ctrl =3D (struct uvc_streaming_control *)req->buf;
>+
>+	uvc_fill_streaming_control(uvc, target, ctrl->bFormatIndex,
>+			   ctrl->bFrameIndex, ctrl->dwFrameInterval);
>+
>+	if (video->control =3D=3D UVC_VS_COMMIT_CONTROL) {
>+		uformat =3D find_format_by_index(uvc, target->bFormatIndex);
>+		if (!uformat)
>+			return -EINVAL;
>+
>+		uframe =3D find_frame_by_index(uvc, uformat, ctrl->bFrameIndex);
>+		if (!uframe)
>+			return -EINVAL;
>+
>+		spin_lock(&video->frame_lock);
>+
>+		video->cur_frame =3D uframe;
>+		video->cur_format =3D uformat;
>+		video->cur_ival =3D ctrl->dwFrameInterval;

I just realized that this is broken. It obviously should return the
index for the dwFrameInterval.

I prepared an helper find_ival_index and will rework it in the next
round after some further review.

>+
>+		spin_unlock(&video->frame_lock);
>+	}
>+
>+	return 0;
>+}

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmGazkEACgkQC+njFXoe
LGRhWA//ao6gYM9ho4fSWe6H2gLScbTrafpX35H4/th5CHLi+oln5FXPgjLuu60V
9IqEepkEJamZ5dGkXvNmsbVfCvYuyy6NapOuEmtG52o5iMyQhaYmuJICx5CW7Hm3
1uKt6b2NpmBV/Li2iXaNhFiJhv86QPoyxB7YlFwFHUcvvlWXK3ccYFM62yIjz0Fe
FgPrZJmZUBN0PjEa8k6qppsQmRMcaPxMfBOIIk6t7Aq4HmSgKRpU7711ToclwuN0
uO+8Mij4AKIl0GFMVtvHHcX8pClwogslkRtqgbf+1wL8twd+7wTm8MrJ7NSi9eSg
KpnSXk7ElX19ZHnbWT6ngMiUUrezJIeyS+Y7/8w3V08KjKbIUIU07AMBQ5kdrGvm
2pGbSd45ziHutCq6sEyIp1OIyZrusZxZcbp+/PEyR2UHTzoHShf7oIAN0BTRegjM
vVeHs7rYQh0mpxvbxWjt7IZRtsMzFMAm0UqVPduFeiMdi2d+2pzexg8uQUvKAe0e
tHganfBFag/+ZNxPIf5O3KTGIZNL7qpXktMNkVFx8OPQBeaAr29tRV6K7GENGUbW
lyaHP7dyuewfF0kvgJqjPljQ5mIRzHS5IgbtBdx84rpYXTbkA1xVJ/rfpvCiSKe0
guJQ8gD5891qEDVcUzrGzLcxyI6QhHzwOcXwIogSDgAhsgUI5Nk=
=KTll
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
