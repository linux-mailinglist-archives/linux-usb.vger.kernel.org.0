Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF66650A1F
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 11:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbiLSKbu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 05:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiLSKbt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 05:31:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71287625D
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 02:31:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C035825;
        Mon, 19 Dec 2022 11:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671445906;
        bh=xm7iQYvH7pRcFpSgYAuCVNgbIFY/VAuOsRh34P+hVEc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cfJ8DbgzVZoAJqphhfEuqd+8W3v7OhKzhyou1Ig3LOPuniY/UANEuR4p8V7A7t1i2
         qLI55TWde01Xm25mdOxkyOVQDP/jtYvA85kDo6UFzsBHxmEpcK5o+O7IEC2zGPhx4F
         wmur07YMUGotEkAmYMY8cwBBqtfM5t/7+cZ+G5Kk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y584AMESSdNzEDgk@pendragon.ideasonboard.com>
References: <20221216160528.479094-1-dan.scally@ideasonboard.com> <Y584AMESSdNzEDgk@pendragon.ideasonboard.com>
Subject: Re: [PATCH] usb: gadget: g_webcam: Send color matching descriptor per frame
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Mon, 19 Dec 2022 10:31:43 +0000
Message-ID: <167144590394.2009555.11749147766598937543@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Laurent Pinchart (2022-12-18 15:55:44)
> Hi Dan,
>=20
> Thank you for the patch.
>=20
> On Fri, Dec 16, 2022 at 04:05:28PM +0000, Daniel Scally wrote:
> > Currently the color matching descriptor is only sent across the wire
> > a single time, following the descriptors for each format and frame.
> > According to the UVC 1.5 Specification 3.9.2.6 ("Color Matching
> > Descriptors"):
> >=20
> > "Only one instance is allowed for a given format and if present,
> > the Color Matching descriptor shall be placed following the Video
> > and Still Image Frame descriptors for that format".
> >=20
> > Add another reference to the color matching descriptor after the
> > yuyv frames so that it's correctly transmitted for that format
> > too.
> >=20
> > Fixes: a9914127e834 ("USB gadget: Webcam device")
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>=20

Oh - wow this was easier than I anticipated.

Likewise:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> > ---
> >  drivers/usb/gadget/legacy/webcam.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/usb/gadget/legacy/webcam.c b/drivers/usb/gadget/le=
gacy/webcam.c
> > index 53e38f87472b..c06dd1af7a0c 100644
> > --- a/drivers/usb/gadget/legacy/webcam.c
> > +++ b/drivers/usb/gadget/legacy/webcam.c
> > @@ -293,6 +293,7 @@ static const struct uvc_descriptor_header * const u=
vc_fs_streaming_cls[] =3D {
> >       (const struct uvc_descriptor_header *) &uvc_format_yuv,
> >       (const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
> >       (const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
> > +     (const struct uvc_descriptor_header *) &uvc_color_matching,
> >       (const struct uvc_descriptor_header *) &uvc_format_mjpg,
> >       (const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
> >       (const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
> > @@ -305,6 +306,7 @@ static const struct uvc_descriptor_header * const u=
vc_hs_streaming_cls[] =3D {
> >       (const struct uvc_descriptor_header *) &uvc_format_yuv,
> >       (const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
> >       (const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
> > +     (const struct uvc_descriptor_header *) &uvc_color_matching,
> >       (const struct uvc_descriptor_header *) &uvc_format_mjpg,
> >       (const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
> >       (const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
> > @@ -317,6 +319,7 @@ static const struct uvc_descriptor_header * const u=
vc_ss_streaming_cls[] =3D {
> >       (const struct uvc_descriptor_header *) &uvc_format_yuv,
> >       (const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
> >       (const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
> > +     (const struct uvc_descriptor_header *) &uvc_color_matching,
> >       (const struct uvc_descriptor_header *) &uvc_format_mjpg,
> >       (const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
> >       (const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
