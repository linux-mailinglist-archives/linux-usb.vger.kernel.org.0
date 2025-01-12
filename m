Return-Path: <linux-usb+bounces-19224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D513FA0AA2F
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 15:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EE1B7A12C9
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 14:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AE21B6D0D;
	Sun, 12 Jan 2025 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIENImQF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43911EB44
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736693222; cv=none; b=ot0iYOz7Hj3zLV/MT90bIU1sDDvH4NxPTgAW0eijsB5MelVcUMi22aPG769UxkEMypvSs5gGnpwh7OuRFfVuRs/IKT2+oUnLJDsgJpi47vMEkkvrJ9uSOz2axOeRZWTXnwO6os3zOtFeCvC24vYbveDr2pB37S424laqdRODCA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736693222; c=relaxed/simple;
	bh=FOL+6Qoomp5Z3UOj7buUK+1Y4Xv9mXG1dGElncTmr60=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gKzFkw9pArGhshrlK2tGaUICjU6tsFCyuhI55zFLEmPYRcIy4IP0sCr9rK2RKn0XJdUrBIn3nuXVVjPkPxeMjk8SOOahnB2HeWBOc6PO10shgwibV1RRcEPYlXC0SWLkQq/bH5b5AyFHp3ogoc0kbxtdmheNPeDWtjCEswKwfSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIENImQF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56D43C4CEE4
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736693222;
	bh=FOL+6Qoomp5Z3UOj7buUK+1Y4Xv9mXG1dGElncTmr60=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iIENImQFfh1dzM2xD//Z1utufwxviiA2OnXEjHMSOQaXQz4Q/Fne6xb6aAn/LCUmq
	 pc/buMPznPWend+7zULTYzpN1TplyBLlkUtU+5iu4pXAm+EQnIdwEA6MSC9T8cz/WL
	 9HW+HfOT+vZnbdCPYTL2Rv4ou0eRwzNlWeRyLFbUIoyXDN9mkgTI/198sxVv8PK40g
	 n/928trfXUWxGmRcSYDOCv1E6z6J7VMc3rGZGrS8MNlEh1My0In9awnboWQ0uEcL7r
	 QYMVmtR4Cb8fW7tpxrI+9d5evrd8xmwDcYyoDJT+OwMTAY2IL0ahlAIQq8z/VdnWte
	 nf4xLxu7U2Icg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4AC80C41612; Sun, 12 Jan 2025 14:47:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219683] Noname webcam used to work, but not anymore.
Date: Sun, 12 Jan 2025 14:47:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: v4l-dvb
X-Bugzilla-Component: webcam
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: v4l-dvb_webcam@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-219683-208809-ul5XpYWGF9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219683-208809@https.bugzilla.kernel.org/>
References: <bug-219683-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219683

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |webcam
           Assignee|drivers_usb@kernel-bugs.ker |v4l-dvb_webcam@kernel-bugs.
                   |nel.org                     |osdl.org
            Product|Drivers                     |v4l-dvb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

