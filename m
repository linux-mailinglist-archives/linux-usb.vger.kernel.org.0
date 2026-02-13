Return-Path: <linux-usb+bounces-33338-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DqQLbo8j2mtNgEAu9opvQ
	(envelope-from <linux-usb+bounces-33338-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 16:01:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD56137609
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 16:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1EEE3011877
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 15:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C632D34A3A7;
	Fri, 13 Feb 2026 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gihW/ijF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5480F1B4224
	for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994865; cv=none; b=GrTia9iNLdtMJvDdSReeiiiVWIOu5U60fayzuWFGvpSWPt8pVPO4tz1UYCy7MD+EzU9KTchbN3roHu88B7qBDRAxo8+q8XjSs6/i66BpPuCX9FuzpCvVrnwcuKpaPvPFyK76QGTVySBH/qq/yAqQrPO8SpNMLYVghmV1W8GVwro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994865; c=relaxed/simple;
	bh=HZGiblf5WgjTZvS5+NGP4YrrZukHxiQVZC2dwukLciw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ELlHVF1qJL1DjZkxFMlHmT/vWNi9Jn3UkXtWXdqEv8RkkLUaWgETadcz8aSRHBtErmZuYy3CR9eTJ4scwy+eLerHQaNANQUg6PrrSRGlkgAFod3WwU6W4eIvb/QHxN8Bsfq01f72m2ecxCNyPl93eSLgJaPlibMmMq1UiSuKXZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gihW/ijF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D14B6C16AAE
	for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770994864;
	bh=HZGiblf5WgjTZvS5+NGP4YrrZukHxiQVZC2dwukLciw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gihW/ijFOQgCmtw6EQxZGC62rb9prIWQrX2Jao7C7NYH37OxVXDDET9Iiq1g6nWjA
	 rzJOruRWuNQvhv7l/UUyvqahWyXw5VFnYPO9bdPa9AMsWr1v/Okl45WzEimNXRFFD/
	 QHFq1jknVgpluVTna0GpQPFLI2mqkE0frzbPzq03FDCncTnhY2z1/WWILEiJhREE2v
	 T3sVatd+YcksjdrAJMxbJ/jRluTuh0PKcU0Pi0NG54yR0tqzGZPV8tYgzLHD3XseK/
	 Mkp6UBDD4NzKa+mNV2yrzCqGb3nXZQHIq7+C51I4C6mnG94xoFE5CcORzjweRNNBLB
	 j0u6N5/KPWUWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C6A7CC433E1; Fri, 13 Feb 2026 15:01:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Fri, 13 Feb 2026 15:01:04 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220904-208809-uCtqUC5rIa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33338-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 5BD56137609
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #13 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
I was able to recreate this with a USB-C hub and forced xHC reset in resume.

So far no simple solution to solve this. I tried disabling the port in resu=
me
path before host reset, tried toggling port power before host reset, but
nothing helped.

So looks like we need to focus on why your Intel xHC at 0000:00:0d.0 is
reset in resume, and avoid that.

Your log shows you have the  XHCI_RESET_ON_RESUME quirk BIT(7) set, which
explains the reset.

[1.901865] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120
quirks 0x0000000200009890

Intel xHC hosts don't normally have this set. Looks like its forced in kern=
el
cmdline at boot in your case:

Kernel command line: ... xhci_hcd.quirks=3D0x80 rw quiet splash

Any idea why this is set?=20
Can you try to remove it and see if it works

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

