Return-Path: <linux-usb+bounces-20738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0CBA393B2
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 08:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ECF016E093
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 07:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFC41B21AA;
	Tue, 18 Feb 2025 07:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jYB/Z5Xs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD387E1
	for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2025 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739862983; cv=none; b=sdcA4IY/UPFbu1U/SdE7ec1s7+TPR0VmdImpcFCSIXzpliE5Xx3TNI/NRE72RRdwU3sO2Vz1mJKe8wSNyJH8F1/qu2CNkAMQDQTs563sJ0aRW2Tm4SMMhaAaeDvSYopmTmhNojvT/f0+rSEReZfue1XOMr0y3Lhrc66XHYfgp+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739862983; c=relaxed/simple;
	bh=068EpuTYR1sNoaZhilGIn3GALZ2Ts4aiihvlsR6jcqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCEFF6vW9OVftgzLU+ZXvkxmWS/515JxgDU8NaKnst3gBNPeGGLDsED27VHhxyxACW5nA34rywBfTsDiq17EwMo/99HhUDsBXl90zM2FuOZWKGqwBwH9BH0bNkXNo1ovQOQnKikRYFKZ1RX3eRceIWIXRsEhmyXjlWy0aOk9uvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jYB/Z5Xs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C0FC4CEE2;
	Tue, 18 Feb 2025 07:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739862982;
	bh=068EpuTYR1sNoaZhilGIn3GALZ2Ts4aiihvlsR6jcqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYB/Z5Xslb7c7f4N1EnXLLCIURfFl2ogHMzQDbGl2Hjgn0N+WTUMKHbPXWxHAgF7j
	 1A0cCfOG4aNv5p+3irgK34RClxcziL+t5iN+NB+sTPD7G7qEx9bQkFS4hKEgn5cyH/
	 BcG93jjFyMPSHhN4UDKkbate6t/yi6eoPFm/BxEg=
Date: Tue, 18 Feb 2025 08:16:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: use-after-free with Lenovo Ultra Docking Station
Message-ID: <2025021853-stained-scared-9e60@gregkh>
References: <76af1506-3425-4d6a-b388-3304823fdd82@secunet.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76af1506-3425-4d6a-b388-3304823fdd82@secunet.com>

On Tue, Feb 18, 2025 at 07:52:34AM +0100, Philipp Leskovitz wrote:
> [1.] One line summary of the problem:
> A use-after-free is triggered when the device ThinkPad Ultra Docking Station is connected.
> 
> [2.] Full description of the problem/report:
> 
> When I click the notebook into the docking station (ThinkPad Ultra Docking
> Station, Type 40AJ), a kernel crash sometimes occurs. I think the function
> kernfs_new_node (fs/kernfs/dir.c) accesses a memory that has already been
> released. It looks to me that an access in this function occurs with the
> query "parent->mode & S_ISGID". The error occurs with kernel version 6.8.12
> and 6.12.x.
> 
> general protection fault, probably for non-canonical address 0xfefefefefefeff3d: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 7 PID: 2433 Comm: kworker/7:3 Tainted: P O T 6.8.12-grsec+ #1

6.8.12 is a very old, and obsolete, unsupported, and known-buggy kernel
version.  Does this also happen on the latest release (i.3. 6.13.3 or
our development tree (6.14-rc3)?

Lots of work has happened in the year in this driver since 6.8 was
released.

thanks,

greg k-h

