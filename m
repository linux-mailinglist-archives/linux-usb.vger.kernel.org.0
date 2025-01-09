Return-Path: <linux-usb+bounces-19163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900BA0754E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 13:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 626B23A7A49
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 12:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51920217645;
	Thu,  9 Jan 2025 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p2Jul8h3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA4216E12
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424571; cv=none; b=H0hz8qD38mps9lNa9dzOasgSgegQwMEwZ2XiGIBWoJ2NzdQeyf1RQbvcS+3XUg4u2tnvJ7vyXE2D2E+dn4BTR6Sj+8rKf8T1YHEMjX6icwVh11s8OJZpOcwlbxhPjAtqKfFbBHDbRnHFfsUc+zxSZmyqblvRja1aUkjDsdI5d7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424571; c=relaxed/simple;
	bh=PfOdMefM04LnGaKBSYn4PGv7hXzw2dPA40MH8q7Gki0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCzwQq17WXCWHJwY1149iCwvSVprTgsAl6JiRE9bbQquMSXzgaCtch5ynNHe6ZmQoZAQwT1A0TW0aJC6EsOsy4eWCstPDqJ78Bqe9OX0Jdrp/0gfSn5e5TCYvYOtrGQ8j5K6LiQ1Z2epc5vMD6Th/v3kp3sE44xauFp9fdtBbeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p2Jul8h3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E10C4CED6;
	Thu,  9 Jan 2025 12:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736424571;
	bh=PfOdMefM04LnGaKBSYn4PGv7hXzw2dPA40MH8q7Gki0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2Jul8h3+NcHKhKtHZnpiTOsy0BsaGacqQfqe1AqCk5M0aaS4XuULPqNYnrJS0AHt
	 wQm2SHcQ3YrcIAAA5P9ExyTuT3a97S98jGjgCt1Z+5QECrIEtjuwKK/E4M5UyaR/Vq
	 bk5L17fBWNNUDGqvv8K3AwWafNAziy2CMyGcKFj4=
Date: Thu, 9 Jan 2025 13:09:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Robert NEMKIN <lists@buci.hu>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb crash?
Message-ID: <2025010936-anthem-escapist-6e66@gregkh>
References: <a803932b-d0d2-4b32-8ef2-dc1beee7a47d@buci.hu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a803932b-d0d2-4b32-8ef2-dc1beee7a47d@buci.hu>

On Thu, Jan 09, 2025 at 12:29:05PM +0100, Robert NEMKIN wrote:
> Hello everybody!
> 
> I saw a possibly kernel bug.
> It's a debian trixie with kernel compiled by myself.
> With 6.12.6 everything seems to be ok.
> With 6.12.7 and 6.12.8 I saw crasges in dmesg.
> I attached dmesg of some tries and lsusb.
> 
> Thanks for any hints.
> 
> Robert
> 

> dec 28 07:44:08 brick kernel: ------------[ cut here ]------------
> dec 28 07:44:08 brick kernel: WARNING: CPU: 0 PID: 296 at kernel/trace/trace_events.c:577 trace_event_raw_init+0x159/0x670
> dec 28 07:44:08 brick kernel: Modules linked in: xe(+) gpu_sched drm_suballoc_helper drm_gpuvm drm_exec drm_ttm_helper hid_generic usbhid hid i915 i2c_algo_bit drm_buddy drm_display_helper cec xhci_pci rc_core xhci_hcd ahci ttm libahci drm_kms_helper libata nvme intel_lpss_pci crc32_pclmul usbcore thunderbolt crc32c_intel drm scsi_mod igc intel_lpss i2c_i801 nvme_core idma64 scsi_common i2c_smbus video usb_common fan wmi

This isn't a USB issue, it's a tracing core issue with the xe driver.
It is fixed in commit afc6717628f9 ("tracing: Have process_string() also
allow arrays") which will be in the next 6.12.9 kernel release in a few
minutes.

It's a harmless warning for now, no need to worry.

thanks,

greg k-h

