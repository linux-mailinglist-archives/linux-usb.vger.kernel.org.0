Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C37995441DD
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 05:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237403AbiFIDY7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 23:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237400AbiFIDY6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 23:24:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB67FD0E
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 20:24:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E20F4501;
        Thu,  9 Jun 2022 05:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654745093;
        bh=32Vf6MK4/E1CmkgAOg2b3jk2ZdjBF256Js1BS1gvghc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Xo2EYI2sFvRd0H6ovqj2JnJa7GlIyOrZbAv0xL0AiRw9IuKY+RJZlYUJ/r28nUuxb
         cUdTIw+1Q2cXZUXCn9LYBtZEFQuq1HyjMPxrUHEY4cTNb73h+mUmM7svw6GX9z1fjg
         lXumI4erEqrxSS0RR+4gVAdSwEauYf8Bw2Tq7JdA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220608174918.14656-1-laurent.pinchart@ideasonboard.com>
References: <20220608174918.14656-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] usb: gadget: uvc: Fix comment blocks style
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org
Date:   Thu, 09 Jun 2022 04:24:50 +0100
Message-ID: <165474509014.316514.7871390070421597284@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Laurent,

Quoting Laurent Pinchart (2022-06-08 18:49:18)
> The UVC gadget driver historically uses the
>=20
> /* Comment
>  * style
>  */
>=20
> for multi-line block comments, which is frowned upon. Patches for the
> driver are required to use the more standard
>=20
> /*
>  * Comment
>  * style
>  */
>=20
> style. This result in inconsistencies. Fix it by converting all
> remaining instances of the old style.

This seems quite clear.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/usb/gadget/function/f_uvc.c     | 30 ++++++++++++++++---------
>  drivers/usb/gadget/function/uvc_queue.c |  6 +++--
>  drivers/usb/gadget/function/uvc_video.c | 12 ++++++----
>  3 files changed, 31 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fun=
ction/f_uvc.c
> index d3feeeb50841..71669e0e4d00 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -141,7 +141,8 @@ static struct usb_endpoint_descriptor uvc_fs_streamin=
g_ep =3D {
>         .bEndpointAddress       =3D USB_DIR_IN,
>         .bmAttributes           =3D USB_ENDPOINT_SYNC_ASYNC
>                                 | USB_ENDPOINT_XFER_ISOC,
> -       /* The wMaxPacketSize and bInterval values will be initialized fr=
om
> +       /*
> +        * The wMaxPacketSize and bInterval values will be initialized fr=
om
>          * module parameters.
>          */
>  };
> @@ -152,7 +153,8 @@ static struct usb_endpoint_descriptor uvc_hs_streamin=
g_ep =3D {
>         .bEndpointAddress       =3D USB_DIR_IN,
>         .bmAttributes           =3D USB_ENDPOINT_SYNC_ASYNC
>                                 | USB_ENDPOINT_XFER_ISOC,
> -       /* The wMaxPacketSize and bInterval values will be initialized fr=
om
> +       /*
> +        * The wMaxPacketSize and bInterval values will be initialized fr=
om
>          * module parameters.
>          */
>  };
> @@ -164,7 +166,8 @@ static struct usb_endpoint_descriptor uvc_ss_streamin=
g_ep =3D {
>         .bEndpointAddress       =3D USB_DIR_IN,
>         .bmAttributes           =3D USB_ENDPOINT_SYNC_ASYNC
>                                 | USB_ENDPOINT_XFER_ISOC,
> -       /* The wMaxPacketSize and bInterval values will be initialized fr=
om
> +       /*
> +        * The wMaxPacketSize and bInterval values will be initialized fr=
om
>          * module parameters.
>          */
>  };
> @@ -172,7 +175,8 @@ static struct usb_endpoint_descriptor uvc_ss_streamin=
g_ep =3D {
>  static struct usb_ss_ep_comp_descriptor uvc_ss_streaming_comp =3D {
>         .bLength                =3D sizeof(uvc_ss_streaming_comp),
>         .bDescriptorType        =3D USB_DT_SS_ENDPOINT_COMP,
> -       /* The bMaxBurst, bmAttributes and wBytesPerInterval values will =
be
> +       /*
> +        * The bMaxBurst, bmAttributes and wBytesPerInterval values will =
be
>          * initialized from module parameters.
>          */
>  };
> @@ -234,7 +238,8 @@ uvc_function_setup(struct usb_function *f, const stru=
ct usb_ctrlrequest *ctrl)
>         if (le16_to_cpu(ctrl->wLength) > UVC_MAX_REQUEST_SIZE)
>                 return -EINVAL;
> =20
> -       /* Tell the complete callback to generate an event for the next r=
equest
> +       /*
> +        * Tell the complete callback to generate an event for the next r=
equest
>          * that will be enqueued by UVCIOC_SEND_RESPONSE.
>          */
>         uvc->event_setup_out =3D !(ctrl->bRequestType & USB_DIR_IN);
> @@ -500,7 +505,8 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb=
_device_speed speed)
>         if (!uvc_control_desc || !uvc_streaming_cls)
>                 return ERR_PTR(-ENODEV);
> =20
> -       /* Descriptors layout
> +       /*
> +        * Descriptors layout
>          *
>          * uvc_iad
>          * uvc_control_intf
> @@ -597,8 +603,7 @@ uvc_function_bind(struct usb_configuration *c, struct=
 usb_function *f)
>         uvcg_info(f, "%s()\n", __func__);
> =20
>         opts =3D fi_to_f_uvc_opts(f->fi);
> -       /* Sanity check the streaming endpoint module parameters.
> -        */
> +       /* Sanity check the streaming endpoint module parameters. */
>         opts->streaming_interval =3D clamp(opts->streaming_interval, 1U, =
16U);
>         opts->streaming_maxpacket =3D clamp(opts->streaming_maxpacket, 1U=
, 3072U);
>         opts->streaming_maxburst =3D min(opts->streaming_maxburst, 15U);
> @@ -611,7 +616,8 @@ uvc_function_bind(struct usb_configuration *c, struct=
 usb_function *f)
