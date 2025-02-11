Return-Path: <linux-usb+bounces-20507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2069AA31845
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2025 22:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5965166706
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2025 21:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3172676D0;
	Tue, 11 Feb 2025 21:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrtsaAbB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915EF267B08
	for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2025 21:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739310660; cv=none; b=cR8oJ6nR4PP74UZc1GgG5z3/OJUJ5fxhuCrirt7g9Jd07u1zG8B2YCd8P7Whi6N/lAqN05CLEGn+B2qQqHZFmQP3Td666sfaZzURv5cHrVWDLfm2QWWeVfOuT/XECiufwd6qCGYa2R0ZSxwt7z7WgyIjm9TV46ivCsIUSu362RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739310660; c=relaxed/simple;
	bh=92vOCtS1AyZLZcIZHcP0No7dAGMjE2LDMaFLO9UamQA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ITtCdk4kXZ1dVCAwyACk9h9YzdBP6uOEuwJfZ6H8FRUgz+scDgu+8txjsLxnDLgIWOFuu607xKy2oaqeZRC7MU2bC+Xk3CpkrVhPwh2V6Y40M2O+x1X1NplhYH428vCrGQHGE+28ocKZ+VGa4kGhjLtARkn61HVT3ndWRici1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrtsaAbB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 656D8C4CEDD
	for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2025 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739310660;
	bh=92vOCtS1AyZLZcIZHcP0No7dAGMjE2LDMaFLO9UamQA=;
	h=From:To:Subject:Date:From;
	b=GrtsaAbB66psVM4oz4kO+dStAKZCZ2uMWD4Nfub38KTkPduWZEUVzazeBoJeOXfmZ
	 iswiaHimxtg0DDbCL2cSPjZ2NtbTbpJawNtLs7M6SUv2pD23w3kSJecvLbP3nfU7X6
	 4LOGEYAZkPuS6HiDrAzlwdelFTVF6PGK8qnX1EI/G7miOPwBoJkVGg8TacXsuk3m+r
	 U+8iDO22+XpjT9QvhZRFSejzd9ZqbMfV6rKxJCEuntEcQ8wp0ZMFXll765inIlyPf0
	 +cr2JYiNo5MF/3TKvVTSo7dk+4GmGg6p3Ku7YRipohqnl6wOlFz8e8XSd6jnEunQF6
	 4fRV43pwoTFNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 56A4AC3279E; Tue, 11 Feb 2025 21:51:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] New: External USB disk drive and SSD corruption
Date: Tue, 11 Feb 2025 21:51:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

            Bug ID: 219773
           Summary: External USB disk drive and SSD corruption
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: fredbezies@gmail.com
        Regression: No

Created attachment 307616
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307616&action=3Dedit
dmesg log with errors

Hello.

I noticed recently that on my motherboard - MSI A520M Pro - I got on the lo=
ng
run partition table corruption. When I connect an external SSD drive, My dm=
esg
log is plagued with lines like:


[  114.674453] usb 6-2: reset SuperSpeed Plus Gen 2x1 USB device number 2 u=
sing
xhci_hcd

I see it on both 6.12.13 and 6.13.1 kernel on my archlinux.

Adding both full dmesg log and dmidecode log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

