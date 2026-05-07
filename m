Return-Path: <linux-usb+bounces-37105-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAidLbX5/GmxVwAAu9opvQ
	(envelope-from <linux-usb+bounces-37105-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 22:44:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3B4EEDB1
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 22:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 520CD30956AD
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 20:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B2B318BB3;
	Thu,  7 May 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCu0LIMf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757D311C01
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186253; cv=none; b=JSWeWFrysJQ1Gkguykd2FRE98zTjV0G3PEl4WYV61cACIoA+objBL/vmVl/jRlzFmmE2d03DkvitDRLzhWVTuKKgnvLvSFFDP78qouH1TOiEv8YCGGekcnLHXbh2ff10U298G8xtJ8xMU4RIr6l02qd+HtrNnOldUF5g8DXNIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186253; c=relaxed/simple;
	bh=PYP0brEifYNinqm1AvXFicZ3XQ+yJaqxAhkPpGCLQ0M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OGhmm1qFnBsXxvKWTVXRzVdkTpbkDOOwWe50Kg895T3P3PqArWKpMlF2Xo4Mw/i3UuPa4hcHXKdnkkCh/CWt9KrJralXvoJut2Y0s2/BEfz34u6Dcp2V/NW0IiNma0Bvdk/uQiENgYXJbNV0Mh7t6QLaZ0dbZFOcb5/3OXNhaS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCu0LIMf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7474CC2BCB2
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 20:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186252;
	bh=PYP0brEifYNinqm1AvXFicZ3XQ+yJaqxAhkPpGCLQ0M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gCu0LIMfTUvRrReKdEfpO8CIp5GVxPFme7xZ5foGAF5YeG2Ynnq4+xn/L8Eld6/uf
	 mlYqQMRXmAveqSzesZrYQ1/6+vv2Cew/XaH/oouf1LltX0eni2TVi36ZC9Jlo34OfX
	 sl2n0JFER3oSEB+37vgwUl/CZFXALk/dpDdUEm2s7oAPGi8WJZlJjOwoSKlTD2TS6E
	 KgRK1pillVhPM+OKhE8orMOrQ5Al4zqYeKbc752RR6D3bRmsSEbUm7SFY+7vhy4sul
	 g1T5fciRP5yMhC1s5gL3k3c1/9ACC0QlwghXH9r9i9T62osdRPafZoGh09Xi8PvPXr
	 GpQCRnzqtxRYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6961EC4160E; Thu,  7 May 2026 20:37:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221422] xhci_hcd host controller dies on Intel NUC8i5BEH with
 USB audio interfaces (POD HD500X, Mbox 2)
Date: Thu, 07 May 2026 20:37:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221422-208809-2Sz73RSn9M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221422-208809@https.bugzilla.kernel.org/>
References: <bug-221422-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 39A3B4EEDB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37105-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221422

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #3 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Out of curiosity, would you mind describing what was causing the problem and
what software change solved it?

I suspect there is still some bug there, maybe you found a way to avoid it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

