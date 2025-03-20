Return-Path: <linux-usb+bounces-21963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1DA6A779
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 14:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 803373AE5F9
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 13:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3888621CC6A;
	Thu, 20 Mar 2025 13:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wWr9Bu6X"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61CD1CAA8D
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742478185; cv=none; b=SUxPXic05A2DVaSe02nP3ffnZ0c0Mlrpz4LCu/pgq2R39YXPKZb/t43HcxM5AhSSDERZgEiae/O0i99nMOgQdVUZ3AROqsXkJBJqn6AIS3cpxbRg+aJMBd13zOY7524X38okgvO2aSFlc0r48mCleuN6HRZCEztWg75XFgZHBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742478185; c=relaxed/simple;
	bh=9jsMCkt6ZxtUs90cBsKkk3BevS0TmQNHjoX9pD0OWkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8kchXNnaFSE/0y31PQIB6XcyZ4/IpjKaFqXqgdk/nXALceuwVjAjtvRPbetTxTuh6TZbQJJXktIB6birdp9+bbVJRDngLvu3K7Qc12s0IwcmN4Z4OX9HJK45P8Iu+zrMGNJN48Gj0T22P7VK2obOK68192yGO23kMVMvVVFfmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wWr9Bu6X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B40C4CEDD;
	Thu, 20 Mar 2025 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742478185;
	bh=9jsMCkt6ZxtUs90cBsKkk3BevS0TmQNHjoX9pD0OWkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wWr9Bu6Xg7wuI9pbvFqtAHqI/c5SqOsLHfgxSCVSlYlI9wPwreCz7BPNqheNcPIap
	 hfgFrf+Qg+2m2W6BOxrebnDAvl4Dw1yzXXAfbE8jOzX0+wpbRhjIxhJdmzl8Vd1S80
	 OIbdmTONDa56jnewIs9/w0UK7EVCyZtvIGfwXpC4=
Date: Thu, 20 Mar 2025 06:41:45 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.15 merge window
Message-ID: <2025032037-bazooka-vision-c830@gregkh>
References: <20250320114914.GO3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320114914.GO3713119@black.fi.intel.com>

On Thu, Mar 20, 2025 at 01:49:14PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.15-rc1

Pulled and pushed out, thanks.

greg k-h

