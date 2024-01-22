Return-Path: <linux-usb+bounces-5372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C396883691E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 16:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C106F1C236E4
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 15:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3167762F;
	Mon, 22 Jan 2024 15:08:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 373757762A
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 15:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705936099; cv=none; b=mGAOYHfYBZcg+m68pStuaCKIlNVnfSL68YkTza1Hs+r/Yy3m35Kk9UR+MBSsOzPXEffAGmiuJmwbxsDxda4pA47bYbuVXtk05A5EEFj9f5IyGL6VbMjDoeMH/rgn92VY3GnfCw6YkT68HlIMJYnivoCRSkHvyOblEcaHJpSXg/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705936099; c=relaxed/simple;
	bh=fPpb09xy8zoO8A6ntqr3S4dPIh3HBR93jJHHoHg0urw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqe3ltWCOAWKDla8vKX7cWsemCL2ksF8WDSO9HN0WX9lsOXZYm/AXir8uCWOAD0tqrsyeTh57xa695tQd1T0jT8/R420wUrhQi6H4wPkzUQZzpkdl+rspyAw8PsQpUskZHFx5wotK0paH5gqQKIw5tHb/Y6Z7Rflz93H3cFYmTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 137813 invoked by uid 1000); 22 Jan 2024 10:08:12 -0500
Date: Mon, 22 Jan 2024 10:08:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: yuan linyu <yuanlinyu@hihonor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: f_mass_storage: forbid async queue when shutdown
 happen
Message-ID: <1f890a94-0cec-4776-9af3-754f913ee8c4@rowland.harvard.edu>
References: <20240122105138.3759477-1-yuanlinyu@hihonor.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122105138.3759477-1-yuanlinyu@hihonor.com>

On Mon, Jan 22, 2024 at 06:51:38PM +0800, yuan linyu wrote:
> When write UDC to empty and unbind gadget driver from gadget device, it is
> possible that there are many queue failures for mass storage function.
> 
> The root cause is mass storage main thread alaways try to queue request to
> receive a command from host if running flag is on, on platform like dwc3,
> if pull down called, it will not queue request again and return
> -ESHUTDOWN, but it not affect running flag of mass storage function.
> 
> Check return code from mass storage function and clear running flag if it
> is -ESHUTDOWN, also indicate start in/out transfer failure to break loops.
> 
> Signed-off-by: yuan linyu <yuanlinyu@hihonor.com>
> ---
> v1: follow Alan suggestion, only limit change in f_mass_storage
> RFC: https://lore.kernel.org/linux-usb/5f4c9d8b6e0e4e73a5b3b1540a500b6a@hihonor.com/T/#t

This is basically okay.  I have a suggestion for improvement, see below.

>  drivers/usb/gadget/function/f_mass_storage.c | 28 +++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 722a3ab2b337..d5174e066078 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -545,21 +545,41 @@ static int start_transfer(struct fsg_dev *fsg, struct usb_ep *ep,
>  
>  static bool start_in_transfer(struct fsg_common *common, struct fsg_buffhd *bh)
>  {
> +	int rc;
> +
>  	if (!fsg_is_set(common))
>  		return false;
>  	bh->state = BUF_STATE_SENDING;
> -	if (start_transfer(common->fsg, common->fsg->bulk_in, bh->inreq))
> -		bh->state = BUF_STATE_EMPTY;
> +	rc = start_transfer(common->fsg, common->fsg->bulk_in, bh->inreq);
> +	if (!rc)
> +		return true;
> +
> +	bh->state = BUF_STATE_EMPTY;
> +	if (rc == -ESHUTDOWN) {
> +		common->running = 0;
> +		return false;
> +	}
> +
>  	return true;
>  }

This could be written more cleanly as:

	rc = start_transfer(common->fsg, common->fsg->bulk_in, bh->inreq);
	if (rc) {
		bh->state = BUF_STATE_EMPTY;
		if (rc == -ESHUTDOWN) {
			common->running = 0;
			return false;
		}
	}
	return true;

And the same goes for start_out_transfer().

Have you tested this?  Does it do what you want?

Alan Stern

