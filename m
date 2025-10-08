Return-Path: <linux-usb+bounces-29026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23177BC4893
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 13:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59ED3A64E3
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 11:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D519B35966;
	Wed,  8 Oct 2025 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WOV/emSg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56867224B09
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759922519; cv=none; b=HMxBUZtN+dQ5cSAwUXZJo/8jyhVU9r3fJyWSuQB9HGMiBxSiB8JgLOA2nZv9ZuDctpfaWFciS86+6coVoUytIl09ozw/Oy2THyTlZ+vHquX973pCCt+ch8JLISjZCf7zmh2cqetCJdMZnxhAp6xHIbym8JuXcpeeFEBX8aEnUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759922519; c=relaxed/simple;
	bh=PckdGZ2olLGQ9qXZe59Psj3irDFstLgyvu3IEwEUT4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AaH0D8jwnuJhq8XBjFhDmUUf9uJTDDiSAEGPQPQYk8wsc8tRLfp8yAjKe72AnccrQi0mPDuxY7m9wU7qKqNq8kdR+94QOLKBp9wV1N255iDQXnjCV+nn9d3h19cdEBW1afeqPrSZMEUB02pfu8zWe1W2SjcixwPrkTpd6x/e1mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WOV/emSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADD6C4CEF4;
	Wed,  8 Oct 2025 11:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759922518;
	bh=PckdGZ2olLGQ9qXZe59Psj3irDFstLgyvu3IEwEUT4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOV/emSgPcecYZWdZt61GoFFeSKJ5C2BY8VEfSgeixF+lmt4KZdoGgzIqVZWaPqjs
	 YL+g0Ao9C9MPVm/hFWBb4fmh76G+Zo1SRttQfTfCRITZlJ97nf+ZsBlAVN3XLccoD2
	 ixSXTVpYZ5X1hFgIagjaV2TGoJGIABNCj3RwmmoM=
Date: Wed, 8 Oct 2025 13:21:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Subject: Re: [PATCH v6] usb-storage: Fix comment indentation level
Message-ID: <2025100802-sedan-security-3529@gregkh>
References: <2025100845-engraver-perch-dabb@gregkh>
 <20251008110910.33833-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008110910.33833-1-i.shihao.999@gmail.com>

On Wed, Oct 08, 2025 at 04:39:10PM +0530, Shi Hao wrote:
> Fix comment  indentation level .
> 
> The previous comment was indented at the wrong level, breaking
> kernel coding style consistency. The indentation has been corrected
> to align with the relevant code block.

This does not describe what this patch does.

Please take a break, relax, and come back in a day or so and start from
a "clean" tree to implement this after taking a look at the kernel
documentation for how to submit patches again.

You are making patches on top of patches, all of which will not work
here.

thanks,

greg k-h

