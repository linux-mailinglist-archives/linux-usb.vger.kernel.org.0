Return-Path: <linux-usb+bounces-9880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F08B5462
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 11:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D011282042
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 09:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005D724B34;
	Mon, 29 Apr 2024 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riw4CiLA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E38A22EEB
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714383662; cv=none; b=p9Rfk/cx2nfJmFzJfQxSlZd2MX+AbFFwBNtz10Ave8zKLY9H5N5z5WD49noFAya7cr9ExOWi4D3GXfjyL3A0M8ttiKk46ASmFDaKEeu7cuLWUxxmGlLd1VILXs1JXYfr6xpxD07h8KBl3TTgzx9FaikAOoK6i5QkJotxhu2x7KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714383662; c=relaxed/simple;
	bh=FTkWrZVByvQRV72aWQerMJa/ahU7yROujSMlUtuGV0k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bWo3gdhTFXjfeHF2i4DKOWjQqk+cgaU2lzP0FIVBrE4VhBJgoIOCLkZHpeBC3etmqb3DCwR+Dhmtpv5uLnyXY7vdWm8VkjtThZBLvEEMhsXZpCsZL1AyCBB6OQ9G2yUqvEKLCOs8qyArft1X5fYe9S3xzvRl96WQtCvQurNkcfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riw4CiLA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0797DC4AF1A
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714383662;
	bh=FTkWrZVByvQRV72aWQerMJa/ahU7yROujSMlUtuGV0k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=riw4CiLAQPeP+gIM4AsLgOvWBJHs+FKoROE1vSEkfZydCvKrnRUXFXYpBcrjLp9y9
	 r/JM5Y+3ZmHEUysRV0g4SEbKCYKlWKsdTVzGiEXVpBKBcOZWldTRI0KZ0gXvlxfDbp
	 wt3Wm5rM6+NSPM21uJB93rZgi5iN+41IkOGW+0BtNCZQXK0O/VFAY9SU3yVbzVEc40
	 uegp+pOjgFnnl6Wh5/cbt5HuZVQVRAGiGpgD370wlsm/NxWNX2KXWFdG2lMkAH0RpF
	 T9OBESBjL5yB+8RhorZiroraThxE+TsgWotfUnbwojS2x7tR1Ft4IzA8zv+hFkPS2K
	 dvKVdMmZIP+Ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6957C16A72; Mon, 29 Apr 2024 09:41:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218788] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Mon, 29 Apr 2024 09:41:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-218788-208809-E95KgDJ14W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218788-208809@https.bugzilla.kernel.org/>
References: <bug-218788-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218788

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |aros@gmx.com
         Resolution|---                         |DUPLICATE

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---


*** This bug has been marked as a duplicate of bug 218789 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

