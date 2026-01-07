Return-Path: <linux-usb+bounces-32004-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE976CFE7F0
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C4D53133E3D
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58B4349AF7;
	Wed,  7 Jan 2026 15:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ddd2trhw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A33534886F;
	Wed,  7 Jan 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798287; cv=none; b=L5ippGaVTZqnTqRIfNmgyOImvbamhlbNxe7NXceWcPjAup0JWXdoSRcNni3FKXBKcfNEQSs/vUya9pbf7vSCbfGpJ57cdUjCrZCvANN3c3ZFEB3HBMoz2IgqUFozYw5P9W4qYpRT8OwvF1+P6bQf6AGtawJYP2Ya8uWp+B/KB4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798287; c=relaxed/simple;
	bh=8Wo8kMmhWAxcMtU3B1eiYo6LLBbGSTrIlkTxnTHfWbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GncdyVU+5sstO51ZQ7hF2t4oyMn80cEen6Q6j/Kwqo6TQxli464L5U60PcYupla0LQhzlo1NUrq/uhrJcaRazVZLjZWSKecsOaE9b14OEICmyJhOseXHDvl9ue8DtEfQX9ZeFWHsbG5XX0IczYDzRnvaTnUAwhU9G8gcLauK4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ddd2trhw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6EEC4CEF1;
	Wed,  7 Jan 2026 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798286;
	bh=8Wo8kMmhWAxcMtU3B1eiYo6LLBbGSTrIlkTxnTHfWbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddd2trhwOR/pBzy123b/dbBSpRWIdxd994sHA5Ptm/G7jlHZ2BLMmBj3fkoIcHoIk
	 Qu24sf3663V3syPK/jJVV1WRJGetLnb7Q7w6s7fGl9Wx4b30KLyex3OKTrz3OLVOvs
	 fc6a0PPRG5XP4s1kMmoHU6VOlIovrjYSlIfpvq0c=
Date: Wed, 7 Jan 2026 16:04:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: xhci: Fix memory leak in xchi_disable_slot()
Message-ID: <2026010723-earshot-staining-6e11@gregkh>
References: <20251225162119.1184703-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225162119.1184703-1-zilin@seu.edu.cn>

On Thu, Dec 25, 2025 at 04:21:19PM +0000, Zilin Guan wrote:
> xhci_alloc_command() allocates a command structure and, when the
> second argument is true, also allocates a completion structure.
> Currently, the error handling path in xhci_disable_slot() only frees
> the command structure using kfree(), causing the completion structure
> to leak.
> 
> Fix this by using xhci_free_command() instead of kfree(). This function
> correctly frees both the command and the completion structure.
> 
> Fixes: cd3f1790b006d ("usb: xhci: Fix potential memory leak in xhci_disable_slot()")

No cc: stable?

And how was this found?  How was it tested?  What tool created this fix?

thanks,

greg k-h

