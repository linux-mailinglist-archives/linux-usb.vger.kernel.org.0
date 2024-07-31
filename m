Return-Path: <linux-usb+bounces-12732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157A9431D2
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 16:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFB34B25421
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 14:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D391A7F73;
	Wed, 31 Jul 2024 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SycwhddZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD89442C
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435344; cv=none; b=SCf0P9BStbvg3JOe8dA7TZUhrcVDZy3nmJeodq2NNiaUHVix7vsZ1oKCsJSGHcCsg8AydMPDBtcsPKNnrwIo2FOIgSMPMMR+H2hls6dFCRkCwH9jw4yy8SInVhBocHZbleM6wtTjYuofTNEyQ+7tVDF2SjsO25+LiDbwshUTtWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435344; c=relaxed/simple;
	bh=VyhFShjpUdTEK5oLyQ5Y3Os6yhfV4ChKWOhna7lef0I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ok2lNxOGz9tT64Mmodw7NyU8IovKQFvX98FMrD+feqXnUO1e0m6JNzAnWepIo20r2/dpw2upmfhxpx7rRavSQZoOScv397OtwddRp/CGVSrDCQVxTgPxusEdI9Ymy2+9wOWW9fnFvr4O5TKSxHgAVVhf893RUJv26JHrRp737kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SycwhddZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A689AC32786
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722435343;
	bh=VyhFShjpUdTEK5oLyQ5Y3Os6yhfV4ChKWOhna7lef0I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SycwhddZ8eht4cuHfvQsUtm8Cvsy4Ruz3tmd+Y1KgVir6ebUnjb6gVjFNneSSGngj
	 Jn36WMsC+zetQHbDXl9JEitt25hFj+MtKNe0PVHC0kk2KrQjUV1AZ6pWIch4UZFdj+
	 eDrM7/8eDnzrfIPb8BJYdio6huz4YGU9j6XyDm0cFGC12/1adj+2Sp3j1tcqCx20j8
	 sls5sxNmCOFN7EPBGSSkxOSbHkW3gCwEzwUjSyshrz0bDkiKv8ckJaTIASz5fqwwoE
	 KguLRj+MNhHLh5nwVnYQ7bHYJue99qyrnzazUYHDj69++Z9tIsyxV8El+de+3U8rzr
	 I2HqfPwCZaq/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F35AC53B50; Wed, 31 Jul 2024 14:15:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219113] I/O-errors freezing the system [sd 0:0:0:0: [sda]
 tag#11 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD OUT]
Date: Wed, 31 Jul 2024 14:15:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219113-208809-703JbbPAgC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219113-208809@https.bugzilla.kernel.org/>
References: <bug-219113-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219113

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Please check whether the following helps:

1. Upgrading BIOS to the latest version
2. Using a [different] power adapter
3. Some hints from here: https://github.com/openzfs/zfs/discussions/11741

Add to kernel boot arguments: iommu=3Dpt amd_iommu=3Don

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

