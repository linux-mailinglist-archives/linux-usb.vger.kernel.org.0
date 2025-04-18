Return-Path: <linux-usb+bounces-23240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A923A93C91
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 20:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E07877A746C
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 18:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7191D221557;
	Fri, 18 Apr 2025 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7joFvVp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC96521C18A
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999762; cv=none; b=aXGvKb5t40/HnOy0B9MY7Oh8+hr7d2MUso861hdCiVZUvdQBa/paVXk8Ucgn68q0tZgND0Kz8TnfsOWopxlcHmyUOMHR9CX8ioz/pvFISM+mhSphOmpiRU6PLgHtD4UFJZoTRthmYn7aOFKGpkiYYB9v/2aFJOHgwioR/6AX6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999762; c=relaxed/simple;
	bh=3/dRAmez5GhPjRlFuFxnrVL4nF6E1JoZdTL3WmyvQb0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y+80Oxre2iRF6yXgeXupqeYYNatek/agv8a5VfgKP+fchhh92w4PVDgeuJAhMANLyFt/2AeiDvwvMU50DPkEUxdpSTHRAArMY67SvW1RRPY4h8bsQibjeWd4FPU6QP5SaGUEeBddwbSH7of32Gm6abdpRbZ7Y3wrGPHh2+o71Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7joFvVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6124BC4CEE2
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744999761;
	bh=3/dRAmez5GhPjRlFuFxnrVL4nF6E1JoZdTL3WmyvQb0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C7joFvVpyqPW3KpWDbRbJEb0vdhNpkHe6EhGu+RmzdXXSRks81aXY7x5/CCyqz5Nm
	 vAL3idHlhAiRmiwWcR7MbxBJXzWvOPRAfCgog+X19Ij1icRpBdXceU6d+zMyAuRYDK
	 q3ylkR4zS5CgekZNGFiN3gwN1hSFNs2G6yiFLhf7jmNhlh2WVV7LJprl7yYzHqvdL+
	 NCw7JtCGfJY6Fs6RAAVxN33KfbhkEhkaddkP3i1R73/no1xVUG6z7gQFLkbiQe7eBg
	 taCCzp2S9uLbyluKgPSZdIQVU6PxFMU7v0zJrfv+9eiIQjqp0Q8K7xiAlxapGNRpwV
	 xN0afVWHOSQMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 500C7C53BC7; Fri, 18 Apr 2025 18:09:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 18:09:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-CMwnp0R1o9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #22 from Steven A. Falco (stevenfalco@gmail.com) ---
I updated the attachments.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

