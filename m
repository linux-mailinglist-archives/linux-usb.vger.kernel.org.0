Return-Path: <linux-usb+bounces-887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9697B4808
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 16:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id CAA70281988
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 14:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F844179BA;
	Sun,  1 Oct 2023 14:25:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66699CA61
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 14:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 622FAC433C7
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696170342;
	bh=/UEVW6thJbjBjjT5PwEHLFCsgBYauT5cuOP/Lnfkukg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XA2cIB1oLCeRjkKTXhaD/Iqt4Y9eEuV3nV5AosVyCBwnsbqgHPT7rvC4ALpk/RUSf
	 y3/6dpj83CXnu9u05CzvpsypBLLfv6O7MY1zAY7NcH3bhHtZEe1NPElhZsWHq+9p+0
	 V8zktVlJS5dYxi1ZxQ8RAtnIH6jiDfmcK7TEOoacfTgTOccT1Iqh1xFrKgdqPjqWo8
	 C4DiuMfQURefM5JUivpXFdytwVRX8KQAa0e/5CYt24szziiooUgkVlgZ4AwJKKNDSv
	 k22fYFuK3SQP4xNwgNCUt0lgm6f/OCU3OD5W1mbc6JzZTJh+cHy1x7X0qGGE0KG3dV
	 5UrbZeo7KtV5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 36500C4332E; Sun,  1 Oct 2023 14:25:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217960] Linux 6.5.5 - kernel BUG with ucsi_acpi
Date: Sun, 01 Oct 2023 14:25:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alxchk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217960-208809-lL8NrSgtQ8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217960-208809@https.bugzilla.kernel.org/>
References: <bug-217960-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217960

--- Comment #5 from Oleksii Shevchuk (alxchk@gmail.com) ---
Created attachment 305172
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305172&action=3Dedit
dmesg 6.4.3

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

