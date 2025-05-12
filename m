Return-Path: <linux-usb+bounces-23856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74578AB3059
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 09:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5FDE3B5411
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 07:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BA3256C63;
	Mon, 12 May 2025 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="spdqPApL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9D2561AD
	for <linux-usb@vger.kernel.org>; Mon, 12 May 2025 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747034113; cv=none; b=eAHVl3IXcK4quI0hxpYwUZSb4AEisaFyVacLRLITWjmaLvk+MYGgfAHUmv1aQkWPYFcYpeXbLG9NhTrrYtdAeiOf8mim9c7oIhCm5ZvgcxfecSRPghGn9R9A16yBMUTtFMY4uC9+fwhnLbKo8UrTUF8WNG4rwnv24xToLCJ5ZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747034113; c=relaxed/simple;
	bh=7dMk5qgIVTbtNel61vEWL54bj6uFYjb3FLQRzjHLibE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e34/Fsn+k8tBWLfILdOfXTLv/PGBta2gnYX7QzLvHMtKyr45XFKC/bV+jjA2En4opxfl7yvJ+OgUpmakGY4AXvlYOdZBvnjdc8edh7/sh2ukB9zUxpxL8kauuQuWTjDGoDvvb7Gx6/aHYkdXrd80Yg3TEOCB5IbeJGbwd+MEwGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=spdqPApL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45BEC4CEE7;
	Mon, 12 May 2025 07:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747034111;
	bh=7dMk5qgIVTbtNel61vEWL54bj6uFYjb3FLQRzjHLibE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spdqPApLwfMyG0Yy85f6+Nvu77RUqEUTyxiA64D2qq9Y3lBLjK8p2iAcxo2af7AMJ
	 sueNxOVPnt0KrT7buyenmWXkGv6XxqIh25niCMWioUDASKoU07h8PyuG6yZKdbBlGD
	 7/GqZaXND3ZQ+TXuSgbEWBunzQUTT1f1gONQq1m8=
Date: Mon, 12 May 2025 09:15:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan Wang <guan.wang.jy@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
	guan.wang.jy@renesas.com
Subject: Re: [ISSUE REPORT] xHCI infinite endpoint reset loop on full-speed
 after transfer error
Message-ID: <2025051244-rebuff-morphine-9808@gregkh>
References: <20250512063912.3331082-1-guan.wang.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512063912.3331082-1-guan.wang.jy@renesas.com>

On Mon, May 12, 2025 at 02:39:13PM +0800, Guan Wang wrote:
> From: Guan Wang <guan.wang.jy@gmail.com>
> 
> Hello,
> 
> Using Linux version 6.15.0-rc5-00032, I encountered an issue where the xHCI controller enters an
> infinite loop while attempting to recover a USB endpoint. This causes the xHCI driver to get stuck,
> and no USB transfers can proceed.
> 
> This issue appears to only occur with full-speed bulk devices such as USB serial adapters(e.g.,
> USB-Serial or CDC-ACM class). I've reproduced it using CH340 and CP2102 USB serial devices.
> 
> **Steps to reproduce:**
> 1. Attach the device.
> 2. Start continuous data transfer (e.g., `cat /dev/ttyUSB0`).
> 3. Induce transfer errors via:
>    - EMI interference
>    - Sudden temperature changes
>    - Long USB cables
>    - Briefly shorting DP/DM lines to simulate a transaction error
> 
> After this, the xHCI controller enters an infinite reset loop on the affected endpoint. "Transfer error"
> messages continuously appear in the logs, creating a log storm. The issue seems to improve or disappear
> when an external high-speed USB hub is inserted between the host and device.
> 
> Do you have any comments or suggestions? The log is shown below:
> 
> 
> **USB emulation dmesg**
> 
> [   41.109377] usb 3-1: new full-speed USB device number 2 using xhci-renesas-hcd
> [   41.277651] xhci-renesas-hcd ee000000.usb: add ep 0x82, slot id 1, new drop flags = 0x0, new add flags = 0x21
> [   41.277676] xhci-renesas-hcd ee000000.usb: add ep 0x2, slot id 1, new drop flags = 0x0, new add flags = 0x31
> [   41.277697] xhci-renesas-hcd ee000000.usb: add ep 0x81, slot id 1, new drop flags = 0x0, new add flags = 0x39

Does this happen on other xhci controllers as well?  Or just the Renesas
chip?

thanks,

greg k-h

