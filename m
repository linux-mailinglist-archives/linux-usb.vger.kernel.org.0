Return-Path: <linux-usb+bounces-8012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7F387D5EC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 22:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D18F1F2412F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 21:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE0D4C600;
	Fri, 15 Mar 2024 21:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RleMB+0v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174793FE47
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710536615; cv=none; b=YdHg2I3TckieuiCrJ5LVITRrNb/8HQhT8aFSQSYYf2y/wLjPQZqNqh2FZyIGyI6HGLtMkpRgLv8q1EP1c7hh0qeijacVa9qw/eoAhzRDHi9ZssPwjKekrqlVxv72ZH19fAFcORXqeohLIJKuobwhG3Ih48naRc6DrIi/vUJ7o40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710536615; c=relaxed/simple;
	bh=HTCCJgLMTsBhil8VtM1FZZ0zX8EmaevPf5OQ0onJC8Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ccv7GKYy/8cndlVOiBq7GMH8t5Toqn8ywO63g3RUH0F1KS71UuwtbPGrHGkteSV3fxT1/l9daiok6n7Lf7yIXK2QW8rIHL4N8wqpsnqFqctwC68YBXJN7dQZ7Ijd4DnzHE3blOsrjgRO3Gopb60IqUMagnoPMTSwP2pbkjrH+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RleMB+0v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D1CAC433C7
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 21:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710536614;
	bh=HTCCJgLMTsBhil8VtM1FZZ0zX8EmaevPf5OQ0onJC8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RleMB+0vD2e/2hESI0YLZJ94nwXpL/JT41F22juTJpGH6nXtZwllls4WVSIOfAqZq
	 LGSgw45BINbuEJ7f2TrVtzhe6NX6b0PTe6LHGSXOv35zebF363TCV4P4HDl0PGpRDi
	 Tp3Bvl4qu5B/3gBkNP4PNP9DsETSZxaiW15RWkAaT9P47w+/WLvWCptme2wEQ7LQ8z
	 p6OoAfGou+z/XLnx7BbsvFsF/VdzDEZoHWc9LgBrNo91XVs2Mnh+zqd8B1YsDLhHeF
	 0I5yGqLJh3ZnwA+Tf0HF6n5mszXjGRvyJVz52Q2gO8Eb18NqynHf7IDiEmFFijtBWM
	 R37LjCYxPwmqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 854B5C4332E; Fri, 15 Mar 2024 21:03:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218546] xhci_hcd prevents hibernate/S4 suspend from working on
 several systems
Date: Fri, 15 Mar 2024 21:03:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: corngood@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218546-208809-9uo2Bnr3gG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218546-208809@https.bugzilla.kernel.org/>
References: <bug-218546-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218546

--- Comment #7 from David McFarland (corngood@gmail.com) ---
Sorry, 'symbol' -> 'symptom'.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

