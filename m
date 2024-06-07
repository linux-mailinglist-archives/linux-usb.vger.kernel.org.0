Return-Path: <linux-usb+bounces-11016-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDF99001D6
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 13:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F35A01F25FA8
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 11:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE4B61FDD;
	Fri,  7 Jun 2024 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbvuBqEF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE0F18C326
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759030; cv=none; b=Bn4zc075qa2WVgghzN6hLEbV4B2SBjENnT5X9C59biJ55RYVWTWkZwnt+gF2KSPqAfPK0JJyXgeVgV8f2VvydaUrd4sorTpNgkd/AbkGCq6x7I0MAMWCIJsOJfTuTUQvldwGKM02ya0NAQkjoFhfMKUFIa6ZM0WpYEmijwK3ORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759030; c=relaxed/simple;
	bh=ScJ5bYC+TKohUeF0fLs/w7XP0XJMl+Hs+HdZJJqBa7c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mSub/sstGDzfd78ExqlrSff2ri1yml0leonBREBQVyorMX1VVuDhLnAKPqgN/6dU2uoHx8GV8OEg/vwIqkQJAyl9dvFIHOyLKXsWkO+HP9IzUZFBkovWh6KfkV02xvCvbxFik/zsfsT6mmXrNvo5N1xvxn5j/WwxT/kv1O6dylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbvuBqEF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B1C9C32786
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 11:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717759029;
	bh=ScJ5bYC+TKohUeF0fLs/w7XP0XJMl+Hs+HdZJJqBa7c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UbvuBqEFt452aYeyZ+16+7Iy5bt1r8afLwLWO9JI8jPpPMxrzOiapXrIiEZRUo8jF
	 ssc1me/ADOtVMyNMigfi7p0qTLORr/+vkO8jLXiIZ2gwEt8v00WnoZ78phia/um7M1
	 Zlya4brcqAARCEivdpV7jbNmyHFVwJFFPNcYO0tsbNbUvaF/ffkx7crwOMJTrSppC2
	 s+MX/9QOWuJK/mkh2NU2PBU5wULA/1RYZ2SEvz0EumNAdS9DyXr+jgaVizuSpuhSBm
	 hRP6YuQMo1aYSSvX7dRIRf4r+tQKjz3GyjOz6e3RR5+UcVqptFVlmnoAKIA6dvqYyk
	 4bjUgDY3Ij3Ug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 77423C53B50; Fri,  7 Jun 2024 11:17:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Fri, 07 Jun 2024 11:17:09 +0000
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
Message-ID: <bug-218943-208809-goTBrvy64s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
Please reboot and post `dmesg`.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

