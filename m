Return-Path: <linux-usb+bounces-28885-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB7BB640F
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 10:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B419219E375A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 08:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B8F26F2BC;
	Fri,  3 Oct 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rbat3lnL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30E126E6E5
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759480975; cv=none; b=DKnIhBlHJthG0HKcWbCoFtZLvAo/Efw73nf8vJovDMv3Z+DKjhoxLX75iMk5IcXR9fffp3Gz4hMa5eBroIDshbwLIsvKRfgbC36T1eOZk/AtdOJPvALVgiVY3gs+jbOwhILvhEG6PBgxunFesVnW78GCSarvYER8gd6mjY12c1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759480975; c=relaxed/simple;
	bh=KJ1PjTxGCAy0/IDKe9GYFTnEc0Krbv2RYauc9GJVf2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sST3A2ddPDqfkeV1XRRPe/O8y4dTv4MUCRkeKT/EfCDy97vgyWAOOOVznEvRdTuokYj/OCWeLiWblpC5DL3lCplXOX+771LqZI9bLBoSGbleMDn1ZHqN3n241SU3JfEcMv0bH7HZkPqpgDvRrl7b+J33u5gwiboaubKVVrmxLD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Rbat3lnL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA441C4CEF5;
	Fri,  3 Oct 2025 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759480975;
	bh=KJ1PjTxGCAy0/IDKe9GYFTnEc0Krbv2RYauc9GJVf2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rbat3lnLzMfi6Ps5i4umt8l2P4JLBEAf/Qg/F5kVwGddpC02HmyEJJvoNwS+W0U39
	 V4xiQ1SGftj2weyNap7Fwn8dcz4X937CMPUBWwJntdFZXCbyeKlvStaYk4K9hG7Qrt
	 Npk+eaa5X/zGWLpGoyT8aYSEJ5r1f6FqgBPUCNGo=
Date: Fri, 3 Oct 2025 10:42:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: shihao <i.shihao.999@gmail.com>
Cc: shuah@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Fixed protocol translation in
 usb/storage/transport.c
Message-ID: <2025100309-posting-scavenger-a9cb@gregkh>
References: <20251003083124.17072-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003083124.17072-1-i.shihao.999@gmail.com>

On Fri, Oct 03, 2025 at 02:01:17PM +0530, shihao wrote:
> Signed-off-by: shihao <i.shihao.999@gmail.com>
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

