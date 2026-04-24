Return-Path: <linux-usb+bounces-36473-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJI9FszI62mHRQAAu9opvQ
	(envelope-from <linux-usb+bounces-36473-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 21:47:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B292846302B
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 21:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F8C6300F124
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 19:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4844366820;
	Fri, 24 Apr 2026 19:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGO2zL8D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636201DF261
	for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 19:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777060041; cv=none; b=MQVky98b8F8ix8vjGALUYdy6RVZKZ11zNP9dEWQOk02CYIyb3Hycjybaz5S7Iv999SI3kQ1lZ1GNbReEQi+1Zsm/r5AHu86+F5QM0+CzztJYTaC/pXNJ9Q2+Kge+BWFU9q0Zp/ge+Ar9yTkm0FGCGR3D1xMnkFUDByTtTaxwWAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777060041; c=relaxed/simple;
	bh=Oo2N6AsdG3JggC2xST//fi6pINfdW9XNToK7cR1EPhE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q1Q7l4MlhP0PI7a/v4QNIWKF/tG8aTTczHoGQrD4JqF7oFED9aYwi0OvKFAt+U6cvuYurvz4rkSjlgtvWq+g39/fA4fkmY5/68pss2up8RcDXjkTjyJx2Kqs7v72/bWFh7zbdO4p+TuLAD0E5HSJac/eXzl7IhJfDh5gXp50p9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGO2zL8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14619C2BCC4
	for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777060041;
	bh=Oo2N6AsdG3JggC2xST//fi6pINfdW9XNToK7cR1EPhE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tGO2zL8DxU5tUzUd0jr5cY2d0O22/BVlfAi2ZNoagmmi4ZkM05aCnD58WQMuVXxeN
	 BpwyKobOTQjlUuF4dpAx4tnlevzRmPobLhnCECkwF1WcfGTNPYhaSIYI8TUeCehHAM
	 Sm5poMSfout5EDInorH4bHfBgSlheQgRfGKpNf0D1nD79yxYsLonSAdt5oJ1iQo/SZ
	 5u4hCZiwIaQLGrNVKirKsdL2xY6iq6cecXB4eDeIpjV3aDY3j/sazBxbNzNsS0Gj4t
	 9nyYT7wWek3HJGQPBJCwH2Su+D4yOufNDq1mJQAdFPdxOAjZFvOkJeW/18Hyb9YClH
	 nAx63QIsaLweg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E7BFC4160E; Fri, 24 Apr 2026 19:47:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Fri, 24 Apr 2026 19:47:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: strasharo2000@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-oFggVGt8Hr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: B292846302B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_FROM(0.00)[bounces-36473-lists,linux-usb=lfdr.de];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #48 from STRSHR (strasharo2000@yahoo.com) ---
Still reproducible on kernel 6.19.13 (Fedora 43), ThinkPad P1 Gen 3, Intel
Comet Lake-H.

Hardware: Intel JHL7540 Thunderbolt 3 USB Controller [Titan Ridge 4C 2018]
(8086:15ec, rev 06) at 0000:2c:00.0

Trigger: Hotplugging a USB-C Ethernet adapter (Realtek r8152 chipset) into a
Thunderbolt 3 port. No dock involved =C3=A2 a plain USB-C adapter is suffic=
ient to
reproduce.

Sequence: The adapter enumerates fine (~37s after boot). ~52 seconds later =
the
runtime PM puts the xHCI controller to D3. On the next access the resume fa=
ils:

  xhci_hcd 0000:2c:00.0: Controller not ready at resume -19
  xhci_hcd 0000:2c:00.0: PCI post-resume error -19!
  xhci_hcd 0000:2c:00.0: HC died; cleaning up
  xhci_hcd 0000:2c:00.0: xHCI host controller not responding, assume dead
  xhci_hcd 0000:2c:00.0: HC died; cleaning up
  xhci_hcd 0000:2c:00.0: Timeout while waiting for configure endpoint comma=
nd

The system continues running for several minutes with the dead controller, =
then
freezes hard (requires power button hold).

Workaround: Keeping the controller out of D3 prevents the crash entirely:
  echo on > /sys/bus/pci/devices/0000:2c:00.0/power/control

Persisted via udev rule matching vendor/device IDs:
  ACTION=3D=3D"add", SUBSYSTEM=3D=3D"pci", ATTR{vendor}=3D=3D"0x8086",
ATTR{device}=3D=3D"0x15ec", ATTR{power/control}=3D"on"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

