Return-Path: <linux-usb+bounces-20749-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5293FA3972C
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 10:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B07953AA69A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 09:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9224C22FF22;
	Tue, 18 Feb 2025 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKAgDl3F"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D64C22FDEE
	for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2025 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739870782; cv=none; b=rG5n7rGjP7o+J+OHBNHi8Hw8PozCUOQURUDjSSMYU720THU393F0xYBKfw9y+g9XG+vTF+/Tw+VnMECku0kJWE3BvHQdTh6wyiec6jnsAg/N7hlsur3r4O7Zvpz46z6ll8vrBK4ylWqcF5Msp4HjHF01wGfj/mqV2XaUV0TiSbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739870782; c=relaxed/simple;
	bh=38PUrXdJtMQzYZcGUWbpjddiW9lO3rZ2KVEC4pclOi4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D+NcGWtJ6LXP7CSuPvB/SUb6rmNEssa6OaExgBKdUnjCEdiBp46GN1aCeyIJ5fsz+Qn4HH461klLXuWHT2x16Eg7Scdo/WEMapXyNP6pXaQn1gBgSXn1O33P61Y2fvWiWPlLve0NSkz1uc30fyjXUrwZJ4G04qnGmYruBTftHWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKAgDl3F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88A9DC4CEE4
	for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2025 09:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739870781;
	bh=38PUrXdJtMQzYZcGUWbpjddiW9lO3rZ2KVEC4pclOi4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gKAgDl3FiATkMPCKpWfj4NHYHNBShpcPNHwV1mceJStJlwxoQwbSsTrza3kIG1BAL
	 eaQPeylUzPRgwhlJeV2fZasHjkYfw8wXpOH+DDKE/XiklJFd/UF0Vl3wE+1TNYKe8w
	 9KB3qnRxY0s1WzAnic2qenrAY/cFJGKkNgytoy/xh7sETTURc5PK2z28TS7h9Xj//I
	 sZTuEmV8gkA7skfi1YAQofYAdyo4g25TDk9WdbiqyQO5PvPBGh//F9tocgAIVl/juM
	 czwwfUq7wW0K7yYuc29I3My7pThmCqfiIS1ZeWFtvYxbeyvYiTHJIhFntnKntG1SCs
	 5feL1zSWPFGVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 744BCC3279F; Tue, 18 Feb 2025 09:26:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219789] [regression] Moving Logitech mouse causes WINE to lag
Date: Tue, 18 Feb 2025 09:26:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: esteve.varela@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219789-208809-DBgUiAPGr6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219789-208809@https.bugzilla.kernel.org/>
References: <bug-219789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219789

Esteve Varela Colominas (esteve.varela@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Esteve Varela Colominas (esteve.varela@gmail.com) ---
I've tried bisecting the issue, but was getting bogus results. On some rebo=
ots,
it would lag, but after rebooting again, it wouldn't lag at all.
After rebooting 6.6.67 a few times, this issue was reproducible there as we=
ll.
I'm under the impression that since 6.12, this issue has gotten worse, but I
cannot prove this appropriately. I've tried everything: downgrading microco=
de,
every in-between kernel version, disabling TLP, etc etc, and nothing seems =
to
make a difference.

The annoying bit is that I *know* it's a regression, but now I can't tell
what's causing it anymore. I don't play WINE games frequently enough to nar=
row
down when this happened.

Thanks, anyway.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

