Return-Path: <linux-usb+bounces-7426-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4375486F0DF
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 16:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6249B21A90
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 15:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DD318627;
	Sat,  2 Mar 2024 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDM744BD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99A182AF
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 15:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709393683; cv=none; b=aAqNENfalXXiYMqDAzy1aSZifxr/4wd9wPkkygXtlbafEiUZ496gz9FhMiyFpS9Bg8IX5PjEQ/TuBTAPqdg6Mx8L3gnLGMJ5GhN7M1VCsfEDs7Y35Fh+emKBZz87QGrqLeRV5QFxfWvE66/5G60JAvI5i2XCLyKUJn2FdL5UczA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709393683; c=relaxed/simple;
	bh=KXO04N4E+YC4JCVuVdYNgMHZryPiRkl0JeUCry91D9s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LTKcCY1/u1tvn0gs/OD5GVEBLBJX5CWNA3sVj4BmWeq82VAbnGVt481Rb9KIV8H8M20IYdcw1ABKcAyQIwNffGQVzAjOe7PmxuBO/nsiJs9RgeUnxQhEkR37N+JVKnQkUvbiqmPKC7oOlRajNvS04G/kPwPTGV6gyBGIVtE+HLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDM744BD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D156BC43390
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709393682;
	bh=KXO04N4E+YC4JCVuVdYNgMHZryPiRkl0JeUCry91D9s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nDM744BDAfOXfGLjOMIrcIMplkgofNKiXLHcPQhTah1710JrqdnUnG/Sl1YktFhmQ
	 7gvZ4lAOiWxL4/WtXijFwd2YG0aO76MH7QwRJhxDmZgVyEV4LCuLarxYOkB8po7TMJ
	 9GU95xyDvdmyfTYH8DRVyVyz5PPqBgh0WdL8cwohFQtcp07cYb6ksEwvvORWfbZ7bR
	 ehe3uPe88K3dimfhq3gMDrYRWBD9tfXuLIir1WBjDTK09Ap9how5NaXfFtNrcZpd7c
	 hmSukKONmZT4wCvvBVhvrmm0tgZy2JfOXYyvYmbJ/fjzcM3WXuLPx6KtK9YSxmyDgY
	 XvpfUMGTX5nvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF181C53BD0; Sat,  2 Mar 2024 15:34:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Sat, 02 Mar 2024 15:34:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218544-208809-1IWX83HpkR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

--- Comment #9 from Alan Stern (stern@rowland.harvard.edu) ---
xiphmont's web page was written 17 years ago, so it is incredibly out of da=
te.=20
However, if you want to use it as a base for improving the current driver, =
I'll
be happy to review your code.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

