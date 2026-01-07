Return-Path: <linux-usb+bounces-32002-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D04CDCFE7E7
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08F39300671E
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E326A342521;
	Wed,  7 Jan 2026 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lISmhaSi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4D126C02;
	Wed,  7 Jan 2026 15:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798153; cv=none; b=V9ZFd1qp74Te5v0YIsDf3UWDb7gqj5AdZYWTaZWRyxWuX0yCrmdvroGwV2NTC8x4zzh3ybq205PgM7LzqM/rIkyC/iJbwPBRIa1ca37mK1CVHma7NbTGLTk4EQ52vmAQwap1sA2bT877dLa5osq8bJ+zukABDO5opwa966aBiSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798153; c=relaxed/simple;
	bh=/3w3Yz3ER8tiG1AKvmWE8yJ3v6NF1LQwbPjuv2d5Y0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUfw25Nwj7M9ZBJul1OqF2O2rGB2fM6yAHuWcJhd8yM0XhAFOEwggqc/MSSe0eADV516pVmyUUb0AQQLjVPuLpQNktMnfE/lZQUo4j6w5eu12UBLihG5FIz7nxKFU0hTJmeWJG0dmpWpJViT++IV5HCLYhb11kXGT2wI0GKPkhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lISmhaSi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B83DC4CEF1;
	Wed,  7 Jan 2026 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798152;
	bh=/3w3Yz3ER8tiG1AKvmWE8yJ3v6NF1LQwbPjuv2d5Y0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lISmhaSiybOr46rz7aGg+x7W0F3uxd3U2thqNNZ/V3cGKuBM8J4bTMojG+Neue8KH
	 +aVczJcFyujkwZgCut7OqOPf3OUv8nxagl4TQ6Z7iC42v9o/+gC1BaFKMu/qv9WDQp
	 BeMHHriwX2LjC9OKmmRiFlzVHLIkE2Nt9+6SRqiA=
Date: Wed, 7 Jan 2026 16:02:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
	linux-kernel@vger.kernel.org, naveen.v@harman.com,
	sankarkumar.krishnasamy@harman.com
Subject: Re: [PATCH v2 2/3] Documentation: ABI: document
 DEVICE_ENUMERATION_FAILURE uevent
Message-ID: <2026010748-shrivel-curliness-755d@gregkh>
References: <2025100805-resisting-target-419a@gregkh>
 <20251224115808.415753-1-Akshay.Gujar@harman.com>
 <20251224115808.415753-3-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224115808.415753-3-Akshay.Gujar@harman.com>

On Wed, Dec 24, 2025 at 11:58:07AM +0000, Akshay Gujar wrote:
> Document the DEVICE_ENUMERATION_FAILURE uevent emitted when device
> enumeration fails, including a minimal example captured on USB.
> 
> Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
> ---
>  Documentation/ABI/testing/sysfs-uevent | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
> index 0b6227706b35..1f1573c8be96 100644
> --- a/Documentation/ABI/testing/sysfs-uevent
> +++ b/Documentation/ABI/testing/sysfs-uevent
> @@ -49,3 +49,25 @@ Description:
>  
>  Users:
>                  udev, userspace tools generating synthetic uevents
> +
> +What:		DEVICE_ENUMERATION_FAILURE
> +Date:		Dec 2025

It's not December anymore :)

> +KernelVersion:	6.x

Are you sure this will happen?  And the major number means nothing,
let's pick the real release number please.

thanks,

greg k-h

