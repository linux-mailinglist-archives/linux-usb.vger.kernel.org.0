Return-Path: <linux-usb+bounces-565-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3C7AD7B2
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 14:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 7D3D7281ED3
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 12:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055621B278;
	Mon, 25 Sep 2023 12:08:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A361B270
	for <linux-usb@vger.kernel.org>; Mon, 25 Sep 2023 12:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA89C433C8;
	Mon, 25 Sep 2023 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695643714;
	bh=2G0uOhtTT0RICzrpge27cbr0RwESvs2DqRkS9VKgySM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qba3VSvMi4VaMD2PSc5jvYmcYgW/cPnqPjRrFxmM/7jAhWsHixSZF3kFtsuSUP3m9
	 WsVYwAV7KIkWa+RwWIRSEBdGCRaOyKfrxiYbfe09hkaioJOi50SK0HUrY3ymIJaVRg
	 ffqlnRHks88TbOEf9jViPh2Ocz94SO/W6CO0WijA=
Date: Mon, 25 Sep 2023 14:08:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jia-Ju Bai <baijiaju@buaa.edu.cn>
Cc: hminas@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc2: fix possible NULL pointer dereference
 caused by driver concurrency
Message-ID: <2023092521-shredder-sublime-97fe@gregkh>
References: <20230925100741.799856-1-baijiaju@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925100741.799856-1-baijiaju@buaa.edu.cn>

On Mon, Sep 25, 2023 at 06:07:41PM +0800, Jia-Ju Bai wrote:
> In _dwc2_hcd_urb_enqueue(), "urb->hcpriv = NULL" is executed without
> holding the lock "hsotg->lock". In _dwc2_hcd_urb_dequeue():
> 
>     spin_lock_irqsave(&hsotg->lock, flags);
>     ...
> 	if (!urb->hcpriv) {
> 		dev_dbg(hsotg->dev, "## urb->hcpriv is NULL ##\n");
> 		goto out;
> 	}
>     rc = dwc2_hcd_urb_dequeue(hsotg, urb->hcpriv); // Use urb->hcpriv
>     ...
> out:
>     spin_unlock_irqrestore(&hsotg->lock, flags);
> 
> When _dwc2_hcd_urb_enqueue() and _dwc2_hcd_urb_dequeue() are
> concurrently executed, the NULL check of "urb->hcpriv" can be executed
> before "urb->hcpriv = NULL". After urb->hcpriv is NULL, it can be used
> in the function call to dwc2_hcd_urb_dequeue(), which can cause a NULL
> pointer dereference. 
> 
> This possible bug is found by a static tool developed by myself.

Because of this please follow the rules for such things as documented in
Documentation/process/researcher-guidelines.rst

> To fix this possible bug, "urb->hcpriv = NULL" should be executed with
> holding the lock "hsotg->lock". Because I have no associated hardware,
> I cannot test the patch in real execution, and just verify it according
> to the code logic.
> 
> Fixes: 33ad261aa62b ("usb: dwc2: host: spinlock urb_enqueue")
> Signed-off-by: Jia-Ju Bai <baijiaju@buaa.edu.cn>

My bot says:

-----------

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documetnation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

