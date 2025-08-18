Return-Path: <linux-usb+bounces-26966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F1B29C28
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 10:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F341890294
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 08:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2E13002CB;
	Mon, 18 Aug 2025 08:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9K45Mrr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E422F01
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505599; cv=none; b=aTzxQXTrsOM1IeaGfkwHYw9gWGFN1mpxarx1xL3eCd4Eyim/Ipmk3CKE9r3dz7Kpm5iiE0z4RZjuXiT2RzOShEB9zaFb5x/nn31RRcNF7ty6do4jKZMysc9q4URXcGmgsn4M/b1e+4d9EQ2sKkiLmYwL9Iakr4hCrUfpg8H+sEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505599; c=relaxed/simple;
	bh=m5wkKNb8rjVgeGCJH65Y6JSowAxzKYXbGTTGB4ajJL0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TdNipK0ck9oeYczfRnf0fhWo5TBD0FzLFMfPfqGzvpqSeJN1KxX2coZADTAVJKEYHbQ5/0SvU1o0lRykuQPKkcDRRHf/QaeHl5gFryrihAMFcGG7aPz79qpxZOPKZCJo6xzOa0Wx/b2Oz/ktLPEls8r23e14xe8kTr8rS+pTTp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9K45Mrr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37558C4CEEB
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 08:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755505595;
	bh=m5wkKNb8rjVgeGCJH65Y6JSowAxzKYXbGTTGB4ajJL0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i9K45MrrdEqpMcUWtk6IPXCMETV2XEmnLMajQISzt2MxwzcnScH5tA58xq4uZXaYr
	 8dJkM1b1WXmQFQrE5Wl26WqJJMPQ9XL9rtlYv3KmgkkeRSgpSdpBgjCBLrNXhgqBDH
	 CvJysonJmhIn2iptWJbFIMtrEyoF6fJYzR4MidLH4gvemPTq0GFqUfVPlaVMqZ/U5B
	 w9myzuxmcDKfAi02VmOEG4fGUR9hHUXd7Y+IsFQ5lBdOIRBd23a4FI9E1QiUEFJsmu
	 j1BqhX6YY0WDLTQX/2dzt70hLGFgzpxNeu1pv4VPjP4rQm744qZT7dnCaXGCib7vnW
	 eNU07sNI1oBJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2A61FC4160E; Mon, 18 Aug 2025 08:26:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Mon, 18 Aug 2025 08:26:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-220460-208809-UykdChiszw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #308513|0                           |1
        is obsolete|                            |

--- Comment #4 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 308514
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308514&action=3Dedit
Content of `/sys/kernel/debug/tracing/trace`

Looks like the file wasn=E2=80=99t fully downloaded to my system. Try again=
, and
obsolete the other file.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

