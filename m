Return-Path: <linux-usb+bounces-5408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0F8391C4
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 15:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAA26281133
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 14:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BF95A110;
	Tue, 23 Jan 2024 14:54:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7A4381C14
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706021647; cv=none; b=Tko+tCtUYTwcqbSQH+mJy4SqvIIJXvYt1Nss5RQXYFNQvodAMMs1HxKQUbbBfnrAD6jsmITbtdI+zQWaRG0IjvSvWT2GrCaKV1PncOcXU30mmC1oCqZEWXx7EAIPzqb1PAdxMUUliTd+btIyLtMp7dIyKtweKVDSKQ2vkBqd514=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706021647; c=relaxed/simple;
	bh=VYHj1M5T/Bui4JZ9Ta1SZsMff8aHylVjUkZDtFoZCnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwSZvSlGya64qWh4Y0jgIWC5lY73nbeniat2Zra42JKhvNu5x1uKon7FUZZkVaUds1gn0KEyNNFcBLtJac8cW8LAexbR1X23TppoqDCepnQtaai14K2MRT0w/kht1QSomVWoB4dVDfqKhVG/DTjJYZQHAy2db3VK+iXY3VfiU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 177528 invoked by uid 1000); 23 Jan 2024 09:53:57 -0500
Date: Tue, 23 Jan 2024 09:53:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: yuan linyu <yuanlinyu@hihonor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, stable <stable@kernel.org>
Subject: Re: [PATCH v3] usb: f_mass_storage: forbid async queue when shutdown
 happen
Message-ID: <9255cda3-f7fa-4e33-a0ce-83db6e30cfe0@rowland.harvard.edu>
References: <20240123034829.3848409-1-yuanlinyu@hihonor.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123034829.3848409-1-yuanlinyu@hihonor.com>

On Tue, Jan 23, 2024 at 11:48:29AM +0800, yuan linyu wrote:
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
> Cc: stable <stable@kernel.org>
> Signed-off-by: yuan linyu <yuanlinyu@hihonor.com>
> ---
> v3: add Cc: stable <stable@kernel.org>
> v2: fix comments, only change coding style, no function change
>     https://lore.kernel.org/linux-usb/20240123032641.3846713-1-yuanlinyu@hihonor.com/
> v1: follow Alan suggestion, only limit change in f_mass_storage
>     https://lore.kernel.org/linux-usb/20240122105138.3759477-1-yuanlinyu@hihonor.com/
> RFC: https://lore.kernel.org/linux-usb/5f4c9d8b6e0e4e73a5b3b1540a500b6a@hihonor.com/T/#t

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/function/f_mass_storage.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 722a3ab2b337..c265a1f62fc1 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -545,21 +545,37 @@ static int start_transfer(struct fsg_dev *fsg, struct usb_ep *ep,
>  
>  static bool start_in_transfer(struct fsg_common *common, struct fsg_buffhd *bh)
>  {
> +	int rc;
> +
>  	if (!fsg_is_set(common))
>  		return false;
>  	bh->state = BUF_STATE_SENDING;
> -	if (start_transfer(common->fsg, common->fsg->bulk_in, bh->inreq))
> +	rc = start_transfer(common->fsg, common->fsg->bulk_in, bh->inreq);
> +	if (rc) {
>  		bh->state = BUF_STATE_EMPTY;
> +		if (rc == -ESHUTDOWN) {
> +			common->running = 0;
> +			return false;
> +		}
> +	}
>  	return true;
>  }
>  
>  static bool start_out_transfer(struct fsg_common *common, struct fsg_buffhd *bh)
>  {
> +	int rc;
> +
>  	if (!fsg_is_set(common))
>  		return false;
>  	bh->state = BUF_STATE_RECEIVING;
> -	if (start_transfer(common->fsg, common->fsg->bulk_out, bh->outreq))
> +	rc = start_transfer(common->fsg, common->fsg->bulk_out, bh->outreq);
> +	if (rc) {
>  		bh->state = BUF_STATE_FULL;
> +		if (rc == -ESHUTDOWN) {
> +			common->running = 0;
> +			return false;
> +		}
> +	}
>  	return true;
>  }
>  
> -- 
> 2.25.1
> 

