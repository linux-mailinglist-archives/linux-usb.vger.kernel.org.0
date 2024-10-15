Return-Path: <linux-usb+bounces-16221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C07DB99E42C
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 12:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 777521F236BC
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 10:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D89A1E379C;
	Tue, 15 Oct 2024 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EjcxvofQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970DC4683
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988715; cv=none; b=LVK9rVr2O2lsrEiPoGuVj9/DaLMl68OaHVxJ5Uclwrg2Oqrs4TUVdCUomyT0XE+0tdFddsj8ka4Vi4W+Z3w8wpciYc55Ww34f7V5Fxmup8Guos4PKByMFxlIa4w+SYTy5JyW5/02a/t+bXo5cYdGkcaYbyx5RBEo4lI28c2/3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988715; c=relaxed/simple;
	bh=G7pbInPckWvz7AeTsg5jk6gSrPL2prjk8SvL6+543CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huru5jB21VWMn+Z9RFc1v/IVDIszEtI2Qfz5WDMedYst1LI60idgGAsLOFgm6t2LCiBSffdnxXafBAvW+I8I+nGld92+MzcTVHYozuQo4yBqTX48W80wOP7dLFzJe7GnHlcjlCMt8TQHqiSI6LqlxdN3T6cSSijmJwIfV5ZFFWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EjcxvofQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F43C4CEC6;
	Tue, 15 Oct 2024 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728988715;
	bh=G7pbInPckWvz7AeTsg5jk6gSrPL2prjk8SvL6+543CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjcxvofQmk00JgxpzjPweK21CgmtCN6uup6VAdr8LqAMp/nJ9OjGdz+kfzPySsEkE
	 N/dx3tffu2lugYWu33PBLn/5F6C+fXTJeoyAlDUXCVm2isA8ZX1mVCaJzdN9Ken97j
	 NhTDdc2Ro6kG3CD9hC12x/KvC7wpD5bzdbe70RKQ=
Date: Tue, 15 Oct 2024 12:38:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: xhci: Fix the NEC stop bug workaround
Message-ID: <2024101547-sharply-unbiased-7f7b@gregkh>
References: <20241014210840.5941d336@foxbook>
 <20241014211005.07562933@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014211005.07562933@foxbook>

On Mon, Oct 14, 2024 at 09:10:05PM +0200, Michal Pecio wrote:
> The NEC uPD720200 has a bug, which prevents reliably stopping
> an endpoint shortly after it has been restarted. This usually
> happens when a driver kills many URBs in quick succession and
> it results in concurrent execution and cancellation of TDs.
> 
> This is handled by stopping the endpoint again if in doubt.
> 
> This "doubt" turns out to be a problem, because Stop Endpoint
> may be queued when the EP is already Stopped (for Set TR Deq
> execution, for example) or becomes Stopped concurrently (by
> Reset Endpoint, for example). If the EP is truly Stopped, the
> command fails and further retries just keep failing forever.
> 
> This is easily triggered by modifying uvcvideo to unlink its
> isochronous URBs in 100us intervals instead of poisoning them.
> Any driver that unlinks URBs asynchronously may trigger this,
> and any URB unlink during ongoing halt recovery also can.
> 
> Fix the problem by tracking redundant Stop Endpoint commands
> which are sure to fail, and by not retrying them. It's easy,
> because xhci_urb_dequeue() is the only user ever queuing the
> command with the default handler and without ensuring that
> the endpoint is Running and will not Halt before it Stops.
> For this case, we assume that an endpoint with pending URBs
> is always Running, unless certain operations are pending on
> it which indicate known exceptions.
> 
> Note that we need to catch those exceptions when they occur,
> because their flags may be cleared before our handler runs.
> 
> It's possible that other HCs have similar bugs (see also the
> related "Running" case below), but the workaround is limited
> to NEC because no such chips are currently known and tested.
> 
> Fixes: fd9d55d190c0 ("xhci: retry Stop Endpoint on buggy NEC controllers")
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
>  drivers/usb/host/xhci-ring.c | 44 +++++++++++++++++++++++++++++++++---
>  drivers/usb/host/xhci.h      |  2 ++
>  2 files changed, 43 insertions(+), 3 deletions(-)
> 

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
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

