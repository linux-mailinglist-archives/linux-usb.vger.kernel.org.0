Return-Path: <linux-usb+bounces-24244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B123AC1AF8
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 06:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D959918955F5
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 04:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6481F4171;
	Fri, 23 May 2025 04:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mupr0diH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E222170A
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747974490; cv=none; b=RPSv/Z8SPZfX2zaFLuXb/U4+yYTXtbShlhvQN4cocGmohkPj+ql5YtDiSJ0MsHxe4ZBqb/ohwkPei5H1HD09KEMxHvVtrtZCrqDlsSNZTKCdKWKgyh1y3IT/54ueRkVEOzOQtLtb89VCo2XifwZW7t5GfTkZTxZXTPkwIDYZUwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747974490; c=relaxed/simple;
	bh=+sgDsrSGP1oV2VPar6pzvn/aSFsGeKyOv4Nctkwfdqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTjHK+CPFqOof/GKSvDNJPjdmlN+cZO59UbSi6Yfj1uNkdiFg2JXsj74/dM13ieNSGMKMhE4WYVOh+uFdbrTmPUaaGUWbacZsy/WDbUOPGK4LpepGKKWHO4O6eEbwuFFRvQg9awGonyRvf1Eug+JS7cpHEoBfRs83QknE7ADdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mupr0diH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2AEC4CEE9;
	Fri, 23 May 2025 04:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747974489;
	bh=+sgDsrSGP1oV2VPar6pzvn/aSFsGeKyOv4Nctkwfdqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mupr0diHcRONxBTelPJyiDnqlYmp/RBwpAot6bgAGtDYH24WOSoYEBTzi3nOSA6U0
	 xVaaBqNcPYMAtUIcw/6P4kOWfvuxHBjodb2AJ5exPwp74hGMuAPc8jGkGqGa8wTrqz
	 IYZQJoW6xRakrc4ChGBf7ogJ+0kueYgC+U2BEqOA=
Date: Fri, 23 May 2025 06:28:07 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Kampalus <kampalus@protonmail.ch>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: quirks: disable LPM for Xiaomi fastboot
Message-ID: <2025052315-divinity-attendee-5e5a@gregkh>
References: <NlJ7bhWZBDatLxx8gt6X9CKi8u2oiRtCatIn6yHo68o8KUYM-qBCqPyNLSbCQx6th39-0uMLtTk18AYC4TQFj-aHEt2Xw9rPJzWMFgWexmI=@protonmail.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NlJ7bhWZBDatLxx8gt6X9CKi8u2oiRtCatIn6yHo68o8KUYM-qBCqPyNLSbCQx6th39-0uMLtTk18AYC4TQFj-aHEt2Xw9rPJzWMFgWexmI=@protonmail.ch>

On Thu, May 22, 2025 at 08:11:07PM +0000, Kampalus wrote:
> Both Xiaomi smartphones and AMD Ryzen systems have sketchy USB setups. When combined, fastboot
> fails to read and write data properly. Disabling Link Power Management works around that.
> 
> Despite only being useful for certain setups, let's enable this globally as it does
> not hurt healthy setups.
> 
> Signed-off-by: Kampalus <kampalus@protonmail.ch>
> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 13171454f..57f747776 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -552,6 +552,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* INTEL VALUE SSD */
>  	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
>  
> +	/* Xiaomi smartphones in fastboot mode */
> +	{ USB_DEVICE(0x18d1, 0xd00d), .driver_info = USB_QUIRK_NO_LPM },

Did you miss the comment at the top of this structure saying what order
this should be in?

Please fix.

Also, I need a "full" name for a patch to be accepted.

thanks,

greg k-h

