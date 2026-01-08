Return-Path: <linux-usb+bounces-32055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F346DD03FFD
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 16:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7959C308FBE3
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 15:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F2E425479;
	Thu,  8 Jan 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aqjoR08N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8401C3EFD3A;
	Thu,  8 Jan 2026 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863726; cv=none; b=OtJ7aEef5mLcWFHmEJ0mjHkjMRSSODUgL9hcXelYUCgE/DxcFQaQK/63TiMSndaGT6mg+u4mRqOoPIQKvZ9pRV/M5R6pxKpr0ywTptZLg9vBeyChow9dFVT/RqEctMSkrvIOTeilbx9yvm3cXXlhRVk0ZLYPLf8W7AUtIfCTn8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863726; c=relaxed/simple;
	bh=8NuEwgNVOlqCnQUfr+flH8AZTZw3fUpFUlFzaZofMMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbC6LlbHesUCUOugemI7wxe3SWXI6+WqNxV0pAwTOts6v34AXAc52kRc54fPcWOONwiDNgz0dvrnNL0ZAIM4f/657BPR194WhiKQl3Rzz6LOODrPbZNh6Mgue2r+OH8Xa2sa6XyS0Cv6PubgZjj77en/S5sduKnMFoHlfiWThls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aqjoR08N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AF0C16AAE;
	Thu,  8 Jan 2026 09:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767863724;
	bh=8NuEwgNVOlqCnQUfr+flH8AZTZw3fUpFUlFzaZofMMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqjoR08N3fW33LhRb9/vRBJy+6sJx7n6JGt1ExDb3T1EFDXtTkPztS2EwFH2/f3xp
	 z4mDDsOiSVK6hJhDcGjsr5yvFG1YrXJTXNfPIauLaF1iAlf8Ys/ZCrPmwHn/OdURhv
	 RvrR2NiRWF6azp9nz8phkRvXsLrq/u3d1i4udGqY=
Date: Thu, 8 Jan 2026 10:15:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: jianhao.xu@seu.edu.cn, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [PATCH] usb: xhci: Fix memory leak in xchi_disable_slot()
Message-ID: <2026010835-footless-decrease-e72a@gregkh>
References: <2026010804-commuting-hardly-0204@gregkh>
 <20260108090531.788192-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108090531.788192-1-zilin@seu.edu.cn>

On Thu, Jan 08, 2026 at 09:05:31AM +0000, Zilin Guan wrote:
> On Thu, Jan 08, 2026 at 06:42:51AM +0100, Greg KH wrote:
> > As per our documentation, you need to describe the tool being used,
> > please read and follow that, otherwise we have no idea of what is
> > happening here.
> > 
> > thanks,
> > 
> > greg k-h
> 
> The tool used is an experimental static analysis tool we are developing. 
> It is based on the LLVM framework and specifically designed to detect 
> memory management issues.
> 
> The tool is currently under active development, so we do not have a public 
> repository link at this moment. However, we plan to open-source it once 
> the associated research is published.

As per our documentation, you need to say all of this.  Please read:
	Documentation/process/researcher-guidelines.rst
and follow that.

thanks,

greg k-h

