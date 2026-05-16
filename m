Return-Path: <linux-usb+bounces-37533-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCr2FLQZCGpLZQMAu9opvQ
	(envelope-from <linux-usb+bounces-37533-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 09:16:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112E55A92F
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 09:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95F9B3018D5D
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 07:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F2D35E1BB;
	Sat, 16 May 2026 07:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="d2oCQedh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qmQ+4BQs"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBCF1DE8BE;
	Sat, 16 May 2026 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778915754; cv=none; b=AVEEgF47P39OXv4jS1RlW9Dj7jVbNqjET6qZEPmadKFZjne4k5PD59w9pB0pGIC2nm1+u5rtl5pLFi+VeEk6WxoFDjlZ0zCL/YDbyefbeeF31Hv1cI5w+mcEWg/iUTiQ0dwIObc/EwR1slWG+Rz9GSgrEFK2gbAFFRzoHJb28KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778915754; c=relaxed/simple;
	bh=rgs5+s1ClX0Wn1KpSlAAAhP8rv0biZymFmNT20x1tsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLTzPisB+0IL67NIo8JjCk9L+h9rBWcpGxk5RZA69N4BFncYzyVlRR0VQXI8/c8HtpIc5z9h21tVR7nnPLgxi5SazdZEPgtJ6hIuuc2bbGScxqk50i92v3kcjG6xkdfcAso4qMqoTCapj4VYArJYlofbxqG1p5F0A49UubKYQVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=d2oCQedh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qmQ+4BQs; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BADE71400012;
	Sat, 16 May 2026 03:15:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 16 May 2026 03:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1778915751; x=1779002151; bh=qCClhENl6H
	MJKu2LecGNJ1FrfVRDziov1RWw4ZBe5XM=; b=d2oCQedhe4P3wHfSQt4ZbHKFvw
	ftuKqEQ/tSVA8G/cV+5pXFegHjfAqfjtPfaLiq10pJHZAhAy5uG589l+Ay7mdOJt
	vp8mQQ0VkxPXpyTxca8xF/4q7beWXjGtHziOjkIGyoijlLmXYusetarLkuhxvvK3
	eUkDhi7BXERkNcbyY0EaX02Cwdtb7wurpr/mpZUNpjWuJ4LN8kEObwYHOn0SxGn4
	vhvxfZyJgpRZn5Ei6lzLYDK3bOslbCd1na/ZzTkTD9O7INI8poLBTYRUbnb/1RP/
	ua0TmueBJoTQiIwtH5/gvc61c1myYQDg2YDbuyfXv+6Mj04bUCiIr3Q7jB5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778915751; x=1779002151; bh=qCClhENl6HMJKu2LecGNJ1FrfVRDziov1RW
	w4ZBe5XM=; b=qmQ+4BQs1gZlfETtn6FO1q/4lbfTNr9VKAZbO0tiduxyqGR+SUo
	E85pMmyixDBwK9qEJKtlvaq8y3KNPCcRGu1olObB9m7d3A304Je+5tQ33qCCH8WC
	6pU6WK/h4qgJjLs2Ooxc8bUCLuoE/ySi0KefvdskAeuzdnmXd8oQmiQxXvIaSTB/
	gq1Xc2QkW92AGYODYR/iS8j5JnlHZ7rsGUw3jEpFcRNS5cDEJ6faXMIOeopqDyid
	gKR62ZtBBZawvKLNwOozYjheQul+HySYhP3rGLmtVjz1SHH29bwDEPvA1Hb/Bu0D
	l7pocnLDx9IyKJLtNpOgoPt6hlLJlMfgXYQ==
X-ME-Sender: <xms:pxkIamUy-mZNtzZUSZ0-0PgqLw-jB8iGWmABBxzAsTI9ZZXqQaRiXw>
    <xme:pxkIak03uKvLbMWF7zjkpTrg82N8gfxKWazY8tW6roc2vh8hpABJsrtCrY6zHTUh7
    98Z07FUM3givAMujCTZEYUCLAXVVq7UeIkYZt9sYv3XO17zfA>
X-ME-Received: <xmr:pxkIasqVXksiv3RrdxZq3sQCdUw5aqVN8A0kuGjtwOTWPkc78ysBlTulUmIHRXUEGxX9sAIfug1TunqwcRT3j_A4Ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufedvieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegvlhhlihhothgtthgvshhtvghrudesghhmrghilhdrtghomhdprhgtphhtthhopehlih
    hnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pxkIajWxwOLdhR8Je9fw-6BMXWl61ZNiU1URyhdcvPAdNDm1Vb6jWw>
    <xmx:pxkIavbl0UVNA8APh6K4RzXEPHGxfx5-YL4a_iq_Kp09uRJRhD_7TQ>
    <xmx:pxkIaodND_SB5vvHYvOZU473l532EiTylMrbp9dd-XS1igsRoE-5rw>
    <xmx:pxkIah2oeahUSS3ybCbS08yUxWfSXwPrQ2tyT4LcBQWLqW0KdlXhYQ>
    <xmx:pxkIagXOfmCEJ8OD4kOmqaCDBVvt344WcA1fKznGjL0uCCJRGhPeeMtb>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 03:15:51 -0400 (EDT)
Date: Sat, 16 May 2026 09:15:06 +0200
From: Greg KH <greg@kroah.com>
To: Elliot Tester <elliotctester1@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: legousbtower: remove changelog, tracked in git
Message-ID: <2026051654-rudder-phony-a9ec@gregkh>
References: <20260515180132.27565-1-elliotctester1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515180132.27565-1-elliotctester1@gmail.com>
X-Rspamd-Queue-Id: 4112E55A92F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37533-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,kroah.com:email,kroah.com:dkim]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:01:32PM +0200, Elliot Tester wrote:
> The changelog in legousbtower.c is no longer maintained and has been tracked
> in git for a long time, so I removed it.
> 
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

