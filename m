Return-Path: <linux-usb+bounces-2252-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E37D90D2
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB0B8282345
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 08:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D90125DC;
	Fri, 27 Oct 2023 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DcZkDPIF"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC8F125A2;
	Fri, 27 Oct 2023 08:12:21 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9179E1B8;
	Fri, 27 Oct 2023 01:12:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 631BD669;
	Fri, 27 Oct 2023 10:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698394324;
	bh=JLv2vTWkskZ3ZZMv11yo8j22UILAnBsQU2Zv/ZRoRwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DcZkDPIFdV/Cgf+Af4Yl2thMKz7zdrb2LLPD4kJSPp48uGi/xFtnZO5a17c8+ZZkb
	 03Kr38AsmAAVKTLcaFtqH11PE8OsnVVXC8YRRle6YS32dAPV9UoaGl66aKAj81R1y2
	 dU/KXakAo1aSy1hkb0FvLvDa0CgcoMuUYP6z+UpM=
Date: Fri, 27 Oct 2023 11:12:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Jayant Chowdhary <jchowdhary@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"etalvala@google.com" <etalvala@google.com>,
	"arakesh@google.com" <arakesh@google.com>
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Message-ID: <20231027081223.GL26306@pendragon.ideasonboard.com>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
 <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
 <ZS/dmTjdCCdnelVP@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZS/dmTjdCCdnelVP@pengutronix.de>

