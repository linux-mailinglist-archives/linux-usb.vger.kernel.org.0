Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7EC657205
	for <lists+linux-usb@lfdr.de>; Wed, 28 Dec 2022 03:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbiL1CPH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Dec 2022 21:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiL1CPF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Dec 2022 21:15:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D5A3A7
        for <linux-usb@vger.kernel.org>; Tue, 27 Dec 2022 18:14:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C442725B;
        Wed, 28 Dec 2022 03:14:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672193695;
        bh=errEwRvy+sa+Cj4ekGHcEyz60I9Urg0jqYRqeokgCjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EnVxoD+Lp01gCqZjFM0L6rdxAooKmt+bnd9jzWIzHpJ6dHreElu9kkqJ0fQ7qRN/r
         HRaiAp6EUU3iUBpjzBehJpnpSuuVdgQaW9JBTz1p3pp1w1tAcL9EEW/n0jcdVcOLvJ
         gBgCDw8TLm4lqWm0DPMAbJX5fI2idGReyWAJDFXg=
Date:   Wed, 28 Dec 2022 04:14:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
Subject: Re: [PATCH v2 2/7] usb: uvc: Enumerate valid values for color
 matching
Message-ID: <Y6umm+jUPrcvHWeC@pendragon.ideasonboard.com>
References: <20221219144316.757680-1-dan.scally@ideasonboard.com>
 <20221219144316.757680-3-dan.scally@ideasonboard.com>
 <10145364-505c-596f-2fd0-27b549115bd7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10145364-505c-596f-2fd0-27b549115bd7@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Mon, Dec 19, 2022 at 02:45:07PM +0000, Dan Scally wrote:
> On 19/12/2022 14:43, Daniel Scally wrote:
> > The color matching descriptors defined in the UVC 1.5 Specification

Not just UVC 1.5, but also UVC 1.1. I would just say "UVC" gere.

> > contain 3 fields with discrete numeric values representing particular
> > settings. Enumerate those values so that later code setting them can
> > be more readable.
> >
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v2:
> >
> >    - New patch
> >
> >   include/uapi/linux/usb/video.h | 30 ++++++++++++++++++++++++++++++
> >   1 file changed, 30 insertions(+)
> >
> > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> > index 6e8e572c2980..08606a52e1e2 100644
> > --- a/include/uapi/linux/usb/video.h
> > +++ b/include/uapi/linux/usb/video.h
> > @@ -179,6 +179,36 @@
> >   #define UVC_CONTROL_CAP_AUTOUPDATE			(1 << 3)
> >   #define UVC_CONTROL_CAP_ASYNCHRONOUS			(1 << 4)
> >   
> > +/* ref Color Matching Descriptor Values */
> 
> _Immediately_ noticed that I forgot to replace the placeholder with the 
> actual reference to the document - sorry...I'll fix that in the v3

Conditionally-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

with this fixed.

> > +enum uvc_color_primaries_values {
> > +	UVC_COLOR_PRIMARIES_UNSPECIFIED,
> > +	UVC_COLOR_PRIMARIES_BT_709_SRGB,
> > +	UVC_COLOR_PRIMARIES_BT_470_2_M,
> > +	UVC_COLOR_PRIMARIES_BT_470_2_B_G,
> > +	UVC_COLOR_PRIMARIES_SMPTE_170M,
> > +	UVC_COLOR_PRIMARIES_SMPTE_240M,
> > +};
> > +
> > +enum uvc_transfer_characteristics_values {
> > +	UVC_TRANSFER_CHARACTERISTICS_UNSPECIFIED,
> > +	UVC_TRANSFER_CHARACTERISTICS_BT_709,
> > +	UVC_TRANSFER_CHARACTERISTICS_BT_470_2_M,
> > +	UVC_TRANSFER_CHARACTERISTICS_BT_470_2_B_G,
> > +	UVC_TRANSFER_CHARACTERISTICS_SMPTE_170M,
> > +	UVC_TRANSFER_CHARACTERISTICS_SMPTE_240M,
> > +	UVC_TRANSFER_CHARACTERISTICS_LINEAR,
> > +	UVC_TRANSFER_CHARACTERISTICS_SRGB,
> > +};
> > +
> > +enum uvc_matrix_coefficients {
> > +	UVC_MATRIX_COEFFICIENTS_UNSPECIFIED,
> > +	UVC_MATRIX_COEFFICIENTS_BT_709,
> > +	UVC_MATRIX_COEFFICIENTS_FCC,
> > +	UVC_MATRIX_COEFFICIENTS_BT_470_2_B_G,
> > +	UVC_MATRIX_COEFFICIENTS_SMPTE_170M,
> > +	UVC_MATRIX_COEFFICIENTS_SMPTE_240M,
> > +};
> > +
> >   /* ------------------------------------------------------------------------
> >    * UVC structures
> >    */

-- 
Regards,

Laurent Pinchart
