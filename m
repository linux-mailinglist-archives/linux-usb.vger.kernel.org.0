Return-Path: <linux-usb+bounces-6372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C638538E6
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 18:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C54151C2369B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F593604CC;
	Tue, 13 Feb 2024 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8fAM070"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4CA60257
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846453; cv=none; b=sjwaPgmcpOZN2eWUJkzLdCOmAUSY6W+WQ9aC6L2u7EwTvU/IAjv641VjdLzEMz+I9940nf0Kty0JQoYgtMCBHPbLbR+cokFL1fXN7MresM3TRGW9v+Iv0NSUgr8a7CcetUwxWJUfuxM3Mu5KjihrOq/4xUtSIQtVgCiiUfCfPiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846453; c=relaxed/simple;
	bh=M01AeWy9NyAhOZCJxb0T0YdS3OugIDF6K9u5A0dPyXE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JHtJgU74i2uyPQr0nuq7eBbsh1Ab/FslaV3pNpaSrQDvfCsxSMRtPcnQi3cp0Z/fRIjWlYfIRz+Fx6WgQQ/Ub2hnPyL+h8qfIfKsRlVHTpi2zcb66EwuraZ0L4b+oembqUMhgwv7N9qwaoKpyRbhsgdr3iTrgbOnvIR8MbB1b94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8fAM070; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 721EBC43399
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707846453;
	bh=M01AeWy9NyAhOZCJxb0T0YdS3OugIDF6K9u5A0dPyXE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P8fAM070G80Cua2KBiQ8NXQtWMQFi4gjmSSRYEhkhtzPjuUBJJHi3/Z6xg4mFjpVN
	 Z+QSaIZUD9+22TWUWv4tG+BybSkVASSzqz8kx4HhU6uei/QCDyRxejCLE/qI750UDP
	 8ziVW9PUVKftzlXH1pwS3AplMUjK+OqeOVh7+csdGR1wPufh/AhJqZg8G/pQwKFwEg
	 5x1Gznh83zZWMvOfMAJ0UXxlF5osFySMgw77Lbu72UtNn6RECq+uKZJ515kxF4ECCy
	 Nl3N4t7NymzbHLBhUsbudhj/5JRvi4Vhcx64BTNE+b1zS9iZr5tF79lDdX+2NgFv50
	 MK3ed+XmXpLIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6478EC53BD1; Tue, 13 Feb 2024 17:47:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218490] Linux warning `usb: port power management may be
 unreliable` on Dell PowerEdge T440
Date: Tue, 13 Feb 2024 17:47:32 +0000
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
Message-ID: <bug-218490-208809-xB8ZK7KPnV@https.bugzilla.kernel.org/>
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

--- Comment #6 from Artem S. Tashkinov (aros@gmx.com) ---
*** Bug 218465 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

