Return-Path: <linux-usb+bounces-20854-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02206A3D64B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 11:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D828317BB7A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 10:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD691EF091;
	Thu, 20 Feb 2025 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fmr9exNw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A51CAA9C
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046629; cv=none; b=FFixvsXGTOTHQheh3W6us2rP4iYxGH/JeL7Kg61mor5lCIX8I4QLxoI2Ny+xJsJXoVoep9NWuv61z3J+6HUUH878yPlHjSMwBucI68tfanzh8LBS1o61wT6BZkVbZhA9Hdy4t2RxsZ1+moXBf5NahhIBSQ20Ae0ZJckDpHNsxJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046629; c=relaxed/simple;
	bh=9KmqJ1BEHtKG4QjE9I9x08RkC0QExrDPqMk5h1YNYg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncM4TEd7ExruYem/dNukIFdegYVg2S9YgE5lz2hyHed5Rp+ROw4Hz3Ja7rz4WsfQY2TDPRTcFqbss7I6R26dbmiCyRiBsbGlktLbXffxJQQGCKAhTCL/wPjUwmMwnJigV4KGCB8zVclqhZpirzKsCfXA/7wiG1sbaXKrhhFWwuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fmr9exNw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7514EC4CED1;
	Thu, 20 Feb 2025 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740046628;
	bh=9KmqJ1BEHtKG4QjE9I9x08RkC0QExrDPqMk5h1YNYg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmr9exNwYm+Eigi0OLlbuoRjsmymPDes4BRtM/W+WIidJnlUh9WQnnIlrWudSaLlC
	 miYloqK2FjnGUEP2DfyTG6jmuYlimsMHc4CEyT/1wVay0RDxpfrGg5SEp2fSDUDF6w
	 WeRDmBtBzZl16eas2D0JWwaXRNm8TMatFp+V5lZ0=
Date: Thu, 20 Feb 2025 11:17:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: use-after-free with Lenovo Ultra Docking Station
Message-ID: <2025022009-hurricane-amiable-2195@gregkh>
References: <76af1506-3425-4d6a-b388-3304823fdd82@secunet.com>
 <2025021853-stained-scared-9e60@gregkh>
 <e17329a8-eb65-4dbe-ae8f-3b68efcf11f5@secunet.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e17329a8-eb65-4dbe-ae8f-3b68efcf11f5@secunet.com>

On Thu, Feb 20, 2025 at 10:34:33AM +0100, Philipp Leskovitz wrote:
> Hello,
> 
> with kernel 6.12.12 I also see such an error in the typec driver. There is also a warning in the log.
> 
> <4>[  783.320429] Oops: general protection fault, probably for non-canonical address 0x31373836396332a4: 0000 [#1] PREEMPT SMP NOPTI

Can you duplicate this without the closed-source, out-of-tree kernel
modules loaded?

And this docking station is very odd, has it ever worked?  Is there a
bios update for it?

thanks,

greg k-h

