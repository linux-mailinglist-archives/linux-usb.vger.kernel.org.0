Return-Path: <linux-usb+bounces-20404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DADA2EF67
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 15:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 849C07A0FBC
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 14:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AD623498A;
	Mon, 10 Feb 2025 14:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AdG9euNS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CA1233D9F
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 14:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196750; cv=none; b=fbLnNEYdEn0W68W+8wgh3nYX0Gqj9JCDKewKJxHGW5GyZGDkSYALGth+dBDp3S9WzZYzLwiWXZc2vkaDy5XYsiLeKgp4apDjvgakhNuRspP0IZ4LreBokTXQjVLvRzQSAipagUKdBNhoDX/gqwwI/bA76QVAFH+8ZIp56pmEVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196750; c=relaxed/simple;
	bh=B204JIe1cj6iz9tf5MX3OAesKsQDShiS6jKLTCK445k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2CsX5oter9EDTXe6KHnmc7PgIMnbsHjv9ZE8B7Ydu9TDYxueywmZERJDdpaTNgwS41SfoBWQLGoZiYoN8HtClH+qoZmk6k7ZLa6Qed7bqZiogzTciLOVIEBYCUTA+MShwmmJDHLCozdGvl32+R5tVf3D8STUz0VKQbPskpmZ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AdG9euNS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EAEC4CED1;
	Mon, 10 Feb 2025 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739196750;
	bh=B204JIe1cj6iz9tf5MX3OAesKsQDShiS6jKLTCK445k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdG9euNSbvsQf4ICNYdID9V0IDbRsWyUSlOlqOuNCbDgOE+t2ZG84+W0oJQx3z+cU
	 gdkrkfICZbJfYa+8BZLwvXsF2iUS9xaGz0v3RkufE/gtg6fVEIZttrSh2fh7Yxs3Pj
	 b3icfOsJwyhUZm3ojJ6l70ZxvwChgbP3c1cLKisU=
Date: Mon, 10 Feb 2025 15:06:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matt Lee <matt@oscium.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: max3421: Improve retransmit handling for NAK
 responses
Message-ID: <2025021006-engulf-dreary-d232@gregkh>
References: <CABrMTjempFXxCt4FhZPVUo=4h+o1hxoppoOmbfcbD-yGLt==Xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABrMTjempFXxCt4FhZPVUo=4h+o1hxoppoOmbfcbD-yGLt==Xg@mail.gmail.com>

On Mon, Feb 10, 2025 at 07:48:28AM -0600, Matt Lee wrote:
> This reverts a previously submitted patch where the slow retransmit was
> removed.
> 
> The max3421 driver would immediately retry transmissions indefinitely upon
> receiving a NAK response, leading to potential stalls.
> 
> This patch re-introduces a limit (`NAK_MAX_FAST_RETRANSMITS`) on how many
> times a request is retransmitted immediately.  After reaching this limit,
> the driver falls back to a slower retransmit strategy using
> `max3421_slow_retransmit()`.
> 
> This improves robustness when dealing with unresponsive USB devices.
> 
> Signed-off-by: Matt Lee <matt@oscium.com>
> ---
>  drivers/usb/host/max3421-hcd.c | 7 +++++++
>  1 file changed, 7 insertions(+)

I got 2 copies of this, is that intentional?

And patch 2/2 should be threaded with this one, did you use git
send-email to send these out?

thanks,

greg k-h

