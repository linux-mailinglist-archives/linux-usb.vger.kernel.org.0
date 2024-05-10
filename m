Return-Path: <linux-usb+bounces-10195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A38C20F9
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 11:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B562281473
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 09:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D93161333;
	Fri, 10 May 2024 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PNu2DomR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D129405;
	Fri, 10 May 2024 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715333583; cv=none; b=b2s4zGfNjzVRl0EwReDFtoz2kSwN89HbDchHIHlnUjxkW0w1LmYthi7R8367Hdos34DDUEOY7Q8fT3/puhZmo3QbpODTt0Y5LEb8caFOhQ8rTk6qaj++VzqzEdxCN2d71h0evQ+z5P88bsUD3geID5dYcDXno0xVa2oP8NAuNbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715333583; c=relaxed/simple;
	bh=73JsTNaDf+GI4JlgU/jC3QWglWrdkJLycFiZnloba+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaPhbw+BpCgVKscqQVxfVOtY+8WsFNfFGgjVO4Bbom3tOwmh4Lia48Y/Jz6+HaUEPtRtjHeR1VOpavKOYYx3+JOnELkZAnmqbBW7+ZFTSh04p5N3bUh2dsF1/XXsVC1X6jCHro4vzCUh8Y21JzDZfye4aUx4fpChFe5AFCaWUbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PNu2DomR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150E5C32781;
	Fri, 10 May 2024 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715333582;
	bh=73JsTNaDf+GI4JlgU/jC3QWglWrdkJLycFiZnloba+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNu2DomRYjl0hblkn7Qiiwf6Dqk6ilB0FmSbGlFt7qWKRVJmojLcoWx1xmLCKxvzR
	 k2EH0uYWTVwe/4M8+7xexcFDdZsH/t5CYylFFTyf2+mHApoA63oN/ay4BBsdxtOnU4
	 LPrS3WRShXAwD7oJpl3MZ0cRtKZ+OJz3meLIlD1c=
Date: Fri, 10 May 2024 10:32:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: qiurui <happyqiuqiu9604@gmail.com>
Cc: corbet@lwn.net, linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	qiurui@kylinos.cn
Subject: Re: [PATCH] docs: usb:gadget:hid: fix hid_gadget_test code in
 documentation of hid section
Message-ID: <2024051011-nearby-mowing-e53a@gregkh>
References: <20240506024408.19344-1-qiurui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506024408.19344-1-qiurui@kylinos.cn>

On Mon, May 06, 2024 at 10:44:08AM +0800, qiurui wrote:
> Fix bzero buffer before read()
> 
> Signed-off-by: qiurui <qiurui@kylinos.cn>
> ---
>  Documentation/usb/gadget_hid.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/usb/gadget_hid.rst b/Documentation/usb/gadget_hid.rst
> index e623416de4f1..c4ee81a6b48e 100644
> --- a/Documentation/usb/gadget_hid.rst
> +++ b/Documentation/usb/gadget_hid.rst
> @@ -410,6 +410,7 @@ Sample code::
>  		}
>  
>  		if (FD_ISSET(fd, &rfds)) {
> +			bzero(buf, SIZE);
>  			cmd_len = read(fd, buf, BUF_LEN - 1);
>  			printf("recv report:");
>  			for (i = 0; i < cmd_len; i++)
> @@ -419,6 +420,7 @@ Sample code::
>  
>  		if (FD_ISSET(STDIN_FILENO, &rfds)) {
>  			memset(report, 0x0, sizeof(report));
> +			bzero(buf, SIZE);
>  			cmd_len = read(STDIN_FILENO, buf, BUF_LEN - 1);
>  
>  			if (cmd_len == 0)
> -- 
> 2.34.1
> 
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

