Return-Path: <linux-usb+bounces-34932-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN8tDHFauWlpBwIAu9opvQ
	(envelope-from <linux-usb+bounces-34932-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:43:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A832AB208
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2802E30AA52D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 13:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F732D12EC;
	Tue, 17 Mar 2026 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gB2+gE8U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540FC2BCF5D
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754845; cv=none; b=pVPIYVvIOiClec1tBLxx+P0ObRkQ/mVzPZOAW6bGk5jvongu9RZY1DdXuM0BlC2WdBd9NtVJNMxs5780E7vv6bdigeePWkbAptM5eqKSLpBYEiuWpwaonLcGnKR/DwgGaIICLGcWYdFDxxspKSddMSnqx38ys6y1k6IglGE9IME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754845; c=relaxed/simple;
	bh=06pp+dEBd268K33K8Pw766V127rHGn66tof8/LjYwqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyaPVYZuz6qrBHXuQirYtV9QehgVqHJTtfT+Dnl4QPrSsApbmfCZCWCAQCvF90vlGKkjm8MEgNavE6ErJHDcM0TE24S/241MlmfwcoZymDTnknpsS2wOal65FPVxtBZEKHb3TsmOLotDv3KzTTyc+xpWHuK7lj3lEDtQZ00yCiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gB2+gE8U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2F5C4CEF7;
	Tue, 17 Mar 2026 13:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773754845;
	bh=06pp+dEBd268K33K8Pw766V127rHGn66tof8/LjYwqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gB2+gE8UA36CAzMYpAEUxnlGmZf/2htN/SUVzzCUUd1ymbRIdFiRTMPz4L4yvHDuc
	 GJ+yLdmChzx7EwzjbdZc0nnCV5SbBmF7g2LtsXF79Bhr/0DcTMIG1i5DgWI/f7RdBI
	 QLdh/+ktjQBlR9lr2cNflWOxXOsoKH4gCJuiLjaU=
Date: Tue, 17 Mar 2026 14:28:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: zaitcev@redhat.com, linux-usb@vger.kernel.org
Subject: Re: [PATH v2] usb: usblp: add the reset_resume function interface
Message-ID: <2026031730-fanatic-alias-3d85@gregkh>
References: <20260317125614.3215254-1-shitao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317125614.3215254-1-shitao@kylinos.cn>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34932-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: 92A832AB208
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 08:56:14PM +0800, shitao wrote:
> Add reset_resume callback to prevent premature device unbinding during
> S4 (hibernation) thaw phase, which would otherwise cause usblp to require
> a re-probe — a process that is slow and trigger error -517, and even
> has a high probability of causing use-after-free bugs and kernel panics.
> 
> Problem:
> When a USB printer(CH340S USB-to-parallel adapter ID 1a86:7584)
> is connected during S4 hibernation,the following sequence occurs:
> 
> 1. During thaw phase, USB core sets udev->reset_resume = 1
> 2. usb_resume_interface() checks for driver->reset_resume callback
> 3. If not implemented, interface is marked as needs_binding=1
> 4. usb_resume() calls unbind_marked_interfaces()
> 5. This forces disconnect via usb_forced_unbind_intf()
> 6. usblp_disconnect() immediately frees usblp structure if !usblp->used
> 7. However, PM subsystem still has references (usage_count > 0)
> 8. Subsequent PM callbacks access freed memory (0x6b6b6b6b SLAB poison)
> 9. Result: kernel panic in pm_op() with use-after-free
> 
> The bug manifests as:
> Unable to handle kernel paging request at virtual address 006b6b6b6b6b6b93
> pc : pm_op+0x50/0x80
> Call trace:
> pm_op+0x50/0x80
> dpm_resume+0xdc/0x200
> hibernation_snapshot+0x234/0x3d8
> 
> Signed-off-by: shitao <shitao@kylinos.cn>
> ---
>  drivers/usb/class/usblp.c | 1 +
>  1 file changed, 1 insertion(+)
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

