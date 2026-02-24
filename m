Return-Path: <linux-usb+bounces-33648-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOsKNXuTnWlKQgQAu9opvQ
	(envelope-from <linux-usb+bounces-33648-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 13:03:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D96186B31
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 13:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67A133016168
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 12:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC41738B7AD;
	Tue, 24 Feb 2026 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7KJkXtr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B921938A72A
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771934581; cv=none; b=C91qVe6YWHjWfZc0crjlJUj4us8dM+x+05KulFj88DWL6UyW+oAaUAKjCE6DYpPJuIK3BS7M17sCB26Y/ZPe5xYvs7jt2/U+Sg/EsfzEDSZJUAdxnGOh0IKqh431My5MOVnWwSSkDMw0LKmG3vgOifSwBR0YvXl9a+fLl6RKb/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771934581; c=relaxed/simple;
	bh=uirNYUMPwRROHJM8+ztNE7YuJonK5UwiLd5dUZUU/1c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fNHO7IPPI23yGU9ac1ARL8R4IuYtGKkvC9cbgqkZfra/vhqXXWfxSAk7fvVthmaUFiEVQQWRwkRRWiJAgCJssumYFVa0cAwPPbmNGe976sFIRoU+BBUzdzcZBdht0CPSlU1eZmcGfpql4p3JRwkDI+/euTzjTD72eW19I72xMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7KJkXtr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C280C19422
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771934581;
	bh=uirNYUMPwRROHJM8+ztNE7YuJonK5UwiLd5dUZUU/1c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u7KJkXtrwoXHM6iPZ5+qEGh6rGcSgPzO2KZndwlClPbikhPJS/ZngjKhtR6AA9sPN
	 0L+IfUsc6MccTggfw9VkuqhOc5SLRw35+5rugNFTwyaM8Fxv7YbsNrF4L+k8NhEoeu
	 fXL+7q/1EzGmUmUgnwtZJ9y5imZY4C1F/kyloSqUA87CaIX2sy7wR4el7Qpxvk8ery
	 6Hq6y0aXvKHdnRxbk0UOtT3kxFwKPaXvhfGlx3AvrB/d+C9q1DGOe/nXfQl2RiRps3
	 WOoomIJPFNvShRY5TySWJtoR/bM+FC63pjF7v0WpPvzYR+akCXsehiWGPCHMGmWeTy
	 BJtEDSOTONeAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E3B1C41614; Tue, 24 Feb 2026 12:03:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 24 Feb 2026 12:03:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221103-208809-Ouc38mRsur@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33648-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0D96186B31
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #22 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
As Michal stated above this is due to reading 0xffffffff from the xHC mmio
USBSTS 'status' register in xhci_resume(). This would happen if a PCI xHC
controller isn't properly powered up yet.

I'll add a hack that sleeps for a little while and then retries. Lets see i=
f it
helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

