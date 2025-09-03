Return-Path: <linux-usb+bounces-27513-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 878FFB42B96
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 23:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F49D1BC6988
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 21:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711952EAD0B;
	Wed,  3 Sep 2025 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSB84Pp9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7102C235A
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 21:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756933997; cv=none; b=e7ZbB5TG7XV3tufRkrCmm+z8cMbzdz0wuoTrynU5yIHptJFbDoXrRi39cRODM+HdXFAvY3FkDMMqr/CSvQx7feyVcQZa9ZQY67sXKFI/BGRlmZrjZjTBVZAycwigF+6C2FtKHulTxwNSMQ8ykw2EQJhhAUXHV7+9u/qbXGaza9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756933997; c=relaxed/simple;
	bh=uJZaBQz9xELvoH9hbGZnge05Xq/MCcY/URbrXXIxGF8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c0+epg1qF4WZWhISAzOyTsGCJKSKh/6wpfHR29V7LZQQV4GQxT/QlIZuKEQf6jT1YyNMrLSVn5O6GMRXHCuqlKWryKr0Dh04a6n5uWg/6Wpebwd1ni6bH/eFpPwfxEIdoihlz0GiPUlN/ttFyijLFwRMd/hMxVt425Jz/6K7rEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSB84Pp9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF9A5C4CEF5
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 21:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756933996;
	bh=uJZaBQz9xELvoH9hbGZnge05Xq/MCcY/URbrXXIxGF8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qSB84Pp9FY2EKgLtbxs+62umHdbJOHD7mDENyD812mEeieiXzCfZLKy2XbiucqK5v
	 tM2t+/T3E70IxDGCsJQy1rnf2GFyYvNSP6RnCzPNxvyainy+7Ng/q4TC7OLVxSMJyn
	 ONTKz2uni99m2m9NC+msBhVcQSC2t7gZjDa2mIiyfz52FynqKHgBaQxNkAr05Ee6aP
	 wsNTDK3va+DxDxoQO6lD40X3bN5hU4r3/ZqPAI5DXBY5uABIzu/1MVmC6m80fFeDwd
	 gsA/6O54ILdo8nOwcb6rVLXGMQvBardRviCThJ8Eourc0OBQGXF6qXiOhsxg2tjRY9
	 vPWHdtMDbmGMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B0F78C433E1; Wed,  3 Sep 2025 21:13:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 21:13:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-t12UhO5L0Y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #32 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
I thought it might be useful to gather data on what an actual physical
disconnect looks like during suspend/resume. I've run a test where I physic=
ally
remove the USB storage device while the machine is suspended and then trigg=
er
resume. The trace data looks somewhat similar to the software simulated
disconnect but without any device communication attempts and without any
subsequent reconnect. The attached test data relates to the emb-qm77 MB.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

