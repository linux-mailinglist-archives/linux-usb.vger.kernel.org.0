Return-Path: <linux-usb+bounces-15873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75E995428
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 18:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D26287C2C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 16:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEE61DF73A;
	Tue,  8 Oct 2024 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oouJLHXZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D817578
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404025; cv=none; b=Rz8HFdUvM8i+8WPUa9wFGIxRXoqnXPyFmkq87JEPYfHkFGSbh2/qzQR/JkYfb+pN3fmnCN3zfej/YLCaAOUs1o0xDTlr2R7BPn/5jRv6kIGDBhWRwR1ifkp/uaIYbEjFObcCapcI4K1hABhS95dsAlKy0onMAA2jxbRPHzcNkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404025; c=relaxed/simple;
	bh=7Qjr7MNe/kWCUov6eBJUC5RRvQmjaXLL1O7Lpv39DVA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kFSgWM+vtCWwv3SoSDUBqAXzbduDbnLaQBMyliF7cwMZ28cxlSgSQ1WffMu9hJ5qMu7GeWJOaEdIslCMkQ+xxcOZdYUmX3mWO12m8MMq+Fpcx/8rfdiYMUGDAgYXLW+SEdt/RrcokXblWk+5BnS6gRiDgO9nMxCBr0x3kyC4s38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oouJLHXZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2B71C4CEC7
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728404023;
	bh=7Qjr7MNe/kWCUov6eBJUC5RRvQmjaXLL1O7Lpv39DVA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oouJLHXZq+VJapn/e6ZszPHTSZICAQD5vUZ7Xqd84NVbPUOHW8ndOIkMG/8Kz23UV
	 cJv5BscbmGgNnJnRISXnz/FxgV1WUwxgE6PleR52fEK+B/Kc4hj2RorHFsK3K9FX+s
	 D8B5YyB26DslG+fD2biRtHx153IS5JKHtLv3M3962sp7zl1GJyJhFAvDCEKnCAGeqy
	 tzZVtV9AuqDZO2tjjYbfAv8AcG4VtGo287U3iJ7ylkrm6Pmp8pToCYvRc4MOlbTEyD
	 fSHD8FqYFodJ8VQpcmx9Im1kGNzVW15aSaNn6pnOc33cOKJNjjTMIoR2XSvLfQ6UFH
	 G11rX/c4kk9+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B33BC53BC1; Tue,  8 Oct 2024 16:13:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 16:13:43 +0000
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
Message-ID: <bug-219362-208809-w0KNubZdAQ@https.bugzilla.kernel.org/>
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

--- Comment #9 from Alan Stern (stern@rowland.harvard.edu) ---
The sysrq commands were originally implemented before drive controllers for=
 PCs
contained any significant state.  Maybe they need some updating.

More generally, these questions should be posed to the SCSI maintainers,
because it is the SCSI subsystem which is responsible for sending the comma=
nds
you're talking about.  The USB driver does nothing more than relay the comm=
ands
and their results between the SCSI subsystem and the storage device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

