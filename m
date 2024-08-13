Return-Path: <linux-usb+bounces-13340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D694FFCA
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 10:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB6A01F218F9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB30877102;
	Tue, 13 Aug 2024 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ezOt+O64"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524FE18E29
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 08:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723537570; cv=none; b=WRquvGEpvlsIY9y+RRHsU7DtQv4qtbKd1SH4MTuP381TYfcuDDzC8pAS/MYV8cM7/jUtPdlR2HKoNsHFLP2CyhufHhJzT/hjjG9WW4J3gwWr60O0lJAZVkLZOvlcDAsfYtCtm7weNZX5GTa+tqTFX8ahk5syys8dnqFFXpBJCqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723537570; c=relaxed/simple;
	bh=7qDJuGpfDLlRepsFDLuQYScdz+mX9gVfLdfFL/lyOF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXSu1J+XFg/6Mfp7w3zHwXKoS5dW6nOvpCIN38CZ5UbWT/UqAKl6OwxsntYbP4xoI+JURXuObHwPuxJTp0rJDHFzgDKL7Y8rD463qccaLqKaWUsgnKiM6W28slZUqgxSN9ENhAWCUyVLEkxmLFUHfrYiRdUroheGR4TYfo+qF0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ezOt+O64; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC2FC4AF0B;
	Tue, 13 Aug 2024 08:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723537569;
	bh=7qDJuGpfDLlRepsFDLuQYScdz+mX9gVfLdfFL/lyOF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezOt+O64xZ8VUPNnw28CpR4ASHYBHzyDTk0DJi4KSDfRqEJBIhMJHUe0/ZVaeq7vC
	 h3RVlVS5aSQ1ftb+niknD1EVe3Nsoi7vcUel0eVxOAy4xgKZY/S8ZlUXVzl5Txydos
	 SoDuLD02Ph4arHowrOpbxNWDYM8//Mp0G/vcawjI=
Date: Tue, 13 Aug 2024 10:26:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.11-rc3
Message-ID: <2024081353-deity-stability-6aaf@gregkh>
References: <20240808091426.GJ1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808091426.GJ1532424@black.fi.intel.com>

On Thu, Aug 08, 2024 at 12:14:26PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.11-rc3

Now pulled and pushed out,t hanks.

greg k-h

