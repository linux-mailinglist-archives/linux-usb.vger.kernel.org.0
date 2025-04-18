Return-Path: <linux-usb+bounces-23236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C0A93C8B
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 20:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEFDF19E49F8
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 18:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13257221564;
	Fri, 18 Apr 2025 18:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3zjnHnn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F1433C4
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999531; cv=none; b=rX6xBTBCBlDXQg79gZup5BBUJTbhi7DPC9ehGDrNNxjiPVZeY1OSrmqEDb21GXcaRwLCDYGmkLAKoq2twE4rB2idMaCLxvmGbkyS6xyS/y1c84PRr7zNggLRUZ+X7QA/Oog61dzWvEZDb++C5eZsh9GMQ2LwZu1olbd+hE0i3lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999531; c=relaxed/simple;
	bh=Pf4Ms1lcgKkedJBoglGl+YCRbnD6RuFB1bZiwf18CnU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZY2R/kctmJ60cxaMap7FzkaDPFgpsFi1lvX0fHWmea8jAWjJOMdu3snHfbfoHe8mzQdlYpr39SaikTFh1YJuJqZilghgbd2yUT/e86EHEUfgBk5VgAqm+d7VKZc52P0PsdMWfpyeXmtnxetFmhcTQKwWkhlBxo8fsOJwe4tQpc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3zjnHnn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E6F5C4CEED
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744999531;
	bh=Pf4Ms1lcgKkedJBoglGl+YCRbnD6RuFB1bZiwf18CnU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r3zjnHnnOTaYC6pLUGM88hXOWGh30DBfvvKPe0D4jcYfBhrCEWZ0sFIP8cEVNDUcj
	 WGKnWtnw+5AHrNCiItb32pWLw+i17fc5DIRenyoYvFqglWAZWUKIg/Un4YsuXSappZ
	 3EqIZ9L+H2mfVFwvJCqghqaQwWP4z7N4UgvihHjXIF3vxqSio0YPJZxApFZTkAAA4m
	 n3hRMrQQfRwtxq4nYsS5a0y+UTK0icsmoKbAbwVVE01aIDymgqBz/dGHI8cdChC1nk
	 3+7QcjwK14jIT0/saPOhuossSU/cBTr1nn61fSky3C8y5MPZZ3V0CVcuPuZXuGxBh7
	 h5tK0KpSjvoxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00BD0C41612; Fri, 18 Apr 2025 18:05:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 18:05:30 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-220016-208809-8ZoE13EDCe@https.bugzilla.kernel.org/>
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

Steven A. Falco (stevenfalco@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #307986|0                           |1
        is obsolete|                            |
 Attachment #307987|0                           |1
        is obsolete|                            |
 Attachment #307988|0                           |1
        is obsolete|                            |
 Attachment #307989|0                           |1
        is obsolete|                            |

--- Comment #18 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307990
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307990&action=3Dedit
6.13.10 with realloc=3Don, no keyboard

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

