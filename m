Return-Path: <linux-usb+bounces-10204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB14C8C26D5
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 16:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D39FB23E04
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 14:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA3F171085;
	Fri, 10 May 2024 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8SzGGob"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57D51708B1
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 14:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715351288; cv=none; b=hjPNA95VBI/7lfx1ZcEQ1D6aWdr3Aa61JLFkCN7DVnETSW4j54CuVwgUli8hjjwbU+YlTCABus4aTqsTA2/JOY/YmuPsSsUzb5SEeWCqsP+ImX0KHF5VgczVH50NDUzjY9A2OPV6BJPVZ+Dfjn+wFedwo4UZZKF/oFJwTg5gcBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715351288; c=relaxed/simple;
	bh=2MokkFA96prQk13OiPxCePxLqofjkYFLWzRajNJGJx0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pd1Bdl/eacSraxGmoJCh9KVXIISXl7KG6Lenc4BVKgnGWbYIt/wWVhlDoDsAnBll76zB5cY1nufQOFFGMrlohkUASriCTN2akfR89dIP99YFJkhzDinn3CcO82ZlUGjD6ipk0vC8S2DFJCiNT3ymv+LVY/zGKV6j7YWSoXkwF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8SzGGob; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4564BC4AF12
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715351288;
	bh=2MokkFA96prQk13OiPxCePxLqofjkYFLWzRajNJGJx0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F8SzGGob0C/sdHnekrCOarrYdU/cP/rKfdF1FXd8y8IOL8CWa6XXAvq16isvJ3VkS
	 PGEpSqYaeFePB56esPGpO92uPKimNNDwJ60wL+Dap14GsKzTPpVmfIAqbKXe4PKvyM
	 5n40OAm2tD3zp/e43tZxSXj6b59wr0bv+w3HkpNgxENyQUU11QqbRYRI7uI23ZJAYT
	 j8fxXr5YGuY+Nthm987s8PP8tVLkhSQ3hBkOvpiJHK7jsBl25BAi3KfVsRUYW2ec+0
	 f1ji4xkBLdo50lfWzWHFnlx8FTJ0fkqLc1MiXlZyrVxjGr62B0s9jIlbMdlIIodCWb
	 YIHkAXGM8JmIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3973EC53B6F; Fri, 10 May 2024 14:28:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Fri, 10 May 2024 14:28:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rjw@rjwysocki.net
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-218789-208809-utMxCvrDmB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

Rafael J. Wysocki (rjw@rjwysocki.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |rjw@rjwysocki.net

--- Comment #9 from Rafael J. Wysocki (rjw@rjwysocki.net) ---
Patch has been posted:

https://lore.kernel.org/linux-acpi/4926735.31r3eYUQgx@kreacher/

Any chance to try it and see if it helps?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

