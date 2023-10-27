Return-Path: <linux-usb+bounces-2288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A137D9C68
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 16:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17A78B21473
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 14:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29CC374C3;
	Fri, 27 Oct 2023 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01F3716A
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 14:58:13 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 6B329C4
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 07:58:12 -0700 (PDT)
Received: (qmail 571154 invoked by uid 1000); 27 Oct 2023 10:58:11 -0400
Date: Fri, 27 Oct 2023 10:58:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Jayant Chowdhary <jchowdhary@google.com>, Thinh.Nguyen@synopsys.com,
  arakesh@google.com, etalvala@google.com, dan.scally@ideasonboard.com,
  gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb:gadget:uvc Do not use worker thread to pump usb
 requests
Message-ID: <7c30f943-aaad-47dd-9ae3-02f1ca57e49b@rowland.harvard.edu>
References: <ZToOJhyOFeGCGUFj@pengutronix.de>
 <20231026215635.2478767-1-jchowdhary@google.com>
 <20231027075117.GJ26306@pendragon.ideasonboard.com>
 <ZTuanepgXLXRoSMW@pengutronix.de>
 <20231027114752.GB12144@pendragon.ideasonboard.com>
 <ZTu9oEw1QEOxbHCf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTu9oEw1QEOxbHCf@pengutronix.de>

On Fri, Oct 27, 2023 at 03:39:44PM +0200, Michael Grzeschik wrote:
> On Fri, Oct 27, 2023 at 02:47:52PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 27, 2023 at 01:10:21PM +0200, Michael Grzeschik wrote:
> > > On Fri, Oct 27, 2023 at 10:51:17AM +0300, Laurent Pinchart wrote:
> > > > On Thu, Oct 26, 2023 at 09:56:35PM +0000, Jayant Chowdhary wrote:
> > > >> This patch is based on top of
> > > >> https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:
> > > >>
> > > >> When we use an async work queue to perform the function of pumping
> > > >> usb requests to the usb controller, it is possible that thread scheduling
> > > >> affects at what cadence we're able to pump requests. This could mean usb
> > > >> requests miss their uframes - resulting in video stream flickers on the host
> > > >> device.
> > > >>
> > > >> In this patch, we move the pumping of usb requests to
> > > >> 1) uvcg_video_complete() complete handler for both isoc + bulk
> > > >>    endpoints. We still send 0 length requests when there is no uvc buffer
> > > >>    available to encode.
> > > >
> > > > This means you will end up copying large amounts of data in interrupt
> > > > context. The work queue was there to avoid exactly that, as it will
> > > > introduce delays that can affect other parts of the system. I think this
> > > > is a problem.
> > > 
> > > Regarding Thin's argument about possible scheduling latency that is already
> > > introducing real errors, this seemed like a good solution.
> > > 
> > > But sure, this potential latency introduced in the interrupt context can
> > > trigger other side effects.
> > > 
> > > However I think we need some compromise since both arguments are very valid.
> > 
> > Agreed.
> > 
> > > Any ideas, how to solve this?
> > 
> > I'm afraid not.
> 
> We discussed this and came to the conclusion that we could make use of
> kthread_create and sched_setattr with an attr->sched_policy = SCHED_DEADLINE
> here instead of the workqueue. This way we would ensure that the worker
> would be triggered with hard definitions.
> 
> Since the SG case is not that heavy on the completion handler, we could
> also make this kthread conditionaly to the memcpy case.

If you don't mind a naive suggestion from someone who knows nothing 
about the driver...

An attractive possibility is to have the work queue (or kthread) do the 
time-consuming copying, but leave the submission up to the completion 
handler.  If the data isn't ready (or there's no data to send) when the 
handler runs, then queue a 0-length request.

That will give you the best of both worlds: low latency while in 
interrupt context and a steady, constant flow of USB transfers at all 
times.  The question of how to schedule the work queue or kthread is a 
separate matter, not directly relevant to this design decision.

Alan Stern

