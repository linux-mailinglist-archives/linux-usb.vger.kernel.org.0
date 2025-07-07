Return-Path: <linux-usb+bounces-25524-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A38AFAF30
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 11:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7551AA0FE8
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 09:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D764D28C2C3;
	Mon,  7 Jul 2025 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ovq0g8OF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E99328B511
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879084; cv=none; b=OQABFb/60L3csmxVHxpAjOePtKx00tQ/8zlub5eQugkSIRG7yX2vTeNHBu+5qC+mvQfeF0OibCMwkqxSEUf+Sfi/lv6QOOBRM61bRkO2anQ1iVq0IbyVa28E1rNw8eHI5C4x8FlLrpdcuh8iWMENKPohhaqkTxrjhWI+weWnFqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879084; c=relaxed/simple;
	bh=AAaNmij3zAy58pf+DYkYQO0IFFApvlvYY5fuK0Boxc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrqnWtotfr0eSB3hS8/dqQYJdJHr+4zn8pfJxO9eGaNLC+oi8NGOp719iMnDsv9B1ieQEmes9D+ZiWVivm6a1HOxYrd1dGw0PyWIVwTuIqEYBNFU/5iiNIoee+2cAstk5R4J7mhaw8khBsr24N98kWrtOb5EQAEbfM5vD5B8P1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ovq0g8OF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D80C4CEE3;
	Mon,  7 Jul 2025 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751879082;
	bh=AAaNmij3zAy58pf+DYkYQO0IFFApvlvYY5fuK0Boxc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ovq0g8OFPgxtPSi+VRoxD7lcHjZKL1QJCN4ryPm0AnvKM4T0e8IXq0K5ABMuP0ELu
	 5383O7pECZuMuBpnKqzyv2xr4lQKOEq8prrMM7/IXyXRjEI56WCwomCba486d0RQsY
	 Vo3HJhgutm/pnf4wFZJSlld4no0Qexvy7m2RzMfs=
Date: Mon, 7 Jul 2025 11:04:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.17 merge window
 (early)
Message-ID: <2025070732-monetary-unselect-1669@gregkh>
References: <20250626155811.GL2824380@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626155811.GL2824380@black.fi.intel.com>

On Thu, Jun 26, 2025 at 06:58:11PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> I'm sending this one early due to my vacation starting after tomorrow. Just
> a single documentation fix. Thanks!
> 
> The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:
> 
>   Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.17-rc1

Pulled and pushed out, thanks.

greg k-h

