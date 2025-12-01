Return-Path: <linux-usb+bounces-31055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CFC9631B
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 09:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 24A7034406D
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 08:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4432D0606;
	Mon,  1 Dec 2025 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GllaV+hk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BABB33985
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764578128; cv=none; b=I9ImT+uXAyxN52OGHD8tKNEN/R5gdr0KgI2VufOfkVdMEuGq7zphAXL6gqD8pPgJG1MmvS9fZZQ6kviGhLCeqaC/uqRWyiDoC54V54yjdigtsJecvaeUeK7jF1qNvSrR1f39mL6j4EGLrCa69JxaL1wn3lh/13YD/JFfcy9APtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764578128; c=relaxed/simple;
	bh=qyXVuTFj47ohIMeY6SxZZfaraLXRBJkjuYsrT02fgto=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EqYVwGFlui59Ppmy1hR2U1NFWTDEemT94+R43Y0owrLMVG+o02WKQQEkLQFvV3+V1jPIMoc1/1WjgO7MpzTHmKRBpFhG1W9LukcAqGngIAMZX4X4FyvIByBikxBTMkkKJF/yUWeef6T61bJsof0rwuzIXKhGO9r3YviLLp8V9no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GllaV+hk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E466C19421
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764578128;
	bh=qyXVuTFj47ohIMeY6SxZZfaraLXRBJkjuYsrT02fgto=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GllaV+hkKJwwstq9gvDQY/TgfG0zbbC/KbD9ysJbBZq4jcDNV/ZzMdLv8PnUal8xv
	 h9tftwHGaI4H0GPutaAEju87QADNjOIXLgHmVepWDnkxGJUY36i/KslZh75V6wUcp1
	 rCk1jz11wBJ1EW1rrWjT03cDgD9qWizKZZdGMyrfKUOyAcXqbsUGhLU8oN5afIArAl
	 w2/0sMVEhqiS/NG/OLi+d3zpSYGO7MsS9zq7drvUoN7qBfIKIrF+kYdrFG3MBHIQ2/
	 FbqBxrbIzW77XqGyQnR615+I57qPg7ZNxaCbrcUPCj3W9WolvneZOR0lPZDuRjknhV
	 JQRu4VxkeQ9Og==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0498AC433E1; Mon,  1 Dec 2025 08:35:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220686] REGRESSION: USB devices not recognised when plugged to
 Thunderbolt 4 USB-C ports
Date: Mon, 01 Dec 2025 08:35:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: anonq@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220686-208809-UfczPma9hJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220686-208809@https.bugzilla.kernel.org/>
References: <bug-220686-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220686

--- Comment #5 from anonq@tutanota.com ---
How can I check if the patch has been applied?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

