Return-Path: <linux-usb+bounces-36114-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGisKhsT2Gm9XAgAu9opvQ
	(envelope-from <linux-usb+bounces-36114-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 22:59:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CA3CFAD4
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 22:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D50A303131D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 20:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41343446B9;
	Thu,  9 Apr 2026 20:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFgFtrw9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5133434404F
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 20:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768198; cv=none; b=oeNbOmn6Sbt2qosmTho5lNzwNeDy21OYUYEmUTUi0L6eMdXpgnfa2Fg88sfjZBkuFkyx6pXjiIKK6ddXlwP0wVH7OCv9UGP02tSBYF/j8QM8sQVYP9YGgiCi0i2qgH2tBlRv7pHRV++7luyUC41mj7EU4MlKB1R9UVYT+c73LzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768198; c=relaxed/simple;
	bh=Oubx7AuLVx7RrNUjBKDOpiRVmdGJJZMPxV6iskgOKWw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nEM+pq7fV7LsMbdx4IyhSeUh5VXgWUaZlEkv3qzgTOBKIBUzeAbO1HDFGbOxNA0/5X8wI9uNiyTCdNRoiX6Lyc01GHJ7sA1Nu3LncPIti1rBdVJZ4ezOits2zzcqQjFZRKHYwqFrnZV5t9THIxyBAPJ38s1cApE9ywzEL5arPbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFgFtrw9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6E7EC4CEF7
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775768197;
	bh=Oubx7AuLVx7RrNUjBKDOpiRVmdGJJZMPxV6iskgOKWw=;
	h=From:To:Subject:Date:From;
	b=bFgFtrw9f4ftDNqO9YgXVjNMgdwmJ859ixk9mFSdlrYV9fDMvdp/wINDbch59a5Ud
	 2SJLB6JxFsZ2N79F6pc7kXfKU0URb6skQTeUnBIbu78Wq3opGsd9U40cQ9J2oEpWTT
	 UuPSZYgkN5y9pJOOKQcX33rOT359telxRrUjoSkRPGPFia+7R+tv3Xq++yd1Etg8MX
	 dIfde0T1ipWqZ5FfJq9hGagsSl7Mjen2/eoK+i4XfcGaYesOIX6HhHcqIkgq9RHmr+
	 Wjsnulkm2bsASWjTqqBBoMLQMeDi5KLzd+VumDZV01pl+g0TJBwDaZwg49fI20wxEp
	 gN8/kJ78mWtGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D6E71C4160E; Thu,  9 Apr 2026 20:56:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] New: uas driver hangs and causes usb reset
Date: Thu, 09 Apr 2026 20:56:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-221340-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36114-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email]
X-Rspamd-Queue-Id: 501CA3CFAD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

            Bug ID: 221340
           Summary: uas driver hangs and causes usb reset
           Product: Drivers
           Version: 2.5
    Kernel Version: v6.19.11-arch1-1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: DaisyTheFoxxo@proton.me
        Regression: No

Created attachment 309850
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309850&action=3Dedit
Linux Kernel log

The driver has been isolated to uas, usb-storage driver works without issue.
Happens more often the more load there is on the drive.
I am not aware of any duplicate bug reports.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

