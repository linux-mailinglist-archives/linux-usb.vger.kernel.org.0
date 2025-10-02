Return-Path: <linux-usb+bounces-28865-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE11BB268F
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 05:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DF813C0EEE
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 03:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95AF15E5DC;
	Thu,  2 Oct 2025 03:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFNeBx7P"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3A3208CA
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759374131; cv=none; b=Y3vBg5kX3Y7VQA4TTWI1WyzJs5t5hq3oSnOkZIG/olZlVG2CwakoS/NGjPvX3cGONVx62BQHYHXNJNPevx33deBxkNq5Xfmxk6qJshDiMDlAuw94SBOAR3yJb0XmLWw1PQ8utuojh7syLK+AYQpiBPEYDK2F0EqtoM17yhp66XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759374131; c=relaxed/simple;
	bh=sxawU1XMzfxg7t+GprQ9lpmw/w1PpqnGiCRTflCFpVk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=djM5ZwCTbgtjV8B/ju323mJQMYfQPot5QbMTVCqRko7uDpdKvji22l1j8udeLWsupbW9h8xx+xFRC7UBT8T/0Ow5kVwO+Asz6Xv4HNXr7hBklo5UREKr2Cpx1D5Ov1lKgIqYGFwXqT/MHg6hMSGrX3vU7CAff8t6bSiUsP1ulF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFNeBx7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D67FDC4CEF1
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 03:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759374128;
	bh=sxawU1XMzfxg7t+GprQ9lpmw/w1PpqnGiCRTflCFpVk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XFNeBx7PZTeTdqu/rWXvxxAyOJLQGbdI8xZKvGDlghJndO5Ev4SaEw5BZR9sblAmw
	 ugqAb6+TG9MpHYEGKod7BK+F3u4QpW8e4+s25xvSo9LRxmCEFaFFHhq6pshfUminx4
	 zlzVAc3F+uT/EDCMsIgn5dLfuIImjensUcmfd680pmv+zTqHY9up76f6jeon3NFzBV
	 I85WFfDzoefz70AE4HB4KcEgvgXG18ISvN3NSKitP08GCpgzzBp4g3+d73Wq0kvba8
	 7zyYIJ1I75lLJE+SQXcu5+wephF1T3pupm4w6ExytTV3Lqo9xfrJu+w/jTATnyRVvw
	 oxs0mFVcPgejQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C6A32C433E1; Thu,  2 Oct 2025 03:02:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220422] USB: Misdecoded serial number from Dymo Twin Turbo
 (0922:0018) breaks multi-device support in CUPS
Date: Thu, 02 Oct 2025 03:02:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steve@groesz.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220422-208809-heqMqwwkUB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220422-208809@https.bugzilla.kernel.org/>
References: <bug-220422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220422

steve@groesz.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #5 from steve@groesz.org ---
This has been fixed in CUPs.

https://github.com/OpenPrinting/cups/issues/1338

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

