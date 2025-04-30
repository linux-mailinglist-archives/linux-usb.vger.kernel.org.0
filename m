Return-Path: <linux-usb+bounces-23574-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6926AAA48D0
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 12:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8304E7B5EE6
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 10:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC3F2580D1;
	Wed, 30 Apr 2025 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHv6z3B3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C92512DD
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009558; cv=none; b=J+tMS4j7n3tYMKZHRBXovKwGKHolVVPBQe5PdN6CsAU6EYqtBWV9CmasDvqIe6pjNnrKMDHhXJpeEw02P3/mq/GKOwb98moVMo3G+ZbnPpouaWe/z5oiZBEuSFL6qQTJVPNQEaenCRsGRb59lv11kXqpMqBauPgcOWj5STaP5ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009558; c=relaxed/simple;
	bh=LNt7Q9JQNtzqLbLUq4iZ0d0SJ/JXclVjFuBAkaWsfQg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=APKXpqZHx9Rm5k7rVqHHCVdxbqHQ1G4xCHQ3PXtbasag7lw7h5tEmyFo1+XhBTeTednmYCllSX+036WX2scV3QMaFrp/Bq5cOaC+FwadQuSUiNjW9hwI6Bryr53OgwJO4R5btCFfnp5bHbIuaq65iSQT6xah0lFAzT5NUgsmLOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHv6z3B3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 210BFC4CEE9
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 10:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746009557;
	bh=LNt7Q9JQNtzqLbLUq4iZ0d0SJ/JXclVjFuBAkaWsfQg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kHv6z3B3fmlhZVKm011u1RBTsrWPWNFskyf984/DUBwgJqTGCheCqXtsMgmfDag47
	 dFxaawGGKDysZNNF8bZi7QOEOeflZefbLeG/TCZhdF3KttWAXzbjQaj0dlb8I7VB0m
	 /x0Ixikk//ICtyzdt0jsawiYjZ/+0/G4HUrkKpTEN7QVQNVLUfRsDcQHKSzZlc+XpJ
	 hSDQYVa+SihPM5LRBEeqq2nEFAMmVRsbbnzZ/Jf7ZmxUBvhGKd74QdDpn7/14/4eRw
	 iMxbx0MCSx8b2T1TeIHkyOfHPtDgtS7ZUs9vemSLmDRcDQMj67suryJ+BlLEy1w2lg
	 IkgyeqAh/dh+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1A738C41614; Wed, 30 Apr 2025 10:39:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 30 Apr 2025 10:39:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilpo.jarvinen@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-KdKiq3Z5lc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #29 from Ilpo J=C3=A4rvinen (ilpo.jarvinen@linux.intel.com) ---
Created attachment 308058
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308058&action=3Dedit
Resource reset logging patch (only for 6.15+ kernels)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

