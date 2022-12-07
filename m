Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702D564590B
	for <lists+linux-usb@lfdr.de>; Wed,  7 Dec 2022 12:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiLGLa1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Dec 2022 06:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiLGLaQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Dec 2022 06:30:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3632E9C4
        for <linux-usb@vger.kernel.org>; Wed,  7 Dec 2022 03:30:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42C1F87B;
        Wed,  7 Dec 2022 12:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670412612;
        bh=SVSw1pGFeJJU2zmxQtWPm7GiVRdeR9pHmw+E5byUxgU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Y59qVewkmzUWG+0S3+En8OBuyd2gcJ7JpPOIuIMZwlqkd4GjnMi1mAjSnUn5PWiXx
         Z/s0hmQMEVqhv1h3ZVJsz/IAGb2LQtX5VrdwcCNGRaqFpIJVHydL2A+enE2hKX28Jo
         yFUU7ZHdGgeu12mbP7/vw9jf/9Q5TQvOaqpBxqFg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y4+xmpzrFjSNC/Ip@pendragon.ideasonboard.com>
References: <20221206161203.1562827-1-dan.scally@ideasonboard.com> <Y4+xmpzrFjSNC/Ip@pendragon.ideasonboard.com>
Subject: Re: [PATCH v2] usb: gadget: uvc: Rename bmInterfaceFlags -> bmInterlaceFlags
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        mgr@pengutronix.de
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Wed, 07 Dec 2022 11:30:09 +0000
Message-ID: <167041260960.9133.9901949273101143848@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Quoting Laurent Pinchart (2022-12-06 21:18:18)
> Hi Dan,
>=20
> Thank you for the patch.
>=20
> On Tue, Dec 06, 2022 at 04:12:03PM +0000, Daniel Scally wrote:
> > In the specification documents for the Uncompressed and MJPEG USB
> > Video Payloads, the field name is bmInterlaceFlags - it has been
> > misnamed within the kernel.
> >=20
> > Although renaming the field does break the kernel's interface to
> > userspace it should be low-risk in this instance. The field is read
> > only and hardcoded to 0, so there was never any value in anyone
> > reading it. A search of the uvc-gadget application and all the
> > forks that I could find for it did not reveal any users either.
> >=20
> > Fixes: cdda479f15cd ("USB gadget: video class function driver")
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

FWIW, as I've spent time on this:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

As this is now correct, I would really dislike reverting this outright
if we found it did break userspace.

I don't think it will break anything - but in that event, I'd rather see
a union/alias added so that we can actually use the correct name as
defined by the spec in the future.

--
Kieran


