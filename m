Return-Path: <linux-usb+bounces-7285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4586BE6F
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 02:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A4F1F23580
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 01:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E652E63C;
	Thu, 29 Feb 2024 01:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4/UIJ4p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37D736113
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171058; cv=none; b=r1eNiHLZ453yJNq2coMzWSYEimWvXzvHujXMlb30eON8O5h1uRQXG6lAJE4wIG8XhXJj0sfDY+5vust0XOonGA+b1XPemXLzSrKHyZUXh+HZLB2eKTVSokeOWToD8VSORfQ9sQdtruv/Es6uXrvzhIyaOTLJsZYuyn6pm52ltjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171058; c=relaxed/simple;
	bh=HD5UdPy8Z5JrjPvOUe4GqZfwrlMndmUMtBMMDxDBWwQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q0xih7rlrr3A4MDVHUAGhca+IEfUxKn5FjfgiQECPUwi60osiKKowsoXFR5vAXOMVNrDg9Fi+TV9RWMtpPol9434pwj7cYNG7nSUOEV0Q7MLSjcdLI2ld4C1M9QsnmGU6p2RcqGh9fnspdp3VJjV/NPk/HkszVXG+cxc5aTayJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4/UIJ4p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1591C433F1
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709171058;
	bh=HD5UdPy8Z5JrjPvOUe4GqZfwrlMndmUMtBMMDxDBWwQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V4/UIJ4pHxFOFvnzZIiJKROSXzmbomFG6vYj1lePfQ64P4jCqfixtq2lHDjDeavaR
	 BdvJS4e87Vkv3+IDTGrdNuj/YLmf2Fd8peLU2hsGghj9tGa3PQklm8lxD6wnEUcLdy
	 TpXeDhPtJ8HGBUebieEQrzrd+hA6bj52dKCtksNlF07Z1r2IsLF3qSfkKohJgYCJC9
	 EU408bMXv9Hia7qiGkl/o+ocwXl10P7KqUhhL6BXJ6keBQ2q7pCPzmFJJb7WCD7vKS
	 jqr9WJOartTCcfVNuBNSFzt17G0zhfR1AgB4pkZdSxwR6zlqi4+jy+UaLJYwkhckCz
	 Umn2CuewhMJ4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 73CA9C4332E; Thu, 29 Feb 2024 01:44:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218526] Unable to achieve 240hz on usb4 docking station
Date: Thu, 29 Feb 2024 01:44:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samworlds123@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218526-208809-R8m0OTYKB9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218526-208809@https.bugzilla.kernel.org/>
References: <bug-218526-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218526

--- Comment #2 from Samuel (samworlds123@gmail.com) ---
Dock also has to replugged sometimes for displays to work....

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

