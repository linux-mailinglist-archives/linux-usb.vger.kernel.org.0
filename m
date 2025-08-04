Return-Path: <linux-usb+bounces-26475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87EB1A8BA
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 19:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED34062087C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 17:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58E319F424;
	Mon,  4 Aug 2025 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPFk6qfL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B44A1D416E
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754329533; cv=none; b=fLycUexlqUXwdjBfqdbhZNRJb4ArHiRGXXNvc5HfrKBegfQZPqs5pLAtKqPuyHl/ocw2dvURrtJQUPSRdieybBcwtwX1TccBno4wQSCnKNnT9fAqqX0f+b1r622pdY1aVPcikNtQqRe41VYzrpjqR0e63YMHvJGJF6ULic+6gtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754329533; c=relaxed/simple;
	bh=5ibGDjfOJGK4zck6W4pAnKTjxMcbjTYWcBCs3UxjGu8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pU+HS3RaNttUVZDwcsLvhjZRNIu8LGYhPoNqAqAXBsNwzDrUqbfLf0gRekBcAmqDKavaej2TJ/LQijCGx9XENjJs5Xb1V2QrcpE3AgUvfnzm9JZCF5eEYySOwBXR1Gz9Q5lhdSK/7OiPT20xNKjq70WnzSOhsVIzSi4hQnfv8mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPFk6qfL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E183FC4CEE7
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754329532;
	bh=5ibGDjfOJGK4zck6W4pAnKTjxMcbjTYWcBCs3UxjGu8=;
	h=From:To:Subject:Date:From;
	b=fPFk6qfLExeYg9U6XjEANRxIoGi7ZtuZWTk0PpzB9OlbJ3Euby+2HJm06ogYkhnA9
	 C5DubQ5cl/KflyyKGrOna/Xisiqg8kU6eNOXlkYESfFP1hotFH3gUfLQHdIvjLRxQw
	 z3JRadTUMAfMghwe6KOpVu478WjIX8hEylCVkujz8oQo1US0+x84OB3UErpVXEZig4
	 Tb5gidnwbFBIkaKkQe/NC5u18RRNmgm2em6P39Z20J2BlQKS7qVg9hamjE1PHX6ENc
	 pUDdlt5iLgsQI76ubo6J1ngZBYY8JDq+pZT7wtdYmig6RTWlqHq4QN8a6C1X7mptxY
	 DGCDSOpmQ04/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D1F64C4160E; Mon,  4 Aug 2025 17:45:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220409] New: usbtouchscreen support still needed for Win10
 migration
Date: Mon, 04 Aug 2025 17:45:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sashedroff@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-220409-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220409

            Bug ID: 220409
           Summary: usbtouchscreen support still needed for Win10
                    migration
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.12.10-76061203-generic
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: sashedroff@gmail.com
        Regression: No

Please reinstate support for the NextWindow 1926:0bce touchscreen in
usbtouchscreen.c =E2=80=94 this was dropped in recent kernels, but is essen=
tial for
many Win10-era AIO PCs transitioning to Linux.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

