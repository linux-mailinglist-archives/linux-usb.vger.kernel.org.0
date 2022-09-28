Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92BED5EE671
	for <lists+linux-usb@lfdr.de>; Wed, 28 Sep 2022 22:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbiI1UNK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Sep 2022 16:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234179AbiI1UM7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Sep 2022 16:12:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04640A4848
        for <linux-usb@vger.kernel.org>; Wed, 28 Sep 2022 13:12:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D5C147C;
        Wed, 28 Sep 2022 22:12:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664395968;
        bh=0azwr/I0QMQqIH3cifTGSvyYWcNGNfHvgAhrM4CSiqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kIuTT8Sv6ZsoghnIrDhj27KbevEB2UfEemVNN60P4+U4gb37XF+kLNj1YNlkeFQ0s
         ny1IIMuVBf0KqPmVzk0BT6g1Mu4SfMt3wPW5eoITZubehG7zE2ztxVs+ui+Q4aa7si
         hBX8URvicVjM+7w5Xz8gz4jg/35ebrFUs9/g21kY=
Date:   Wed, 28 Sep 2022 23:12:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Dan Vacura <w36195@motorola.com>, linux-usb@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 3/5] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <YzSqvuMxeK3FOYfH@pendragon.ideasonboard.com>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-4-m.grzeschik@pengutronix.de>
 <Yl8fwdOuxYDVrujW@pendragon.ideasonboard.com>
 <YmwzxIV5/a+ZNLXI@p1g3>
 <20220429200137.GE7671@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220429200137.GE7671@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Fri, Apr 29, 2022 at 10:01:37PM +0200, Michael Grzeschik wrote:
> Hi Dan,
> Hi Laurent,
> 
> On Fri, Apr 29, 2022 at 01:51:48PM -0500, Dan Vacura wrote:
> > Thanks for this change it improves the performance with the DWC3
> > controller on QCOM chips in an Android 5.10 kernel. I haven't tested the
> > scatter/gather path, so memcpy was used here via
> > uvc_video_encode_isoc(). I was able to get around 30% improvement (fps
> > on host side). I did modify the alloc to only set the WQ_HIGHPRI flag.
> >
> > On Tue, Apr 19, 2022 at 11:46:57PM +0300, Laurent Pinchart wrote:
> >> Thank you for the patch.
> >>
> >> On Sun, Apr 03, 2022 at 01:39:12AM +0200, Michael Grzeschik wrote:
> >> > Likewise to the uvcvideo hostside driver, this patch is changing the
> >> > simple workqueue to an async_wq with higher priority. This ensures that
> >> > the worker will not be scheduled away while the video stream is handled.
> >> >
> >> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> >> > +	video->async_wq = alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPRI, 0);
> >>
> >> Unless I'm mistaken, an unbound work queue means that multiple CPUs will
> >> handle tasks in parallel. Is that safe ?
> >
> > I found that with the WQ_UNBOUND flag I didn't see any performance
> > improvement to the baseline, perhaps related to cpu caching or
> > scheduling delays. I didn't notice any stability problems or concurrent
> > execution. Do you see any benefit to keeping the WQ_UNBOUND flag?
> 
> I actually copied this from drivers/media/usb/uvc/uvc_driver.c ,
> which is also allocating the workqueue with WQ_UNBOUND.
> 
> Look into drivers/media/usb/uvc/uvc_driver.c + 486
> 
> 	stream->async_wq = alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPRI,

Just for the record, as a newer version of this patch has been merged,
the host-side uvcvideo driver is specifically made to handle multiple
work items in parallel. Each work item will essentially perform one or
multiple memcpy operations, with the size and offset calculated by the
code that dispatches the work items.

As Lucas separately commented, the UVC gadget driver has a single
work_struct, so there can't be any concurrency. We seem to be safe for
now.

> In my tests, continous streaming did not trigger any errors. In fact if
> this would be unsafe, the issue would probably trigger early, numerous
> and obvious on multicore cpus.
> 
> However, some users seem to have seen recent issues on unplugging the
> cable while streaming. I have to check if this could be related.
> 
> >> > +	if (!video->async_wq)
> >> > +		return -EINVAL;

-- 
Regards,

Laurent Pinchart
