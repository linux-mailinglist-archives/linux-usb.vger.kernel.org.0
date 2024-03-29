Return-Path: <linux-usb+bounces-8631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7589104C
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 02:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62CB71F2248F
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 01:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872AA14A8F;
	Fri, 29 Mar 2024 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lu+K1m9e"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1187011CA0
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 01:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711675204; cv=none; b=eRWfpLul0cqZSMyW6aGNZ4KTE6h0kbary4qQctqndWUpc7NRQHFumPrX9KH2ZKojwuunu5+qf58HJ4kYypSijcVDx5od0sZyFYG8fiTGV3nPg66FkjFc9feXbc9q9XUGXIQTjn9jAAAmLvAJ7rbf8uIaZPrM2pcA77WmLMltOT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711675204; c=relaxed/simple;
	bh=nTJ8Led2SsR6YSYbwV9luma4EQ9r/p4do2PKDZ6yXjA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=K3GWI/L8gGR67ex1PypIFxnYbV3Jj/S+slphYLoNIApwtEWs+16dA5AjRxrXh/wA/p/we5IdjG3FSSWQK1MaD69NHg2bRzLpjDW1x4GJz2DopiV61y3FwXgVX0YeHoWcldLk+F+3WGFYCGY2qn/+1Lzgw7LHmYkxTZSqGUdLe14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lu+K1m9e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82973C433C7
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 01:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711675203;
	bh=nTJ8Led2SsR6YSYbwV9luma4EQ9r/p4do2PKDZ6yXjA=;
	h=From:To:Subject:Date:From;
	b=lu+K1m9evGcCBFUHLEYwpFhZw99DTsYscFI+r+At9gA2XRNoa9zG6L3jAdxeXJrTW
	 C+HD7fGqMsDEyY/PSOWRsTe9cSMRKkBa7yCwhY8TO1ES9i4bPUlLPMPLoMLWHzuI//
	 jCskL4BGmECbkZ4MPi5LYWIpAYQMJ/9J7ELmLIsNH5gzt0wTmkFeVT9NkQDMIugVsq
	 Ir4Fe98pHJADkHS+QKF/rOx6OxflZJzQaCjpWWYnGvOs54Stg1XWMvDxOpv0MXMKtP
	 PfkkvzHmHkdfr6gwbZ3pbBt57OvT0QbhNDlrWh2HfgA1SuFMIrFkMRzKbnGx7dy4v+
	 EWkylzy/TRSPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 65941C4332E; Fri, 29 Mar 2024 01:20:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218656] New: Regression: Update from 6.8.1 to 6.8.2 breaks E50
 DAC
Date: Fri, 29 Mar 2024 01:20:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vaxerskiofficial@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218656-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218656

            Bug ID: 218656
           Summary: Regression: Update from 6.8.1 to 6.8.2 breaks E50 DAC
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: vaxerskiofficial@gmail.com
        Regression: No

Created attachment 306056
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306056&action=3Dedit
sudo journalctl -b -1 | grep E50 -A 10 -B 50

Hello,

after upgrading to 6.8.2, my DAC no longer receives any signal, thus audio
can't work.

I have ran `sudo journalctl -b -1 | grep E50 -A 10 -B 50` and it seems pw/a=
lsa
is having a hard time communicating. Logs attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

