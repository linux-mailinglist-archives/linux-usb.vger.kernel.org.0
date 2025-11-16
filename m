Return-Path: <linux-usb+bounces-30536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3389C61472
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 13:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE8283B47E4
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 12:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E994F2D3221;
	Sun, 16 Nov 2025 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0pErqhC1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DF62D238F
	for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763294880; cv=none; b=gSnCUfEN5e10TRQ0TU4okSjaZCl5sWv/RM3hbgj3CH5RXuouNfU6Dk6T2GLk5WlUKpK/l5ANUWTywc3vheOmD8ta2jV89uq5HkiWfVgcKQG6dKaJRIlqxtS0Jyp+qKbmNtILMWV/86dWWnInpMcrliM/QhFGDyiePHlJpnFsPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763294880; c=relaxed/simple;
	bh=Kldd5CPElPHOJiC/1e7TgutC4T9rZsu5bhBV3PhLXOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRXWxKBVYkx6QekI+Q2qRiGMSr6gPOB8aPzEtby/zX4CMgBfSf2Exxjix5rrlz8NZClqpyEfXNMJLclg0Ke4T1XbSAg/6L6jhE17cRUT0C+r7vKSCqAaUuey3A3Iua2oLU6/Wvl0yd7uPH2aYld3QlaGq9NZIGZkGh+AonMsW3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0pErqhC1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB86C16AAE;
	Sun, 16 Nov 2025 12:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763294880;
	bh=Kldd5CPElPHOJiC/1e7TgutC4T9rZsu5bhBV3PhLXOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0pErqhC1z0j9UsfAolQeit6f+UQ2P5YwixI3xSCYZqaLWbVBx5Du7VE5FljmXmbIu
	 l9vDqyex6eyz0aW3y/DCmjINQviVZatcaIG1GMJa5sH0dW1KZjOu1zoUGkbQvtYVGo
	 Xszj1PrxgPiwpJjTT1PUreWONJyWwR3IirWOOse8=
Date: Sun, 16 Nov 2025 07:07:57 -0500
From: gregkh <gregkh@linuxfoundation.org>
To: =?utf-8?B?Zmx5bm5uY2hlbijpmYjlpKnmpZop?= <flynnnchen@tencent.com>
Cc: linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: storage: sddr55: Reject out-of-bound new_pba
Message-ID: <2025111605-stardust-unvocal-222f@gregkh>
References: <B2DC73A3EE1E3A1D+202511161322001664687@tencent.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B2DC73A3EE1E3A1D+202511161322001664687@tencent.com>

On Sun, Nov 16, 2025 at 01:22:01PM +0800, flynnnchen(陈天楚) wrote:
> From c63dc814b5e51713222462e6bf27d7956a933834 Mon Sep 17 00:00:00 2001
> From: Tianchu Chen <flynnnchen@tencent.com>
> Date: Sun, 16 Nov 2025 12:46:18 +0800
> Subject: [PATCH] usb: storage: sddr55: Reject out-of-bound new_pba

You can use git send-email to not have this show up in the body of the
email in the future :)

> Discovered by Atuin - Automated Vulnerability Discovery Engine.
> 
> new_pba comes from the status packet returned after each write.
> A bogus device could report values beyond the block count derived
> from info->capacity, letting the driver walk off the end of
> pba_to_lba[] and corrupt heap memory.
> 
> Reject PBAs that exceed the computed block count and fail the
> transfer so we avoid touching out-of-range mapping entries.
> 
> Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> ---
>  drivers/usb/storage/sddr55.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/storage/sddr55.c b/drivers/usb/storage/sddr55.c
> index b323f0a36..9d813727e 100644
> --- a/drivers/usb/storage/sddr55.c
> +++ b/drivers/usb/storage/sddr55.c
> @@ -469,6 +469,12 @@ static int sddr55_write_data(struct us_data *us,
>  		new_pba = (status[3] + (status[4] << 8) + (status[5] << 16))
>  						  >> info->blockshift;
>  
> +		/* check if device-reported new_pba is out of range */
> +		if (new_pba >= (info->capacity >> (info->blockshift + info->pageshift))) {
> +			result = USB_STOR_TRANSPORT_FAILED;
> +			goto leave;
> +		}

Any chance you tested this with real hardware?

thanks,

greg k-h