>=20
> > ---
> > Changes in v2:
> >=20
> >       - Updated the legacy driver too
> >       - Updated the ABI docs...which I also forgot last time (my bad)
> >=20
> >  Documentation/ABI/testing/configfs-usb-gadget-uvc |  4 ++--
> >  drivers/usb/gadget/function/uvc_configfs.c        | 12 ++++++------
> >  drivers/usb/gadget/legacy/webcam.c                |  4 ++--
> >  include/uapi/linux/usb/video.h                    |  4 ++--
> >  4 files changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Docume=
ntation/ABI/testing/configfs-usb-gadget-uvc
> > index 611b23e6488d..f00cff6d8c5c 100644
> > --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> > +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> > @@ -197,7 +197,7 @@ Description:      Specific MJPEG format descriptors
> >                                       read-only
> >               bmaControls             this format's data for bmaControl=
s in
> >                                       the streaming header
> > -             bmInterfaceFlags        specifies interlace information,
> > +             bmInterlaceFlags        specifies interlace information,
> >                                       read-only
> >               bAspectRatioY           the X dimension of the picture as=
pect
> >                                       ratio, read-only
> > @@ -253,7 +253,7 @@ Description:      Specific uncompressed format desc=
riptors
> >                                       read-only
> >               bmaControls             this format's data for bmaControl=
s in
> >                                       the streaming header
> > -             bmInterfaceFlags        specifies interlace information,
> > +             bmInterlaceFlags        specifies interlace information,
> >                                       read-only
> >               bAspectRatioY           the X dimension of the picture as=
pect
> >                                       ratio, read-only
> > diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/g=
adget/function/uvc_configfs.c
> > index 4303a3283ba0..76cb60d13049 100644
> > --- a/drivers/usb/gadget/function/uvc_configfs.c
> > +++ b/drivers/usb/gadget/function/uvc_configfs.c
> > @@ -1512,7 +1512,7 @@ UVCG_UNCOMPRESSED_ATTR(b_bits_per_pixel, bBitsPer=
Pixel, 8);
> >  UVCG_UNCOMPRESSED_ATTR(b_default_frame_index, bDefaultFrameIndex, 8);
> >  UVCG_UNCOMPRESSED_ATTR_RO(b_aspect_ratio_x, bAspectRatioX, 8);
> >  UVCG_UNCOMPRESSED_ATTR_RO(b_aspect_ratio_y, bAspectRatioY, 8);
> > -UVCG_UNCOMPRESSED_ATTR_RO(bm_interface_flags, bmInterfaceFlags, 8);
> > +UVCG_UNCOMPRESSED_ATTR_RO(bm_interlace_flags, bmInterlaceFlags, 8);
> > =20
> >  #undef UVCG_UNCOMPRESSED_ATTR
> >  #undef UVCG_UNCOMPRESSED_ATTR_RO
> > @@ -1541,7 +1541,7 @@ static struct configfs_attribute *uvcg_uncompress=
ed_attrs[] =3D {
> >       &uvcg_uncompressed_attr_b_default_frame_index,
> >       &uvcg_uncompressed_attr_b_aspect_ratio_x,
> >       &uvcg_uncompressed_attr_b_aspect_ratio_y,
> > -     &uvcg_uncompressed_attr_bm_interface_flags,
> > +     &uvcg_uncompressed_attr_bm_interlace_flags,
> >       &uvcg_uncompressed_attr_bma_controls,
> >       NULL,
> >  };
> > @@ -1574,7 +1574,7 @@ static struct config_group *uvcg_uncompressed_mak=
e(struct config_group *group,
> >       h->desc.bDefaultFrameIndex      =3D 1;
> >       h->desc.bAspectRatioX           =3D 0;
> >       h->desc.bAspectRatioY           =3D 0;
> > -     h->desc.bmInterfaceFlags        =3D 0;
> > +     h->desc.bmInterlaceFlags        =3D 0;
> >       h->desc.bCopyProtect            =3D 0;
> > =20
> >       INIT_LIST_HEAD(&h->fmt.frames);
> > @@ -1700,7 +1700,7 @@ UVCG_MJPEG_ATTR(b_default_frame_index, bDefaultFr=
ameIndex, 8);
> >  UVCG_MJPEG_ATTR_RO(bm_flags, bmFlags, 8);
> >  UVCG_MJPEG_ATTR_RO(b_aspect_ratio_x, bAspectRatioX, 8);
> >  UVCG_MJPEG_ATTR_RO(b_aspect_ratio_y, bAspectRatioY, 8);
> > -UVCG_MJPEG_ATTR_RO(bm_interface_flags, bmInterfaceFlags, 8);
> > +UVCG_MJPEG_ATTR_RO(bm_interlace_flags, bmInterlaceFlags, 8);
> > =20
> >  #undef UVCG_MJPEG_ATTR
> >  #undef UVCG_MJPEG_ATTR_RO
> > @@ -1728,7 +1728,7 @@ static struct configfs_attribute *uvcg_mjpeg_attr=
s[] =3D {
> >       &uvcg_mjpeg_attr_bm_flags,
> >       &uvcg_mjpeg_attr_b_aspect_ratio_x,
> >       &uvcg_mjpeg_attr_b_aspect_ratio_y,
> > -     &uvcg_mjpeg_attr_bm_interface_flags,
> > +     &uvcg_mjpeg_attr_bm_interlace_flags,
> >       &uvcg_mjpeg_attr_bma_controls,
> >       NULL,
> >  };
> > @@ -1755,7 +1755,7 @@ static struct config_group *uvcg_mjpeg_make(struc=
t config_group *group,
> >       h->desc.bDefaultFrameIndex      =3D 1;
> >       h->desc.bAspectRatioX           =3D 0;
> >       h->desc.bAspectRatioY           =3D 0;
> > -     h->desc.bmInterfaceFlags        =3D 0;
> > +     h->desc.bmInterlaceFlags        =3D 0;
> >       h->desc.bCopyProtect            =3D 0;
> > =20
> >       INIT_LIST_HEAD(&h->fmt.frames);
> > diff --git a/drivers/usb/gadget/legacy/webcam.c b/drivers/usb/gadget/le=
gacy/webcam.c
> > index 94e22867da1d..53e38f87472b 100644
> > --- a/drivers/usb/gadget/legacy/webcam.c
> > +++ b/drivers/usb/gadget/legacy/webcam.c
> > @@ -171,7 +171,7 @@ static const struct uvc_format_uncompressed uvc_for=
mat_yuv =3D {
> >       .bDefaultFrameIndex     =3D 1,
> >       .bAspectRatioX          =3D 0,
> >       .bAspectRatioY          =3D 0,
> > -     .bmInterfaceFlags       =3D 0,
> > +     .bmInterlaceFlags       =3D 0,
> >       .bCopyProtect           =3D 0,
> >  };
> > =20
> > @@ -222,7 +222,7 @@ static const struct uvc_format_mjpeg uvc_format_mjp=
g =3D {
> >       .bDefaultFrameIndex     =3D 1,
> >       .bAspectRatioX          =3D 0,
> >       .bAspectRatioY          =3D 0,
> > -     .bmInterfaceFlags       =3D 0,
> > +     .bmInterlaceFlags       =3D 0,
> >       .bCopyProtect           =3D 0,
> >  };
> > =20
> > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/vi=
deo.h
> > index bfdae12cdacf..6e8e572c2980 100644
> > --- a/include/uapi/linux/usb/video.h
> > +++ b/include/uapi/linux/usb/video.h
> > @@ -466,7 +466,7 @@ struct uvc_format_uncompressed {
> >       __u8  bDefaultFrameIndex;
> >       __u8  bAspectRatioX;
> >       __u8  bAspectRatioY;
> > -     __u8  bmInterfaceFlags;
> > +     __u8  bmInterlaceFlags;
> >       __u8  bCopyProtect;
> >  } __attribute__((__packed__));
> > =20
> > @@ -522,7 +522,7 @@ struct uvc_format_mjpeg {
> >       __u8  bDefaultFrameIndex;
> >       __u8  bAspectRatioX;
> >       __u8  bAspectRatioY;
> > -     __u8  bmInterfaceFlags;
> > +     __u8  bmInterlaceFlags;
> >       __u8  bCopyProtect;
> >  } __attribute__((__packed__));
> > =20
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
