Return-Path: <linux-usb+bounces-18739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B629FAE36
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 13:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F4FD1644CA
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 12:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8421819DF95;
	Mon, 23 Dec 2024 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8/W/rNS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD4D188A0C
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734956295; cv=none; b=u3refXgttew3cheYCLk9+lMduugV10kPp7lgmmtTXyr/8v1snEEy7KntoOpOj/jWIJprBvIaTJFkRW5WufW/RhF3UltNi9Ds48yaOnVnq5hkmdDCIzv2UmKCplcH9qxfJSg4wce2OM6m4RSx38pp1y3Jbq2hRc7vtMw8ulu3HNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734956295; c=relaxed/simple;
	bh=fW6nqVVw3wkSRgZ+IXTrn+uCmi9d8+coX52xu2Mr8Sk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FmeuNv4JfH98wduH1UIAqEhuB3rSEpnXfGxKBYCzthjwqTX/LrP+qLSGdj/HMpTTcgcj2BaW8TbzSMAjwNqxsmwhqIqRGKlyvPlgYkJqUIYD9k8sDWavzHXgXQ/x0gzjhHcB7f1d5CTUiDgjzy58tDwxXOUyXakUAYGhOqDtD9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8/W/rNS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8094EC4CEDF
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734956294;
	bh=fW6nqVVw3wkSRgZ+IXTrn+uCmi9d8+coX52xu2Mr8Sk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q8/W/rNSQ0roRcau2WXTIqvanzjsFjY8Fq0k+tr8GRKC4nolNV04JRWFlGlAVtUch
	 XZAAEFp1DpW5+InFUXVo9KfBxcZY/n1vNgdPvUsEAbo1x0SNkHr8Z/inREv0kEHf9a
	 +m+UOkns9uxspvIZ00ZQCCtPXxeyPANp1n8PvIinQkOsmB/H9knjVyCOQ6BzQIw7dh
	 YCi0NPxE1ufaiQAZ/2PcKBC5DdGTQfDtp6tjMcdWBoYGXYpm3n1Xmt/xaKyQKl42lW
	 OZBYI8mnjnjOleUl4OToZQ2ogFHrTBR47/ADRhr2yGrdZpr97qDgqBlZ1OXHLyCbct
	 +oi/Y2pTZJC4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7A337C41612; Mon, 23 Dec 2024 12:18:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 23 Dec 2024 12:18:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lists.rolf@reintjes.nrw
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-ZnFt6Ich2B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #25 from Rolf Reintjes (lists.rolf@reintjes.nrw) ---
(In reply to Micha=C5=82 Pecio from comment #24)
> Maybe debugfs is not mounted. Try
> mount -t debugfs none /sys/kernel/debug

root@i7-5820K-debian-testing1:/sys/kernel/debug/usb/xhci/0000:05:00.0# ls -l
reg-op=20
-r--r--r-- 1 root root 0 23. Dez 13:10 reg-op

The file is empty.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

