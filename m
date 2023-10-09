Return-Path: <linux-usb+bounces-1259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD07BD5FA
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 10:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346E2281649
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 08:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960AF8F57;
	Mon,  9 Oct 2023 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rSdCZSMQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E096B2569
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 08:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FA3C433C8;
	Mon,  9 Oct 2023 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696841982;
	bh=yla6if91DgxfzcR1E+8xpqEziU1Qqf8NpvdMKk61CO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSdCZSMQEUvHMZ6nxZPjVMGjIj2PE83o1AqZAGsihrVjbyaK2lqL32ogGc+hvFSNL
	 S/Se+zbTnv0OhkxiZX25G9OeB6tyK7xKUiq6cX9Akmv43hqe6eLBQjFMdehA7U9Xsp
	 OmzsRwVnRV+vZX2p4+0bFu1wpJXWMbZSc8XpeAXM=
Date: Mon, 9 Oct 2023 10:59:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brian Kloppenborg <bkloppenborg@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	Brian Kloppenborg <brian@kloppenborg.net>
Subject: Re: [PATCH 1/2] Make cp210x respond to modem status changes (CTS,
 DSR, RI, DCD) by default.
Message-ID: <2023100909-catlike-apron-8b70@gregkh>
References: <20231009023425.366783-1-brian@kloppenborg.net>
 <20231009023425.366783-2-brian@kloppenborg.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009023425.366783-2-brian@kloppenborg.net>

On Sun, Oct 08, 2023 at 08:34:24PM -0600, Brian Kloppenborg wrote:
> ---
>  drivers/usb/serial/cp210x.c | 62 ++++++++++++++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 11 deletions(-)
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

