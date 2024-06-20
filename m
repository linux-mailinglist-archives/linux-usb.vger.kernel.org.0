Return-Path: <linux-usb+bounces-11487-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A19279106E3
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 15:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B3D02825DE
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 13:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DD91AD4B4;
	Thu, 20 Jun 2024 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZzYNznD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFDD48CCD
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718891762; cv=none; b=AKHwPyQwIl8ncJGXxK3xcPsmu1q5z8lMlOyQX8CtdYtQqoLMsNnxL2SlDsBRl2MAjTfVF2HoYJGm4OA7M7e7kXnlS38jmzS1tr6kKX3yiy7jUCp/s9F1BXHs5lwlKese1ldB0VA8SNgjBeX02hIb+fzyJI6DpUhS15kQtxfeT9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718891762; c=relaxed/simple;
	bh=pyeA2/ECAQpOoN3nf6Y96o3NO/9EZ/VAvHuLw0WaTkw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AExqaFVbGjsssDwVnY/K2yNswFhNrkq0m+Fs236QyfYxVAjZMiNIzOVfOqTRcmIzu3exkA7L9V4RtP+ht09/w2++S7jle9bPvwvsIdgTnM57tsUNXp/9ACqnehWthMJtcYyszTgVYmT5iV0NGMs61UuFcIrz6SEA+lnk8vTu+Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZzYNznD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 343C3C4AF07
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718891762;
	bh=pyeA2/ECAQpOoN3nf6Y96o3NO/9EZ/VAvHuLw0WaTkw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TZzYNznDtMYoaMF/IfWlqoWfxmt/uYhX6Qc7sglUAUEghpOUuFMCCeQhEVhnvO3CT
	 PhB5rC/VBFbKQuhtA/A46lD6aRokzsJ8rGWk217TUlD5A17rGLidOjPxZpsJDEOuPd
	 M9h7imPY3lTiO+qGOjteCwirm45ys0h8eHQ2yT+bKYe9qNC9YPphfP3AvCIQ5iE6Fb
	 70sCV1aS7lnWYNoVgVX/sRNchYPo5lEJsr7L/a2eMep391f0nDyIMO/QEPwopep575
	 oD5g6ze2JXyVSoNTNiNJmt3RsFAbNzEGdUR3V31nX/zuimZ599sULtN3CqJiCZR9Ww
	 KdlxHQcbKXBSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1F26DC53B73; Thu, 20 Jun 2024 13:56:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Thu, 20 Jun 2024 13:56:01 +0000
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
Message-ID: <bug-218890-208809-5jbnGEqick@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #16 from Alan Stern (stern@rowland.harvard.edu) ---
Pierre, unless you're still having any problems, you can go ahead and close=
 out
this bug report.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

