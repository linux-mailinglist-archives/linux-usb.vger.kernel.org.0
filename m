Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C73026228A0
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 11:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiKIKjM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 05:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiKIKjL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 05:39:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F591BEBB
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 02:39:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 16713B81D7E
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 10:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BF7C433C1;
        Wed,  9 Nov 2022 10:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667990347;
        bh=8YUjxvjWHXoXvw/8p/KetBYSLIq1fyGGva7IKzNKGXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D4gpatqeh0Mw3huCmjAs2pYpuNIveqGK/Y2ATG9R23UbHbg5pKgfYUI416Zttyh0a
         Y3s2YwAaS4mMm09jTctIFVx0QdRr0OheTCgqxz0ZqqW5cEaEusttrKa/vChkYqrHXf
         4jbEEqkoM05Ym6LqgYqzZ0x4Blxk5T25jopme6d4=
Date:   Wed, 9 Nov 2022 11:39:04 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran@linuxembedded.co.uk, balbi@kernel.org, mgr@pengutronix.de
Subject: Re: [PATCH] uvc: gadget: uvc: Defer uvcg_complete_buffer() until
 .complete()
Message-ID: <Y2uDSLCXlM922EwB@kroah.com>
References: <20221003101627.144026-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003101627.144026-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 03, 2022 at 11:16:27AM +0100, Daniel Scally wrote:
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
> is encoded via uvc_video_encode_isoc_sg().
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

What commit id does this fix?  Should it go to stable kernels?

thanks,

greg k-h
