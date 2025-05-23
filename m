Return-Path: <linux-usb+bounces-24251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5AAC1F9D
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 11:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3091417851A
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 09:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDA9223707;
	Fri, 23 May 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rptv/s5N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9D18DF8D
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991869; cv=none; b=ilsHO5rd3bFQ6PnfEAVuiy5Aw+XjmvlomxtqQe2SPWdpGzLc9pqZsIM/6YshS3/1/ei4gVzAMajXLEk7UfZXk8uLO3XKs9HqlM4vyBu0H79nbuZmWQHMkeSAD2+LxHkbyQYM2Y3oWkBTS/1XOitVzxZNTKHChERRIjKEf2bRcJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991869; c=relaxed/simple;
	bh=m+x94HuAkXQlA60g/087aMPve+QyIq0PFSeZn1Upx7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+lsefxrbyzmKNZn4lMy90/G/T1nnEaCkvSgKyEu7tpF+Tyy0G3A+vQnT9jQ5pyn7Io3d37O3X7CPdQEk7mDencHhsOOzYQHlTnLFYPV3n56nB8zH/v3zNleaQWiPW4JZdqnqNTl6djI9dlrOJyjOYbGC9vM/GwcPbHXoKBmSDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rptv/s5N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD10C4CEE9;
	Fri, 23 May 2025 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747991868;
	bh=m+x94HuAkXQlA60g/087aMPve+QyIq0PFSeZn1Upx7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rptv/s5NWjCwC/PUO97q3yl16Z/cTa4h+7MIs77Yk8cCQMT/qzGcqO1LpGAatjkM0
	 UIHzB5baCB0A5zWGMukF66YfPNrKHFHfsn9JvpR+wGBtDpapqahUIud3oBzYY1bizZ
	 +vMEkIZlWWvnjYmePBOLOT147L7LRGA4SZx30FR4=
Date: Fri, 23 May 2025 11:17:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vadym Hrynchyshyn <vadimgrn@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usbipd: enable tcp keepalive and set its options
 for accepted connection
Message-ID: <2025052331-pregnant-squid-5b1f@gregkh>
References: <20250523090802.17987-1-vadimgrn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523090802.17987-1-vadimgrn@gmail.com>

On Fri, May 23, 2025 at 12:07:22PM +0300, Vadym Hrynchyshyn wrote:
> If usbip client does not close a TCP/IP connection to a daemon
> gracefully, the daemon will keep this connection open indefinitely.
> 
> The issue is that the client cannot attach this device again
> until the device will be rebinded by commands:
> "usbip unbind -b ..." and "usbip bind -b ...".
> 
> This issue was reported by a user, look for details here 
> https://github.com/vadimgrn/usbip-win2/issues/109.
> 
> To reproduce this issue, run "usbip attach ..." to attach remote usb 
> device and make a hard reset of this PC by pressing Reset button.
> usbipd will keep this connection forever and will not allow to
> attach this device again until unbind/bind will be executed.
> 
> To fix that, enable SO_KEEPALIVE for accepted connection and set keepalive
> parameters if corresponding program options are passed.
> 
> Vadym Hrynchyshyn (3):
>   usbipd: enable SO_KEEPALIVE socket option for accepted connection
>   usbipd: add long options to set TCP_KEEPIDLE/TCP_KEEPCNT/TCP_KEEPINTVL
>     socket options
>   usbipd: use usbip_to_int to simplify usbip_setup_port_number
>     implementation
> 
>  tools/usb/usbip/configure.ac        | 24 +++++++-
>  tools/usb/usbip/src/usbip_network.c | 96 +++++++++++++++++++++++++----
>  tools/usb/usbip/src/usbip_network.h | 14 +++++
>  tools/usb/usbip/src/usbipd.c        | 58 +++++++++++++++--
>  4 files changed, 174 insertions(+), 18 deletions(-)
> 
> -- 
> 2.43.0
> 
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

