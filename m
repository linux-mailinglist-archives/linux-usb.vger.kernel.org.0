Return-Path: <linux-usb+bounces-32001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B7CCFE814
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E543307CF38
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA20334C2C;
	Wed,  7 Jan 2026 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uFfrZ/nY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1DA33290F;
	Wed,  7 Jan 2026 15:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798101; cv=none; b=r5Hb9qQjJNfP813lww+rAVGo2iSKGNbOToY8F78/n9sReArG3Bx+0hzxH8FVzbXw43KbTGzViMh71nyvRWKDIQT3+/c3XK2KW/XJfMSszvzouDoiNWf8P4qijpqpyFQReEzSVTFHZsGIiyWbm06mEtBKPPfjrbnKhU490MGvpIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798101; c=relaxed/simple;
	bh=XtDwWt1sdRC0qXU7CxkJJJHu+Q2cAmeMPix7jLlTeIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iN6sdOmU9KcG1gjfp1tidqFiFfHopeihZFJ8fEH3TEZwdh0BYeDeoaKazR8tErb+tMEsv1g53up9ShaB5NIU1oWRnIWOpSFFDkC+J4ECiw9H03qzjegfGe73E4pLb6hQT9QHk0ZWZRs4A2c5Uu3SkAIQzE9C3bmdSVwcmyIOMXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uFfrZ/nY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C46C4CEF1;
	Wed,  7 Jan 2026 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798101;
	bh=XtDwWt1sdRC0qXU7CxkJJJHu+Q2cAmeMPix7jLlTeIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFfrZ/nYJm+5v9VFEMNpsv71zcJ+pBNPSP15smuwJqeVYgiJbUsBl40H2qL6LRgto
	 WOfNuX+2cDGZNO2AuZzTmyFMLL/DjlligRkv6AqTrsmsu8H2eFMOMPKs6pdYPXsYGb
	 5CETk5ejXUSpZtU1grwsl7hOG5sP2SkRZpoJ4AwU=
Date: Wed, 7 Jan 2026 16:01:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
	linux-kernel@vger.kernel.org, naveen.v@harman.com,
	sankarkumar.krishnasamy@harman.com
Subject: Re: [PATCH v2 0/3] Generic device enumeration failure notification
Message-ID: <2026010726-grimy-variably-b10e@gregkh>
References: <2025100805-resisting-target-419a@gregkh>
 <20251224115808.415753-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224115808.415753-1-Akshay.Gujar@harman.com>

On Wed, Dec 24, 2025 at 11:58:05AM +0000, Akshay Gujar wrote:
> This series is a revised version of the earlier patch, updated in response
> to review feedback in the discussion starting at:
> 
>   <2025100805-resisting-target-419a@gregkh>
> 
> The intent is to provide a small, generic mechanism for notifying
> userspace when device enumeration fails after hardware is detected but
> before enumeration completes.
> 
> Some devices may be detected electrically but fail to enumerate due to
> protocol-level errors or invalid responses. Today, such failures are
> reported only via kernel log messages. This series introduces a
> structured uevent notification that allows userspace to observe these
> failures without embedding policy in the kernel.
> 
> Patch overview:
> 
>   1/3 driver-core: add device_enumeration_failure_notify() helper
>       Adds a generic helper in the driver core to emit a KOBJ_CHANGE
>       uevent containing DEVICE_ENUMERATION_FAILURE=<identifier>.
> 
>   2/3 Documentation: ABI: document DEVICE_ENUMERATION_FAILURE uevent
>       Documents the new uevent and includes an example captured on USB.
> 
>   3/3 usb: hub: send enumeration failure uevent
>       Uses the generic helper in the USB hub enumeration failure path.
> 
> The USB change is intentionally minimal and serves as an initial user of
> the generic helper. Other subsystems may use the helper independently if
> needed.
> 
> Akshay Gujar (3):
>   driver core: add device_enumeration_failure_notify() helper
>   Documentation: ABI: document DEVICE_ENUMERATION_FAILURE uevent
>   usb: hub: send enumeration failure uevent
> 
>  Documentation/ABI/testing/sysfs-uevent | 22 +++++++++++++++++++
>  drivers/base/core.c                    | 30 ++++++++++++++++++++++++++
>  drivers/usb/core/hub.c                 |  5 ++++-
>  include/linux/device.h                 | 12 +++++++++++
>  4 files changed, 68 insertions(+), 1 deletion(-)
> 

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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

