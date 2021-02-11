Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF5D318B31
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 13:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhBKMwD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 07:52:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:56426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230109AbhBKMta (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Feb 2021 07:49:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D28164E79;
        Thu, 11 Feb 2021 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613047729;
        bh=iXe34DFEKawE6KmUW4NyxJD5p5KxYLvBOE7qh/9vsCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=POYcG2N/3klKAWGDdlkv9ZCLp+nwkUH4TQdYThDDOG470JDQXw0Qt2jdkWgegTI/E
         3inDFuztJrBRIMnD+A7jyo9DV+aJenFmEFFmPXFnfahbcgfIXhfaDGSx3ljZypkL76
         b7RgFVrnRHri77u/bD+rWR1EOkD/6JNI8Za30FfA=
Date:   Thu, 11 Feb 2021 13:48:47 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sylvain Pelissier <sylvain.pelissier@gmail.com>
Cc:     kopiga.rasiah@epfl.ch, linux-usb@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH] usb: video: fix descriptor structures macros
Message-ID: <YCUnr0cJC3GKIdof@kroah.com>
References: <20210128081259.20940-1-sylvain.pelissier@gmail.com>
 <YBJ0SQaTSM5PxZom@kroah.com>
 <CAOkUe-CJNg2iCZu3528TvsQXTT5-STRauiiDciB_AnbwE8qrHQ@mail.gmail.com>
 <CAOkUe-AV22j07eAY6N0_2x3_9Ogo3GSX=UW0p1qbXTsyf=oV9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOkUe-AV22j07eAY6N0_2x3_9Ogo3GSX=UW0p1qbXTsyf=oV9w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 09, 2021 at 05:16:45PM +0100, Sylvain Pelissier wrote:
> On Thu, 28 Jan 2021 at 18:17, Sylvain Pelissier
> <sylvain.pelissier@gmail.com> wrote:
> >
> > On Thu, 28 Jan 2021 at 09:22, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Jan 28, 2021 at 09:12:59AM +0100, Sylvain Pelissier wrote:
> > > > The macros defining structures for descriptors use token
> > > > pasting incorrectly. For example, the macro
> > > > UVC_EXTENSION_UNIT_DESCRIPTOR(1, 2) defines a structure named
> > > > uvc_extension_unit_descriptor_p_2 which should be
> > > > uvc_extension_unit_descriptor_1_2 instead.
> > > >
> > > > Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> > > > ---
> > > >  include/uapi/linux/usb/video.h | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> > > > index d854cb19c42c..1eb982df87a0 100644
> > > > --- a/include/uapi/linux/usb/video.h
> > > > +++ b/include/uapi/linux/usb/video.h
> > > > @@ -324,7 +324,7 @@ struct uvc_extension_unit_descriptor {
> > > >  #define UVC_DT_EXTENSION_UNIT_SIZE(p, n)             (24+(p)+(n))
> > > >
> > > >  #define UVC_EXTENSION_UNIT_DESCRIPTOR(p, n) \
> > > > -     uvc_extension_unit_descriptor_##p_##n
> > > > +     uvc_extension_unit_descriptor_##p##_##n
> > > >
> > > >  #define DECLARE_UVC_EXTENSION_UNIT_DESCRIPTOR(p, n)  \
> > > >  struct UVC_EXTENSION_UNIT_DESCRIPTOR(p, n) {         \
> > > > @@ -371,7 +371,7 @@ struct uvc_input_header_descriptor {
> > > >  #define UVC_DT_INPUT_HEADER_SIZE(n, p)                       (13+(n*p))
> > > >
> > > >  #define UVC_INPUT_HEADER_DESCRIPTOR(n, p) \
> > > > -     uvc_input_header_descriptor_##n_##p
> > > > +     uvc_input_header_descriptor_##n##_##p
> > > >
> > > >  #define DECLARE_UVC_INPUT_HEADER_DESCRIPTOR(n, p)    \
> > > >  struct UVC_INPUT_HEADER_DESCRIPTOR(n, p) {           \
> > > > @@ -406,7 +406,7 @@ struct uvc_output_header_descriptor {
> > > >  #define UVC_DT_OUTPUT_HEADER_SIZE(n, p)                      (9+(n*p))
> > > >
> > > >  #define UVC_OUTPUT_HEADER_DESCRIPTOR(n, p) \
> > > > -     uvc_output_header_descriptor_##n_##p
> > > > +     uvc_output_header_descriptor_##n##_##p
> > > >
> > > >  #define DECLARE_UVC_OUTPUT_HEADER_DESCRIPTOR(n, p)   \
> > > >  struct UVC_OUTPUT_HEADER_DESCRIPTOR(n, p) {          \
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > And no one noticed this?  If not, then why do we have these defines at
> > > all, as obviously they are not used :)
> >
> > The problem is not detected if you have descriptors with the second
> > argument different each time since the structure name will change. It
> > is maybe why it was not noticed. Nevertheless, the extension unit, the
> > input header and the output header descriptors are part of the USB
> > video class specification and are often used by devices. We have
> > detected the problem while implementing a usb gadget having such
> > descriptors.
> >
> Hi,
> Do I need to change something for this patch ?

I need an ack from the v4l maintainers before I can take it...