>                           opts->streaming_maxpacket);
>         }
> =20
> -       /* Fill in the FS/HS/SS Video Streaming specific descriptors from=
 the
> +       /*
> +        * Fill in the FS/HS/SS Video Streaming specific descriptors from=
 the
>          * module parameters.
>          *
>          * NOTE: We assume that the user knows what they are doing and wo=
n't
> @@ -895,7 +901,8 @@ static void uvc_function_unbind(struct usb_configurat=
ion *c,
> =20
>         uvcg_info(f, "%s()\n", __func__);
> =20
> -       /* If we know we're connected via v4l2, then there should be a cl=
eanup
> +       /*
> +        * If we know we're connected via v4l2, then there should be a cl=
eanup
>          * of the device from userspace either via UVC_EVENT_DISCONNECT or
>          * though the video device removal uevent. Allow some time for the
>          * application to close out before things get deleted.
> @@ -912,7 +919,8 @@ static void uvc_function_unbind(struct usb_configurat=
ion *c,
>         v4l2_device_unregister(&uvc->v4l2_dev);
> =20
>         if (uvc->func_connected) {
> -               /* Wait for the release to occur to ensure there are no l=
onger any
> +               /*
> +                * Wait for the release to occur to ensure there are no l=
onger any
>                  * pending operations that may cause panics when resource=
s are cleaned
>                  * up.
>                  */
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget=
/function/uvc_queue.c
> index d25edc3d2174..951934aa4454 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -104,7 +104,8 @@ static void uvc_buffer_queue(struct vb2_buffer *vb)
>         if (likely(!(queue->flags & UVC_QUEUE_DISCONNECTED))) {
>                 list_add_tail(&buf->queue, &queue->irqqueue);
>         } else {
> -               /* If the device is disconnected return the buffer to use=
rspace
> +               /*
> +                * If the device is disconnected return the buffer to use=
rspace
>                  * directly. The next QBUF call will fail with -ENODEV.
>                  */
>                 buf->state =3D UVC_BUF_STATE_ERROR;
> @@ -255,7 +256,8 @@ void uvcg_queue_cancel(struct uvc_video_queue *queue,=
 int disconnect)
>         }
>         queue->buf_used =3D 0;
> =20
> -       /* This must be protected by the irqlock spinlock to avoid race
> +       /*
> +        * This must be protected by the irqlock spinlock to avoid race
>          * conditions between uvc_queue_buffer and the disconnection even=
t that
>          * could result in an interruptible wait in uvc_dequeue_buffer. D=
o not
>          * blindly replace this logic by checking for the UVC_DEV_DISCONN=
ECTED
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget=
/function/uvc_video.c
> index a9bb4553db84..5876bc73f929 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -378,7 +378,8 @@ static void uvcg_video_pump(struct work_struct *work)
>         int ret;
> =20
>         while (video->ep->enabled) {
> -               /* Retrieve the first available USB request, protected by=
 the
> +               /*
> +                * Retrieve the first available USB request, protected by=
 the
>                  * request lock.
>                  */
>                 spin_lock_irqsave(&video->req_lock, flags);
> @@ -391,7 +392,8 @@ static void uvcg_video_pump(struct work_struct *work)
>                 list_del(&req->list);
>                 spin_unlock_irqrestore(&video->req_lock, flags);
> =20
> -               /* Retrieve the first available video buffer and fill the
> +               /*
> +                * Retrieve the first available video buffer and fill the
>                  * request, protected by the video queue irqlock.
>                  */
>                 spin_lock_irqsave(&queue->irqlock, flags);
> @@ -403,9 +405,11 @@ static void uvcg_video_pump(struct work_struct *work)
> =20
>                 video->encode(req, video, buf);
> =20
> -               /* With usb3 we have more requests. This will decrease the
> +               /*
> +                * With usb3 we have more requests. This will decrease the
>                  * interrupt load to a quarter but also catches the corner
> -                * cases, which needs to be handled */
> +                * cases, which needs to be handled.
> +                */
>                 if (list_empty(&video->req_free) ||
>                     buf->state =3D=3D UVC_BUF_STATE_DONE ||
>                     !(video->req_int_count %
>=20
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --=20
> Regards,
>=20
> Laurent Pinchart
>
