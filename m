Return-Path: <linux-usb+bounces-21806-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A61EA6374A
	for <lists+linux-usb@lfdr.de>; Sun, 16 Mar 2025 20:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ED8A188D7DD
	for <lists+linux-usb@lfdr.de>; Sun, 16 Mar 2025 19:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D90E1DD889;
	Sun, 16 Mar 2025 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IaFN9UoP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EBC1A238D
	for <linux-usb@vger.kernel.org>; Sun, 16 Mar 2025 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742154626; cv=none; b=o+Pl3m/Y9BjSy9HtmnqqzM3wJICKltfX/aXV5ezYxFzRlijMBUcL+50foMGAC7n+NgiZaXt+JcAvOEb2DxNJehypvKKs9uVjzjE0KPBsq82uhKy8cAz8R+xvXuJZpj5MfAm3I+elnF098EwfLfNGFQtdkdAZPDR5e4bX57FxaZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742154626; c=relaxed/simple;
	bh=O9fbB2R029PBV5DhMFgIvAW2PKxzFiEN8Da5uuscCes=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A+s2iQ1D9z1rLoBGN+6YnPKCs9LKnZzWmlWCwxv+PjCYz0YHbkW5Bdl4sM+HTiHeHcEW4Tp5mXlOMzkOog49UwwN0Lg3RlF9OMn7GXyVdIRX79fEtNUUHOGGOzHpo3OEOjMTLdXhyzs3iFuR+Jcc2k2D9XmzS5klM9T0hK0g7Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IaFN9UoP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23D5EC4CEF0
	for <linux-usb@vger.kernel.org>; Sun, 16 Mar 2025 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742154626;
	bh=O9fbB2R029PBV5DhMFgIvAW2PKxzFiEN8Da5uuscCes=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IaFN9UoPU1ZGf/RYYdS9BssjpgOqytcgF/UJZvu6joNwcXNDgBuKnOXwihWUsRNEy
	 A5KhF8bf3rjBH3QbF5u6mD6YFazYl9ecabpaHE4ZBwOZXDi3oSnAyeY0kLML+jfFVR
	 l3tT+t6rerm5PBxcTLNz6ZbGW55GDNUjbmjzj0hD17iVfFevXwGdf65yOvzplp7KZm
	 etC94t5W+fv47MtcPMTDmKTZVbV0+rxM0YPWEaYx074aUfrUmc7tBrA4UaRj5XFipI
	 3YIWijLozyPTDjHQCtsM5fBqkLaNNpdpD5vVJG7QMGi7uNvtMeKHc0H7zDZqbetPJ/
	 44fl3j7koTboA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1A3F5C53BC5; Sun, 16 Mar 2025 19:50:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Sun, 16 Mar 2025 19:50:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pchelkin@ispras.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-gLQcIHyZEU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #17 from Fedor Pchelkin (pchelkin@ispras.ru) ---
Do 976e7e9bdc77 ("acpi: typec: ucsi: Introduce a ->poll_cci method") and/or
bf4f9ae1cb08 ("usb: typec: ucsi: increase timeout for PPM reset operations")
fix the issue for you?

They both appeared in 6.14-rc6, 6.13.7 and 6.12.19.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

