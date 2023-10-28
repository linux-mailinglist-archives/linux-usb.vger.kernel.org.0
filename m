Return-Path: <linux-usb+bounces-2308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C8F7DA536
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 07:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE941F21EF8
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 05:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B1D139D;
	Sat, 28 Oct 2023 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jO2XJe1j"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11387FD
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 05:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C73C433C7;
	Sat, 28 Oct 2023 05:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698471049;
	bh=DAtpQvMGMBvuauUAWILOC1KqmmeeZ++9aiDqUvAqdrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jO2XJe1j/4bVAIJKcz+lj2mlLLvQJiVvCjeuPAzfVTpLFkoYH8cj+b+fOyqZ2P2bA
	 znQG9GyLj5+1cFPsoZ05qggzL/s95rE72ti0ouqovxEEiZXvI5bTpVXzHKxWaYlS0A
	 5YjOVEJ8lWU3/lR5pcMzTHlJ/BtRWQCUOnZrA4gA=
Date: Sat, 28 Oct 2023 07:30:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Avichal Rakesh <arakesh@google.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com, etalvala@google.com,
	jchowdhary@google.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, m.grzeschik@pengutronix.de
Subject: Re: [PATCH v8 2/4] usb: gadget: uvc: Allocate uvc_requests one at a
 time
Message-ID: <2023102823-embargo-envy-5fcb@gregkh>
References: <20231019185319.2714000-1-arakesh@google.com>
 <20231024183605.908253-1-arakesh@google.com>
 <20231024183605.908253-2-arakesh@google.com>
 <421d1996-8544-45ac-9f31-551ef597546c@ideasonboard.com>
 <1d3777ec-ac12-4a9a-a19c-fb7d5013a0a6@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d3777ec-ac12-4a9a-a19c-fb7d5013a0a6@google.com>

On Fri, Oct 27, 2023 at 01:31:26PM -0700, Avichal Rakesh wrote:
> >> @@ -322,6 +325,7 @@ uvc_video_free_requests(struct uvc_video *video)
> >>   static int
> >>   uvc_video_alloc_requests(struct uvc_video *video)
> >>   {
> >> +    struct uvc_request *ureq;
> >>       unsigned int req_size;
> >>       unsigned int i;
> >>       int ret = -ENOMEM;
> >> @@ -332,29 +336,34 @@ uvc_video_alloc_requests(struct uvc_video *video)
> >>            * max_t(unsigned int, video->ep->maxburst, 1)
> >>            * (video->ep->mult);
> >>
> >> -    video->ureq = kcalloc(video->uvc_num_requests, sizeof(struct uvc_request), GFP_KERNEL);
> >> -    if (video->ureq == NULL)
> >> -        return -ENOMEM;
> >> +    INIT_LIST_HEAD(&video->ureqs);
> > 
> > 
> > Probably unecessary here; it's done in uvc_video_free_requests() and uvcg_video_init() already
> 
> Ah, that is fair. Added a BUG_ON instead, like we do for video->req_size
> so we still catch cases where the state might be inconsistent.

Please no, that means you just crashed a machine and all data is lost
and the user will get very mad.

Either handle the error properly or it's something that can never happen
and so you don't need to handle it.

thanks,

greg k-h

