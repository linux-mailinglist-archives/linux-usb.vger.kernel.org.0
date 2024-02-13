Return-Path: <linux-usb+bounces-6366-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1038538DE
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 18:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15C41C235D4
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCD660268;
	Tue, 13 Feb 2024 17:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFkYLgIz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E852E60258
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846382; cv=none; b=olLrWmmQdWkAVqAAyE4JjL/QLnPjCOUC7oxN34F//cRbObx1f+GWCUoL1W5g+vRIx2ex4gfs1ebMhRwsutxz81adLg/l7TDASBL+E3wI2E0CrtWAECKhbMvbq7/uHXKmYQBKKIY30HDl6LWAyanCRLt4E8HSEe7dU6K2AZ5JWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846382; c=relaxed/simple;
	bh=1Q9WWpdblefqm/G5jxJlopj+cjtrExGAoYNYTXXn3EI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AuGq6urWdEQ4c1rD2qmfbzDHkC/SuD31jqD9IaCl0c74f4V57NFibEVH6vY+gPMuBTx5AtMBKVgBlzleMwb/7VGOokQMdA/NrgBYf8MVi8mkW5AVe1M6Nvt5Res9cYU1Tf9VeZYnAGzKI2Tdggv3AbuUU8ej3wq+cb40JrWVFcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFkYLgIz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ECF8C433C7
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707846381;
	bh=1Q9WWpdblefqm/G5jxJlopj+cjtrExGAoYNYTXXn3EI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GFkYLgIzeAsT2937Xm4lPN8eRNIvVzd918jM0eCkKgrs5Lm00tnZuSvNsrBKtbe2l
	 K3or9e0GxwAPVuZtbIj1NLfw9FKLsWFu7dvz3sGA8NHJhWx0+BuFlvVjsAGAGCC2Xo
	 3m4YHWbW0t9bxTqye7yG6s1sHI2tNHzdBV/xZI5EfWt0MU6plQBF7px9V/iK2Ksyt/
	 JpfQZY82V3gnHpRzNX+/SG2AKXblbGDJoKe/UNxkMg+daLTH5DdcE0KGRnlsN/j/bW
	 aEmqGYtHSo9lAV6AgK28BNfZctXRbD6+YiJ+027XCCiTws1qRVqKNQUMevhFiJTJh/
	 9WEH9Jja39hfw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7C881C53BD0; Tue, 13 Feb 2024 17:46:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218490] Linux warning `usb: port power management may be
 unreliable` on Dell PowerEdge T440
Date: Tue, 13 Feb 2024 17:46:21 +0000
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
Message-ID: <bug-218490-208809-oJHds6m1gb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218490-208809@https.bugzilla.kernel.org/>
References: <bug-218490-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218490

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
*** Bug 218486 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

