Return-Path: <linux-usb+bounces-12750-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7194365A
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 21:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07C201F275C5
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 19:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACC85C613;
	Wed, 31 Jul 2024 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiD/lR/U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C6B1805E
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453683; cv=none; b=q7EXtQ0Pch23O8WxnOKxO4vTxFM7sog71ESocDSAThVnmeoXjM6N8o4YbVDeQ1w3ezbP+u6u2E2hPsEUQXsPiBYH43KDo6N3sz7RYeS0DFYa+zZ55Xh/xlP0dgEzjxJk7DOhB0WrMzUeOmce7FRZu3lZdHZdGiTr7V/r3X3+deE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453683; c=relaxed/simple;
	bh=C5pl4jAOsza5T1P7XGSZT1md6dBkOlTlOIsCfO1wgww=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M9aAZFP8QLpoSo8LqS6Z5P7TfXOa4eT4dNC8OejaUVcLX5nTYTnN8cEQ+BCFt4Qk4hfey/BSl2p8KfXht6BjqqE3gbIJ/mGXRcLEy7CSuF5D3gDuKZIswvRXNxjReCCs/hlyYQEBionz1aiWG0EKHtVQH5p8oRho5uYASl30B0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiD/lR/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA65EC116B1
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 19:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453682;
	bh=C5pl4jAOsza5T1P7XGSZT1md6dBkOlTlOIsCfO1wgww=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BiD/lR/ULxVZuWIi7C6vxnx4Sro7eFmqUt3q3D1RI3drsoAAu8ahLUtbUZeWm1lTn
	 h8TizVE8Q6JfvH7AI/UWKqgvMrARAtFRDXScqVvmpFvYBh7jmbB1CQyrckfQ19s8OH
	 xnXpRQq+160eNscEzMo8jBX50/kVve/EUA3fxUDE0y/H+UIn2foE+dvp5JPJYqnfd7
	 Lk1cIB892qYAPzDDCwxCIzzHrOSzIUHXNN+O8hc4wqonmjvS32I++5W8GtbQGXxpH+
	 Vyv0KjVXJTYce0/qtPPQ3l70kLHuPLtlpWklDC0CGGdQngQ9nRRBw9ghYLn27vnjMg
	 a75WSR72qOm5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C1666C433E5; Wed, 31 Jul 2024 19:21:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 19:21:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-gzXjJfb8YD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #12 from CH (com+bugzilla-kernel@c-henry.fr) ---
Or rather: I addapted your patch on the 6.9.11 RPM I have. Can you confirm =
that
the diff is good?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

