Return-Path: <linux-usb+bounces-9892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970658B5A55
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 15:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52887281D72
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 13:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA3974404;
	Mon, 29 Apr 2024 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niJfojeh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3B7651B6
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714398171; cv=none; b=UcITi0iaA/Ip8Bw1XiIlAy6kINIPVvzZIhPt7L3FZcYYKPmWIBZfHQBeVTUjzDYGXyadKCKC1tSm9nfYBsZmVNn+PWrQT7kZvCa7qHbq5l4vegMedzggQoeVAASobsG1cUJ52NukpEA51/7bg93kjEPdLfHSBpy1I+ih8RXdfQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714398171; c=relaxed/simple;
	bh=nx/E5ZlQ9turW3cnMAa8pWHusT6pENEAd6UaB6hKIwQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NfuQ3lABK0pyglrHAV+l3tiEOupLGInzO36dBrt8EXX20re8Xjd3wbVYIKH2q5EeoJePgDB1C/4Zz1Jb/mASX0XLv4ldA5A7c7rtBJgItf/V56yAJOkMscRr5RBTRvbWuCAWhJYab6hchUNSrY/BEIZJzU+RnMe8ysmYjpGYPiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niJfojeh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25220C4AF1A
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714398171;
	bh=nx/E5ZlQ9turW3cnMAa8pWHusT6pENEAd6UaB6hKIwQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=niJfojehsUp0QdnjTAojVGMWmxd40t2MxaYmbM8OScRgHLkoyO+dLCIwq6OmtelIU
	 5OiibwVO37rMBxQDuA+DpxpVNpSBTUikJDoMlRMA4wgoJp2g+4dKvjHUL1o3Gmu/bN
	 gOXS9sKQAaOfZUYf5E7w1LZrm5gIsSQ99aJI4z3EnszDUe7mYgDI/4r4mpADMhVvwM
	 Rb7CseaQ0CeOsJAKqPwmiqDhJG71svMgZzcjmTj6my2qQEr6oJxI0AExuGG9roWSyr
	 Yoy3VQ8PtMfoP4XqPwgSrR7SH/+39FemYMGscFuxoRkK+mdfkpL7a/E90qVsWKsgfu
	 0w/kYo6XrhdTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0EDF0C433E5; Mon, 29 Apr 2024 13:42:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Mon, 29 Apr 2024 13:42:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218789-208809-f8JoPNg9aN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

--- Comment #7 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
Thanks! I can see that "ECSI" EmbeddedControl OpRegion inside the scope of =
the
UCSI device in your tables, which should be fine.

I don't think we have a global handler for the EC OpRegion in Linux, which =
I'm
quite certain we really should have - just like we have for the other types:
SystemMemory, SystemIO, PCI_Config, etc.

This may actually be a missing feature in ACPICA, so other operating systems
may also be affected.

I'll see if I can get the ACPI/ACPICA guys to take a look at this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

