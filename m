Return-Path: <linux-usb+bounces-23235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2007A93C5F
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 19:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A68D3AD1E6
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 17:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBF721C9F3;
	Fri, 18 Apr 2025 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+aH6UPP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FE13B590
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744998789; cv=none; b=AysHQes6ciIfItefFdlIeO3myC+5xA8n6eWqfDldF8NrE+pvY0EH8aDNnzVPiNGT0f5NRO+o4561mPTpio6raKTChuOYHf1gtArbk4VPmoLRNGjJxwWN/FecwtmZToNhgqOuLzV9QeN6BKj8hA7tIYI2RiPfUvi1U/G9ftK/V3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744998789; c=relaxed/simple;
	bh=S/Nb2SHa7gFWVU77y8vtVkIOHkqEHi1ERo1vflXZ2TQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sIxt1IOyR+Vmvbpvb4hk6gl+l3SidU12nLDKG0uyoaTWtAgWdA0NbAqglbsMxzlvl3RQhyUB7+sr0X+TxVceITzKTS1AQNYppI3bj8Uce/YgI+GGAMmgiyb6D8qVTArBWW9xTSziPiJgWMle40ROLjqlaaSGhG8260acFBqAbv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+aH6UPP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74E92C4CEED
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744998788;
	bh=S/Nb2SHa7gFWVU77y8vtVkIOHkqEHi1ERo1vflXZ2TQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C+aH6UPPu5tIHPas9aM72kDaZg2rxNn82gAt9lM1QllB5ctnN8UAxVwCKWUPre7xj
	 2+LhC9YvwqzEFs9yxiD2L2Hkft7npGjBwcY8TytQ50s35UsH3NgxdlGromDwlHgF3i
	 2BHaC4NQkzj2aTWkQW1grWOmOUhV9Y49DPqlJ45dgykulSX6ypQ89l1ta77jHpPQPl
	 zGpKr6G0wFHzR7NQGgtHyhN712zkl4/M/A9Mg1H2IFwl0SNsYjgVf05ASDQr8DahZP
	 lSkCGzZzMHP0wvpNTgVoyB4KXTqCPpKy710ajzyblRSnhxTq6PzZ/NMfNpOHZmWvLr
	 k/SErTkzV4/VA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 66772C4160E; Fri, 18 Apr 2025 17:53:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 17:53:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-IvridVin9x@https.bugzilla.kernel.org/>
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

--- Comment #17 from Steven A. Falco (stevenfalco@gmail.com) ---
I just realized that I need to read /proc/iomem as root.  I'll recreate the
attachments - please give me a few minutes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

