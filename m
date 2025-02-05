Return-Path: <linux-usb+bounces-20192-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B9DA29D49
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 00:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECBF07A1B8F
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 23:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590AF21CFEC;
	Wed,  5 Feb 2025 23:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3zhPhmj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17EF215F4F
	for <linux-usb@vger.kernel.org>; Wed,  5 Feb 2025 23:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797311; cv=none; b=JugFB7kpBzk1Tuq/JWeY3fn/sB1u1PLlb05AZC8NrX08dIv/tm/ZgMJDUaq+7ua4nc02PwTQOexC62C1x0XJJca+iVTOrp53e9bLdm82jMj6anHaVdE9Ap4rCZSBpYKFksTETn+frheEFPNcWfW8/TJhSIqCdSVjDqaWzuT21So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797311; c=relaxed/simple;
	bh=ggQram7PUUyhKnb/E2LC1KrFl9poCOO3VkFYuMHFFok=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FqvpM+sGmx5qtLsdYpp+8vxSO96RT+05EkA/PRIxzswFSmhetutL6amZUVr19SqASLQYq7heHyd6H8TKA7ahhKGOduNYCk6zTehiNMUyRITZ6Qd7/ZMnu8HA0mxpTFTOaWvO8CLZW4D05ikkwarvR6qU3oIgXO6DOxI6BKLpNRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3zhPhmj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44DF6C4CEDD
	for <linux-usb@vger.kernel.org>; Wed,  5 Feb 2025 23:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738797311;
	bh=ggQram7PUUyhKnb/E2LC1KrFl9poCOO3VkFYuMHFFok=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t3zhPhmj0kbD7MPbmjl1qnlOjSMutOXl6+zhukouv2F4s48eyqH4CZPa4Wx2XdvrD
	 ck8Zw50bvE0QGfjrVI6W185BJkAXUgVhDtaoJpzbuNgsB33p9XHIITZ+Rf7PHg7Plv
	 5Fpvx7kN5VnmmqdHlfCvUaIXz6cUgZxkzfiMWOFPASsEFd0bsVITh5vp5CFe8QL+Vn
	 a9mgCpI8vCFp9yx59oMahyk8TGkT2zrWqPmjOMJz7OmiM4NtvGiXr4pKkMCutdZNAB
	 v5ISNQYDPxFV8QYj8tyojq28AnXUz2xQjyHwhfFGbNsspaGp58JJP/kwBsESsnPx/n
	 1NqhpnXnbH/MA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3B38DC41615; Wed,  5 Feb 2025 23:15:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Feb 2025 23:15:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-Zt2RfqQSKs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #4 from Thomas (lyz27@yahoo.com) ---
Created attachment 307578
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307578&action=3Dedit
trace

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

