Return-Path: <linux-usb+bounces-26048-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE5B0C675
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 16:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C34C0178815
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 14:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE911E1C02;
	Mon, 21 Jul 2025 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g1soqmID"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7537B1AF0A7
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 14:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753108517; cv=none; b=K95QmAt58sVdRzMPNMqk8bWfathI3sViLV92lRxzSZrgdsxOHzK5Feysh4ONfFlWJC1eLvinLPBz1hn0W+IVLmKU2iI6tJLKykwnt+oe5QUXb22GOzMy3twq5ce76Gy8JePrTHcp+U76vMGKKFHWGIGlJKzFQePTlBegk9Wzqdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753108517; c=relaxed/simple;
	bh=LUl7SEiMj/uMoyShXaXJKwNkOdWHoflyRGfR+wxHCP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mchsuyo1g11LvBGwJM9ebH+BKRq85atGgPyPhdvOvNAsU6BDPd0GMQxX/pxDZnyiokYUkxBozdPggEbL6K4zygoufFqQZlPeR8CyjBn1mXuFo3upz2VKMhPgTUGn4mDSZ68wEif5E5XzKk5AliE0WZFCOZt0nDc99Wuqfok/kF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g1soqmID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A096C4CEED;
	Mon, 21 Jul 2025 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753108516;
	bh=LUl7SEiMj/uMoyShXaXJKwNkOdWHoflyRGfR+wxHCP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1soqmIDjQLcOL32jse2LGZKhM+zSyC+NtpVxXUaWyV54QT1dSswegWF4AYK9OYVr
	 OSM8rPotQlNNgaKG7XFa5KmrLotnub3MN0tanSuPogkuH4HYJe8C4f99H45QY7esiO
	 WY7N0Fo6adks+1u3xpYNkty3HFhzsh5URfzIIrDU=
Date: Mon, 21 Jul 2025 16:35:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkat Jayaraman <venkat.jayaraman@intel.com>
Cc: linux-usb@vger.kernel.org, pse.type-c.linux@intel.com
Subject: Re: [PATCH v2] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
Message-ID: <2025072133-mastiff-calorie-c02d@gregkh>
References: <20250703193259.760717-1-venkat.jayaraman@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703193259.760717-1-venkat.jayaraman@intel.com>

On Thu, Jul 03, 2025 at 12:32:59PM -0700, Venkat Jayaraman wrote:
> Add support for UCSI READ_POWER_LEVEL command as per
> UCSI specification v2.1 and above to debugfs.
> 
> Following power related fields will be exposed as files in debugfs:-
> peak_current (Peak current),
> avg_current (Average current) and
> vbus_voltage (VBUS voltage)
> 
> These files will be updated either when a READ_POWER_LEVEL
> command is sent from OS or when a device is connected.
> 
> Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
> ---
> Changelog v2:
> - Removed extra space in declaration
> - Made the call to debugfs_create_file single line for clarity
> 
>  drivers/usb/typec/ucsi/debugfs.c | 31 +++++++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.c    | 16 ++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.h    | 13 +++++++++++++
>  3 files changed, 60 insertions(+)

You somehow did not cc: the proper maintainers on this at all, have you
gone through the proper Intel kernel developer training that should
document all of this type of thing?  If not, please do so.

thanks,

greg k-h

