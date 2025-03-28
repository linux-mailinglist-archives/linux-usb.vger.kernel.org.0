Return-Path: <linux-usb+bounces-22290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 620DEA74911
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 12:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 210CE17E739
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 11:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BFA218AA5;
	Fri, 28 Mar 2025 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4wshhNp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF7B4C6E
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160523; cv=none; b=rvF5QFFxAjFkEeHxJTY0TEFhBHegG4cPlxyGvGlLpzpUXLjts3Dof56iKceGmCdDXw4PYVtO/p5e7Em6nLM62ZrLtYfA10kn4HasqPDFL9+JAvc0Snlkymle+Vt7qNsIij9l1evXWqhQ4cpXtpplssDY4FVz4QZxh450X0aj8Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160523; c=relaxed/simple;
	bh=RLSZEYpt43AZB2Xuu8p5//XoGLJY+KtCzXx+A9nN8o8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P5FpXw+hc8TNU17NwAC9V5N0fgx+oFjZQ34UI0O3AIDzMwvI4I6ReMw5zWuaV4zzzolq+7CzLJ8fvQnlMSDVa0n6zftFwLIWLpDOcZ08a9aFXrKV+6SXt5FVPlZiUTTvOrQb/w/O27+hB86cLDmLuJtkbwCXEYDSvwNhLj28Q9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4wshhNp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED0EDC4CEE4
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743160523;
	bh=RLSZEYpt43AZB2Xuu8p5//XoGLJY+KtCzXx+A9nN8o8=;
	h=From:To:Subject:Date:From;
	b=Z4wshhNpgiZG+OuiZE3QvHw7iJWWO9B8jW6OZOVa7v3LnJCIh4HrfWZHVAsXNBq7I
	 N3lLi2fayIEAOOOUyAp3IybEibpV2sRBnGXdBf60Vu6XWBf7wwddJNZ5Ac2PX8IJvC
	 4Ju4FZPIS8MzR4EHCM5DXJF6vwUunYqQYPxjw+CMJubIV6uvjb3dOfn7MdxAxFms4a
	 1Sfy1l/5TVuXj3XFqHFDC6t8kr4pfJyA25mXsXmIX0D1VWeEqriZ83UqhZpoCAOTMg
	 1mqt7lKUfysNeJS1w0O+cS3hqN8pJx8rlPVWUUk0o2EDPWaEAa4Qgak9gm3abBOdH1
	 Q6kfeilsCp4zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D9324C3279F; Fri, 28 Mar 2025 11:15:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219951] New: Missing null check in ast_vhub_init_dev
Date: Fri, 28 Mar 2025 11:15:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bsdhenrymartin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219951-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219951

            Bug ID: 219951
           Summary: Missing null check in ast_vhub_init_dev
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bsdhenrymartin@gmail.com
        Regression: No

usb: gadget: udc: aspeed-vhub: dev.c
Add NULL check in the ast_vhub_init_dev

When devm_kasprintf() fails, it returns a NULL pointer. However, this return
value is not properly checked in the function ast_vhub_init_dev.=20

A NULL check should be added after the devm_kasprintf call to prevent poten=
tial
NULL pointer dereference error.

CODE:
        struct ast_vhub_dev *d =3D &vhub->ports[idx].dev;
        struct device *parent =3D &vhub->pdev->dev;
        int rc;

        d->vhub =3D vhub;
        d->index =3D idx;
        d->name =3D devm_kasprintf(parent, GFP_KERNEL, "port%d", idx+1);
        d->regs =3D vhub->regs + 0x100 + 0x10 * idx;

        ast_vhub_init_ep0(vhub, &d->ep0, d);

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

