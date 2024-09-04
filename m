Return-Path: <linux-usb+bounces-14626-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54BE96B09D
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 07:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23E8D1C239E2
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 05:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2797983CD9;
	Wed,  4 Sep 2024 05:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xy/9NIem"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58B85B1E0
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725428690; cv=none; b=lQDghFCAuzgKYlr5BwVYBAfIDxfmnJtQcVbDnoly15xrdJ8QzjWAVVDI9E/mXyeRTN4vGDprl6ZED9I8eKHwkJtVLx6ATU7/1AuiL3LG1Oj09OWAY2HkQE1B86PpJRubqy/VWiQLE3U1TT9PIUWKTOLzZfVdcDkhl3w9fW8SvCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725428690; c=relaxed/simple;
	bh=zjjzgPcvtiUl1JZS24cU/u9iIyO1cNZU3RDyYFpGuGs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SSabIe+Jc2UYTpIPkGCJfFLo0J3I7rVv1D9gLvKhD47fmOJAYkFJkdvjcEwbL8wbN3uvilQ/vYa35lwbmRjqn4HQsPIntnRpZhMGUWl4tOdoUzRsN9SOqVRJ9awNOXoHl4u9cu/a1XmxvOOE/ZPLLKpC/nVvXQIoy+PdFxsRURc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xy/9NIem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AEC8C4CEC9
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 05:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725428690;
	bh=zjjzgPcvtiUl1JZS24cU/u9iIyO1cNZU3RDyYFpGuGs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xy/9NIemHQHaD2U+mH8ah7v4s3JsTHPJK9yXjpDA4CwUm15aKFexVGtR508E1hNkg
	 H4O7znzZXre0A6SJkTDDkuZD7iksSdqvOAKLjsIKC3hoT0gxVoEY7CB4SXe3o4az47
	 9BCrJIxV5ZiH5RygFqfLBtdeXwmTKayKmxQyRUV9yxDOC8swvsvigvUAfNNrlCHD4y
	 UH3HN1v6Qrj/vQrooyaqyJZNSMY2Q8flRQnQuc/srAOSnQM5FIYX7nlMUBZcyoou6R
	 FD6RJQee2fCsFhqDpFNmj7gbECRtRS5SixS2i1HlKXn3+/CJWliyIcVf7mcnfc1xi6
	 vacOFw0r9xmNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1FF56C53BBF; Wed,  4 Sep 2024 05:44:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 04 Sep 2024 05:44:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adamw@happyassassin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-WFOdWVZOQM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #30 from Adam Williamson (adamw@happyassassin.net) ---
Because there was a parallel - actually somewhat earlier - discussion on a
mailing list that led to that patch:
https://lore.kernel.org/linux-iommu/20240814162726.5efe1a6e.alex.williamson=
@redhat.com/
. (no, Alex Williamson is not me, though we get each other's email quite a =
lot.
:>)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

