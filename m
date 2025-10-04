Return-Path: <linux-usb+bounces-28899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99FBB90A9
	for <lists+linux-usb@lfdr.de>; Sat, 04 Oct 2025 19:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DA534E0601
	for <lists+linux-usb@lfdr.de>; Sat,  4 Oct 2025 17:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C3E280025;
	Sat,  4 Oct 2025 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXyqBpBU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AB12857C2
	for <linux-usb@vger.kernel.org>; Sat,  4 Oct 2025 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759599903; cv=none; b=b4AN1pcSz5SzdS0DIxNr7t0O6d5P7aWf7rwjG9+EmxBTmr2kGT3X+VqugbOusVYied0YmafdgCVDoMyd1uudTN7em3lnmUEvKJvMpyreu01lQL1zs9QT8rXWMVLPAAolZtCb6B40Z8Z8pgYDyJQx7oqobZY6qsTEj9Zk3kHOqSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759599903; c=relaxed/simple;
	bh=od9pOgdiCTzoQA0YqPdAdM2UcdVbQ+qGkJCX2O20CrA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KMUgr/nVh/7cmVOG+4KuJHxvIWJakt4BRqGE3DjfJ+IhL/kqTlzqejvCikpW7sX1UJrW3ifTqe/kczJyYn29/JYKnAMnA8dTYf5A3MlMm0IXPBcBdCijsCz3+BYYcd1eKc4Lb4jxqVwZKkIC3+TF9KaTxA+efNJuZpow1gdutWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXyqBpBU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C497C4CEF1
	for <linux-usb@vger.kernel.org>; Sat,  4 Oct 2025 17:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759599902;
	bh=od9pOgdiCTzoQA0YqPdAdM2UcdVbQ+qGkJCX2O20CrA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eXyqBpBUgdprDBtsgfvD0ywiiHwC1reTdJ0vDaNfxMlxOVECj56eFK7piIQtQ+5X0
	 pVq0sIHAucyM0shh+VKUat0VJYJM13T+LbdGNZIu77+X04Thyps3wnUwj5bzcKGhuK
	 Z1hcvd3zWHeDXOk0wxjoEZl+KW7TW5+E8OgISMFwHNwS+jT7mhx3oTcoTrrtG7cWe3
	 GC20m2L3REkiRB+vxafgOOUMFLTqgb7RInxTqPKirhO4nGkBnDlzPPGZBUkL+30/Ef
	 euq42Ahq0sfEMH8F7+IqiIcLb1saEoSP2grG9wCyZJXD+CdwZJOe7eufQRUHbB7P5j
	 aK+fAN1JeY0yQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 157BFC3279F; Sat,  4 Oct 2025 17:45:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220628] USB disconnection after mounting file system
Date: Sat, 04 Oct 2025 17:45:01 +0000
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
Message-ID: <bug-220628-208809-eqWeK4AYNP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220628-208809@https.bugzilla.kernel.org/>
References: <bug-220628-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220628

--- Comment #2 from Pierre Tomon (pierretom+12@ik.me) ---
* with B to A cable

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

