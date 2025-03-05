Return-Path: <linux-usb+bounces-21392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31174A4FEE0
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 13:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F487173FBC
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 12:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB5C245014;
	Wed,  5 Mar 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQnOpn2V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9772459CC
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178436; cv=none; b=aaGLIqaAA2si1i/mvaAnmGrT0l8hJvvU4Z4nbBocUTs+cXU8X4Ep/GGZpaXrXVaKiBXimHoBY5eoAe7BZ8/cv7qxBVUZ033Aoqta8y9ZW1UmSgRzlEfW9uU1saRwMsDmzbWb0UWecIhElLp5kpjonUH4YM+aSp8OFjs0Mk25ZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178436; c=relaxed/simple;
	bh=Il4oc8MkEZcwKAm+9Wn73QS/UVrcdDcI2drE/OL/XP4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BFSn92C5p9B+AMc0WJZWRwqpoJ3g/NcrIj5bmJAdKHJI7nCAMsDQUBSTOFee7ZaFV5OVgM1y84vQ8xev6f9DA1iA2ljxqohnRe1GZN6NBUXjNqiaoKZAoJLhaZzBnXy/e8L5l19KmeV1VBxdsneK/50KmOrCkBGLoQlQQtaZTec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQnOpn2V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9804C4CEEA
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 12:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741178435;
	bh=Il4oc8MkEZcwKAm+9Wn73QS/UVrcdDcI2drE/OL/XP4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HQnOpn2VbehQYAlV/B2LUs02quES8S/as9A/768dm3KqLRB9tA7jVJAA/Rk53P9dx
	 IGm9vaJ+Jz4IXmmNrShMAtPJIaIIPO69GolKxY9pTrj/y1so0qG0dTLnDT4Wrg/UXv
	 MTxWtjbB5LMwsFGgz34N7rCVH7B9FOMHyslm5WwuY8WxWB4BucZesJYHkwGxsk6ONk
	 j2QYYQpHqqkXkp17oUxszJY/SYDSCJt7fhcewj7JnLkZ2NTos5BZOE6cqTGHNDCdmq
	 5VrZx0wqZ1kZ5MFHLdi0pe3gaGxQUBHslbkmEc7bEJxrOoEHkTb/EY5Iwitg+iqbz7
	 hIYLiSM70lzrg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A62BAC41613; Wed,  5 Mar 2025 12:40:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Mar 2025 12:40:35 +0000
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
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-219748-208809-xieAU465Q8@https.bugzilla.kernel.org/>
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

Thomas (lyz27@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lyz27@yahoo.com

--- Comment #23 from Thomas (lyz27@yahoo.com) ---
Created attachment 307771
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307771&action=3Dedit
dmesg after move retimers patch only the pluggable device

Thanks for the patch.  This is the dmesg output with the move retimers patc=
h.=20
Only the pluggable device is tested in this one.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

