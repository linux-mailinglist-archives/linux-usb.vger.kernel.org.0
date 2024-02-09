Return-Path: <linux-usb+bounces-6171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AAE84F8B5
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 16:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88FA4283DD6
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA17A74E12;
	Fri,  9 Feb 2024 15:37:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 72CCA69E07
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707493079; cv=none; b=uKad8HZElgLUkymfZ6uRCF9eUq5othAuxYQk8T7hdzL7Y8ufFGLQZVhY/2+WHfXJ/08XRT/3aAWF0/UPQRcIz5YyzYjiwtPSiH6dRAXPoYLhjJZQSK6EE27V2/K+GAwfjMrMyK4MvequUB4CQ/dQJwJ1Mo7cgGFWqnCwzkap/7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707493079; c=relaxed/simple;
	bh=Yiez5BLk19XCyjr5ZMEN818vLzIHQKcpWeL8VekEEL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAYirPHpLj81RPdJE2T7FSE/whdDLyYmWvPnOlh29Iolp6AF1NeqgALyB4M7m2F8vTZkXw4WSXB67Reboy+agntFEkxUDsu9DiUe+As6s1ide8hroRXqRzYHozbBCf2NEDoxeiCnboKxFGZtXpsUQZbsEcNZHyBpP2h3d2Ds550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 263963 invoked by uid 1000); 9 Feb 2024 10:31:14 -0500
Date: Fri, 9 Feb 2024 10:31:14 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Tasos Sahanidis <tasos@tasossah.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb-storage: Ignore UAS for LaCie Rugged FW USB3
Message-ID: <b16e72ad-3f2d-46a8-8361-2641088694df@rowland.harvard.edu>
References: <20240209151121.1004985-1-tasos@tasossah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209151121.1004985-1-tasos@tasossah.com>

On Fri, Feb 09, 2024 at 05:11:21PM +0200, Tasos Sahanidis wrote:
> This external HDD fails when plugged in to a USB 3 port. Ignoring UAS and
> falling back to mass storage resolves this issue.

What happens when it is plugged into a USB-2 port?

> [   56.338088] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW USB3   1081 PQ: 0 ANSI: 4
> [   56.339162] sd 4:0:0:0: Attached scsi generic sg2 type 0
> [   56.343484] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: (500 GB/466 GiB)
> [   56.343600] sd 4:0:0:0: [sdc] Write Protect is off
> [   56.343604] sd 4:0:0:0: [sdc] Mode Sense: 47 00 10 08
> [   87.365885] sd 4:0:0:0: tag#26 uas_eh_abort_handler 0 uas-tag 1 inflight: IN
> [   87.365897] sd 4:0:0:0: tag#26 CDB: Mode Sense(6) 1a 00 08 00 04 00
> [   87.381852] scsi host4: uas_eh_device_reset_handler start
> [   87.514256] usb 3-1: reset SuperSpeed USB device number 2 using xhci_hcd
> [   87.538153] usb 3-1: LPM exit latency is zeroed, disabling LPM.
> [   87.539720] scsi host4: uas_eh_device_reset_handler success
> [  118.102578] scsi host4: uas_eh_device_reset_handler start
> [  118.102733] sd 4:0:0:0: tag#26 uas_zap_pending 0 uas-tag 1 inflight:
> [  118.102745] sd 4:0:0:0: tag#26 CDB: Mode Sense(6) 1a 00 08 00 04 00
> [  118.231029] usb 3-1: reset SuperSpeed USB device number 2 using xhci_hcd

Have you checked to see if any of the quirk flags can prevent this 
problem?  It looks like the only issue might be that one Mode Sense(6) 
command.

Falling back from uas to usb-storage could reduce the throughput 
considerably.  We would like to avoid doing this if possible.

Alan Stern

> Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
> ---
>  drivers/usb/storage/unusual_uas.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1f8c9b16a0fb..b1d99c57cf8a 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -45,6 +45,17 @@ UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
>  
> +/*
> + * Patch by Tasos Sahanidis <tasos@tasossah.com>
> + * UAS hangs during Mode Sense(6). The quirks for the similar "Rugged USB3-FW"
> + * disk (US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME) do not resolve the issue.
> + */
> +UNUSUAL_DEV(0x059f, 0x104b, 0x0000, 0x9999,
> +		"LaCie",
> +		"Rugged FW USB3",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Julian Sikorski <belegdol@gmail.com> */
>  UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
>  		"LaCie",
> -- 
> 2.25.1
> 
> 

