Return-Path: <linux-usb+bounces-34246-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCN8EAXqrWnx9QEAu9opvQ
	(envelope-from <linux-usb+bounces-34246-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 22:28:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAF9232539
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 22:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A35300F9C9
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 21:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D3134DB79;
	Sun,  8 Mar 2026 21:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1P6IFmT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9788214A62B
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773005313; cv=none; b=V7tv8htQZZQDlauxZz9pEoqInnDSNvsH73qHFlJNWOPMn3PvAFxVBLVW4mNncWZlN+qMipfpyFb0nIw74tT9fn96jFN7RpnBRTCBPu2qurrdVzxzpr4ZrMb2DuOwBc9X0rFvjueNcqT/xdoQ+B53VicY3MFkV+k6Ezf6WsKWypU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773005313; c=relaxed/simple;
	bh=Tw1KuL5gD6bldntSmAWVx4oc480+dSip3tpIOnpanuM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nHJ6YMtYxefB2uR3rj+go4cx2bHoVprB25ka4TPvSGkKL5Ya/3mxgRkV++FicnOakWUoypuksX2zgmImX2zOhqXRuHQ+gUY92fRbOvk2M2s5RNVs9oNFd8W5nJmuu12XSZ6MXui8ejx3Zv7M/I84ToNpbf9j4zRWNdq2zJvwMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1P6IFmT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E03FC116C6
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 21:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773005313;
	bh=Tw1KuL5gD6bldntSmAWVx4oc480+dSip3tpIOnpanuM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W1P6IFmT6vJnK4A74ON5UT1BD+Pmr8xPB8Taoao2Zr+hNv4PpRXnvwS4q3g215+RQ
	 K+7w8ZxIqwLdNin8Ui+ozqHTWk0G/xrMQjzptvo4JCVuElhVZpoi8ezFiAs7qP2aso
	 qrvWqs/AQinIjRqQ/CsknXDeXXm62OXoth5gHsScM+OVwW52x3ulemC+qc9lGwzp4W
	 2Og4v1YIn3WkqAIjyYd7fT38hO5G4zXgfpCArXbNy03AHf2cnbE2Iv/Hm6IWRJLOxv
	 9IH0+15Ur5NDocn76aYmi5qrL7sg4Ze1ahb1qF1vHyF/gRMnPJIP6mfkrVq0Fd1PQk
	 7GOXIM5I1OBIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 23C2CC53BC5; Sun,  8 Mar 2026 21:28:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sun, 08 Mar 2026 21:28:32 +0000
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
Message-ID: <bug-221184-208809-5UilaWB4OI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 8FAF9232539
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34246-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,harvard.edu:email]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
The new usbmon trace clearly shows the same errors as the earlier one.  It =
even
shows at least one reset (I didn't look through the whole file).  So althou=
gh
the newer OS may behave somewhat worse than the earlier one, it did not
introduce a new bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

