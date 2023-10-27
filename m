Return-Path: <linux-usb+bounces-2253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9397D90DA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A2651C20985
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 08:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA2B12B86;
	Fri, 27 Oct 2023 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u2m7h3lR"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D941125AC;
	Fri, 27 Oct 2023 08:13:57 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8C4FA;
	Fri, 27 Oct 2023 01:13:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 562EE669;
	Fri, 27 Oct 2023 10:13:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698394421;
	bh=2NFevOPSc8lFCix/agYkubSp5saJmMndfMj5KyFbmNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2m7h3lRj54hK+4J/TI9tIagzfQY57nLkhz3ZnceMjcmQfjDrjN/yI9g7eJlMQ9Kr
	 EU7LUDV7r1gjt3VoSXX/XtD+arQxQcQShiDY/o1WMU6IwtdWRqNrNLU+0Ti2q/VGrk
	 5N4El1IC3Ds4wy27/O6aZlIJfdgEoyP9Xay5438A=
Date: Fri, 27 Oct 2023 11:14:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Jayant Chowdhary <jchowdhary@google.com>,
	"mgr@pengutronix.de" <mgr@pengutronix.de>,
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
Message-ID: <20231027081400.GM26306@pendragon.ideasonboard.com>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
 <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
 <20231020233044.dh63nu3tkbmrtfl4@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231020233044.dh63nu3tkbmrtfl4@synopsys.com>

On Fri, Oct 20, 2023 at 11:30:52PM +0000, Thinh Nguyen wrote:
> Sorry for the delay response.
> 
> On Sun, Oct 15, 2023, Jayant Chowdhary wrote:
> > On 10/12/23 11:50, Thinh Nguyen wrote:
> > > The frequency of the request submission should not depend on the
> > > video_pump() work thread since it can vary. The frequency of request
> > > submission should match with the request completion. We know that
> > > request completion rate should be fixed (1 uframe/request + when you
> > > don't set no_interrupt). Base on this you can do your calculation on how
> > > often you should set no_interrupt and how many requests you must submit.
> > > You don't have to wait for the video_pump() to submit 0-length requests.
> > >
> > > The only variable here is the completion handler delay or system
> > > latency, which should not be much and should be within your calculation.
> > 
> > 
> > Thanks for the suggestion. It indeed makes sense that we do not completely depend on
> > video_pump() for sending 0 length requests. I was concerned about
> > synchronization needed when we send requests to the dwc3 controller from
> > different threads. I see that the dwc3 controller code does internally serialize
> > queueing requests, can we expect this from other controllers as well ? 
> 
> While it's not explicitly documented, when the gadget driver uses
> usb_ep_queue(), the order in which the gadget recieves the request
> should be maintained and serialized. Because the order the transfer go
> out for the same endpoint can be critical, breaking this will cause
> issue.

That's right, but if usp_ep_queue() is called from multiple contexts,
there's no guarantee it can provide when it comes to the ordering. The
caller has to handle it.

> > This brings me to another question for Michael - I see
> > that we introduced a worker thread for pumping  usb requests to the usb endpoint
> > in https://urldefense.com/v3/__https://lore.kernel.org/all/20200427151614.10868-1-m.grzeschik@pengutronix.de/__;!!A4F2R9G_pg!aAnzCopbTbZtUxBK6a6r6_QzV-b2Z2J5o5esPaartZ2jogKijmhqj6OyiKDg-BPhxq8pJHR3HS1Hf8z6YnqfWTon$ 
> > (I see multiple email addresses, so apologies if I used the incorrect one).
> > 
> > Did we introduce the worker thread to solve some specific deadlock scenarios ?
> > Or was it a general mitigation against racy usb request submission from v4l2 buffer
> > queuing, stream enable and the video complete handler firing ?
> > 
> > I was chatting with Avi about this, what if we submit requests to the endpoint
> > only at two points in the streaming lifecycle - 
> > 1) The whole 64 (or however many usb requests are allocated) when
> >    uvcg_video_enable() is called - with 0 length usb_requests.
> > 2) In the video complete handler - if a video buffer is available, we encode it
> >    and submit it to the endpoint. If not, we send a 0 length request.
> > 
> > This way we're really maintaining back pressure and sending requests as soon
> > as we can to the dwc3 controller. Encoding is mostly memcpys from what I see
> > so hopefully not too heavy on the interrupt handler. I will work on prototyping
> > this meanwhile.
> 
> That sounds good to me. I believe Michael already provided some test
> patches and you've already done some preliminary tests for that right?

-- 
Regards,

Laurent Pinchart

