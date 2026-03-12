Return-Path: <linux-usb+bounces-34695-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CADJfL0smmLRAAAu9opvQ
	(envelope-from <linux-usb+bounces-34695-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:16:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E9276758
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E4033038F41
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 17:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFBB387574;
	Thu, 12 Mar 2026 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSHFo0ot"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE5C3F0ABC
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335748; cv=none; b=mYXd/YRXkCRSdrn7mM8DqF72EDMFKAXhNXshndUQ+oGO/1vMoipEqBOXzay+5Tv7W3r61Pm4vmYHM34VHUiHz5Bc/UgtuWQypNmSfgMYKt2sOUr57R8mN/HL0uqJuCBYljZ1VGaXbWq23uUOZap8qmdWjP/O1yfirXMd3XYrX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335748; c=relaxed/simple;
	bh=Z05ScBLimOrHhA32VjLlOGbEgSMJs6hTKWP5Xn04qKk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KpjUg086PLccxCDW+JTWmYCAo2WLVI5I3xNMIGySEAjYJFKlBgZxBLo5Szbz47cAhrP8MgWKNTEcGqtib4cngyBMitV65Z8/gqkR7td/L18h6HPgOIv+auhs1j28DhU2j8YvKRjq/nlgNykGOa435jtO2US9lIr5ZTz4Z8N7y1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSHFo0ot; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C079BC4CEF7
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773335747;
	bh=Z05ScBLimOrHhA32VjLlOGbEgSMJs6hTKWP5Xn04qKk=;
	h=From:To:Subject:Date:From;
	b=YSHFo0otrqDHcvq28x5RJxK+G2MIyO1Q40/7QrWC2PFOwudBD6ePEBH4bcQ84a8VE
	 TysyatNOoTL4EcYifW2eAeOu7LzHYqcojk5iTs5xWfDGxP7ZJNt98JzAERlGMUphvu
	 g8InWkWgaqN4Ei4jf2KogK87erAMB8307xbAW49GWyqbacJCTjBSuJCoHkNSJ4D0la
	 B+3DbFmvQvArWXhQAdrA+ZR6Vr8XCuLBboWLbmIvHZQImW1uKKVqxSAhmFz25Rqxoh
	 FDZQHqITP/rT+Hoeu3cbAZGIFbuSrVKGAbJdjxjDc9P9dF5/45HPLqqfs39/FNT3nY
	 e7op3zdowQ64Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B194DC4160E; Thu, 12 Mar 2026 17:15:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221216] New: ezcap401 needs USB_QUIRK_NO_BOS to function on
 10gbs usb speed
Date: Thu, 12 Mar 2026 17:15:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vahnenko2003@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221216-208809@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-34695-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E80E9276758
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221216

            Bug ID: 221216
           Summary: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs
                    usb speed
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: vahnenko2003@gmail.com
        Regression: No

Created attachment 309632
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309632&action=3Dedit
dmesg and lsusb

Hello, my new capture card works only in 5gbs usb speed, with deepseek's he=
lp I
applied { USB_DEVICE(0x32ed, 0x0401), .driver_info =3D USB_QUIRK_NO_BOS }, =
to
drivers/usb/core/quirks.c quirk and now it's working at full speed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

