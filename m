Return-Path: <linux-usb+bounces-33508-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFMZCpsymGleCgMAu9opvQ
	(envelope-from <linux-usb+bounces-33508-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 11:08:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B8166A8D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 11:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34E23300C3B1
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE5B337BAC;
	Fri, 20 Feb 2026 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usXEsHB9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FEA337BA5
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582078; cv=none; b=Rh4TuYpWtES0o9H4pOxOoxith7Daot48R0RtjTVuk1ISLVV5KtzGfWTWIR6B3KlcPNsftGbKhMkDdSHiikMCmoaAuRkOlJX2yjpGghACGFYic4gX5jgov9a54Ujxng5E4UfrR4x8+cKwqLtW1n5mmjKuEPSYJ/btYp6dEHsWLcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582078; c=relaxed/simple;
	bh=Cn9iy43MRv3kv39EfI1QnSdMij4x9h6g4yVa5rauV8M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GPKSYJ314lqZ8ABcMmAXhbQ0BK7EbAYu6/VX5LQV6aWcc25fcNS2uaz21hGnoTTVVTYf5dxyGq+lBu+mapwc0ZYs2tIAFTu6tWsxgnLPXx88hvkHNvohQ+V/4n79UuyUMqA5YiUibqInBflRAwUqctR/iG0EV14i8VRf3N+9/Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usXEsHB9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5362C116C6
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 10:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771582077;
	bh=Cn9iy43MRv3kv39EfI1QnSdMij4x9h6g4yVa5rauV8M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=usXEsHB95i6bdektXQOXr8AGjFQWVaXNzgON5S7i7eUJXIt3V7AHiYsYzh72sPW9U
	 XeaPbJ45yANd3tPWUnvjdcVyOnXopYCUkc3N7AgkMWIgFE+IfGxMZbzsVbrADVXJkH
	 UYf/7oAHLkbipaVWIpyB6pEHLYloalzL5pHkJ4o+oKxqBRoHkvsXd7y0HeidhSC7Gw
	 DC15pXF0XhSRi6Z2oEvtFG/syh6qL9CXdrPhAmSP1R6mWbejzH6EZmIT/4YV/0bzac
	 ODAlfTtyeT0sMdL/FD9WEGvxl49pnEsKDHaBrw/gCAvogIqB3PGpBTYlRz5yGQzB7Z
	 7XZgGVv3PuWWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD3D4C41613; Fri, 20 Feb 2026 10:07:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 10:07:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@unnservice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-81pZ0utVvy@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-33508-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,unnservice.com:email]
X-Rspamd-Queue-Id: 4D2B8166A8D
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #9 from Paul Alesius (paul@unnservice.com) ---
> Or perhaps simply this would crash it?
> while sleep .1 ; do true </dev/bus/usb/010/001 ; done

Yes it froze the system on iteration 3000

A C program without ioctl also froze it on iteration 887. Doing ioctl seems=
 to
trigger it much faster at iteration ~200.

I ordered a USB-to-ethernet adapter in the meantime to try to get more
diagnostics through netconsole, instead of serial cable, will that work?

Or do you have enough information about what may be wrong so that I can can=
cel
the USB adapter order? Otherwise, it will arrive in 4-5 days. (USB-to-Ether=
net
because I don't have a laptop with RJ-45 from my PC.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

