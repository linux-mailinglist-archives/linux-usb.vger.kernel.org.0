Return-Path: <linux-usb+bounces-15919-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDBA996787
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 12:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 973FCB23EFD
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 10:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56F718FDC8;
	Wed,  9 Oct 2024 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVBB5EZ6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6C618E36E
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728470696; cv=none; b=HYk6Ql7LDV7fc0Ui9dmuljW5iRA5m4vsqk+qU/ONzWUQsxTLjOJ3FvHhyNxpaIKJRCYuRhALUrut+bselN1BuFKrIKBNCCG8u+UWzpVFeE7CDDjOUIGKMPILvpUNFR2spzGd4yN4GRyyNxItVQpaSGfAv4V4/C3ckAo+jh/Vals=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728470696; c=relaxed/simple;
	bh=8cvwqAM5MjAISrIhCzc6aoouQAdkums74ENAefY7US4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GTvq+txG6rnl9xrUjSrUgnjKGUst6CTnwObPnDhRm/v+cehe4KTjmqKwlL87cPiC6B3H2MOk5HEHs4dd6gC8yUR5UKFhP/vTu204Kb2dUDH4q+wF66hrOSKzfiRzFCQoUqAR+X7xMfMHMEcEvrcWUATxPxYGlcuzaPNDYEcWDK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVBB5EZ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F59BC4CEC5
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728470696;
	bh=8cvwqAM5MjAISrIhCzc6aoouQAdkums74ENAefY7US4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TVBB5EZ65NfrQFi7gcpI/kYJCdua9pn6r2tcEDL2oVheA0L0ZU+GjD7leHhfl9m1B
	 /DuK6QYUplhEtiYJZU7SywxgCln8T3Fh8kNDahnvDwT5vAN1saXU7Qs8O4KPlhBTbh
	 VUYVY3y7ykMT6/XibKXtNO1JdU1+6rOXLnzPF5Efm9/DWrx4HXUVkhzLlbPK/Eziyg
	 CkeVmBSi88vkZvK7HigbYpJ5SVkN77eFMrCx4GgVmsl0yWSeHSJO6f41PTIz72eWNR
	 U0VTkKPQ0/SB71IEXEsQiH8eE47dnQvaq8Tqxi2vUa2zP6HuLI+zh8L5iZImBTjNqu
	 LKGNX7goTfogw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 06950C53BC1; Wed,  9 Oct 2024 10:44:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Wed, 09 Oct 2024 10:44:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-AZrRBqL7Kg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #13 from Tomas Mudrunka (harviecz@gmail.com) ---
For example manapage for "poweroff -f" says following:

       -f, --force
           Force immediate power-off, halt, or reboot. If specified, the
command does not contact the init system. In most cases, filesystems are not
properly unmounted before shutdown. For example, the command
           reboot -f is mostly equivalent to systemctl reboot -ff, instead =
of
systemctl reboot -f.



when compared to sysrq... sysrq can at least unmount the filesystems...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

