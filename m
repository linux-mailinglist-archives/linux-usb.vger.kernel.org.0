Return-Path: <linux-usb+bounces-22988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB9AA861A8
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 17:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86B12189FFE5
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 15:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4A420B1E2;
	Fri, 11 Apr 2025 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G5Lxu90V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2CF1F418E
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384856; cv=none; b=Jos/7UUG8q8dReurpsC4cuL0X66IuojMLBinZEr3UZsawXmitE1mUDmIVPHjA9Ijg320rAdJRV9K0NBUS4dXGjrkKEf3oYvA27VBe/f2KQUo65OVqod30B7SfJ5n/jNFHJn4Bxjjba237Gqv81xxaZMIQMY0lwVM7B96eaO64H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384856; c=relaxed/simple;
	bh=Gwr4FMSXGFIGYwMkBtw97BPXuKiuceDrIo+M92aNXa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmdJ3YBLY3DsUU2rum1qHfykxNaDSnBjm4QCgZ4CvF3gT0uqiaNLmX8pOtq27KK4WLFBGA3p/LVeIZvjxSw7jGu0Q1x8H8pdnE3O+bRaeiyMCCy9PmdXmdjrpsZkY9UnfmxJE2ejPkOy35NQYReb6qVsgM/KJGscpMioMQxd1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G5Lxu90V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B6FC4CEE2;
	Fri, 11 Apr 2025 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744384855;
	bh=Gwr4FMSXGFIGYwMkBtw97BPXuKiuceDrIo+M92aNXa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G5Lxu90VDT3A8vTO3ChIJqaWp7DVuKac9QMDoh0e/v6e3T3gRJj4iX/cGD9zs/c6H
	 REIl+PF2nWyv7FRwS4KLYsouFAuAbWX0oEGOC+eStbzT9oX6Njvn/3RNbriu0sCj64
	 EhZgG1tFop75ygkwNBiCSNZ7pWSOQrIIzanzMVO8=
Date: Fri, 11 Apr 2025 17:20:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com,
	michael.jamet@intel.com, westeri@kernel.org, YehezkelShB@gmail.com,
	rajat.khandelwal@intel.com, mika.westerberg@linux.intel.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix a logic error in wake on connect
Message-ID: <2025041139-avid-upswing-6444@gregkh>
References: <20250411151446.4121877-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411151446.4121877-1-superm1@kernel.org>

On Fri, Apr 11, 2025 at 10:14:44AM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> commit a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect
> on USB4 ports") introduced a sysfs file to control wake up policy
> for a given USB4 port that defaulted to disabled.
> 
> However when testing commit 4bfeea6ec1c02 ("thunderbolt: Use wake
> on connect and disconnect over suspend") I found that it was working
> even without making changes to the power/wakeup file (which defaults
> to disabled). This is because of a logic error doing a bitwise or
> of the wake-on-connect flag with device_may_wakeup() which should
> have been a logical AND.
> 
> Adjust the logic so that policy is only applied when wakeup is
> actually enabled.
> 
> Fixes: a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect on USB4 ports")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/thunderbolt/usb4.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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

