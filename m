Return-Path: <linux-usb+bounces-7090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AB486797C
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 16:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB5051F2663F
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 15:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73712132485;
	Mon, 26 Feb 2024 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPS9YQU7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECD912C533
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708958833; cv=none; b=LdT2m9pK0XBrbxtXbsuXd+LHqnr6N+ifauP/6H9BXRVMgc6qwnn89Csel6dAoVOTLa5AJ8jsvq4Y8BQ2+wAa6gZ/JxiCNv7HmhYXBSVxlBkLHaI0rklS5ON+6TB/J2Qk5zk4LrK1TTdH77EAitjW0e+/tXa2CrsT39fDvWCQdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708958833; c=relaxed/simple;
	bh=y9/x+awjSD0YmrFVTYPRzWh3BOAgFDi7jCl/QCcT5e0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cCa0xZ85scmkNLs1YC8rUuYWjy7oOGMSUgLeDFZ+kWDfBfOUadK1tZs+ISytYyxq9i/43URIP2nkKga8F/8WCGm2l0fp43AZ11G9tNBfx84lBBgfq//YqOtqaFl2rIvYZ6ahoYeyX34Ig3XqKbFcK7u1eBo+KecjrFx7vjm7NBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPS9YQU7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85972C433C7
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708958832;
	bh=y9/x+awjSD0YmrFVTYPRzWh3BOAgFDi7jCl/QCcT5e0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mPS9YQU7/eKcvLUjrs6lvZE9Qs7Iarq+Ksxe1UW7SxaaPTwKcrb2sTKXxUnxCvYyn
	 rxM6cLu/PilJ+R88ywtYTzAfxEJmQ9GQ9fVQhXjEWd0VN0MagOWz3azTXL2MYl981/
	 D9B2a5wLGRD2NdEEiKx8neJFwLnS2/omYXU22028T6RyHFc9oJah4mM7dJtICz5edE
	 GKnBSBE/dq615PHU02PDNBBABM0etfzeHjxblocZ4scjHX3YUk2q6yCAYbUwHTK2Fg
	 WhAtieOBAG5xcvFXv0S2R5LbORWru1BaeWaC+LGcey65xkTV89r1icFWeZrUINSuGt
	 d0TdxGk9sw+YQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6F94AC53BC6; Mon, 26 Feb 2024 14:47:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218490] Linux warning `usb: port power management may be
 unreliable` on Dell PowerEdge T440
Date: Mon, 26 Feb 2024 14:47:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218490-208809-VnfCoyCn6K@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218490-208809@https.bugzilla.kernel.org/>
References: <bug-218490-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218490

--- Comment #7 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 305908
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305908&action=3Dedit
Linux 6.8-rc6+ messages with v2 patches (output of `dmesg`) with
`usbcore.dyndbg=3D+p` and with system firmware 2.12.2

Testing Linux 6.8-rc6 with the two USB patches the warning is gone.

1.=20
https://lore.kernel.org/all/20240220135946.4028553-1-mathias.nyman@linux.in=
tel.com/
2.=20
https://lore.kernel.org/all/20240220135946.4028553-2-mathias.nyman@linux.in=
tel.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

