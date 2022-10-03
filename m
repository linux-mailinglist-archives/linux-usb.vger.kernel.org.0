Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF415F2FCD
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 13:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiJCLr7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 07:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiJCLr7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 07:47:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DFE33371
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 04:47:57 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ofJvP-0003qp-S8; Mon, 03 Oct 2022 13:47:55 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ofJvO-0004gu-9S; Mon, 03 Oct 2022 13:47:54 +0200
Date:   Mon, 3 Oct 2022 13:47:54 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran@linuxembedded.co.uk, balbi@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH] uvc: gadget: uvc: Defer uvcg_complete_buffer() until
 .complete()
Message-ID: <20221003114754.GA32650@pengutronix.de>
References: <20221003101627.144026-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20221003101627.144026-1-dan.scally@ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2022 at 11:16:27AM +0100, Daniel Scally wrote:
>Calling uvcg_complete_buffer() from uvc_video_encode_isoc() sometimes
>causes the final isoc packet for a video frame to be delayed long
>enough to cause the USB controller to drop it. The first isoc packet
>of the next video frame is then received by the host, which interprets
>the toggled FID bit correctly such that the stream continues without
>interruption, but the first frame will be missing the last isoc
>packet's worth of bytes.
>
>To fix the issue delay the call to uvcg_complete_buffer() until the
>usb_request's .complete() callback, as already happens when the data
>is encoded via uvc_video_encode_isoc_sg().
>
>Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>---
> drivers/usb/gadget/function/uvc_video.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/=
function/uvc_video.c
>index c00ce0e91f5d..041819a655ed 100644
>--- a/drivers/usb/gadget/function/uvc_video.c
>+++ b/drivers/usb/gadget/function/uvc_video.c
>@@ -194,6 +194,7 @@ static void
> uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
> 		struct uvc_buffer *buf)
> {
>+	struct uvc_request *ureq =3D req->context;
> 	void *mem =3D req->buf;
> 	int len =3D video->req_size;
> 	int ret;
>@@ -213,7 +214,7 @@ uvc_video_encode_isoc(struct usb_request *req, struct =
uvc_video *video,
> 		video->queue.buf_used =3D 0;
> 		buf->state =3D UVC_BUF_STATE_DONE;
> 		list_del(&buf->queue);
>-		uvcg_complete_buffer(&video->queue, buf);
>+		ureq->last_buf =3D buf;
> 		video->fid ^=3D UVC_STREAM_FID;
> 	}
> }
>--=20
>2.34.1

Reviewed-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmM6y+cACgkQC+njFXoe
LGTnuA/6A8Kkdhq+RFFSJFVUS1DiV2sF2rHnO33NxvQ42GcV1JoMUHBI0KeDvo01
do+4NmMQgPfqIcdQLVvHt7Zjat95nTMmX0uLA6Q2vL9ibEsRNwOgJK7Y/torOyyn
J9QwkclypqjEJTRy1pQQdsttQ2BxzttieV1pLdoy1Tk36jNH6Q6RAtHJNdz9mLxY
zVUqXmOEPyXsfTji+foHt0uNA2TxwYk3bAE0i+aMCRzWca70PYoIJKqbJlR2iLm2
FTSBbH6lH3ElSGI5Jgzbjk3LkMTwC2sznxO8M2OFNU79Gh6ylZ9+H/bQ5lXgFRrC
l1biRrVjSYWpIjprQienueYxMS2fOeMBhzpiw4hgyIqr3Tv5aLT0UIpLqRTU2llw
6KuV1VNVZPo3DuMrtKMirueFHyPmBjceZNwpj09nqLPjxZZicl4XOmzt6lUFfU5h
aNkVoUVFwWlS9Wvcv7ntgDqb9rDpxtqQE9DWceo468hySZYBXSFcn/F7zuOp63WY
zL+v6nJyvW3CncN6lGNFWBUkjIq5e04rN1a4f9lkUWZlFhh56eBKFgBK7xygN6jZ
Cx5uXmb5VukOlduthjHl9ug5URYt2UxEvIASvS9JfcA+RVLmb43daQTFkaby0V8q
g5vvpXjXfwX15Js6DTwnmJ59YLwUj6/iG92ctwkiGGIWGm/kT2o=
=JAQ+
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
