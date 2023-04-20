Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA5F6E9A88
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 19:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbjDTRUV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Apr 2023 13:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbjDTRUN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Apr 2023 13:20:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B30E44AE
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 10:20:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54B8F9DE;
        Thu, 20 Apr 2023 19:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682011193;
        bh=ZoNVTyLc/tmgT9Tdt64+rznxDWli7COr3nrn2nkwC1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZLbx1cjOdZLvNrM9y4Mb+TJh/m4McfN+hSXaiS4rBwO6acJe4+MPBah4aQVvHsZgN
         6J+3b7o3iGJX+oXIoQyqiT10uuy/hZSkGPMkg/G33H39IBHCHntgr5L4CZr69nmMbI
         8+xkoYu1+vCE+VToppV3wKijJeCSLXy6ijx7eTu0=
Date:   Thu, 20 Apr 2023 20:20:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Message-ID: <20230420172011.GF21943@pendragon.ideasonboard.com>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Avichal,

First of all, thank you for looking into the problem and initiating this
discussion. The whole mail thread was very helpful, Thanks to Thinh and
Alan as well for all the help.

On Tue, Apr 18, 2023 at 10:26:11PM -0700, Avichal Rakesh wrote:
> On Tue, Apr 18, 2023 at 6:07 PM Alan Stern wrote:
> > On Tue, Apr 18, 2023 at 03:45:53PM -0700, Avichal Rakesh wrote:
> > > I see, and I think I understand Greg's previous comment better as
> > > well: The UVC driver isn't falling behind on the video stream, it is
> > > falling behind the usb controller's monotonic isoc stream.
> > >
> > > From what I can see, this leaves us in an interesting place: UVC
> > > allows the host to configure the camera's output resolution and fps,
> > > which effectively controls how fast the camera is generating data.
> > > This is at odds with the UVC gadget driver, which currently packs each
> > > video frame into as few usb_requests as possible (using the full
> > > available size in usb_requests). Effectively, the UVC gadget driver
> > > attempts to use the "full" bandwidth of isoc transfers even when the
> > > camera isn't generating data fast enough. For example, in my
> > > observations: 1 video frame is ~22kB. At 30fps, this represents 1/30
> > > of the amount of data the camera would generate in a second. This 22kB
> > > is split into 8 usb_requests which is about 1/1000 the number of
> > > requests UVC driver needs to generate per second to prevent isoc
> > > failures (assuming 125us monotonic uframes). Assuming some fudge
> > > factor from the simplifications in your explanation gives the uvc
> > > driver some extra leeway with request queuing, we're still roughly two
> > > order of magnitudes out of sync. Even with perfect 'complete'
> > > callbacks and video frame encodings, an underrun seems inevitable.
> > > Data is being generated at a far slower rate than it is being
> > > transferred. Does this reasoning seem valid?
> > >
> > > Just as a test I'll try updating the UVC driver to consume 266
> > > usb_requests per video frame (~1/30 of 8000), which should be enough
> > > to keep the usb controller queue occupied for ~1/30s. Ideally, by the
> > > time the controller queue is empty, the camera would have produced a
> > > new frame. This doesn't solve the issue with latencies around callback
> > > and an isoc failure might still happen, hopefully the failure
> > > frequency is reduced because UVC queues enough requests per video
> > > frame to not starve the controller's queue while waiting on a new
> > > frame and the only way they go out of sync is from 'complete' callback
> > > timings. I am assuming this has been tried before, but my LKML search
> > > skills are failing and I can't find much on it.
> >
> > Note that there's nothing wrong with submitting a 0-length isochronous
> > transfer.  If there's no data left but you still need to send
> > _something_ in order to fill out the remaining slots in the controller's
> > schedule, this is a good way to do it.
>
> Oh, this is very good to know, thank you!! We just need to reach a
> steady state of UVC queuing enough requests monotonically (even if
> they are empty), and the usb controller calling the 'complete'
> callback to give it more requests to queue. Although I wonder how the
> host's UVC driver would interpret the zero length packets, if it would
> even care.
> 
> I am unfortunately being pulled into some other work for the next few
> days, but I will try out both: splitting one frame into many many
> requests and just sending 0 length requests, and see what happens on
> the host. Will report back with what I find.

I'm looking forward to this :-)

> Any other insights are
> welcome. I want to fix this problem for good if possible, and am happy
> to try out whatever it takes!

As far as I understand, we have two ways forward here to avoid running
out of requests to send: sending data as quickly as possible (maximizing
the number of bytes sent in each packet) and filling up with 0-length
requests in-between, and spreading the data across packets. I'll call
the first one burst mode for lack of a better term.

Both mechanisms require a form of dynamic rate adaptation, monitoring
the consumption of bytes or packets by the UDC to decide how to fill the
next packets. In non-burst mode, we may still need to insert zero-length
packets if we really run out of data (for instance in case of a V4L2
buffer queue underrun), so the burst mode implementation may be simpler.

On the host side, both option should work, the uvcvideo driver shouldn't
have any problem with zero-length packets. As the driver offloads memcpy
operations to a work queue, I believe burst mode would be more efficient
on the host side as it would lower the number of times the work queue
needs to be woken up, and overall reduce the work performed in interrupt
context. If burst mode doesn't negatively impact the gadget side (from a
CPU time or a power consumption point of view), it would thus be
preferred.

-- 
Regards,

Laurent Pinchart
