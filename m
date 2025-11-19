Return-Path: <linux-usb+bounces-30725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 826DFC6FAC0
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 16:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4B6A4F9464
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9819F36655A;
	Wed, 19 Nov 2025 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ehyCKtBF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C035CB9D;
	Wed, 19 Nov 2025 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565949; cv=none; b=BwkH1tjuOLTekIWomFKjVsYXHsxJ6SVE4d8GUK7KJRxNvJpBG3bmTpmjsO0PnKYjJZAjYotPJnpAkHfeGOjQy7y5ogywb74XgCdeyuBXbPaD853W0+7e3gggnRZVuvqFV24MoCN2DQf9KsWa2AgQnAZXvuzZ1u9yxNgDvfBYkzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565949; c=relaxed/simple;
	bh=5OXlmYijK5GFRZCoLwK/2HQwpElUf6JZGgdledLa/Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKnfOY9zMSkyO8DLDi3ZvqWo5dMTnkXe8d7I/TppXp5ALec8RhBjuqhbJVWHlAjEVFDwz3emumEdMJPjAqLm7+V6KRN2q7uUsNgbhj8cfSsiX14syxlKs1fwRM/cCrmKfFPIW1OqpTPqZmfQMIT0+yCoVsCTMrnyzV7RIwLuP/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ehyCKtBF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3104DC2BC86;
	Wed, 19 Nov 2025 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763565948;
	bh=5OXlmYijK5GFRZCoLwK/2HQwpElUf6JZGgdledLa/Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehyCKtBFyll+wzPjHYgGvvW1md6569P6NEyYsDkHl6hnsWbpqOfN05AA90buGxau1
	 jpwlvKYngtVk2vRVtZ1KqQnW5GYM6r4tJey1oWDbpavcT4lGaO7mHRHuT2RicB8HPa
	 H6bUa8uqTu2ud+fAaKwzXjIAkdxiVpBfiWjI9gtg=
Date: Wed, 19 Nov 2025 16:25:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Clint George <clintbgeorge@gmail.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	khalid@kernel.org
Subject: Re: [PATCH 7/8] usb: gadget: dummy_hcd: remove unnecessary 'else'
 after return
Message-ID: <2025111941-okay-dry-1b18@gregkh>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251119130840.14309-8-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130840.14309-8-clintbgeorge@gmail.com>

On Wed, Nov 19, 2025 at 06:38:39PM +0530, Clint George wrote:
> The 'else' after a return statement is redundant and unnecessary.
> This patch removes the 'else' in dummy_set_halt_and_wedge(), making
> the code clearer and compliant with kernel coding style:
> 
> - Return early for the -EAGAIN condition.
> - Place the subsequent code at the same indentation level instead
>   of inside an 'else' block.

When you have to list different things in a commit changelog, that is a
HUGE hint it should be multiple patches :(

> 
> Signed-off-by: Clint George <clintbgeorge@gmail.com>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 1840dd822..1114dfe61 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -803,10 +803,10 @@ dummy_set_halt_and_wedge(struct usb_ep *_ep, int value, int wedged)
>  		return -ESHUTDOWN;
>  	if (!value)
>  		ep->halted = ep->wedged = 0;
> -	else if (ep->desc && (ep->desc->bEndpointAddress & USB_DIR_IN) &&
> -			!list_empty(&ep->queue))
> -		return -EAGAIN;
>  	else {
> +		if (ep->desc && (ep->desc->bEndpointAddress & USB_DIR_IN) &&
> +			!list_empty(&ep->queue))
> +			return -EAGAIN;

Wait, what?  Why move this around like this, the original is best and
makes more sense.  This version is much harder to read :(

thanks,

greg k-h

