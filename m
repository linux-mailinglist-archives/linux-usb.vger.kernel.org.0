Return-Path: <linux-usb+bounces-28888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F1BB68BA
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 13:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B42619E7108
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 11:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3E52EBDC7;
	Fri,  3 Oct 2025 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V5W4uTXQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C4826E16F
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759491585; cv=none; b=RgNUmuR/j2oixNQCEDPNaYlblQx4Y0VcZJ61WdZk/0Vdv1815TjGhZ58hR3vm7X8+gCkqWnOUzg05RprcsRJ+UEL+z+OZF9vpzR8bxuDMspDegSUyrJSRVOuLGQEAltC3WSzxSNDRWC1upXYljUTi9cPnxUVrAJN7xojXNLZ8RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759491585; c=relaxed/simple;
	bh=RbbShJdcNnabwviV1wVZEyRR+2qUvdUSaaMSJ01pPeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB2PhQl3h9m7Nm5ajshc1R98rjCb2mf/rKQmuwXoDfREXvdIHetH+ZZmlUea3GKSv+V3KKs5DDs5SXdmULnemohTRMUgqoGsiqTGalFSc12QXBXyMhUtGwLAgYNRAepJeD8Fux2tUkuW1JlkSlNNYhqOgoahnf2HXsJN+9yFVPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V5W4uTXQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8EBC4CEF5;
	Fri,  3 Oct 2025 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759491584;
	bh=RbbShJdcNnabwviV1wVZEyRR+2qUvdUSaaMSJ01pPeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5W4uTXQkFAK+RhyeJ+GHXaUa7vZMfgnBl7BGXxS+DqRKqN7Hipdh9f12YmKGAJbV
	 v2RuERfPnbd9ycqnsb9DhC8hhyVRNAQNjvWIXdtgYhes0jJhbBPjUK96Hv0z4HO/CW
	 7dfgGMMd8xqN+WI4Zf1PrzQrgmDQncEnvXMQ+Jnw=
Date: Fri, 3 Oct 2025 13:39:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: shuah@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: fix protocol translation in
 drivers/usb/storage/transport.c
Message-ID: <2025100302-tropics-version-e2ee@gregkh>
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

Please take a look at the kernel submission guidelines that says not to
say things like "this patch" :)

Also, please wrap your changelog lines.

> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>

What commit id does this fix?

What devices are not working without this change?  Given the age of this
code, and the fact that no new devices should be using it, it's odd that
this is just showing up now.  What changed to cause this to be relevant?

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

You ignored my bot's response saying that this shows a bunch of
scripts/checkpatch.pl errors.  Why?

thanks,

greg k-h

