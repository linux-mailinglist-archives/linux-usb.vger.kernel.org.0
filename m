Return-Path: <linux-usb+bounces-2736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 723697E632B
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 06:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CDA0B20C51
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 05:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5094FCA7F;
	Thu,  9 Nov 2023 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tcwndz8s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E736D22
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 05:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62476C433C7;
	Thu,  9 Nov 2023 05:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699507747;
	bh=CtFE+SQmZkMBdbiiFfBSQ/wbLt1J1G4kfwWEfLrg8Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcwndz8s5oMd/TjUYLcHALEkllOA4+fMNWBPdOfdbwqyqExZlhG67830/ByKqfZ93
	 flhoCOVR7KGliwVcZgBxng3Bwg9oKKOnqfsdpRbaVYW0nrDDb0Ik9FLgh6Aos01DyR
	 WaRXFwMwdS2JLvRV7/OVf2xy9P7Z9fgV3olXX++I=
Date: Thu, 9 Nov 2023 06:29:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jayant Chowdhary <jchowdhary@google.com>
Cc: dan.scally@ideasonboard.com, stern@rowland.harvard.edu,
	laurent.pinchart@ideasonboard.com, m.grzeschik@pengutronix.de,
	Thinh.Nguyen@synopsys.com, arakesh@google.com, etalvala@google.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5] usb:gadget:uvc Do not use worker thread to pump isoc
 usb requests
Message-ID: <2023110953-tavern-underwent-63e7@gregkh>
References: <20231103071353.1577383-1-jchowdhary@google.com>
 <20231109021251.542558-1-jchowdhary@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109021251.542558-1-jchowdhary@google.com>

On Thu, Nov 09, 2023 at 02:12:50AM +0000, Jayant Chowdhary wrote:
> When we use an async work queue to perform the function of pumping
> usb requests to the usb controller, it is possible that amongst other
> factors, thread scheduling affects at what cadence we're able to pump
> requests. This could mean isoc usb requests miss their uframes - resulting
> in video stream flickers on the host device.
> 
> To avoid this, we make the async_wq thread only produce isoc usb_requests
> with uvc buffers encoded into them. The process of queueing to the
> endpoint is done by the uvc_video_complete() handler. In case no
> usb_requests are ready with encoded information, we just queue a zero
> length request to the endpoint from the complete handler.
> 
> For bulk endpoints the async_wq thread still queues usb requests to the
> endpoint.
> 
> Change-Id: I8a33cbf83fb2f04376826185079f8b25404fe761
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Signed-off-by: Jayant Chowdhary <jchowdhary@google.com>
> Suggested-by: Avichal Rakesh <arakesh@google.com>
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> ---
>  Based on top of
>  https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:
>  v1->v2: Added self Signed-Off-by and addressed review comments
>  v2->v3: Encode to usb requests in async_wq; queue to ep in complete handler
> 	 for isoc transfers.
>  v3->v4: Address review comments around code style.
>  v4->v5: Update comments. Remove 0 length request queueing from async_wq
> 	 thread since it is already done by the complete handler.

You forgot to run checkpatch.pl :(

