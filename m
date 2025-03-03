Return-Path: <linux-usb+bounces-21295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB320A4CE7E
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 23:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D8D1897D11
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 22:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1F222DFB6;
	Mon,  3 Mar 2025 22:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iezbWpt3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB88211CA9
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 22:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041532; cv=none; b=Lv4qfAy9cOQAnKYJR7sgqVph1PFnbXtsXSw+w3i734vnQv8Xe3rVpdqgPBxK994mJUJPJh2cS+L95y2vQsYFpLY8UmXXHmVdaKlHzQlp+WWkOE9iN2LcMZICdtNzw+OaaT8KPUnZ/vjlXGQ9+t71nX6+lbQDan6f55HXIxhgCVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041532; c=relaxed/simple;
	bh=WMqu+uFlmrxTwSKtWT23P5QamEK77XXozUIZAV3jyIE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uN97B2uNewyOrwq/+lmYApyPUXlJ/6KUOEUHuUoSkx8y8Fr7dpU9G+r36unajEdg0w4fVBdNDQkCKg9saBojWPyqtHhHEYM/qlU0JUCYKD4XPU+9nillMocMwcm08py9kAIhNi+FgOeDv/KvbKHewr7Y0Ryt7WFVjlz0t/szM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iezbWpt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 690A8C4CEE6
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741041531;
	bh=WMqu+uFlmrxTwSKtWT23P5QamEK77XXozUIZAV3jyIE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iezbWpt3UoGORx0YoWFhWQYyvXNddONCeK43YGlXNkvXIlVzOnaYpqhzAlSJxXtWS
	 R635IyYvKqXHCEKHlTak3GPMQWVMCzSX2X5jpdYjCNbtAwgliNS84nLSOdLXSRm2T8
	 vLun7xq4Q6l4TYra1lJNWmdzArYPWY1hFNBtSRbHyiDzY37Wv5fo8txiQYS7NEcVG+
	 dHGKmAKpg9rkx7VVoiw4npShJVfvYo76jUwwVTpV3mcO1fm3zyIZ6vTlD1317Ihneo
	 8cW1VkAXvQPJz4YWLrUy3Px55nmYS/4UqrcLn5OWtiOWSd6e/XldCMkX9MK6Qac+CB
	 w2RAjeU4bvCTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 54742C4160E; Mon,  3 Mar 2025 22:38:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Mon, 03 Mar 2025 22:38:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-PS2e2EJS3V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #14 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
I think I found it.

Does it help if you revert 36b972d4b7cef?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

