Return-Path: <linux-usb+bounces-35619-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJMIAMBVyGmskQUAu9opvQ
	(envelope-from <linux-usb+bounces-35619-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 23:27:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 524193501FC
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 23:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB981301C16F
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 22:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9E836EAA2;
	Sat, 28 Mar 2026 22:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqZ58gAc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C7348895
	for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 22:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774736801; cv=none; b=h6R4tvHCg15UFsFccEHfnWJ9WcnalMHXU7SSX/ct1DsBnO2kpyih/+K4NCF/w2m9IMT2MNWDNYZOj2EbZGoecm/tQWhECs1mA12x69bJiVGu7UnUrkA8vN2Vo/UrH8uQWypScU7XvRSFganTcA4qC2dIYPD0iDpD2DEqqPW1EsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774736801; c=relaxed/simple;
	bh=xnyPq9fTT0/hHGzhee8t035BVxPGc6W8YgcnaKYfBB4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KPTJTUMdXJJTQ8qxaYjNtT2GTmkiqf8tc02T72WqMNLKCqJTgDOCxNifT+X2aodX85lTebCbNOylmhSMMk3/NvzoZSI1Tx1BHJR7rknZb8eoS50qs5h8wmoSn2lYWhwLaQor7JA2n32yCSQdj9L2USkC4PhQHxSNCdKBrjvR9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqZ58gAc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6A3EC4CEF7
	for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 22:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774736800;
	bh=xnyPq9fTT0/hHGzhee8t035BVxPGc6W8YgcnaKYfBB4=;
	h=From:To:Subject:Date:From;
	b=GqZ58gAcZTvSAt2b8WEnTXz8ZiR1W2ZctpJPEdOczOR2xS6Nx1J3x5z1ojO2xvBby
	 T93MZ9ynjzX56GYATG6Al4PZh+YMh+8U+5PwzT640iAGu9qP8cMRwnoVBUOeum/g43
	 alKdZCgyrj3wr16fOlhZw1dKJZzZstZA2rLngpYz2BFi4DFWX6g0pENJ8jeR5XXRBU
	 8WqVeo2mG+952KxDbmEGn0aAfsIMvNdyigNUr7WcINHLrW5qip0TPkA4uF6Ab6XJXR
	 axUCMj16nHcDD/9Era4pdvjYdxQu6PDZyHID5EQzQZNsReQjTygtIh6hM6tpQKK3Lx
	 1NiO1dWH4Ytjg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C2C0CC433E1; Sat, 28 Mar 2026 22:26:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221293] New: Thunderbolt: "failed to calculate available
 bandwidth" causes DisplayPort tunnel drop with Apple Studio Display
Date: Sat, 28 Mar 2026 22:26:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aylin.ahmed@jetbot.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221293-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35619-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 524193501FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221293

            Bug ID: 221293
           Summary: Thunderbolt: "failed to calculate available bandwidth"
                    causes DisplayPort tunnel drop with Apple Studio
                    Display
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: aylin.ahmed@jetbot.co.uk
        Regression: No

Created attachment 309779
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309779&action=3Dedit
dmesg thunderbolt log and hardware details

Apple Studio Display connected via Thunderbolt to ThinkPad X1 Carbon
intermittently loses DisplayPort tunnel. The kernel logs:

  thunderbolt 0000:00:0d.3: 0:12 <-> 1:20 (USB3): failed to calculate avail=
able
bandwidth

followed by "failed to reach state TB_PORT_UP" and device disconnect.

USB3 hub (05ac:8014) and DP contend for bandwidth. Manually unbinding the U=
SB3
hub restores DP, confirming contention. Suspend/resume recovers correctly b=
ut
DPMS wake does not.

Hardware: ThinkPad X1 Carbon, Intel Gen12 TB controller, kernel
6.8.0-106-generic, Ubuntu 24.x Wayland.

Full dmesg and hardware details attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

