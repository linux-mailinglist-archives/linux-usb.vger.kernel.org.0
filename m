Return-Path: <linux-usb+bounces-31303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D7CAE5DF
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 23:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2C11301D64C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 22:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B84E288C22;
	Mon,  8 Dec 2025 22:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GmjgnrA/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924BF17C9E;
	Mon,  8 Dec 2025 22:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765234598; cv=none; b=e+OHIsjudO8L7QU/nbDnTvg+KNzMB2+1m8hUJnLS8py2VV0dfpUZ/43a/EEI5m0OW6QDknj5cI/cRUjc3NdK62V/5UWJYtZtzSkxNX6iLamn1XO8+nYMSMKK8gQfKG5Ow5asun6asYbXRCRmUWWPz0qg4gBnXO6Otru1nLY9J/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765234598; c=relaxed/simple;
	bh=WxhpWs5pqk6IWWdt4vf0CJ5CkuiE88a1wJRSOVxXUCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnV7Dgc788V1TrdDWN4lKVooagPQkcNQ6c+7JkCxcNspimcsAwzkjZ+vu91KD+3ybzDcmzDjcqWVzIagYS+2wCriwEVLElRW6MF4TeZAwpk7gN4Sgs3ygBc3TDUGnSbrRbvkkRTHWHb9cGiM7Jk+PsLkmSm1FXymdc/1dumcqi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GmjgnrA/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE8CC4CEF1;
	Mon,  8 Dec 2025 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765234598;
	bh=WxhpWs5pqk6IWWdt4vf0CJ5CkuiE88a1wJRSOVxXUCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmjgnrA//UREOvDQCCbfaW/1nB/PT2XQSjGgY2w/HDJJh9TeY4k4YihaLUcuNWF3m
	 HZgACQpu7RxBMvMm8JnqIpF9NPAcW/w+utfWjqQ3mWJrMNI1zuqPrSy+YnQcPeUuD5
	 +6SG6qnN1hQu/Bz+Z2KuUP641tPCXWvyO6IlQW20=
Date: Tue, 9 Dec 2025 07:56:35 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: david.laight.linux@gmail.com
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/9] thunderblot: Don't pass a bitfield to FIELD_GET
Message-ID: <2025120944-grudge-machine-720c@gregkh>
References: <20251208224250.536159-1-david.laight.linux@gmail.com>
 <20251208224250.536159-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208224250.536159-3-david.laight.linux@gmail.com>

On Mon, Dec 08, 2025 at 10:42:43PM +0000, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> FIELD_GET needs to use __auto_type to get the value of the 'reg'
> parameter, this can't be used with bifields.
> 
> FIELD_GET also want to verify the size of 'reg' so can't add zero
> to force the type to int.
> 
> So add a zero here.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>  drivers/thunderbolt/tb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index e96474f17067..7ca2b5a0f01e 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1307,7 +1307,7 @@ static inline struct tb_retimer *tb_to_retimer(struct device *dev)
>   */
>  static inline unsigned int usb4_switch_version(const struct tb_switch *sw)
>  {
> -	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version);
> +	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version + 0);

This is going to be very confusing to people who see this line only.
Can we add a comment here to explain why we have to do a "+ 0" and why
it can't be removed?  Otherwise I'm going to get a bunch of "cleanup"
patches attempting to "fix" this over the next few years.

thanks,

greg k-h

