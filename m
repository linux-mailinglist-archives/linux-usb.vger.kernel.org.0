Return-Path: <linux-usb+bounces-21453-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B1A54F6D
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 16:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21AA169D0E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB071FDE37;
	Thu,  6 Mar 2025 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ix0hdXvR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E0218EFED
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275925; cv=none; b=sivDPQnOkWOzzI7j0i+fhqcKB2jO0sOyvz0G+qgSxNfGWixdNH9M53bwmR5lHTjeCKDEhGGC/8KD5LU7r1ZqwCd+LBaZ29TCHQ/NG1OMktyKKOQrDTHfuKxG5cTXaXIC2Mn2c/MRiyKFpZ9395LHdsla9Q8tQRGpTSG3yADFW3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275925; c=relaxed/simple;
	bh=7YLxwGdoCDEI6VVCmm0XBS0IFXfkWEeXQ4c4RsNxnXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MniiRJEQHITro8zr0uij4Wz+EQdspBDiJrwmHE6X/cDRnGp/yyu6flp95SnzqGxIBQI1SGhhoIYx9RzFvsRL1ApOH+QdV56qZ5Yr34whCvcNfdMClPQpgEXPhPWq+WIRXNP58Xh/nY0aSVRH8fE7bLK09kyf2PwIRYCUteu4570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ix0hdXvR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9B9C4CEE0;
	Thu,  6 Mar 2025 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741275925;
	bh=7YLxwGdoCDEI6VVCmm0XBS0IFXfkWEeXQ4c4RsNxnXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ix0hdXvRyi6B22m/PiDWNxMTVATQcjVo2doYBBTnL7ixMEDcAq8ZxauvmsAC8gdLU
	 C4fgGpnmDkffUkW1mgizq5lRc9DB0KnzPxmmkwh7GTsx2YvD11q1bj6SrtjDNlVXoI
	 wtbHkNmwClGWqsvQBMcdrpWiQrhxC/wCAGduQhes=
Date: Thu, 6 Mar 2025 16:45:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Kenneth Crudup <kenny@panix.com>
Subject: Re: [PATCH] thunderbolt: Prevent use-after-free in resume from
 hibernate
Message-ID: <2025030644-unbraided-drool-647f@gregkh>
References: <20250306084145.373237-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306084145.373237-1-mika.westerberg@linux.intel.com>

On Thu, Mar 06, 2025 at 10:41:45AM +0200, Mika Westerberg wrote:
> Kenneth noticed that his laptop crashes randomly when resuming from
> hibernate if there is device connected and display tunneled. I was able
> to reproduce this as well with the following steps:
> 
>   1. Boot the system up, nothing connected.
>   2. Connect Thunderbolt 4 dock to the host.
>   3. Connect monitor to the Thunderbolt 4 dock.
>   4. Verify that there is picture on the screen.
>   5. Enter hibernate.
>   6. Exit hibernate.
>   7. Wait for the system to resume.
> 
>   Expectation: System resumes just fine, the connected monitor still
>                shows screen.
>   Actual result: There is crash during resume, screen is blank.
> 
> What happens is that during resume from hibernate we tear down any
> existing tunnels created by the boot kernel and this ends up calling
> tb_dp_dprx_stop() which calls tb_tunnel_put() dropping the reference
> count to zero even though we never called tb_dp_dprx_start() for it (we
> never do that for discovery). This makes the discovered DP tunnel memory
> to be released and any access after that causes use-after-free and
> possible crash.
> 
> Fix this so that we only stop DPRX flow if it has been started in the
> first place.
> 
> Reported-by: Kenneth Crudup <kenny@panix.com>
> Closes: https://lore.kernel.org/linux-usb/8e175721-806f-45d6-892a-bd3356af80c9@panix.com/
> Cc: stable@vger.kernel.org
> Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation asynchronously")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/tunnel.c | 11 ++++++++---
>  drivers/thunderbolt/tunnel.h |  2 ++
>  2 files changed, 10 insertions(+), 3 deletions(-)

Want me to take this now?  Or are you going to send it on in a later
pull request to me?  Whichever is easier for you is fine with me.

thanks,

greg k-h

