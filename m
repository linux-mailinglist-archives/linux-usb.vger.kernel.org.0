Return-Path: <linux-usb+bounces-25408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077FAF599F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 15:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07E304A816F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 13:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25970286D57;
	Wed,  2 Jul 2025 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EklEra13"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E08286420
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463175; cv=none; b=KyGg4cuPJcr+Ykdg78TFMHI1VqPImpCg9eltePj4O9SmLsaAYZgsJ9H/4vixpVWEcOe1UY9WGpSR6KbFsiWCeEYHLtZnZDJFUzgnbpylNjik5q8nFCBumfwVpix6mTjNrgQeX/CVP/dMZBt4h7Rvkd+FsSeqCRLUA+54u0oMQqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463175; c=relaxed/simple;
	bh=WNU4GIU9wolLCQ7qQ6y2JtRx+FkRY730fGXr8n4Ebtc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YG9SwAClVN9MiCpkj0TFuJEw+Hzvv29oRQthu3vtJAyXlsFVZRlLTLVT0zFzNB8Bk86ecVvLBEiNFvPfKtta6lVbgMWpxNQCM8R9K0JnFGbWsfSH3ThfDys0jIoepvCHZu0IMIavzlK/3dAcDzCHvlvTSyEMV1dt675Kv6cOrrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EklEra13; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B846C4CEF3
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 13:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751463175;
	bh=WNU4GIU9wolLCQ7qQ6y2JtRx+FkRY730fGXr8n4Ebtc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EklEra13d1KBJSEBK/xC4eLylwfpZueSAPsaKDo7OTZhD8r2wtUgdQgNAgvHBZpO/
	 Uy27z/D84gS/OuY0tiS7IaEo2hjHOPaOP5sfXgZbgaNQKTVsYe7eEgayo9OVD3JiA1
	 kWb7JscB9T4pPksZv0xTR6Z7khiWhaTH2MZbFR/JcYimR7l1YAfUWf0OZYzT/43rC0
	 JeZNUUMDN9VQ98rIjC1Arw300b1Wu+ZtkKvC6Wjt/IkZq3odE1u+3I2OFgdy0u/+Bc
	 aoNimtkE59w5WLPFAKISiUqg6RjnME9WGp0Q4ETxVNAJcAw+bvZlqvFQQROAsRQn9L
	 cx0Dpbjd1yegg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F17D4C433E1; Wed,  2 Jul 2025 13:32:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Wed, 02 Jul 2025 13:32:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: 6svcyk03@rokejulianlockhart.addy.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220181-208809-82yIVejCoU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

--- Comment #10 from Mr. Beedell, Roke Julian Lockhart (RJLB) (6svcyk03@rok=
ejulianlockhart.addy.io) ---
> I can't format this text

It's merely CommonMark. You can read the standard online, at
https://github.com/commonmark/commonmark-spec/blob/90c06837975098002cc89d3d=
a1be30529919a8a2/spec.txt#L1934-L2356.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

