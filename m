Return-Path: <linux-usb+bounces-17141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B57179BD9FC
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 00:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE3321C22119
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 23:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34ADB216A1A;
	Tue,  5 Nov 2024 23:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcpmC9MS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20D41D31A9
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 23:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730850936; cv=none; b=HzAbNSKPZ19nRg9J7CAz4Cq23U/hzSxxiice9nM8A2WXiNxWnLjRVR/Jvh3yBo3dFp4oDLqUMxY4NkBwxo895M3FCpwpC1KUTHeSHtvXW/Wx07aBqytEDLt7mfjSiMkLdLiFGF/B3fivzoj68+zJBB6Icf40fJmd4saPqhE1MC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730850936; c=relaxed/simple;
	bh=zuYrVPe0DwRDgZrLoPrdPePRAKmzAv3mq0Uyxp9mzic=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e34v7Cz7YLIVk1jFOVepPLkPtkIG/tvP5FmSrzOGWRYeDWy/fwANj21ENc5Qkjz1QikrxV3juEZLUNqd+oCOKONlnLQ7V7Llo9nhAPN8M4jz1/LAfgl8WEBN4rHTLl6PrKIRZn83d5NcQBKt5pMetpIRop87M9LufGSc2uWMB2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcpmC9MS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E9BCC4CED1
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 23:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730850936;
	bh=zuYrVPe0DwRDgZrLoPrdPePRAKmzAv3mq0Uyxp9mzic=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qcpmC9MSnFnXtZwk06avszpVzKZwZFgZ7YSeJyYXDPLCSjV3P3szgDVkXOYEnkoQG
	 bhoiiMyJ/413xu/hSTtzsBSiBLtrX93Bwsk9ZJLpUu8VYjB4NY2NKkXS3oqoqOdx1M
	 yb4wjRsEE20ctctHJ6VvR8/FSswX0p3URmGsxH8wYylx3sUV/QS3GSHMt8prSsCgLB
	 GQJ9lZZPwbrxPfPzbX+QOxm+3bs+L/k6K2TahAxLLqFAXTCNAGsuejA2K0e6BDQa2S
	 08iu9XY1EDRCeKKaxQCXC3G0Q8rxmtDaifI+k9mwslsYgA6cc+JtquwO/Mtcasn0qV
	 Fp3Af1+QKUffg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2BD15C53BBF; Tue,  5 Nov 2024 23:55:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219470] Add support for Apple USB-C Magic Trackpad 2
Date: Tue, 05 Nov 2024 23:55:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219470-208809-iWZYKjZ3ky@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219470-208809@https.bugzilla.kernel.org/>
References: <bug-219470-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219470

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

