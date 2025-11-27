Return-Path: <linux-usb+bounces-30990-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F02CC8D724
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 10:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13FCA4E39A4
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 09:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC026324B28;
	Thu, 27 Nov 2025 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PPBMZ8Qr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177DE31DDA4;
	Thu, 27 Nov 2025 09:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234642; cv=none; b=gsDMqqLhOb0/YH4c5dvtcdYuf0GC/CX0HUHbEdHYbRXvfQQ7+VOgNuLcz6KDovofG85/SqXAnHwmypaTJpGw7NNPEjN76SpIn/ao/4GMM/fxkQ6w0iDtGp0SWrNVobbJjnhxTs2SQULiD9AR5meSL7szTKQr0RkM0zagrl3pgSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234642; c=relaxed/simple;
	bh=lrqyF5FPemuYShDDke6GGgcfSA7iy2bPIPlgPE0M8x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTb2CQ6druIjupFICreiLIn+AX+VbNIRZPQdIoiSSUJNJIwHR7DSum56h26f0qG/e4pRruTnHxsw40Z6YlcgFAYweHvnhyq7+KQ3m7g54flSpg6DPr6uqeYcZ2ZehN8L3aqeez7mvkJ+zrQOjfTiJp3zet3BPUm660rpv/d9Zb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PPBMZ8Qr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C19C4CEF8;
	Thu, 27 Nov 2025 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764234641;
	bh=lrqyF5FPemuYShDDke6GGgcfSA7iy2bPIPlgPE0M8x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPBMZ8QrNsRuhOA5HQdZkMUAFIFsBmAbqswF30as7xHhi34yZKqonUOhva0q8ZN4G
	 CHgNjRHFhqf37ldMWfjK7PBWC4iayq6qfzoc8pLRrvO/vFjyFxy/1YE7MSjF9q4kcM
	 V+pj+WSm5xyv4AU9CBPinDZvP4xWtxy5B1HO3avE=
Date: Thu, 27 Nov 2025 10:09:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial updates for 6.19-rc1
Message-ID: <2025112747-hardhead-sprinkled-bc54@gregkh>
References: <aSgJc4X9NRkWyNJ4@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSgJc4X9NRkWyNJ4@hovoldconsulting.com>

On Thu, Nov 27, 2025 at 09:18:59AM +0100, Johan Hovold wrote:
> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.19-rc1

Pulled and pushed out, thanks.

greg k-h

