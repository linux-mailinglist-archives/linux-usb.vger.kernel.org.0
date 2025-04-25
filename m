Return-Path: <linux-usb+bounces-23472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F31A9D1D9
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 21:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13014A0150D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 19:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAA121D58E;
	Fri, 25 Apr 2025 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epTVFfI4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C60D78F2D
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609683; cv=none; b=ZEs8fGn3JuzxvGA1aKXc+SlA2Hh5LF++RN1gaK3Fu/SQSXmz3hWbPu84F0nY2LLg+wTH1TMC88cB7BptSd1hzDBTL/2rXE8IXPjs8rhzGTn5FeN7/elxx3e2CpQmbe9ytmN6j5tTY0B3P1mYAhZ31tkqhPO38ZpDvOUsocIM+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609683; c=relaxed/simple;
	bh=ER2/thHKxlLYYq2dYdT34U+pAg2+Lw4W4ZOs6LPVa24=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C1yzDWQ8fmnoc3Yk1lWCXDL4WqiEVXbwPZFTD/kD4QjAGwHGICBDTBmcBzlysFbY1I6IqU1IVvWhTdKAhK5eyX2iUPMpQpNOCUMozApw1Dd694foWrQZ2vQ/i+S+UhewRkxQ5D5/No0uKaDRyM8g2Apw+DyPpAJpFDoMcFdxutA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epTVFfI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E288C4CEEB
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745609682;
	bh=ER2/thHKxlLYYq2dYdT34U+pAg2+Lw4W4ZOs6LPVa24=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=epTVFfI43+DqMsfnMNnFVJkRR72sO3iOqxTBKM6X4DZNw9KWGsoI67o/s6i+dlJY6
	 iKPMmU9sMOgsM92RiINvM5ksAnS4UjhADDfnNSFtCMaBx45ltZwlpLO4jXYs2njHXH
	 Mm2C9PKZhGrjmh/+QmRh2jdmQsuUWMDb2F4QuVthKXElnxWKEFvU140jxYFRbnqlOc
	 lhVnSL7A4qmNJ6B99YzAjQAyGDjmLLVnXCZGPDYvkUsHkk5Dwo9GSmgcU7+/IDulRB
	 4XJxpkFRGt6A+4T5SHC8jFj40w4/WUkJPp9+KNpkEgDhpuBUOA1YbcEYpU3RjNRHsi
	 nmtJvMrZHHI3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 926E2C41613; Fri, 25 Apr 2025 19:34:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 25 Apr 2025 19:34:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-xVnV0XCk4h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #25 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 308021
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308021&action=3Dedit
Test with min_bridge_window patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

