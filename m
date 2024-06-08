Return-Path: <linux-usb+bounces-11038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DA900F1A
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 03:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 244A31F21FD5
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 01:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFC14C66;
	Sat,  8 Jun 2024 01:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLr8ZT+v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4D3634
	for <linux-usb@vger.kernel.org>; Sat,  8 Jun 2024 01:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717810573; cv=none; b=g5vWuJSlncBLsruUEiNuyZn1jDxhmHgl3DbOHEVwVsFEaPj+bhP598vZ5+R5Zv+q7bi+C/OJUcEj6zkZccuLfrdKpb5xpJVqaUb/O5Vu36/BjTKL21xcBSvFmaK0mVGQOwEjJy1huF1zM+NLa0/wDSHu+EtEOxCdWDSp7drevt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717810573; c=relaxed/simple;
	bh=dTr8vK5/0cvgrgh/RYxsFrHCmtv4ypqaSnm5myXwtzQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HsMeLUZy/9dwO/cKShI56pPBYX4zi7oJwnz+yP3qY2MAQpHR98jpuRDw1jl0NGaMyn+b5qyaCXAQukR1jabb33xRB8nGjmBgbJ7yHW+5YhhUKUUM6i0hJ/jcQZEJBAgYvfsKq8BO/WiqhmKCTSh3B39zl80TQOurCDsffGpOSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLr8ZT+v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65EE2C2BBFC
	for <linux-usb@vger.kernel.org>; Sat,  8 Jun 2024 01:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717810573;
	bh=dTr8vK5/0cvgrgh/RYxsFrHCmtv4ypqaSnm5myXwtzQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XLr8ZT+vXqg3HyznSAFmQQUDHhVVt6A6g6EG3w9gSb6d8Hn/VsUSNX4gfWKObLmni
	 7L6c7NJeC9UHcMguoFjKypFHRXesv6Z4AB2mybHYxXDNROudVktEmI2RCA0tOQQ4oU
	 b3OjHS5Qfy0wwLo41veH67x9Ru+D2gZRSB/i/WIEMKuWyVviEfKWB11wYWe+SbX6Dp
	 uBeW/4ibnifuUpiNFPoASdJaW5jtdGmSA5njkhAyzTvO9STXHxKVMCsHOdISisrkGk
	 gYblqUJicAmoEZf3j2VN5JBEemzUCXEg4WygG7FaRziCrW/dGS6PosaTi7XTlEZP/S
	 SEXVekCedDdqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5C17EC53B50; Sat,  8 Jun 2024 01:36:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Sat, 08 Jun 2024 01:36:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-dZowC6PqI8@https.bugzilla.kernel.org/>
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

--- Comment #7 from Jarrard (jarrard@proton.me) ---
(In reply to Artem S. Tashkinov from comment #4)
> Please reboot and post `dmesg`.

Added

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

