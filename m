Return-Path: <linux-usb+bounces-33660-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNEuKM7InWl6SAQAu9opvQ
	(envelope-from <linux-usb+bounces-33660-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 16:50:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C49189556
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 16:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 555E032205F8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 15:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D2739A808;
	Tue, 24 Feb 2026 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVFKOZyM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998323A1CE7
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947760; cv=none; b=Ixt281U5QTb5dtTU3207D5LeMIgmdE4CyZs/MHcowYJq3/YiDzlzbADyKmwgKMHr9IHJanvP3HW3F+GjMYMBKp1nVS7RUmMyAAHcQtHz4hN0QxQ05oCLCGB2vbA2Hunoc1dCcm/XOxkUfEvd8BCdcb11i+vgwqNDhx/+8wD+TA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947760; c=relaxed/simple;
	bh=LtBuy3+ILhpd9r3A1YFEiLPyBgB9AL/bN0WxkARZHF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yk2ItFERi2q+jlhfcUhFD70umA5+De6J5XD69cWbU5UUoh2x9VpoYmLLFphHMovaZE+ZZL/lFvBU+xaSF6HIKfEkbBjZN/WVCqUKaOnPACOAniq2AeLN74BNQrqa45mj5pO/XnnWX9x2HV5+bATuSV0K/qsQEsbBNWKJjPmQI8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVFKOZyM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 402A4C116D0
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771947760;
	bh=LtBuy3+ILhpd9r3A1YFEiLPyBgB9AL/bN0WxkARZHF4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KVFKOZyMLBYOuKIuGx9Gvg7zRCYY6SsFEHLz7X0oZOU2iSsKfvMrDoG8D6JFdS5tz
	 vqcNeO1X7rbzOZqy9XZokaOy0n27Zut7mv1YASOMPBpVvm5Vf3aHY6B1PR8asa6EdV
	 7ekbax3MiRu/rMm9MhrJ4lhA4WZXCaftWuw9LJt4KEnlsLp6TuzZow4XU5knPiJZ83
	 YnPX2nus+pM8LEKbxx0dVMv/kKe1HZDwkCAD1+dvd6hry4j5XQAasDYxQkUo5h4nlk
	 MvYX6EdIxsfwT+xjxpsM4qAcgoQk6BxbEL/LtuFYXKMEu58u5CcxUr+pHLRe1qbVs+
	 yZI8kUSXskYLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3AA1CCAB780; Tue, 24 Feb 2026 15:42:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 24 Feb 2026 15:42:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-wIqbQpUNKC@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33660-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,harvard.edu:email]
X-Rspamd-Queue-Id: 02C49189556
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #24 from Alan Stern (stern@rowland.harvard.edu) ---
In view of comment #17 plus the fact that the entire system freezes, this l=
ooks
more likely to be a PCI issue rather than a USB problem.  A broken USB host
controller isn't the sort of thing you expect to take down the whole comput=
er,
but a broken PCI bus or controller could easily do so.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

