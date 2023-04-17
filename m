Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0EAD6E4A53
	for <lists+linux-usb@lfdr.de>; Mon, 17 Apr 2023 15:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjDQNtj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Apr 2023 09:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjDQNti (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Apr 2023 09:49:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C451BEA
        for <linux-usb@vger.kernel.org>; Mon, 17 Apr 2023 06:49:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ACEA461DD6
        for <linux-usb@vger.kernel.org>; Mon, 17 Apr 2023 13:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C313DC433EF;
        Mon, 17 Apr 2023 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681739376;
        bh=Xhf5zVYxodNI8xKdvqKKDwo027Ylnm0m988ehiUfuy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sgzJPjGlPl6PFRRMZgb1kuYOJvsdqWEKRFIDVB+mkylfCaOHOIJqC8cH2gUgin2gT
         6vfONPD0eMOWo+n0qAeJQpLnB6FGNcClc9EKgTSExwDC6EUl89ntFa7OUJMMhCvp9r
         Jlpr+2Kg1sbNlDgrqaq7c1YyzI5DYqrulk9mrV4w=
Date:   Mon, 17 Apr 2023 15:49:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Message-ID: <ZD1ObUuy8deAvupf@kroah.com>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 14, 2023 at 02:03:02PM -0700, Avichal Rakesh wrote:
> Hey all,
> 
> First off, I am very new to the kernel space, so apologies for any
> newb mistakes. Please feel free to point them out!
> 
> I've been trying to get the UVC gadget driver to work on an Android
> device and have been seeing partial/glitched frames when streaming to
> a Linux (or Windows) host fairly frequently (once every 2-4s). The UVC
> gadget driver shows no error/exception logs, and neither does the
> host's UVC driver.
> 
> Enabling tracing for the UVC gadget driver and the host's UVC driver
> shows that the gadget sees a missed ISOC transfer, and the host sees a
> frame with suspiciously low packet count at the same time as the
> glitched frame.
> 
> ```
> [691171.704583] usb 1-4: frame 9274 stats: 0/8/8 packets, 0/0/0 pts
> (!early !initial), 7/8 scr, last pts/stc/sof 0/259279856/14353
> [691171.704602] usb 1-4: Frame complete (EOF found)
> [691171.732584] usb 1-4: frame 9275 stats: 0/4/4 packets, 0/0/0 pts
> (!early !initial), 3/4 scr, last pts/stc/sof 0/261131744/14661
> [691171.732621] usb 1-4: Frame complete (EOF found)
> [691171.768578] usb 1-4: frame 9276 stats: 0/8/8 packets, 0/0/0 pts
> (!early !initial), 7/8 scr, last pts/stc/sof 0/262525136/14894
> [691171.768616] usb 1-4: Frame complete (EOF found)
> ```
> 
> For reference, I am streaming 640x480 MJPEG frames of a (mostly)
> static scene, and every frame takes 7-8 packets (~22kB). So 4 packets
> for a frame is definitely not normal. From the logs, it looks like the
> host sees an EOF header for the video frame that had the ISOC failure
> and tries to display the frame with a partial buffer resulting in the
> glitched frame.

But with isoc packets, it's ok to drop them, that's what the protocol is
for.  If you require loss-less data transfer, you can NOT use isoc
endpoints.

So this sounds like it is working correctly, but you need to figure out
why your device can't keep up on the data stream properly.

> This can happen because the UVC gadget driver waits for the encode
> loop to drop the video frame
> (https://lore.kernel.org/all/20221018215044.765044-4-w36195@motorola.com/).
> However, because video frames are encoded (to usb_requests)
> asynchronously, it is possible that the video frame is completely
> encoded before the ISOC transfer failure is reported. In this case,
> the next frame would be dropped, but the frame with missed ISOC will
> remain in queue.

So you need a faster processor?  :)

> This problem may be further exaggerated by the DWC3 controller driver
> (which is what my device has) not setting the IMI flag when
> no_interrupt flag is set
> (https://lore.kernel.org/all/ced336c84434571340c07994e3667a0ee284fefe.1666735451.git.Thinh.Nguyen@synopsys.com/)?
> UVC Gadget Driver sets the no_interrupt flag for ~3/4 of its queued
> usb_request, so an ISOC failure may not immediately interrupt the UVC
> gadget driver, leaving more time for the frame to finish encoding.
> 
> I couldn't find any concrete error handling rules in the UVC specs, so
> I am not sure what the proper solution here is. To try out, I created
> a patch (attached below) that dequeues all queued usb_requests from
> the endpoint in case of an ISOC failure and clears the uvc buffer
> queue. This eliminated the partial frames with no perceivable frame
> drops.
> 
> So my questions here are:
> 1. Is this a known issue, and if so are there workarounds for it?
> 2. If the answer to above is "No", does the explanation and mitigation
> seem reasonable?
> 
> Patch follows (mostly for illustration, I can formalize it if
> needed!). It adds a new 'req_inflight' list to track queued
> usb_requests that have not been given back to the gadget driver and
> drops all the queued requests in case of an ISOC failure. The other
> changes are for the extra bookkeeping required to handle dropping all
> frames. I haven't been able to confirm it, but as far as I can tell
> the issue exists at ToT as well.
> 
> ---
> drivers/usb/gadget/function/uvc.h | 6 ++-
> drivers/usb/gadget/function/uvc_queue.c | 16 ++++--
> drivers/usb/gadget/function/uvc_queue.h | 2 +-
> drivers/usb/gadget/function/uvc_video.c | 71 +++++++++++++++++++------
> 4 files changed, 72 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h
> b/drivers/usb/gadget/function/uvc.h
> index 100475b1363e..d2c837011546 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -80,7 +80,8 @@ struct uvc_request {
> struct uvc_video *video;
> struct sg_table sgt;
> u8 header[UVCG_REQUEST_HEADER_LEN];
> - struct uvc_buffer *last_buf;
> + struct uvc_buffer *uvc_buf;
> + bool is_last;
> };

The patch is corrupted and can't be applied by anyone, sorry :(

Please fix up your email client and submit it as a real patch?

thanks,

greg k-h
