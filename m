Return-Path: <linux-usb+bounces-37462-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMA7OB+2BmrrnAIAu9opvQ
	(envelope-from <linux-usb+bounces-37462-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:58:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B44549D15
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A34FE3046FEC
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 05:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0A537700B;
	Fri, 15 May 2026 05:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2byAiGqI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803CE373C1D;
	Fri, 15 May 2026 05:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778824725; cv=none; b=sjn1UJmEH+ubqlbet0jovhQwI0Z4b0B8GHTR2igspwflauwHGNGOmMCGBcy3TWYnSnjHDhFFxfzsi1thK5jkw7z5qC+8WtjTd00HR1ceWmojqsEAmOjAI3iCbLxKSpnNlecihCEzI39W7eJvwF7BGJ6BgVJ1X1UweQ8vcvCP2xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778824725; c=relaxed/simple;
	bh=269b3wWzoOha4XQIm1eoCWoA7uhqLMJn2ReZ6kzIhYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euE02NVggP2pJhMLyB6rKoJjfJu58f2T+HjW4SHRHLVO2xj2PLRSoffG+H/8LvaOK13qG9wKmDFOxM3OUeHBcaJ1u/AA5Ysgr+BmcnS9YYLBe9AvOXoC3BbmnHHgmBYqwMbbhet3iEFp+hc/ur5Ua9cCzHz6crMWnC4wPKvI1oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2byAiGqI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA91C2BCB0;
	Fri, 15 May 2026 05:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778824725;
	bh=269b3wWzoOha4XQIm1eoCWoA7uhqLMJn2ReZ6kzIhYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2byAiGqIcyn0ZeaHrqlT+CXKz31ySstHSBTjPY+HW5sR0kzkxcSeFZ5v7c3/kqYTO
	 SVKD/PTU7oFG2qMr9i08+vdpIFOXTsMC+xaPlbNtZmYSoFb0YAPY/GmAh/m7jqJQvX
	 t2fLlHJGwBQybE4glVuCMAPRyz0QSY2qkFhl7PNQ=
Date: Fri, 15 May 2026 07:58:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Elliot Tester <elliotctester1@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: legousbtower: remove changelog, tracked in git
Message-ID: <2026051524-anthill-awoke-d35a@gregkh>
References: <20260514184706.101545-1-elliotctester1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514184706.101545-1-elliotctester1@gmail.com>
X-Rspamd-Queue-Id: 44B44549D15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37462-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,kroah.com:email,uwa.edu.au:email]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 08:47:06PM +0200, Elliot Tester wrote:
> Signed-off-by: Elliot Tester <elliotctester1@gmail.com>
> ---
>  drivers/usb/misc/legousbtower.c | 61 ---------------------------------
>  1 file changed, 61 deletions(-)
> 
> diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
> index 052ffc2e7..e34777c68 100644
> --- a/drivers/usb/misc/legousbtower.c
> +++ b/drivers/usb/misc/legousbtower.c
> @@ -8,67 +8,6 @@
>   * derived from USB Skeleton driver - 0.5
>   * Copyright (C) 2001 Greg Kroah-Hartman (greg@kroah.com)
>   *
> - * History:
> - *
> - * 2001-10-13 - 0.1 js
> - *   - first version
> - * 2001-11-03 - 0.2 js
> - *   - simplified buffering, one-shot URBs for writing
> - * 2001-11-10 - 0.3 js
> - *   - removed IOCTL (setting power/mode is more complicated, postponed)
> - * 2001-11-28 - 0.4 js
> - *   - added vendor commands for mode of operation and power level in open
> - * 2001-12-04 - 0.5 js
> - *   - set IR mode by default (by oversight 0.4 set VLL mode)
> - * 2002-01-11 - 0.5? pcchan
> - *   - make read buffer reusable and work around bytes_to_write issue between
> - *     uhci and legusbtower
> - * 2002-09-23 - 0.52 david (david@csse.uwa.edu.au)
> - *   - imported into lejos project
> - *   - changed wake_up to wake_up_interruptible
> - *   - changed to use lego0 rather than tower0
> - *   - changed dbg() to use __func__ rather than deprecated __func__
> - * 2003-01-12 - 0.53 david (david@csse.uwa.edu.au)
> - *   - changed read and write to write everything or
> - *     timeout (from a patch by Chris Riesen and Brett Thaeler driver)
> - *   - added ioctl functionality to set timeouts
> - * 2003-07-18 - 0.54 davidgsf (david@csse.uwa.edu.au)
> - *   - initial import into LegoUSB project
> - *   - merge of existing LegoUSB.c driver
> - * 2003-07-18 - 0.56 davidgsf (david@csse.uwa.edu.au)
> - *   - port to 2.6 style driver
> - * 2004-02-29 - 0.6 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - fix locking
> - *   - unlink read URBs which are no longer needed
> - *   - allow increased buffer size, eliminates need for timeout on write
> - *   - have read URB running continuously
> - *   - added poll
> - *   - forbid seeking
> - *   - added nonblocking I/O
> - *   - changed back __func__ to __func__
> - *   - read and log tower firmware version
> - *   - reset tower on probe, avoids failure of first write
> - * 2004-03-09 - 0.7 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - timeout read now only after inactivity, shorten default accordingly
> - * 2004-03-11 - 0.8 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - log major, minor instead of possibly confusing device filename
> - *   - whitespace cleanup
> - * 2004-03-12 - 0.9 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - normalize whitespace in debug messages
> - *   - take care about endianness in control message responses
> - * 2004-03-13 - 0.91 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - make default intervals longer to accommodate current EHCI driver
> - * 2004-03-19 - 0.92 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - replaced atomic_t by memory barriers
> - * 2004-04-21 - 0.93 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - wait for completion of write urb in release (needed for remotecontrol)
> - *   - corrected poll for write direction (missing negation)
> - * 2004-04-22 - 0.94 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - make device locking interruptible
> - * 2004-04-30 - 0.95 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - check for valid udev on resubmitting and unlinking urbs
> - * 2004-08-03 - 0.96 Juergen Stuber <starblue@users.sourceforge.net>
> - *   - move reset into open to clean out spurious data
>   */
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -- 
> 2.54.0
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

