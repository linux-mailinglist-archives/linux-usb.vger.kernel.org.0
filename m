Return-Path: <linux-usb+bounces-10606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E08D10D3
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 02:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64B651C21016
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 00:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0D2C8C0;
	Tue, 28 May 2024 00:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4nqvmTQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98544BA29
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716855564; cv=none; b=bGkO2Uin1O5er/Ej/CZHDraExpdA9Er5wnIZdwnMo1qRQOGxPiyHSyfFVLn16trWCJWEFm2JjPfhmoqZq60SvzJsePZXmNStxcQsMBtSpgapkH+FSfOtT4Pau/Y+8toKkTo0yrnW0t0YpEWIofnAI+ic2QIQMJzBY0lw9otnPEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716855564; c=relaxed/simple;
	bh=yywSxx47SHvq0becfEko2WOSC7KzxwSlmlACLGgX3zw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RsKyao6W69ibqz7BGvJ3cXqeGEr45n5GCU1JkBhWMBcWEJ5T8V412bF/nVvfMPoK0X8m+7V3bG6bRJypwaNTuw2hFlGOGLGl6lgPgGdGJXMKcAaSrLDhoMqRgPiSSwAGJyVAgLzwn2IUSueTOvUC72VAiykulKwjM50akUNaqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4nqvmTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AF66C2BBFC
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 00:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716855564;
	bh=yywSxx47SHvq0becfEko2WOSC7KzxwSlmlACLGgX3zw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F4nqvmTQn5NB5uoQv0CReGNic3ZzzYws1Km0Q9QVTVgM2vGsBbsoaCcv38FbEI9ui
	 IBbRxEiX07NJs8O1je3GftkQdtbnz5TpCXvXePu8VGKpNC4OOlExCQkyYg4BiHcvNG
	 ITXQ11NplCURCcGJZGvxLfWoK5ubkVup8kFQ4bzxL1RsLRYYOgoJZwV54vYg5SrZqN
	 wcVFMiycqUCQqtYOC3IbbeJReUPZKxAa/ocjFeYtxHoInjkmu3HxgodkLsfJ9yX5LT
	 E++JM43djRAxbmxkgWdc4btqVdfgzkfEMJeJNe6GkPDOk5FHo2vJlFED4ZGkHWiHlV
	 kOeiU3v01DKvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 079EBC53B73; Tue, 28 May 2024 00:19:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Tue, 28 May 2024 00:19:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218890-208809-CXH9VZlgTc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #2 from Pierre Tomon (pierretom+12@ik.me) ---
I did a `git bisect` on the stable repo and it give me this as result:
d97e1c3602240bd35c48ef9aa978e0c47a511d03 is the first bad commit
Author: Martin K. Petersen <martin.petersen@oracle.com>
Date:   Tue Feb 13 09:33:06 2024 -0500
scsi: sd: usb_storage: uas: Access media prior to querying device properties
...

I also did a `git revert` on that commit and built the kernel, The bug does=
 not
appear.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

