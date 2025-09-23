Return-Path: <linux-usb+bounces-28522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A7FB95113
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 10:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FA67444D41
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 08:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F17631D723;
	Tue, 23 Sep 2025 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsH+Giob"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033D7313536
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617379; cv=none; b=utkVZMlGiSvh/NlmgRqoQ0s/DlR+iHvf9F0WEGOz31nXISel40L5lfnpqUr9Q51TMiW8+rBPmdrrZmzz3NS6lLB0lPfwR0n/lUmtCVUUbDccuHgP37Y5UsrQzgCNUDasCpEc7DI/OOFZgQ5deJ+J+Tv6Mtzafybl1SE7VuBwtfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617379; c=relaxed/simple;
	bh=QixsnwwEtCcqCzC0VNKk+8UudvkYeY0YXiXpzCLGjM0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qw7oKQsnxlaQMvgAWPCYYJjpO1YHgRq3Z1sMsM0wsXdlkFi+etnogMqlsKyoGj43e+jK8whB/PPQ5W1PEeuIi+oOstGzZLgxou2UPt0L6dJgKnVS2BJeeM7XS1DuAJI62Ja728R8odW9TSzlWIlnzxVh+dUiySlmWwVivdq3hw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsH+Giob; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 734D3C4CEF5
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758617378;
	bh=QixsnwwEtCcqCzC0VNKk+8UudvkYeY0YXiXpzCLGjM0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PsH+GiobKiYArJRmIKuJSP2AlBga/HI4F7YvkqBZmX3S4ap1kei85sVO07fzWkrmW
	 exjomhk3zhGBfn5fvV79GtOCOtILfN72yydbk4ipGhfIy24fU8VcR43YH/KJ0Vmj56
	 JNuF7GpTZPv9FZd7ir0MfUAhW4Yow1w3qkkcS7LLL7kOdxm2vDwNDUCJeDxacyvJ02
	 P+fwDkDbVmPPLUAM+iMERP0mQ4BRT8stPxSNB5rl+zT+6R+/p6SH74vON1otY6uhJv
	 0BjZqJDK22hLSbPg6BzWHVX6RHDM+uxiyLtLV48iXwVJnkEmLvGscSZteIevTbOmFR
	 5jx3bTjQCXQww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67BC7C41613; Tue, 23 Sep 2025 08:49:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 23 Sep 2025 08:49:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-50gAwQrrYS@https.bugzilla.kernel.org/>
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

--- Comment #55 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Paul: Not sure if you still have time or interest in this, but I'm wonderin=
g if
my two patches, attachment 308620 and attachment 308630 did improve your ca=
se
at all?

I think any improvement or partial fixes would be welcome upstream.

If you have time and could compare something like 50 suspend/resume cycles,
with and without the patches and see if there are fewer disconnects, less
severe errors, or even faster recovery, then I think those patches are worth
upstreaming.

Grateful for any testing you can do
Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

