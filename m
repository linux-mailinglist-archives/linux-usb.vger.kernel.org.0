Return-Path: <linux-usb+bounces-29115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95647BCCE49
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 14:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8ADDC4EB286
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 12:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F81C2ED15A;
	Fri, 10 Oct 2025 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u6Y6Nwm2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580BB288C39
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099349; cv=none; b=H6Vzy1mFQNxCM1Lt0zrDR96CCfyysfatvGYbVZ/tncFIB1CizUcz1smGJjUaZq6R4mF81uqjRQKu+wx8tUtnwyCZGV9ka/GWhbJ3/4PDazEWMmBUZsY8NtxfBTHCzkSVmLITveKIewuIr5xI8XksV09i6RTMhafNmdEpRRbcnIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099349; c=relaxed/simple;
	bh=bUXcv25shOXm2dEjqafy1KGNbuvMyN1VHAtMq+PDzM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B11gFr09wTIK6eWBZL62UD6C68b5OlVB0i+4+rLrRNPGbUGnX4YWOJLWpQTkeIT/VHc5XFJSQrmAvoge7cSLelV/Z/Oji9YoRinFx/8eOcEXEOJhc+odx/VGucExjmSvSXOF9PJckSdNdEtMWMAzcn6GOti8fALZNX4+nDX4Baw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u6Y6Nwm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDA3C4CEF1;
	Fri, 10 Oct 2025 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760099348;
	bh=bUXcv25shOXm2dEjqafy1KGNbuvMyN1VHAtMq+PDzM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6Y6Nwm21CbhttSKC6bgGr3xxNpreQ2kiESX1zgpA9OAaksxmzGqXRpynaFaSQsjL
	 5+zhmlLHzARHv9b+CrBYt11ONvmpiWoUL4REWeWPBLhlVHhlmxdb6Mbt6TuljuV1XK
	 k8G2DKzUuCktMpfh3SYOH51vu+2fXtRO9Uf3rzu0=
Date: Fri, 10 Oct 2025 14:29:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] usb: Implement proper subclass protocol translation
Message-ID: <2025101046-slogan-overlap-bbe4@gregkh>
References: <20251010113003.22863-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010113003.22863-1-i.shihao.999@gmail.com>

On Fri, Oct 10, 2025 at 05:00:03PM +0530, Shi Hao wrote:
> Proper protocol translation for old legacy  usb devices.
> 
> Earlier protocol translation was insufficient for old usb devices
> which was padding all subclasses  such as USB_SC_RBC, USB_SC_SCSI
> and USB_SC_CYP_ATACB cmd_len to 6 byte value and because It wasn't
> complete It had a FIXME comment stating to fix the protocol transl
> -ation for those legacy usb devices.
> 
> As a result implement proper protocol translation as per their op
> code.In addition to   the old default value 6  those old legacy
> usb-device subclasses needed cmd_len value  to 10, 12 , and 16
> byte also .
> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> ---
>  drivers/usb/storage/transport.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 1aa1bd26c81f..4820b45d2a32 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -718,12 +718,25 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
> 
>  		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
> 
> -		/* FIXME: we must do the protocol translation here */
> +		/* Protocol translation per scsi opcode group */
>  		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> -				us->subclass == USB_SC_CYP_ATACB)
> -			srb->cmd_len = 6;
> -		else
> +		    us->subclass == USB_SC_CYP_ATACB) {
> +			/* Determine cmd_len based on scsi opcode group */
> +			if (srb->cmnd[0] <= 0x1F)
> +				srb->cmd_len = 6;
> +			else if (srb->cmnd[0] <= 0x7F)
> +				srb->cmd_len = 10;
> +			else if (srb->cmnd[0] <= 0x9F)
> +				srb->cmd_len = 16;
> +			else if (srb->cmnd[0] <= 0xBF)
> +				srb->cmd_len = 12;
> +			else if (srb->cmnd[0] <= 0xDF)
> +				srb->cmd_len = 16;
> +			else
> +				srb->cmd_len = 6;
> +		} else {
>  			srb->cmd_len = 12;
> +		}
> 
>  		/* issue the auto-sense command */
>  		scsi_set_resid(srb, 0);
> --
> 2.51.0
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

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

