Return-Path: <linux-usb+bounces-23730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF51AA98AB
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 18:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81DB817CF45
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 16:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D2826B0A9;
	Mon,  5 May 2025 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KkXWvOkg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3825D538
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462012; cv=none; b=QKkiaRcjI576+LiW+npnVk3I6lOdm3rfb57X/IJLlcwPiygpdQ6IQI/VRpKrM+UWQoP6D4INeuU+HEIafbMnAZA5NNficrl1MzGeYwuDNDEH1mDYrMKnh4lYH63JUQ2SYDsloNdXdKv2imvynmcdI26IjYu9amvNxxanWiBsvxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462012; c=relaxed/simple;
	bh=bP+2H5hUKtW4lSFFN95ZZ7Nh/CqvXyzQT0djhbQ82JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaiOtfISwNr9vWEB9NnpTODtEllX1D6X44BSZ5Qpsw6RSmBnKlob71ublDH0khUGxjkJTL4cZaLU3GAoiXwpJ/7vBrA8mj/HC7zB5SXlAHEYXx5ebxq4xLiOupEp2Bh16lt1E4PN47xJIeg/TG2RuaMCvxmj3jYR7NA04TvmTWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KkXWvOkg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C632C4CEEE;
	Mon,  5 May 2025 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746462011;
	bh=bP+2H5hUKtW4lSFFN95ZZ7Nh/CqvXyzQT0djhbQ82JE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkXWvOkgYMLWqVb2xs0MIoW+QmvJIYP8afuEo4/BH9J8zkS0WzznqKpKA0HdVDatP
	 sZy42huLPjvkBkjCXQJPGymMbnM3iMPQMtB/eaE18HRkuodE+wKKDGUb3J5brO9zs7
	 wWow0c/+GxQEpJaPcsPpXZJl7MHH8hAoArAXA1gs=
Date: Mon, 5 May 2025 18:20:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 220090] New: usb: teach the usb subsystem about
 non-coherent dma
Message-ID: <2025050507-tipper-quartered-5bf4@gregkh>
References: <bug-220090-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-220090-208809@https.bugzilla.kernel.org/>

On Mon, May 05, 2025 at 03:45:51PM +0000, bugzilla-daemon@kernel.org wrote:
> This is based on my findings attempting to bring the usb EHCI driver
> "ehci-hlwd" in wii-linux (https://wii-linux.org/) to mainline linux (6.14).

Great, please submit patches for this, BUT it looks like this:

> Commit 461db2bdbf3c978e76dd10a04a63fa06bb29114f changed the conditions needed
> to trigger a sync for non-coherent dma memory.

Might be the real root of the problems.  Please work with the dma
developers to see if that's the cause, as all other platforms seem to
work just fine with the ehci drivers that we know of, so perhaps this is
just a dma subsystem setup issue somewhere for your platform?

thanks,

greg k-h

