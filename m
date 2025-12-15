Return-Path: <linux-usb+bounces-31436-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84BCBCEDD
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 09:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D8CF300948F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 08:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ACF31B137;
	Mon, 15 Dec 2025 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UzwM+eU0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B851E31354E
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786376; cv=none; b=J3UM9eghPJgDHGYkjFr5wQIfqqzSXGuPs5vFSOvjxy58j/5Rp95pZbUyteUGKT8olOs+kwYAIYigpJaGtznZBR5G/M2y+6g/HTeaq30AQ+e6XZOikIX2Ip+ViFdYid7Ya/XKNkAV7/SuETizEakVmL51OtoQ1e9sommrQRCIESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786376; c=relaxed/simple;
	bh=TnibSIuqTD+xw/Wq7pm+z3eTrmr1rBbaEd4Hm7rUSA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tijg5MA0mvg58JWVgJK20Dy6Uw/3MTm2XWxnB0QuA4fopwveXJ68PoPplajuhrYfXCLm3vVgGUoGn3GiOmIMxwmZoho0pYn5hO/DQT5Wc6tD4yzJAvXpOJ3W2ZMHrv5yxCiJ2tq5g/8CCJOskbPUI6IExZJKMkhZiqA2KtcdQN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UzwM+eU0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92B2C4CEF5;
	Mon, 15 Dec 2025 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765786376;
	bh=TnibSIuqTD+xw/Wq7pm+z3eTrmr1rBbaEd4Hm7rUSA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzwM+eU0CIru7vTSNGYyykujKmhRcP8fIg5WZxRe/MirissAGPXn9GdSPuAZgt0o9
	 LA6sS/1EKYYmeL7+7BRz3EO3iG40Ld0eBQvrdIMKGfGNISpSZqz91WxcVQ9qIXeasD
	 mlxsn6tkrqf23oxZPAPtx5Z3uFeUfvHwPJiIJ/mU=
Date: Mon, 15 Dec 2025 09:12:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com, heikki.krogerus@linux.intel.com,
	lumag@kernel.org, ukaszb@chromium.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix null pointer dereference in
 ucsi_sync_control_common
Message-ID: <2025121542-implicate-ideally-dfa5@gregkh>
References: <20251214183729.150811-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214183729.150811-1-superm1@kernel.org>

On Sun, Dec 14, 2025 at 12:36:41PM -0600, Mario Limonciello (AMD) wrote:
> Add missing null check for cci parameter before dereferencing it in
> ucsi_sync_control_common(). The function can be called with cci=NULL
> from ucsi_acknowledge(), which leads to a null pointer dereference
> when accessing *cci in the condition check.
> 
> The crash occurs because the code checks if cci is not null before
> calling ucsi->ops->read_cci(ucsi, cci), but then immediately
> dereferences cci without a null check in the following condition:
> (*cci & UCSI_CCI_COMMAND_COMPLETE).
> 
> KASAN trace:
>   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>   RIP: 0010:ucsi_sync_control_common+0x2ae/0x4e0 [typec_ucsi]
> 
> Fixes: 667ecac55861 ("usb: typec: ucsi: return CCI and message from sync_control callback")
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

