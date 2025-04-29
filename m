Return-Path: <linux-usb+bounces-23558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6140AA1BCE
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 22:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B7F27B71AB
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 20:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65663262813;
	Tue, 29 Apr 2025 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJ+3n4t4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F5325A2A5
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 20:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957235; cv=none; b=SjjjaEeeEQ7q6pSZ1HYbXYa7WbaUaURTR0aA9bJV5S29uchEsTo1xQKKHpj3g8RiWmadkN5CLaJMd1Y1iAHwP9TETVWF5xsNn/wl3aSDFyfPfSpu7BFcM4W9o0z4frsxE0E7sO/3+7TFDV/4sReF3eWmZvat3eEyG5Ga9s5wbj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957235; c=relaxed/simple;
	bh=Lov7ERLNt8BDTQa4QMwxlYU0glnfrBzarlatjP034OI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BxHh0pepegnhhMkwjRdowWlNsOxsFXW+QwXUzxjflbrcRO+2MH0JhTz22HX1YLhSPFAAwW3b/b5SZUx7IXILrf9cu3LDQduggkGJPlDOBQ6tLUTwXaeAb+jb1DTrDw6ai/4p0drWmw+AvEpItKrTkxM4OUTd8MK/kbHUTWOup64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJ+3n4t4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54DCEC4CEE9
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745957234;
	bh=Lov7ERLNt8BDTQa4QMwxlYU0glnfrBzarlatjP034OI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DJ+3n4t4TO1R4+LO0x5+aqtQRg26l9YWNl1FyIAw/8VfOYlA54m3y3u6E9e3zNItl
	 62qTgwOg2OoEdCnzxMNnU08EoQp6XSd8bcl02+e9lnARLfC5N0eYeptd4RAVgyXDhh
	 OTi4SYGqB+eR0mnlcD9vV1R+A6eoPLtTKYwpXYqL/pptyM42RXeApxlno0SAd+Z5b9
	 Q0yS+VNjFymi9vsFya4ATUW0zmWvXGBT7+4MvE2f0qoBa3FXqJXHeQyO4C8S+bqmPw
	 d2/TxiWjCFhizD+rIk278DUHSWccq/5Y6sfCBLNNHkQ/myJEL/KVmaScxevAFKVCTW
	 ED7WfWF2XcIMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 485F2C3279F; Tue, 29 Apr 2025 20:07:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Tue, 29 Apr 2025 20:07:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220069-208809-nrxw4CJMGh@https.bugzilla.kernel.org/>
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

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
That's odd, because there are no xhci changes between 6.13.7 and 6.13.9, and
very few USB changes at all.

Are you really sure that 6.13.7 was OK?
Can you reproduce this on upstream kernels built from source?
Or bring the issue up with Fedora, in case they apply other patches?

What's the affected host controller (lspci -nn)?
I presume you are seeing the "HC died" message too, could you post full dme=
sg?

There is clearly "something" here, but hard to tell what it is and why.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

