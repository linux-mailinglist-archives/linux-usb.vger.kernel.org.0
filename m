Return-Path: <linux-usb+bounces-27310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 103BFB3714A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 19:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BDA4188AE7E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 17:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7452E371D;
	Tue, 26 Aug 2025 17:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efMjeieT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9490D1D63C2
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756229082; cv=none; b=ECV00qYqzAD0PIFaZBFQqJ2bkfLaF1eJRlGpA5tEF1uVpnx3MvKf1s7ZY19lq6zoixQgrofSIt2utr5EH99nVlHXGgOWvfGv5cvhejq5+VmyjbAJMGrwJmpDv7TNyZn3GL4ohYq7CDhYDde0bvyaL1yYZxvPX2Khx1UPDtjXuDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756229082; c=relaxed/simple;
	bh=RpR2gDilwHToISaBt7ufidYmCDnL5O4U/UL2Tot7/lY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WHpBZvHQXUewwT6rdVJI3Rx2C9M9o7eEIjkzVyONHWSQCiI4ddLS+Q8/gXBTkKE1O6FCvllCtYQ2ZRVFJUN8IdwHhypAoM4LJF6bvyuiGlnKSgDNfDLE6dylAy/uMdTBL1JlxB2ArUWYbn3BLtgnrXA5bk5H944dDBZDzqWDpko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efMjeieT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1262AC113D0
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 17:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756229082;
	bh=RpR2gDilwHToISaBt7ufidYmCDnL5O4U/UL2Tot7/lY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=efMjeieTpAY0EIz/2ISI2rdkas66y9MAL01GpN7oDcgYhGBy9Jd4Hv7ZisD94mb5+
	 0UOsyHSZLFtWYvZ3dldZbc2p9dN4ZRuu1LZ1OR7ELCdK0/c/wkuv/0A0Hb9vyJRUti
	 ojByi+oi060WarE/ed7J1iWyJvk4i2Tj2bqqyvdSJ3vKfyK37RquPtQWmekpmh+487
	 BTfu/6rmQiw5mcTJX0bhPR1/Vaoodstvw32W8b1BBGUqi7UXHv28u3ps0NycBHVlQk
	 f3I1fOvR6pj7zmQUr8M72v91ld973d8yAlIidyWSfU2iExQcHBD1Eb/hPPBNtKX+fA
	 e1p1wC4FlUBcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE6E3C433E1; Tue, 26 Aug 2025 17:24:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 26 Aug 2025 17:24:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-Qzi4IZCAyj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #5 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308551
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308551&action=3Dedit
usbmon trace of usb activity during suspend/resume as requested

This usbmon trace includes only the 3.0/5Gb xhci host controller activity. =
The
machine has two other host controllers, one ehci and another xhci/2.0/480Mb.
Personally, I find this trace even more opaque than the xhci dynamic_debug
output. Hopefully a specialist can find something interesting/relevant.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

