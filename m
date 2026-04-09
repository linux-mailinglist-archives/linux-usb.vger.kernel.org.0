Return-Path: <linux-usb+bounces-36116-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PBxFmkd2GmZXwgAu9opvQ
	(envelope-from <linux-usb+bounces-36116-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 23:43:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C312E3CFFB5
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 23:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C50113016018
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 21:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F47346AC2;
	Thu,  9 Apr 2026 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4N1nxuO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329FD2E8B83
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 21:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770981; cv=none; b=dFEy1xiD47yhwq3rUaYUA7FeI9VKYcWkNU6+JUdThc//3l0zLeoFY2BCXf8aTh0aMwsJeVwk5HN6Tm5ZggqGHT99Zs0heJmElfzqy82jy5bLul9aWE/Pc/j7hyjHDh7ZP3eUyyp59pwfVVNAFJfclWc9vH35T2DROqOoifxlI+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770981; c=relaxed/simple;
	bh=lD6cJfoIU5R64aA20dkUISqOtbyPIcgzASKpuXd3paM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pp9i8Yf2t9HEetH2AdCognKUoa9FN2TvF7tWWdnXJMXbpBzruq8nGB1XeSapA5SxI8YdCDbBEglS9mUvVUJ8ooPJYydxoq3WQ+CJmcZCConFZpqkCMwZLL6xbxQM4zE/euYMKAYi1eFifTTGXFTwxFvsxjL5R9/H0KWM+je4ttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4N1nxuO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE3F8C4CEF7
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775770980;
	bh=lD6cJfoIU5R64aA20dkUISqOtbyPIcgzASKpuXd3paM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P4N1nxuOC+5eyiDLGhCtaBNbXMdjRaQFjyiSjLFyrK5X4UR7h8f0aa3NHgl9hT7I9
	 mCr8YKmFnLCAtadNlT+w5RXxxSfcscdwNQ+UBdAT0ytVRBu7jpt3C57KEZBuO1t/ah
	 VNtiiXA06UyvTFBdrp1ir6kiC4JU1FX8H51mR4ErNY+tE8DDO+6H5+t/Y+GvrnlBNg
	 BJSph8J6vimhiLXyK1lYkEjV14l/VDMB9ju1o7ETHEakGAwa2fBI8NgZ2ACIcOppGw
	 KP+wEWAErrDA0Cq5nCz7MWUe4PMTQmBW3hKIlul6YOL5LMBlcsq9wOzBdDEFAUJSB6
	 7yzjmd2FBby2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB6D9C4160E; Thu,  9 Apr 2026 21:43:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Thu, 09 Apr 2026 21:43:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-gM7lDUajKi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36116-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,proton.me:email]
X-Rspamd-Queue-Id: C312E3CFFB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #2 from DaisyTheFoxxo@proton.me ---
Appears to be the case, yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

