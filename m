Return-Path: <linux-usb+bounces-3044-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47477F1D78
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 20:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21E2A1C20EC7
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 19:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33A736AF7;
	Mon, 20 Nov 2023 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQ7pH6Ys"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2603F2032E
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 19:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D002C433CD
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 19:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700509418;
	bh=mwzHjcp+QW/5Ohfn1CSlkrNWLnh7hAP6MpS7Vn288HQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sQ7pH6Ys3kNqW6DpqZYN2itk3JxmBmvLzuAh/VVkJdFbBhq1Ny0T/CGqq+YM6SuYm
	 q6G8GNwJkNzhz5JkGLO498k3Q59ZXEE0ApGBWOoN7aw1QwvMqqDiY2o/47i4/LVQWh
	 OTSUio4Ly4XlDcR+F3zC0DFfSlcslCEa7IDHCG3fyYD1gyf1N0DeUmXehcNUTYW9w1
	 pcKw/DIi4lNaQqjPlT32qiSYIVuFgXjc12u6Ne4BRRjez8kkwwfRrCEz7tFo/priJm
	 jHTIy+oh2p2vGUF3ZVkRNOH5VcKfarY/vNqrJDz1e9O8XgZ7ipCTzBol/CG5jVbXMR
	 HpGi8EqNwRbmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 749F5C4332E; Mon, 20 Nov 2023 19:43:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Mon, 20 Nov 2023 19:43:37 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-215740-208809-s8V03UzTKb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #305425|0                           |1
        is obsolete|                            |

--- Comment #17 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 305444
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305444&action=3Dedit
Revised diagnostics

The ftrace doesn't help.  You can't tell where the error occurs or which hub
the function calls are for.

The patch wasn't quite right, so here is an updated version.  Be sure to
include the "cacheline tracking EEXIST, overlapping mappings aren't support=
ed"
line when you post the dmesg output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

