Return-Path: <linux-usb+bounces-18958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A1A008D2
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 12:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CE331885126
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 11:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3C41F9A99;
	Fri,  3 Jan 2025 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOSseOgd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD241CCB4B
	for <linux-usb@vger.kernel.org>; Fri,  3 Jan 2025 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904586; cv=none; b=bTS3JpUy68QD3RgtYJbQDwZn8z6M6F9DWXtpnqEx8hfTfGHUVBXAd/J1rWJY4FVofodSS1vCforupjWb43wuAfwHxubYMFdH/K2g3IIZ2i+dm8O19O8oks23bZaV3KBdUIYZLqrSEvsvARvfFDlIbfB2QMhInkl3oVoOsjWZUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904586; c=relaxed/simple;
	bh=HH2hAN4sT/JOp2OUZRj9lYa5cQCbTRWUbmDbPkDEQJA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P/BRu4eMupdoUh2Qc2D1nQPj4nvy8W+ABzVUTMJVYXUOwxANE13fwsGMo/GzhbxX8dL+mfZGmx5PzTvOZmCVXtqN9oQiVg/bwb2Msce0G7UWwowDUC+vtIgiQGytGJS8t+trAaVzTpPBAsdwK6+a328nMiPhdNEt0mYHhWQ5/Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOSseOgd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FED9C4CECE
	for <linux-usb@vger.kernel.org>; Fri,  3 Jan 2025 11:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735904585;
	bh=HH2hAN4sT/JOp2OUZRj9lYa5cQCbTRWUbmDbPkDEQJA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kOSseOgdMGBQ1jY2Xnc9DZ58O13msBSyeQdrIUmeALtCDPw3eqMfyAaBoiQndzEL0
	 dIoVz+cWALBNvoU+B7yCeazpbjIjxs86mVSFDoy6uDaxOK9ybpfNtTn2HDfocEwEhn
	 zkgRO1D8aiWTicY5kFxmrwWJThwQTqPaDOviaozSEEoi5cn/f6NBKUPmUZwSaQbCFu
	 IVpupxwzPoNn9Yb34jjyb2dcalmbC0PfxjrVYq3TTMLZcVnj7fZyDNHnFM274VkAqf
	 rCNv0ngrVh+Ul+sK4p80gYksm4XomXC7UgE7EKnox5ap6z0Og1Hy3pNflepob9q5By
	 bvzTdfShew3jQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94548C41612; Fri,  3 Jan 2025 11:43:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219616] xhci_pci does not activate uPD720202
Date: Fri, 03 Jan 2025 11:43:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: z.b@arcor.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219616-208809-rMgOYr0xSj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219616-208809@https.bugzilla.kernel.org/>
References: <bug-219616-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219616

Harald Buchholz (z.b@arcor.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from Harald Buchholz (z.b@arcor.de) ---
CONFIG_USB_XHCI_PCI_RENESAS and loading this module make it work. This opti=
on
and module weren't required in 5.x.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

