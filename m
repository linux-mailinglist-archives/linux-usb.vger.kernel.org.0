Return-Path: <linux-usb+bounces-37461-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKGhOfq1BmrrnAIAu9opvQ
	(envelope-from <linux-usb+bounces-37461-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:58:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43295549CFB
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD46C3040FB4
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 05:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453DC372B3C;
	Fri, 15 May 2026 05:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="untkZfJI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2E2245031
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 05:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778824693; cv=none; b=uWqAOMYYg3Rq84nUKUQc/oEIj5NoS9+MNz5mcEt+bFWBbHw/uvwtIjN0sPwoRkrADeI6Fv5rJela8Fy8P11gYdz3WmC49rAl6GNdO71GbJsBpzQHBvrO/I9rJ1Rqsr9zE4MvUkbi0YUsuKhs1TGl+Lkr1OAwcWdvvAXKY+Cmr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778824693; c=relaxed/simple;
	bh=PQofuAc79D4n6VjwJvdQHVwCl/aNuUEUOF+7lSnbD8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPpdM2vwNkLt7a4twyX0N7pxbwJ9LKbso1qD2PhZh6EyoKsQ62TBXiuyp/7R4hgpTdtDbva6jHDFUpwZRtE6XvV/2orqlvLZeDZi532shmIh0hFCWf6BUf7MAAVzAEoHSBnz941XuIutA/dQsTcU+3nSssJPrt3hN5vfX/BATwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=untkZfJI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23414C2BCB0;
	Fri, 15 May 2026 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778824693;
	bh=PQofuAc79D4n6VjwJvdQHVwCl/aNuUEUOF+7lSnbD8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=untkZfJIzDYtpslna7tdtHmAwWEB0k8EC9wknIMpYm05qLFnv9R8Yw2pcZekMUi9x
	 snlbP7sAZ/Gx1TT7dTdKW76iDNa2gYux2ZFGGhnNhXUxj5xj6JRGWGBnAwftCOYaOf
	 dE3FFpRDIi9EwexbOcCFp5Z32McW5iPbsRI2f9Jc=
Date: Fri, 15 May 2026 07:58:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Carey <carvsdriver@gmail.com>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com, guanwentao@uniontech.com
Subject: Re: [PATCH] USB: cdc-acm: start bulk-IN polling when
 ALWAYS_POLL_CTRL is set
Message-ID: <2026051506-theft-growl-5a79@gregkh>
References: <CALPvROTsnvWJZVmW6L_gdF5_Pv4ic3gKbAKYyyC_-n0mffmnAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALPvROTsnvWJZVmW6L_gdF5_Pv4ic3gKbAKYyyC_-n0mffmnAg@mail.gmail.com>
X-Rspamd-Queue-Id: 43295549CFB
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
	TAGGED_FROM(0.00)[bounces-37461-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 03:42:52PM -0400, Dave Carey wrote:
> The INGENIC 17EF:6161 touchscreen composite device has a ~55-second
> watchdog that resets the USB device if the bulk-IN endpoint on the CDC
> data interface goes unread. The existing ALWAYS_POLL_CTRL quirk keeps
> the notification endpoint (ctrlurb / EP 0x82) polling continuously, but
> that alone is insufficient: the firmware monitors bulk-IN activity, not
> just notification-endpoint activity.
> 
> Add acm_submit_read_urbs() calls to the two ALWAYS_POLL_CTRL paths that
> already restart the ctrlurb:
> 
> 1. acm_probe(): start bulk reads at probe time alongside the ctrlurb,
> so the watchdog is satisfied from first bind without requiring a
> userspace process to open /dev/ttyACMn.
> 
> 2. acm_port_shutdown(): restart bulk reads after port close alongside
> the ctrlurb restart, so the watchdog keeps running when the last
> TTY user closes the port.
> 
> acm_read_bulk_callback() already resubmits each URB unconditionally on
> normal completion, so once submitted the reads remain active until an
> explicit kill (disconnect, suspend). acm_submit_read_urb() is a no-op
> for URBs that are already in flight (read_urbs_free bit clear), so the
> existing acm_port_activate() call remains correct and races are avoided.
> 
> Tested on Lenovo Yoga Book 9 14IAH10 (83KJ): without this patch the
> device resets every ~55 s when no TTY is open; with it the device
> remains stable indefinitely.
> 
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> Tested-by: Dave Carey <carvsdriver@gmail.com>
> ---
> This follows commit f58752ebcb35 ("USB: CDC-ACM: add INGENIC 17EF:6161
> quirk for Yoga Book 9 14IAH10"), which added ALWAYS_POLL_CTRL to keep
> the ctrlurb active. That commit addressed the notification-endpoint
> watchdog (~20 s). This patch addresses a second watchdog that fires
> when bulk-IN data goes unread for ~55 s.
> 
> This patch is based on top of Wentao Guan's pending fix
> ("USB: cdc-acm: fix misplaced quirk defines and BIT(9) collision") which
> moves VENDOR_CLASS_DATA_IFACE and ALWAYS_POLL_CTRL from inside
> acm_ctrl_msg() to cdc-acm.h and reassigns them to BIT(10)/BIT(11) to
> avoid the NO_UNION_12 collision. The bulk-IN additions here are
> independent of that renumbering and apply cleanly to either base, but
> the combined tree is the correct target once Wentao's fix merges.
> 
> drivers/usb/class/cdc-acm.c | 6 ++++++
> 1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -799,6 +799,9 @@
> "ctrl polling restart failed after port close\n");
> /* port_shutdown() cleared DTR/RTS; restore them */
> acm_set_control(acm, USB_CDC_CTRL_DTR | USB_CDC_CTRL_RTS);
> + if (acm_submit_read_urbs(acm, GFP_KERNEL))
> + dev_dbg(&acm->control->dev,
> + "read urb restart failed after port close\n");
> }
> }
> 
> @@ -1566,6 +1569,9 @@
> if (usb_submit_urb(acm->ctrlurb, GFP_KERNEL))
> dev_warn(&intf->dev,
> "failed to start persistent ctrl polling\n");
> + if (acm_submit_read_urbs(acm, GFP_KERNEL))
> + dev_warn(&intf->dev,
> + "failed to start persistent bulk read polling\n");
> }
> 
> return 0;
> --
> 2.47.0

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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

