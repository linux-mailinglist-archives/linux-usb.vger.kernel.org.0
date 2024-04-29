Return-Path: <linux-usb+bounces-9881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CA8B5461
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 11:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C42F91F21748
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 09:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0041824B2F;
	Mon, 29 Apr 2024 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTgv859D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3D122F19
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714383662; cv=none; b=N9Pe1tKzb3zDpGq1g4zdUFcLoh3Qsjp7qzd6EW9n3FjOzD2xIeMy3rhsxsoVAvUjatAiG2H7ZyFRST5UEwjmb760RL243e5F960cusg02PySeWRC0MJUF1mMQhFjhr3tilTUulWRDCTfEcedLdiUlMUFs74Qb9/7g88LxeQYErQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714383662; c=relaxed/simple;
	bh=vOsn7KOcZYhjQYtgArvaCxOuYDoC2Hl9onDF3RgG6aw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hwKgA3D0BoY01PlQVrLZBFAtZMGcAuUAMG7k1P3Ks2uhNWzUoH8hc1SOqJaTEUZQqjzCwKhXyMmwnkT453CBUT/QsRW7YhLR12uGxMy5hk8yY1gdO1gunkbMhbwiShzsVQtfUMQA/Lh6vv8K6SaHjES6OyYQgh0zT8UL+yXOWE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTgv859D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BBCDC4AF19
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714383662;
	bh=vOsn7KOcZYhjQYtgArvaCxOuYDoC2Hl9onDF3RgG6aw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GTgv859Diq9vcz3uItHw1/F9RgOnI/UgBCRkFR+6TulFIUWG06NcjbsW6yBE6be4G
	 ah1aZfbKRJ/sOGxqbdEJXxVWWpykhiF1xbJvwIItFFNoRXWhrd0sIGcW3787e5hm3b
	 8piKUOYBqS5crNDJYqQUnghq51E06plXgilhKC7zS7Q7uzUhFDlwGLRvgCKW5tWMVf
	 L1MCsQKRsUO1ZbAf0ELiorCr6zlFttaPK5SpQKuiQnCF+XnBCyQBVUzq47pcYh0rVb
	 e5/RmtC9LJd7ELpJGwaaPdsMHVjCtHfmipnVyimHtwNPfcPaagH8Rv7vQHzqay166p
	 JgenwohKp/xag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 22284C433E5; Mon, 29 Apr 2024 09:41:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Mon, 29 Apr 2024 09:41:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218789-208809-pMpoDAkXxr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
*** Bug 218788 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

