Return-Path: <linux-usb+bounces-25219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B32AEC7C8
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 16:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D85827AEC8C
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 14:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88C5246764;
	Sat, 28 Jun 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NdUWRJ4P"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0762110
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122002; cv=none; b=n+OMNVMjo6UjMdyPqSdoXblRuAZH7iA0jo5PusLCIpvNpU8ywDhJ5M6FS/8h7Byivh+vvnVbB/iZG0UbyKGhzxK8pHqRuxVtmfB1IpuOetEvnTpudq0AMmjPIap8Ukigh1CrMv2Oz0NZKA+WdtxejSyckBpreuIrLijGXFdndjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122002; c=relaxed/simple;
	bh=2OKDhCukj462X61S/o5jVo0UTokAqK0gKvJWaYoVkis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF3gQcnk68HiCROEvhl79HBVzJDwJ0fYwJFDnkLHzEfW+kMtp1ySo5tJWartMU1dtfHiexNnD9aF0HP5/AglBAUdQUt5Hn45Yen7E9ksCKmfLZwn2GdcrdflkLPuIajsqGQGoayyS4bfLrXXANDz1yQFdA+0rDA60xCsYzSQAAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NdUWRJ4P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AC9C4CEEA;
	Sat, 28 Jun 2025 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751122001;
	bh=2OKDhCukj462X61S/o5jVo0UTokAqK0gKvJWaYoVkis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdUWRJ4Pq8xTk5YmIBtxc+tOzo8nMB7L7CwPMZYnOBSfOoj6khlDYAJY2Z/8nDQPq
	 b8kereTszVKOd1dk0b06dCcUavybKgnT/cr+vJnA48Qqy5w6th8BSkcWOsvCr6V5ov
	 G7ZZ1DxNz/HKibMMOmJIWTOUkXstqD4dwV4C1qcQ=
Date: Sat, 28 Jun 2025 16:46:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com, broonie@kernel.org,
	stable@kernel.org
Subject: Re: [RFT PATCH v3 1/1] usb: hub: Fix flushing of delayed work used
 for post resume purposes
Message-ID: <2025062810-slush-trillion-b199@gregkh>
References: <20250627164348.3982628-1-mathias.nyman@linux.intel.com>
 <20250627164348.3982628-2-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627164348.3982628-2-mathias.nyman@linux.intel.com>

On Fri, Jun 27, 2025 at 07:43:48PM +0300, Mathias Nyman wrote:
> Delayed work that prevents USB3 hubs from runtime-suspending too early
> needed to be flushed in hub_quiesce() to resolve issues detected on
> QC SC8280XP CRD board during suspend resume testing.
> 
> This flushing did however trigger new issues on Raspberry Pi 3B+, which
> doesn't have USB3 ports, and doesn't queue any post resume delayed work.
> 
> The flushed 'hub->init_work' item is used for several purposes, and
> is originally initialized with a 'NULL' work function. The work function
> is also changed on the fly, which may contribute to the issue.
> 
> Solve this by creating a dedicated delayed work item for post resume work,
> and flush that delayed work in hub_quiesce()
> 
> Cc: stable@kernel.org
> Fixes: a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/linux-usb/aF5rNp1l0LWITnEB@finisterre.sirena.org.uk
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
> v3:
>  - Rebase on top of a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
>  - Rewrite commit message 
> 
> v2:
>  - Add and use dedicated delayed work struct for post resume work
>  - Add commit message section about dedicated work

This seems to work, want me to take this, or are you going to submit
another one?  I'll hold off on sending the pull request to Linus for
-rc4 because of this.

thanks,

greg k-h

