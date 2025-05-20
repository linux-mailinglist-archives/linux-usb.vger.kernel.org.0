Return-Path: <linux-usb+bounces-24118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F07ABE0A2
	for <lists+linux-usb@lfdr.de>; Tue, 20 May 2025 18:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8B0B4C6351
	for <lists+linux-usb@lfdr.de>; Tue, 20 May 2025 16:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41DC2571C8;
	Tue, 20 May 2025 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDYpPRiw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CA1C8603
	for <linux-usb@vger.kernel.org>; Tue, 20 May 2025 16:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758169; cv=none; b=a9E5Ev24ZQ4buEgD86I8Yn5K9coa0Igcg4aCUGoW5Xbfq26wp5llu6DGSy6mUiSjR+459r9eDROlvjrRjQScWmvQ6KpjB6UUz8OdCfQB2JH42ddrbFzoUVQ7MrXbTCZ7tLGeA2z3vP3ERDCaXt6zHxZwVUV6YAhq1Ycj47BInEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758169; c=relaxed/simple;
	bh=ZSTfMZ2YmxAegw6+Br9YUHH1SH/P83wc0PWyvbBJvuI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EQ4oW56UFJBp4PB9IgABZ2r9NlOeNeO6E0OlAAIyfk4rX+BkDQZxrKA8+5nsPQRY3Q9L6YDWNuSh+H6qW3Eets7rYBQkWxPYPw58o4AGghEFt4hhip1EpCuKPOnJKn4gBal2DPVvQplK0NRM1MBHnJCVecg3EhLH1azkg6CH+tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDYpPRiw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3255C4CEEF
	for <linux-usb@vger.kernel.org>; Tue, 20 May 2025 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747758168;
	bh=ZSTfMZ2YmxAegw6+Br9YUHH1SH/P83wc0PWyvbBJvuI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UDYpPRiwQNGop/Uyu90av4yre9RKybb3JTCfw2Cyb6PkXZyeu5NM4W9kXUh+/j1cF
	 Srz0nrh66NESiLMEua3g5v3M2B2/BwqrblOxf2IdGg6taTxPUsGMFxlDFCefn4aJBZ
	 PVLZVXTEhyLFwz+EqQpDzFQdBlftZhUADW+xMwMRQonY5Mu6MvWlSjgoUEN+/YwChw
	 Ongmk87ehLPkXNWGZCjhJEYt9PZ2duZrvU/2NPSkqlfWvbcC89O4dR364Mpdl33Xwh
	 Z3w3wtpRmERoFdgNPXV9oUFzLoHK46zFakM1Gq3MsCJv86t3saIvI7Ib937FgGXB8n
	 U7B3xN+GD+DjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 950A9C41614; Tue, 20 May 2025 16:22:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Tue, 20 May 2025 16:22:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-NYxqvDKyGh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #60 from Claudio Wunder (cwunder@gnome.org) ---
(I also found that I should use `rpm-ostree kargs --editor` for editing ker=
nel
args.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

