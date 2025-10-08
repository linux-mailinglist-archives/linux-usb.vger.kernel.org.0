Return-Path: <linux-usb+bounces-29008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171DBC3B38
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 09:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A86814F920A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 07:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AE12FDC38;
	Wed,  8 Oct 2025 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qMmhNSod"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1729B2F3632
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908724; cv=none; b=e8OJXohbr7cXdyjMmoe5exR9IyCKuyIiok0bghwwaVfQu0WP7eu5uwrsRO0JryzOSQuIrTaoCMEZn/FnlPTIHHOKd0Q0rur9ZiuuqogVWurjSm8xmdNSNSjnltyxzEBRNZoY63KBD1nrKzanp8Pw9AsL/hsfA5Fwf0o8X7o3bMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908724; c=relaxed/simple;
	bh=PnYuCsmpN/wHrCHbE+pLMUbAhpPJNlzi8HQpEkue0u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7yqCXevF67mKpFF9dKYCZMcGOyKXB9t0RHj5RiZjBkT35NhJrtiOm6LFOnGVxei5VtJjD+iT2TICeoc+Wpg9BIdzF27I6OzWL+g1DDqNVyZgPE+tFno95t5NQjcdxnByLMuuki/61EYUNFwXmXZE80okGhZaL8XsYTLyqJZMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qMmhNSod; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C52CC116B1;
	Wed,  8 Oct 2025 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759908722;
	bh=PnYuCsmpN/wHrCHbE+pLMUbAhpPJNlzi8HQpEkue0u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMmhNSodw45/OF4LuTP+YxAQMIa0iXftP8Wn7ci3BcK//NCLvv1MDO5gYMPTfmjO7
	 Umh5LgYurZJjOgzgo1m2X0BGXz26WBy5g+oUARwhG7SD46c1iJoplHOZH7z4lIh2oM
	 NXfcb92idF1Nv3U/aq6eynRFA3L26WRya+2jg5Gs=
Date: Wed, 8 Oct 2025 09:31:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5] usb-storage: Simplify protocol translation
Message-ID: <2025100836-uncombed-blaming-b77a@gregkh>
References: <857a1b63-83d9-402b-a9cd-8aca0616c517@rowland.harvard.edu>
 <20251008070420.8302-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008070420.8302-1-i.shihao.999@gmail.com>

On Wed, Oct 08, 2025 at 12:34:20PM +0530, Shi Hao wrote:
> Simplify protocol translation for usb subclasses.
> 
> As suggested by Alan Stern  to remove the switch case labels  with
> 'default'  or keep the  previous  if statements  instead of the switch
> cases and advised  reasonable value when cmnd[0] >= 0xe0 .
> 
> keep  those usb subclasses to default and simplify logic removing
> switch cases and set 6 as a reasonable value when cmnd[0] >= 0xe0
> which fallbacks  to value 6 which is old cmd_len for those subclasses.
> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> 
> ---
> 
> changes v5:
> - Reformulate as  v5  of original patch series
> - No code changes ,clarified versioning history
> 
> changes v4:
> - Simplify  protocol translation logic
> - Set reasonable default when cmnd[0] >= 0xE0
> - Remove switch-case statement
> 
> changes v3:
> - Wrap  commit message lines properly
> - Improve commit description
> - fix  checkpatch.pl script errors
> 
> changes v2:
> - Update subject commit message
> - fix  checkpatch.pl warnings
> - match from: and sign-off: name
> ---
>  drivers/usb/storage/transport.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 4d01f70f39ac..14cc608052d9 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -719,17 +719,9 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
>  		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
>  
>  		/* Protocol translation per scsi opcode group */
> -		switch (us->subclass) {
> -		case USB_SC_UFI:
> -		case USB_SC_8020:
> -		case USB_SC_8070:
> -		case USB_SC_QIC:
> -			srb->cmd_len = 12;
> -			break;
> -		/* Determine cmd_len based on scsi opcode group */
> -		case USB_SC_RBC:
> -		case USB_SC_SCSI:
> -		case USB_SC_CYP_ATACB:
> +		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> +				us->subclass == USB_SC_CYP_ATACB) {
> +		/* Determine cmd_len based on SCSI opcode group */

Always remember to run scripts/checkpatch.pl before sending changes out
to others :(

thanks,

greg k-h

