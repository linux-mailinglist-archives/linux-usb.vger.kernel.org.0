Return-Path: <linux-usb+bounces-2404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35D7DD0B2
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 16:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25BB72814AD
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4AE1E530;
	Tue, 31 Oct 2023 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWlNuqAC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF11E52F
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 15:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF753C433CB
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698766800;
	bh=KnA5HCtJXgaPYE7GnhxgryxQmVR/HCat4ZzBvcDbws0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UWlNuqACJREP3GD6urq8YK0Hp8N8P+RWkyGXKuZxntLihQ7NdJLkWbv6QJVUUCgDR
	 RU7zoIWMOQPGpKLnziiPwMK2p6pPMSCxlQniQDfscytzy3J7zhvhJLPp0K5P9X0iQz
	 w/ZNY+P7+/0low/pW6K/ec3P8oX5qpK8W8ToMuGgeOKTTlfIrdtwqNa+oRc1+cetso
	 1CUM8KfFhG0tngYq0R26X3NkJnj1I1hWresyhb6RKUPRm5EHBfKp45TKu2dItLRrPj
	 ehX3fWTWzwv62WEe+3eigSIFPuMx78+rXYlAAxGzEQvf4r4tGnO4iPKU4niC9RW5BI
	 NB/RVuMszM2Rg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B96A5C53BCD; Tue, 31 Oct 2023 15:40:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Tue, 31 Oct 2023 15:40:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chris.bainbridge@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-DXCNlbv1W2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #16 from Chris Bainbridge (chris.bainbridge@gmail.com) ---
> Pretty sure that is something that should be done in userspace, as there =
it's
> a lot easier to update the dataset with the latest firmware versions.

True, but then you have the problem of convincing distributions to ship it =
and
enable it by default.

> The regression was never bisected

It's not a regression in the kernel as Piotr said in comment #7. It appeare=
d on
Debian kernels because Debian enabled IOMMU by default (but not for the GPU=
).
This is a Debian-specific patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