On Wed, Oct 18, 2023 at 03:28:57PM +0200, Michael Grzeschik wrote:
> On Sun, Oct 15, 2023 at 09:33:43PM -0700, Jayant Chowdhary wrote:
> >On 10/12/23 11:50, Thinh Nguyen wrote:
> >> On Mon, Oct 09, 2023, Jayant Chowdhary wrote:
> >>>> On Fri, Oct 06, 2023 at 03:03:56PM -0700, Jayant Chowdhary wrote:
> >>>>> We had been seeing the UVC gadget driver receive isoc errors while
> >>>>> sending packets to the usb endpoint - resulting in glitches being shown
> >>>>> on linux hosts. My colleague Avichal Rakesh and others had a very
> >>>>> enlightening discussion at
> >>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/8741b7cb-54ec-410b-caf5-697f81e8ad64@google.com/T/__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gQ73n_-Y$
> >>>>>
> >>>>>
> >>>>> The conclusion that we came to was : usb requests with actual uvc frame
> >>>>> data were missing their scheduled uframes in the usb controller. As a
> >>>>> mitigation, we started sending 0 length usb requests when there was no
> >>>>> uvc frame buffer available to get data from. Even with this mitigation,
> >>>>> we are seeing glitches - albeit at a lower frequency.
> >>>>>
> >>>>> After some investigation, it is seen that we’re getting isoc errors when
> >>>>> the worker thread serving video_pump() work items, doesn’t get scheduled
> >>>>> for longer periods of time - than usual - in most cases > 6ms.
> >>>>> This is close enough to the 8ms limit that we have when the number of usb
> >>>>> requests in the queue is 64 (since we have a 125us uframe period). In order
> >>>>> to tolerate the scheduling delays better, it helps to increase the number of
> >>>>> usb requests in the queue . In that case, we have more 0 length requests
> >>>>> given to the udc driver - and as a result we can wait longer for uvc
> >>>>> frames with valid data to get processed by video_pump(). I’m attaching a
> >>>>> patch which lets one configure the upper bound on the number of usb
> >>>>> requests allocated through configfs. Please let me know your thoughts.
> >>>>> I can formalize  the patch if it looks okay.
> >>>> Why do you want to limit the upper bound?  Why not just not submit so
> >>>> many requests from userspace as you control that, right?
> >>>
> >>> Userspace negotiates a video frame rate (typically 30/60fps) with the host that does
> >>> not necessarily correspond to the ISOC cadence. After the
> >>> patch at https://urldefense.com/v3/__https://lkml.org/lkml/diff/2023/5/8/1115/1__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gWbb9bvy$  was submitted, we are
> >>> maintaining back pressure on the usb controller even if we do not have uvc frame
> >>> data, by sending the controller 0 length requests (as long as usb_requests are
> >>> available). Also, even if the userspace application were to somehow produce
> >>> data to match the ISOC rate, it would  need to have information about USB
> >>> timing details - which I am not sure is available to userspace or is the right
> >>> thing to do here ?
> >>>
> >>> Here, we are trying to handle the scenario in which the video_pump() worker
> >>> thread does not get scheduled in time - by increasing the number of usb requests
> >>> allocated in the queue. This would send more usb requests to the usb controller,
> >>> when video_pump() does get scheduled - even if they're 0 length. This buys
> >>> the video_pump() worker thread scheduling time -since more usb requests
> >>> are with the controller, subsequent requests sent will not be 'stale' and
> >>> dropped by the usb controller.
> >>>
> >> I believe you're testing against dwc3 controller right? I may not be as
> >> familiar with UVC function driver, but based on the previous
> >> discussions, I think the driver should be able to handle this without
> >> the user input.
> >
> > Yes we are testing against the dwc3 controller.
> >
> >> The frequency of the request submission should not depend on the
> >> video_pump() work thread since it can vary. The frequency of request
> >> submission should match with the request completion. We know that
> >> request completion rate should be fixed (1 uframe/request + when you
> >> don't set no_interrupt). Base on this you can do your calculation on how
> >> often you should set no_interrupt and how many requests you must submit.
> >> You don't have to wait for the video_pump() to submit 0-length requests.
> >>
> >> The only variable here is the completion handler delay or system
> >> latency, which should not be much and should be within your calculation.
> >
> > Thanks for the suggestion. It indeed makes sense that we do not completely depend on
> > video_pump() for sending 0 length requests. I was concerned about
> > synchronization needed when we send requests to the dwc3 controller from
> > different threads. I see that the dwc3 controller code does internally serialize
> > queueing requests, can we expect this from other controllers as well ?
> >
> > This brings me to another question for Michael - I see
> > that we introduced a worker thread for pumping  usb requests to the usb endpoint
> > in https://lore.kernel.org/all/20200427151614.10868-1-m.grzeschik@pengutronix.de/
> > (I see multiple email addresses, so apologies if I used the incorrect one).
> >
> > Did we introduce the worker thread to solve some specific deadlock scenarios ?
> 
> Exactly. This was the reason why we moved to the pump worker.

Correct, but it also has the side effect of lowering the amount of time
spent in interrupt context. It would be potentially problematic to
revert to copying in the completion handler.

> I actually
> looked into the host side implementation of the uvc driver. There we
> also queue an worker from the complete function:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_video.c#n1646

This was implemented for the sole purpose of improving performance, as
the memcpy was too much for a single CPU to handle.

> So this sounded reasonable to me. However we faced similar issues like
> you and introduced different ways to improve the latency issue.
> 
> One thing we did was improving the latency by adding WQ_HIGHPRI
> 
> https://lore.kernel.org/linux-usb/20220907215818.2670097-1-m.grzeschik@pengutronix.de/
> 
> Another patch here is also adding WQ_CPU_INTENSIVE.
> 
> But, after all the input from Thinh it is probably better to solve the
> issue in a more reliable way.
> 
> >Or was it a general mitigation against racy usb request submission from v4l2 buffer
> >queuing, stream enable and the video complete handler firing ?
> 
> I don't remember all of the issues we saw back then. But this is also an very
> likely scenario.
> 
> > I was chatting with Avi about this, what if we submit requests to the endpoint
> > only at two points in the streaming lifecycle -
> > 1) The whole 64 (or however many usb requests are allocated) when
> >    uvcg_video_enable() is called - with 0 length usb_requests.
> > 2) In the video complete handler - if a video buffer is available, we encode it
> >    and submit it to the endpoint. If not, we send a 0 length request.
> 
> It really sounds like a good idea.
> 
> > This way we're really maintaining back pressure and sending requests as soon
> > as we can to the dwc3 controller. Encoding is mostly memcpys from what I see
> > so hopefully not too heavy on the interrupt handler. I will work on prototyping
> > this meanwhile.

-- 
Regards,

Laurent Pinchart

