Return-Path: <linux-usb+bounces-28678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF80BA0AD8
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 18:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16310563979
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 16:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F882307ACE;
	Thu, 25 Sep 2025 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yGqu7bzd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A287E307AEA
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818482; cv=none; b=odHF3NudVQEwZthcnCPczM5TempmdB4bb7dH/oOYFPb/gHuu2YGB6DZ1ysAgVeXRkTgcERMRU20L3EwkBYp9/aFAvvTJMAxqzUaY7wo62X1A86iRYoTNE2SJYG7WOp42Kk2+nytlTo6aJFX4Arp/geLoH0kgAlx6340gEtfdtlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818482; c=relaxed/simple;
	bh=U57YID7E9B7TcPYy+XtOs0wbpnqu/1qbxdfHi0UGpp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYjYUqGQTs+399B5aANdhw+uhGzD7DQ9/+0YK+zwrnxasC0e7vIw9UFJxopujRXAg94+i8LbrX+uUAEBcGYZja7sqoSxuKTJVxYa1n/WbyKUUTh9NbIHZrbXq4S/E505jMaSF8Fe6B8+KjfGZaRBhitktR4xPGv3mkq0yMkBJrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yGqu7bzd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC8EC4CEF5;
	Thu, 25 Sep 2025 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758818482;
	bh=U57YID7E9B7TcPYy+XtOs0wbpnqu/1qbxdfHi0UGpp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yGqu7bzdHeA7PVr/JiW0IV7Sjc+GcdADVb1PSXIOC3tGDRmmjtoNX1hdzAobMcw4K
	 TrqqDU41lLA81IeWIvu1fM9RSI/E38VV6ZfmTPhK227OtX+1xawkQmnJspo6/N2oJm
	 UD/aGZ5WHYgT4LXdDAqgeAq6EpaHB551WZemd3Uw=
Date: Thu, 25 Sep 2025 18:38:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.18 merge window
Message-ID: <2025092528-dweller-elk-9f7d@gregkh>
References: <20250925094910.GG2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925094910.GG2912318@black.igk.intel.com>

On Thu, Sep 25, 2025 at 11:49:10AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.18-rc1

Pulled and pushed out, thanks.

greg k-h

