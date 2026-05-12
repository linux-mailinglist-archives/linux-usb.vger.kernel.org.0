Return-Path: <linux-usb+bounces-37343-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oSxtN4JIA2qS2wEAu9opvQ
	(envelope-from <linux-usb+bounces-37343-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 17:34:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBE9523B91
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 17:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A36C630331B4
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A5F3B1032;
	Tue, 12 May 2026 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAWNSBZD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61BA3B993A;
	Tue, 12 May 2026 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600005; cv=none; b=MIzBt1Ay1j4NwVcrayx5HAEJ4IR21FdVfByqPCImVhZsnr1Ghc2nDxhfUbKEqiZcQJMvRpqVfH3NqDVFWh6/PubtiwVuMg9/N1joLPPGLtfLKaUSTA5uyIpgkq/KZMHJSvyxkt1JRiHnx/tmnHScw5VplSKrrmCGJ8qr5z9lPvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600005; c=relaxed/simple;
	bh=VbNaStc1qBADIt4CSjtSb6nwrPlXzwDQ+ag4jwdYNoY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=icMLWCUCiPA/kWO9HyYwOIXp9L3lkJvNM+ERSaqdMV4sL+f3NPULJBZVM1DCiEks55cOCHPTSimfO29lEn7L/wT1MH+lCIH+vwkga1GKfgqjECykqQa7Y/RbWkTQRn6VKDOLZyuG0MYNQ9vTrm93sevBtfzu/Thv+96kcChi5tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAWNSBZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E38C2BCC7;
	Tue, 12 May 2026 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778600004;
	bh=VbNaStc1qBADIt4CSjtSb6nwrPlXzwDQ+ag4jwdYNoY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DAWNSBZDEkq7tMIJMPiP42Z3Z+pLjil2O/6yPuJnJ1aNki3yPSgQVxjKKYL4YAS1h
	 q35WMdzb9MxuS9ONvFnir6ODwS+lzNA0Z+XnSsSAiscqifWfpMO1eX9etQHAxjofFI
	 AhaVgvPB3MYFTs55TdMPl6YWqVUzNbG2yCYanGJJO2USoV7IAsHMoYxD7ZQw7/0KAu
	 zHeRPEdoRY5Q4OAkeGEV9ZzT899jvdICW2wVeG5/Qcs0YIeP0dHr2cWMEbHxRsxVu0
	 xGt0NaYUx4R0/gjmZqpAf0qWENlv6GjgeT6V73G/oCdtVWRySmp98HmkaXTSnLv/Jz
	 Ot/gTLqqMS9sg==
Date: Tue, 12 May 2026 17:33:21 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org, 
    linux-input@vger.kernel.org, linux-hardening@vger.kernel.org, 
    linux-kernel-mentees@lists.linuxfoundation.org, 
    Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: replace strlcat with better alternatives
In-Reply-To: <20260410192447.7059-1-mahad.ibrahim.dev@gmail.com>
Message-ID: <qo3q917q-77q7-03q2-8458-8p2q2n99q41r@xreary.bet>
References: <20260410192447.7059-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 3FBE9523B91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37343-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,xreary.bet:mid]
X-Rspamd-Action: no action

On Fri, 10 Apr 2026, Mahad Ibrahim wrote:

> In preparation for the removal of the strlcat() API as per the KSPP,
> replace the string concatenation logic in hid-core, usbkbd, and
> usbmouse with struct seq_buf, which tracks the current write position
> and remaining space internally. The changes implemented include:
> 
> - Replace device name and phys concatenation with seq_buf_puts().
> - Include Struct seq_buf and its initialization.
> - Include header file of seq_buf.
> - Replace strlen() with seq_buf_used() on the string buffer which was
>   tracked by seq_buf to increase speed.
> - Add size_t len in files which did not have it.
> - Use of strscpy with length in place of strlcat.
> 
> Testing: This driver was compiled as a module as well as in-built in
> QEMU with the QEMU basic mouse, and QEMU basic keyboard. The testing was
> done in the following steps.
> - Add Hardware Mouse in QEMU checking the usbhid module.
> - Verify dmesg string name of mouse.
> - Blacklist hidusb module from auto-loading, and removing the module via
>   rmmod.
> - Load usbmouse module, and reattach QEMU mouse.
> - Verify dmesg string name of mouse.
> - Repeat same procedure on usbkbd module.
> 
> This aligns the driver with KSPP security guidelines.
> 
> Link: https://github.com/KSPP/linux/issues/370
> 
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


