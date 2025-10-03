Return-Path: <linux-usb+bounces-28889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6FDBB68BD
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 13:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E7C53A3B80
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 11:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83222EBDCA;
	Fri,  3 Oct 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WoKAnj80"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7626E16F
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759491615; cv=none; b=dIS611kFsuh0cB4UNxlADl33MyJIJ7yeJdQyQTl/2FarQCh9p6V22Tdn8Cc3ME09C93tcy4gTPPZPICSMKZjSjXT6R8mYJ63ST/6c2Pp34vGKGKyBovle9817K6W8WOG5URIP8L1OvKRIbGEWQ8yP18KBDq3QBNwht5HQFBUyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759491615; c=relaxed/simple;
	bh=HxCXTzV+jh3wPw3emfqhUCde+Ex1cUifIXxi0rvbjIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEW4edP7O6kvDS1e6ykc6KoHA/531iMmUpP1iWezqpvLnF0zif539ysHZI6qB4bEiODLtcsxppTpvVW3qJpoNLTgH9p6ePL7NnIB47K5qpFmc/kxlMP92+oqgAcUeClfw0NVuV8KibWRNEriRH00rVx0GPSqGDIS7As1puqRzec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WoKAnj80; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A3EC4CEF5;
	Fri,  3 Oct 2025 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759491615;
	bh=HxCXTzV+jh3wPw3emfqhUCde+Ex1cUifIXxi0rvbjIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WoKAnj80dSOpd5S3L5+tU9nZhcRsuj+ipwO0fqyQIVPhQhV33B+dg0/gRJr4iW1S0
	 yn3Mox4Eo/462Fu0y+sbKWLWMF9RZlQ99Tnpk6BBJ8TrM/kqtVQJ9agkPSU/lkJvfA
	 W6RMwwSjBDXC9TZtM86kpOtYPJTZG6XhUj6p5rF0=
Date: Fri, 3 Oct 2025 13:40:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: shuah@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: fix protocol translation in
 drivers/usb/storage/transport.c
Message-ID: <2025100346-overstock-tribesman-3245@gregkh>
References: <20251003104635.24998-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003104635.24998-1-i.shihao.999@gmail.com>

On Fri, Oct 03, 2025 at 04:16:33PM +0530, Shi Hao wrote:
> Previously, only a few USB subclasses had srb->cmd_len translated to 6 or 12 bytes, which was insufficient for some SCSI opcodes. This patch extends translation to the correct opcode ranges so that command lengths are set properly.
> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> ---
>  drivers/usb/storage/transport.c | 41 ++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 1aa1bd26c81f..4dd6bfa86c23 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -718,12 +718,41 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
>  
>  		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
>  
> -		/* FIXME: we must do the protocol translation here */
> -		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> -				us->subclass == USB_SC_CYP_ATACB)
> -			srb->cmd_len = 6;
> -		else
> -			srb->cmd_len = 12;
> +		/* Protocol translation per SCSI opcode group */
> +                switch(us->subclass)
> +                {
> +                case USB_SC_UFI:
> +                case USB_SC_8020:
> +                case USB_SC_8070:
> +                case USB_SC_QIC:
> +                         srb->cmd_len = 12 ;             /* ATAPI/UFI devices always use 12-byte CDBs */
> +                         break;
> +
> +                case USB_SC_RBC:
> +                case USB_SC_SCSI:
> +                case USB_SC_CYP_ATACB:                   /* Determine cmd_len based on SCSI opcode group */
> +
> +                         if(opcode <= 0x1F)             /* Group 0 */
> +                         {
> +                                 srb->cmd_len = 6 ;
> +                         }else if( opcode <= 0x7F)      /* Group 1 & 2 */
> +                         {
> +                                 srb->cmd_len = 10;
> +                         }else if(opcode <= 0x9F )      /* Group 5 */
> +                         {
> +                                srb->cmd_len = 16 ;
> +                         }else if(opcode <=0xBF)        /* Group 6 */
> +                         {
> +                                srb->cmd_len = 12 ;
> +                         }else if( opcode <=0xDF)       /* Group 7 */
> +                         {
> +                                srb->cmd_len = 16;
> +                         }else{
> +                                ;                       /* Leaving cmd_len  value unchanged  for  0xE0–0xFF vendor-specific*/
> +
> +                         }
> +                        break;
> +                }
>  
>  		/* issue the auto-sense command */
>  		scsi_set_resid(srb, 0);
> -- 
> 2.51.0
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

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

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

