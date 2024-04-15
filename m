Return-Path: <linux-usb+bounces-9343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 412638A48F4
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 09:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B800CB24B12
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 07:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87F12C84F;
	Mon, 15 Apr 2024 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YsrohwnI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060622EF3
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 07:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713165848; cv=none; b=Mx7hsOyGIu3cpYfKoaqVKw8RB3AKFlPJXjzrEo466X57ue1tYVezWUd+hHnf1no15c8bzOo6owuCN7/HEWPh+7ZNjntNkNTG6Wr1k6bNOe5L28rp0vXTLRhExEQ11mYrO85ootnoH9X4peQVkoSA4l3rOZBJqlyQfSlj805uJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713165848; c=relaxed/simple;
	bh=mtjuzYWTXjNt/TKS737D7L/iYneAHm1BA72FWWJzu9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJCxzTvrmzQkos5NEWGoCAX+VHoKcr4fLrsXgeDkSYGaxUJ3HOn9N/+Rsvv6OPlZurhu6f4yAikUO4qNCcWYop9MqKMKOLT6k5Aj1M0XkG1AavubIkU5uGmwhqQ27IvnQ+yKPAqFp2VGioed3BEL1w+z1LcpAZ7IxpqqH9XPC6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YsrohwnI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B0CC113CC;
	Mon, 15 Apr 2024 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713165847;
	bh=mtjuzYWTXjNt/TKS737D7L/iYneAHm1BA72FWWJzu9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsrohwnI4wUPZs4apN2BLtrNfm26SAeq3gbnrTUF5VUBUstwHr2y7Bcsj5UUF9S9s
	 IN6eUeS7zLXp5Iiot0E3FSVpSaEsBzKnw0x/c2yd2r+jA9OIgKC/+Gw3dW1NMedN/U
	 ca2wkYPSucycAgZRCA/g3+9f4aSZ2WY0rt6x5JNw=
Date: Mon, 15 Apr 2024 09:24:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.9-rc5
Message-ID: <2024041557-lagged-oxymoron-96bb@gregkh>
References: <20240415061749.GF112498@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415061749.GF112498@black.fi.intel.com>

On Mon, Apr 15, 2024 at 09:17:49AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:
> 
>   Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.9-rc5

Pulled and pushed out, thanks.

greg k-h

