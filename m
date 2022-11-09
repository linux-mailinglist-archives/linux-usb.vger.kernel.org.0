Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 798B36228D9
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 11:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbiKIKqY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 05:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbiKIKqX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 05:46:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EA41260E
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 02:46:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A66C3B81D7E
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 10:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC330C433C1;
        Wed,  9 Nov 2022 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667990778;
        bh=Xd3SdwHbFxp4QRIBw3u3bpCilccN3wcHpPU/ux0r6RQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cHmadIJhvUzi0PrIfM6IYnMRgnTNDTnLjUgeXHI5PBJliomBcqM5xUbd/F9/uGnEW
         9s1vjO7yEu+jKkvlARMmsT/Qvuziy8EB/6ariyt8je105/fUp3YjygKDri8+gxdbDN
         bSqkHBEzq5ozEk4XPvXl7to/UL35vHwhmWEuveTs=
Date:   Wed, 9 Nov 2022 11:46:15 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran@linuxembedded.co.uk, balbi@kernel.org, mgr@pengutronix.de,
        w36195@motorola.com
Subject: Re: [PATCH v2] uvc: gadget: uvc: Defer uvcg_complete_buffer() until
 .complete()
Message-ID: <Y2uE94G9y99ynP7r@kroah.com>
References: <20221019124535.2712902-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019124535.2712902-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 19, 2022 at 01:45:35PM +0100, Daniel Scally wrote:
> Calling uvcg_complete_buffer() from uvc_video_encode_isoc() sometimes
> causes the final isoc packet for a video frame to be delayed long
> enough to cause the USB controller to drop it. The first isoc packet
> of the next video frame is then received by the host, which interprets
> the toggled FID bit correctly such that the stream continues without
> interruption, but the first frame will be missing the last isoc
> packet's worth of bytes.
> 
> To fix the issue delay the call to uvcg_complete_buffer() until the
> usb_request's .complete() callback, as already happens when the data
> is encoded via uvc_video_encode_isoc_sg(). For consistency's sake the
> same change is applied to uvc_video_encode_bulk().
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> 
> Changes in v2:
> 
> 	- Applied the same change to uvc_video_encode_bulk() for consistency
> 
> @Dan - In the end I thought this is probably worth separating from your "usb:
> gadget: uvc: fix sg handling in error case" patch, since it fixes a separate
> issue by itself. I _think_ they're separable but I wasn't experiencing the
> problem you were so I can't test that - let me know if I'm wrong.
> 
> @Michael - I dropped your R-b since I made the change to uvc_video_encode_bulk()
> too, didn't want to jump the gun :)


Does not apply to my tree anymore :(

Can you rebase against the usb-linus branch of usb.git and resend?

thanks,

greg k-h
