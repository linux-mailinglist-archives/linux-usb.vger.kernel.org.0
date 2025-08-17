Return-Path: <linux-usb+bounces-26943-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB7B29489
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 19:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A94D3AA2CA
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 17:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B171C5F27;
	Sun, 17 Aug 2025 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVbDi5Mj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AFB27453
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755451116; cv=none; b=WGnI5KavGxwKSaACjmnJKBCk4VsTPxvUFpi1F3Rgm9h+O4Pp2a2OgTo4mcE06ooLmZ/pT51QEHkTXthETVte0WX5layACOFzTUcHYnUI4TTsF672VoaVB/i9UXsHaVlqZgbD9yzcG9maa3sgamWzjy1FzbEsnqE/LcxNKvzfbyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755451116; c=relaxed/simple;
	bh=gO0Dk/zu4LRt2+k+F4zftiuYKc2XwfCraiBGXz+s4a0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=axEVm0fjLRRYvGtabU7sTXBBiyOXZ9ssTKjdxeriwNZyX9qgA5LeeXm0ADjrgfXn+rr5Lb9bWhWYcCENjkVgGg1S+zKyZsyY9iwQkg6dLqPMn+kgonxay95HVEm4/GblIr4Nw1wouj89Dw5vzi4bEyhQUlfBzC72ZZfia7gtYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVbDi5Mj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EDBBC4CEEB
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755451116;
	bh=gO0Dk/zu4LRt2+k+F4zftiuYKc2XwfCraiBGXz+s4a0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JVbDi5MjqCGphVRUEYd7Ptxr7D8M4xR0SF7lJT4I63doK2em91eliX1jEGomR9Y/M
	 jfG+6zo/qKNwPF72PFwGlyLZNLtyq9bbcOv6JO7aYFb5EIidL0Dc9zRnjgb3rrVd9W
	 BFOykY2NYOHFSk5pd6OZXpW8YAcbWYvh214B/T9sHszuHW6O2DviC6kVD6NBSVF4mD
	 J0/lw/jyO/EqWjPTMoXHluGWXd4hD3Kl7FWnoa3OpXKkMt2nFO76UcamhfFIZaq0oM
	 IxkfE/JsSwiIxOu+oI/RkW3Iq2Bi8vD+uN4pPdQ45X6D+KVKxAAfw7OwlCZ1ph07vw
	 h7FrJcJuLuGLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 22237C41616; Sun, 17 Aug 2025 17:18:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Sun, 17 Aug 2025 17:18:36 +0000
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
Message-ID: <bug-220460-208809-I81AH7tw67@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Is this a regression?

Does it work under Windows?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

