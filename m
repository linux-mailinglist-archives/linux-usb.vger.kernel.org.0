Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01996E70A8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 03:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbjDSBHW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 21:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjDSBHV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 21:07:21 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C468A55B2
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 18:07:18 -0700 (PDT)
Received: (qmail 445852 invoked by uid 1000); 18 Apr 2023 21:07:17 -0400
Date:   Tue, 18 Apr 2023 21:07:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala \(Eddy\)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Message-ID: <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 18, 2023 at 03:45:53PM -0700, Avichal Rakesh wrote:
> I see, and I think I understand Greg's previous comment better as
> well: The UVC driver isn't falling behind on the video stream, it is
> falling behind the usb controller's monotonic isoc stream.
> 
> From what I can see, this leaves us in an interesting place: UVC
> allows the host to configure the camera's output resolution and fps,
> which effectively controls how fast the camera is generating data.
> This is at odds with the UVC gadget driver, which currently packs each
> video frame into as few usb_requests as possible (using the full
> available size in usb_requests). Effectively, the UVC gadget driver
> attempts to use the "full" bandwidth of isoc transfers even when the
> camera isn't generating data fast enough. For example, in my
> observations: 1 video frame is ~22kB. At 30fps, this represents 1/30
> of the amount of data the camera would generate in a second. This 22kB
> is split into 8 usb_requests which is about 1/1000 the number of
> requests UVC driver needs to generate per second to prevent isoc
> failures (assuming 125us monotonic uframes). Assuming some fudge
> factor from the simplifications in your explanation gives the uvc
> driver some extra leeway with request queuing, we're still roughly two
> order of magnitudes out of sync. Even with perfect 'complete'
> callbacks and video frame encodings, an underrun seems inevitable.
> Data is being generated at a far slower rate than it is being
> transferred. Does this reasoning seem valid?
> 
> Just as a test I'll try updating the UVC driver to consume 266
> usb_requests per video frame (~1/30 of 8000), which should be enough
> to keep the usb controller queue occupied for ~1/30s. Ideally, by the
> time the controller queue is empty, the camera would have produced a
> new frame. This doesn't solve the issue with latencies around callback
> and an isoc failure might still happen, hopefully the failure
> frequency is reduced because UVC queues enough requests per video
> frame to not starve the controller's queue while waiting on a new
> frame and the only way they go out of sync is from 'complete' callback
> timings. I am assuming this has been tried before, but my LKML search
> skills are failing and I can't find much on it.

Note that there's nothing wrong with submitting a 0-length isochronous 
transfer.  If there's no data left but you still need to send 
_something_ in order to fill out the remaining slots in the controller's 
schedule, this is a good way to do it.

Alan Stern
