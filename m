Return-Path: <linux-usb+bounces-19378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC809A12719
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 16:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 136617A1B12
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 15:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9351482F2;
	Wed, 15 Jan 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DqNZDGX/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F414037F
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954308; cv=none; b=dXa/joPuq45gKQhBI6QfDD1MkZkhzt8n2pSKxVRcmYtevffcXUOIynbM6CmZl8xWvyTj0yQBqxOgQ94PN1Jfq/pmryBbzn70ThQONcPXtnQ0GtSuUgZOT/0UN0t2omjRAhYWpUYzBQsBB0dXG6CMZw9aRsvpjeKVdZCecnxuTrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954308; c=relaxed/simple;
	bh=WraodrVucc9OLmFhWUiKX9WEcQNWWygE0Ds0idP/h88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6fRYRBXLY5/ZC7604Ffy30O20S/nVEkK9+qc3vxwjKEUra0TfVMkfhquf4Kmx14tRgkad7kXDwDZk7MVRZe66NJDOKENXoMo1FPkYy1LJ0ofTwYtYly7U2ptI2soMHUrJXzPylgSktBZF90Sh2wDcfaCTuUOjaBdAsNJkJiYG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DqNZDGX/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FF8C4CEE0;
	Wed, 15 Jan 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736954308;
	bh=WraodrVucc9OLmFhWUiKX9WEcQNWWygE0Ds0idP/h88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqNZDGX/mDIIqHoE00Rb+sGr1//uRr9qlmfhAFzLi9kUHTgcPidcmw7MLVhTI1XvK
	 h2M9fQbZEDCwTTuxp7karlyNfXALDTWsNeXDoKCvDKtp91TFS5wglruS9CjqJaliW/
	 LM3aZ0zkvzCVkay86FJ7CUlJiefYpN7tRy+wkW1Y=
Date: Wed, 15 Jan 2025 16:17:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.14 merge window
Message-ID: <2025011538-clash-prize-0289@gregkh>
References: <20250114103242.GM3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114103242.GM3713119@black.fi.intel.com>

On Tue, Jan 14, 2025 at 12:32:42PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:
> 
>   Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.14-rc1

Pulled and pushed out, thanks.

greg k-h

