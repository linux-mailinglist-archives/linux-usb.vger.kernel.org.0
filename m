Return-Path: <linux-usb+bounces-5641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A384273F
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 15:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C7962859BD
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 14:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370497CF3C;
	Tue, 30 Jan 2024 14:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Goyhyd22"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72BC6086D
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706626462; cv=none; b=Ga4CUicHijfr+MOKhso+OHQ7LFO6nxz0Q5xlef/G7JVHIs3D4F/s1DpHJ+cvbjYNtsansh6JRP1Ccpbs5RyAd72WAWyDo36wmcJWjJnL+hNiKDGty+SIsuUpzuTmtybbOUEGisn5w8rHG/4oDv5CL/05AmOrCOhq+AYVCKTRksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706626462; c=relaxed/simple;
	bh=zYUJ8PzmpbjWZEi2EZboHgVWKfVsEWj4Z3uQG3qrJKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHxnjA59vAcgtVIBRQCOKpIIgVw4QKfdtFhAk+DaB8gai6RrVJgAa7Hh6CsnKiehLpbHLjElj0WJ+q4flqk0s5qGkTr5C7o29oYOUMuwQShy2pHpKZ01kS+sk1dT0a3/ZcR+0fL6mFDdbQiwQz6F38ytzAS6OZzqWhSMNmhgAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Goyhyd22; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36317C43609;
	Tue, 30 Jan 2024 14:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706626462;
	bh=zYUJ8PzmpbjWZEi2EZboHgVWKfVsEWj4Z3uQG3qrJKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Goyhyd227vBgKuc9Yt52mblYkgwiKC+8YgcCWFKAnNfwoBuIV4aKn+JoXjv4165Ot
	 ooUtpMdbXPSXfBoO68PLaIjSbEqSt+33DWrWNnrNdEnZFrSR2W473NQ95BIkzmAgvT
	 WK4+E4wEogppmGSN5L9VSXfvZAO0v2XQR7sR8m+TRDn/PfP3hyjudacPkH+d2PrUKH
	 RDgflg7fd9u50dg4ZKhLQxC24f8YrSu1z3nGIMbK/ygh9ggmR/pnvKMSfv26vT/8up
	 gPbWVTXJiFS3jgmaGAE4Nf34zPXmSM20/Hi3U2WWerZIdjSIn+uskXFbfxOxOVvVBG
	 M13Z+RSOjwQqQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rUpVD-000000006KK-0WpI;
	Tue, 30 Jan 2024 15:54:19 +0100
Date: Tue, 30 Jan 2024 15:54:19 +0100
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?B?QXVyw6lsaWVu?= Jacobs <aurel@gnuage.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add MeiG Smart SLM320 product
Message-ID: <ZbkNm6AwtW2PLId7@hovoldconsulting.com>
References: <D0XE7S.X6XGW1CB307A2@gnuage.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D0XE7S.X6XGW1CB307A2@gnuage.org>

On Wed, Jan 17, 2024 at 04:43:25PM +0100, Aurélien Jacobs wrote:
> Update the USB serial option driver to support MeiG Smart SLM320.
> 
> ID 2dee:4d41 UNISOC UNISOC-8910

> Tested successfully a PPP LTE connection using If#= 0.
> Not sure of the purpose of every other serial interfaces.
> 
> Signed-off-by: Aurélien Jacobs <aurel@gnuage.org>
> ---
>  drivers/usb/serial/option.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 72390dbf0769..b5468f51e0f8 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -613,6 +613,11 @@ static void option_instat_callback(struct urb 
> *urb);
>  /* Luat Air72*U series based on UNISOC UIS8910 uses UNISOC's vendor ID 
> */

This patch appears to have been corrupted in transit (lines wrapped).

Please make sure you can send the patch to yourself (and apply it
successfully) before resending.

Johan

