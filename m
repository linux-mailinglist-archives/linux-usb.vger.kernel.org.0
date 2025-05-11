Return-Path: <linux-usb+bounces-23846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD98AB2849
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 15:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDBA2175558
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 13:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCB22566E6;
	Sun, 11 May 2025 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGHa3zZf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884DF152DE7
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746968452; cv=none; b=E7qjMm/+7i5TyB4D58s9Mi+cjNLVUd/c4VrcCl0bqLklYn3dSk4/sHsp9aFq/hyBstLgDafDyDHRJ1hFKXVQdo21KqpB3O7A23iY9OkgPmw5b8BJlbrFFuVKkt94PUAXRbGuA+wWwS7uXV4AOLt75MgvgNPZbfC3f3LCmHNh3/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746968452; c=relaxed/simple;
	bh=JnJguieBJlno607EY6jWwLijqD0MpsyDD5qMFBNqxb8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=izw7ZM0RyBuEfDoFIOWiFCu7EGSejCw2q8BzZDlRb9M7PBRD5tM1sLN2DN36maCfy+HP0Jf+wwvD6s8hqcHx5cnRJdslxKG1It60Z0syoB0Gyxj9Uw3fLIv6Gwx+ftlCNYE29MEUJAQPC4bymOf33RQ6o0VJDvz7yZD//ZXhUlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGHa3zZf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA238C4CEE4
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746968452;
	bh=JnJguieBJlno607EY6jWwLijqD0MpsyDD5qMFBNqxb8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XGHa3zZf5WOgczS2XPiXDVl+I72Oc3lCI4jSjhWOBLW0IXEoJh2sr+g+UK5+esL0u
	 OepQjNkc9TADXjrbhtir1tkaJYf6bW2rSKk+jcVde4WdnDn1U3JGGTOwMu3m9D1m4c
	 Yip7srgzho295qlyjiV7CwwPNtVAa5jMttkrDp5nnXyv3KXQ98sYN78kDLOWOrzvgM
	 jr/J88vkDZNGb09T1VWOs0V14GF/yIRo7EssDLldBKikhqxZtmc3/CqPgoYQhHv3DX
	 uXGwGxrSewwu3WsEPY6Y8/taC4/GmxkbEqJkpHz8Uw74tUtodr8bqwoaDh969dCIpj
	 qK/vNefVRWNhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E30DEC41612; Sun, 11 May 2025 13:00:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 11 May 2025 13:00:51 +0000
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
Message-ID: <bug-220069-208809-TkfO9Vf5xd@https.bugzilla.kernel.org/>
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

--- Comment #51 from Claudio Wunder (cwunder@gnome.org) ---
(let me check with the maintainers of Bazzite)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

