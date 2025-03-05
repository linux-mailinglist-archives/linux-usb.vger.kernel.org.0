Return-Path: <linux-usb+bounces-21388-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B36A4FBE9
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 11:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7ACC16B161
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 10:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D7A2066C4;
	Wed,  5 Mar 2025 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvOZDb4w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F8A2063EC
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170519; cv=none; b=WKbmYPYEipYwI91vMb3WXInX2Pbp2NrTzc7XPJPLiwpfFmtPyHaaRcu7Oe+m4NVVSB1RiWuyI7nE2k7EmAmHXYMc4RPctAozWeQX5n1DHt7lNswGJS9x3Fmq6F/jkI2RQsZfNt7mJiY6kO/QJcJk+KORVfq6E0IdkPJV7cjWOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170519; c=relaxed/simple;
	bh=iA3X8qjObYNdyrLA+X0s920HID4AHkwIOCrQayvFtwA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QSyxrz3FuYOcNmpocG2w8yDF68XTfZHc6FZWUTma1zXdyqAfokPJuXpWXjN8gLABN/QS6dyOPLPMe4Xz9opPoR0dfNKR9xN64jbQxOkFRUGZFJjHUW7jv5nzIaPYNS78gy2macbRwBqboDhsjTgugtk8FBo+Ttz71LW75mIHF2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvOZDb4w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93B76C4CEEB
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741170518;
	bh=iA3X8qjObYNdyrLA+X0s920HID4AHkwIOCrQayvFtwA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WvOZDb4wKSS18FQwp2/zPhY2U0AjxE+k/yyC6jOhtY3ZkQIm12X2TfinhO/O5MNBQ
	 ljS59nVG7IEuo5ccH0Sur3ORsxd0iu9IM09zrWcyTiAzObiLB6SNRjhP0D9QS92XCu
	 +l99xDESCbPXDvhfPkQXOx9eZ7w48MoV3pVdFZasfTih4rbDuvZgYtaMbnzWq+hn/w
	 KEe0/kr5o5XhV8E/QqpXmWxXj5NfD8Z+obe389kbolrouiqUXX2yO9F1xtqK/k1V0B
	 lr6SSGTag3jn+tDfHAt8w7OLFvHctaxEaYuUbkIbuwB0541zGD+sNtGVN9/HDgzYYm
	 hPIxsr11w6gkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 84B09C53BC5; Wed,  5 Mar 2025 10:28:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Wed, 05 Mar 2025 10:28:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tr.ml@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-2bX2AywEOq@https.bugzilla.kernel.org/>
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

--- Comment #16 from RockT (tr.ml@gmx.de) ---
6.14rc5 still the same error.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

