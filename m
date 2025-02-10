Return-Path: <linux-usb+bounces-20405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17651A2EF70
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 15:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908F93A3669
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 14:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25127235366;
	Mon, 10 Feb 2025 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dptNVVGe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A450234965
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196753; cv=none; b=bYozndpEGpb9d/q9EJ06zNyKPZO4IiNObhs/vwJLSpNaWgQtbbBjc2sbBZ3rxK+uZ/hjepeISUO18U8rCXlr77A6pVJjXfo6kfBklK92RtWs7R1rWF3FOjmpXeo+pOgfSDkQ73cFT9uonsDA2R9hXYF+q2TBRAbF+WDiCRo/6/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196753; c=relaxed/simple;
	bh=WwnHxGIk7tt1Ik9UMqyFdUvOH7DDYBEJEmPMqYhM1Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uz/cT0XE89yHnpD/JvjitLtPyYzZiKbGyiuk7Di9waBA6Iie/92xxBD1GE3QWrQ0B43j7sRCOoIaNKS6ILyzCnR9CYsBxe0XiwlX4GrHoWlVImN2RBqOdMwfp7e7wN1Q11X2xaAiTKoG8N71zkeWRN0XfRHuhdxQ7u8+zHxUJq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dptNVVGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3C4C4CEDF;
	Mon, 10 Feb 2025 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739196753;
	bh=WwnHxGIk7tt1Ik9UMqyFdUvOH7DDYBEJEmPMqYhM1Wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dptNVVGesY0d0QNetqWeKgWd9SD8UnYc80oVMqWsVeGJjbLHgTlkyEiiwJDIF+675
	 y7vwUrbAT90trXun9hTRE/RB71O4HxTa8735q0FDbi2a8q3ZK1u+Z9KlJHput0TNRI
	 1wHoNxhzLJBd5X5oGsLGxphJ/WICV8s+1CzfEjMg=
Date: Mon, 10 Feb 2025 15:07:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matt Lee <matt@oscium.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: max3421: Fix scheduling while atomic in
 max3421_remove()
Message-ID: <2025021044-conjuror-captivity-619b@gregkh>
References: <CABrMTje0ijdtcO31HmuSufxXFQO2Ay2Rh0_0Qc4FFC3zgqe-pA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABrMTje0ijdtcO31HmuSufxXFQO2Ay2Rh0_0Qc4FFC3zgqe-pA@mail.gmail.com>

On Mon, Feb 10, 2025 at 07:48:29AM -0600, Matt Lee wrote:
> A bug in `max3421_remove()` caused a "scheduling while atomic" crash when
> `kthread_stop()` was called while holding a spinlock.
> 
> This patch ensures that `kthread_stop()` is called outside the spinlock,
> fixing the crash and improving system stability when unloading the driver.
> 
> Signed-off-by: Matt Lee <matt@oscium.com>
> ---
>  drivers/usb/host/max3421-hcd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> index abcdef0..1234567 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -1936,11 +1945,10 @@ max3421_remove(struct spi_device *spi)
>         usb_remove_hcd(hcd);
> 
>         spin_lock_irqsave(&max3421_hcd->lock, flags);
> +       spin_unlock_irqrestore(&max3421_hcd->lock, flags);
> 
>         kthread_stop(max3421_hcd->spi_thread);
> 
> -       spin_unlock_irqrestore(&max3421_hcd->lock, flags);
> -

So now the lock does nothing?  Are you sure this change is correct?

thanks,

greg k-h

