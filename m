Return-Path: <linux-usb+bounces-14916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5762F9743BB
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 21:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 894A51C25484
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 19:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67031A7274;
	Tue, 10 Sep 2024 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqNjIC9C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B91A3BAF
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725998059; cv=none; b=a6Ykv+UxAw7jMqGCsei87O8J+8dTqtWuJGxfovbtYn56N5jOc4W/5Js2U1Xv8YNyw37Jn7sprfni7oXwLa7g2JM5zP02wNN3qbH2d08GJl+6FckZJxZ0LAfnRYYGshifkcxFp8FAUu55t91SfX0kwArC/SqgLbjikzTvg7ERICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725998059; c=relaxed/simple;
	bh=5Gp0AEpeENqIEwuma6UPJwzF2bF8QhCb4XymRq2qDyo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eg1K4nE9za1TMeULsZKg/rXz9Re3OubPiH0lMyso04ltLf7dY95LJ7GQa/6j2iuJ5tTGT3OqI2GoqB0SHO+ViLJ5BE4z6rPOjVN1L99BItptsGXkqvTJoSiEaE1f9R+0Xkx2IqUsR6KWktxmTavQUy7vBaRzEyzKZWhORRBT9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqNjIC9C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6735C4CEC6
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725998058;
	bh=5Gp0AEpeENqIEwuma6UPJwzF2bF8QhCb4XymRq2qDyo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gqNjIC9C0xcnmUXrb2wqoN8lkQ8nmNQCu//35LRaSKv0jjYHEvAWrV2KF9hBZiAmI
	 XVZeGMWYKYS/RQTAwfkkPbfiQXK/mBwoOhwWndSColPM4rUzsi/hcFLSklx2b9R9XI
	 Qq6A7mIdnLpfh4NGNcjxGr2S7wO1abkI2vmavuJfzBGXTTUTG2Z+8B6yV0LUzw41/3
	 W2Tctot7Gd9kcGOGq5Mk5A6UOoC1yIABXHrf/MZ9Mflo+4o98jsJU2jD8+jC78iZTx
	 3m76jrTUDG+k2zJqEUP7MBXJFRwkQIIHtGhFRBzYpsPVqHZJnv6wyfHlT4hn6gn5fx
	 dQrJmZtkiBU2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A684EC53BBF; Tue, 10 Sep 2024 19:54:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219259] Attaching Ryzen 7 7840HS laptop to Lenovo Thunderbolt 4
 Dock causes high CPU load
Date: Tue, 10 Sep 2024 19:54:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thilo@ginkel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219259-208809-oksovlSN79@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219259-208809@https.bugzilla.kernel.org/>
References: <bug-219259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219259

--- Comment #1 from Thilo-Alexander Ginkel (thilo@ginkel.com) ---
Created attachment 306855
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306855&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

