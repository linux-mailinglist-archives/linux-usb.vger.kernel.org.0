Return-Path: <linux-usb+bounces-28868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A84BB3827
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 11:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B79E3B1825
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 09:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C02A2FF651;
	Thu,  2 Oct 2025 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbJOsCx8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A169D2DE1FA
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759398367; cv=none; b=YL7s90PkDpeCDUM7o1av/69xw/PeCJrqDw/+lR2SVddGA4A5cjR/bexMcxmlA+D2K6WOrjy/luBpm9HGYc8uEY0FXrLABnXOPpXGry1+gYjZRChAdIdd8TmWc/6DoVQbo3PFnjURKT5BurvLF7VBsuc5vhrrmI7mi/Yz3wCHxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759398367; c=relaxed/simple;
	bh=pdnmv4YajqhIWXXOj/tBNmeVrB4bgL2eP/gDjNRq2XA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d6J78OBU+Xk4qfs/XSRXyY8Tf6gMrfTCzy2ieQRnI8+AlXSUt1NOu9WkiOzNLA6TqQ93H4Yc/2tE5tOqOeE/Z+YgX9vIHeTHK8v9Pt7OFHQRjX0QwZNIhp94AtINycfc67AN6nXnThdYmH5jVZ/BiLY7KoYcUFMb/jvxLhweMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbJOsCx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 182B5C4CEFB
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759398364;
	bh=pdnmv4YajqhIWXXOj/tBNmeVrB4bgL2eP/gDjNRq2XA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KbJOsCx8KTn6rMRo6JZKcqDzQwqBTrN05RxX1uC7vb1yMTSj/0an4g6Yr3bS2jkhs
	 kJp5Hge7nFbBgcRc5lk7zsXEejBrMumgyy/EkZOa8DrtCT8vNkH7Z7Ic9R5IxPV1O1
	 vQHc/Zxv3Aiei0iiCnmBEHK726LxXhJWnyukix/DjG5/5OxiOFrWFwwNxCUNTOCxkI
	 5vsrrm4h9W4GcwAgoPEhqMPQPUdiQ7X1D4PLwb3mVth7KykOHQZxKd5r5IjaPggJmL
	 WOJOAA40njYovQE1BR07ty5WHy1JK94GVbDUyY8nvAKQH3JTeRzm8dr6TnsbYNlaYa
	 ZlCqkkBQWWzyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 11816C53BC5; Thu,  2 Oct 2025 09:46:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219726] USB devices fail to show up when upgrading to 6.12.11
Date: Thu, 02 Oct 2025 09:46:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marcel.c.vasilache@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219726-208809-MNysIy4FmE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219726-208809@https.bugzilla.kernel.org/>
References: <bug-219726-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219726

--- Comment #5 from marcel.c.vasilache@gmail.com ---
This issue was cleared by adding the proper setting for 6.12.11 kernel conf=
ig.
It has RESOLVED ANSWERED status.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

