Return-Path: <linux-usb+bounces-15972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D4997F20
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 10:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADD2CB2478E
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 08:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26891CC8B2;
	Thu, 10 Oct 2024 07:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnY1CKyI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2921C1AC9
	for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2024 07:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728544208; cv=none; b=pmGyh2PJynhEUuGuLOIckn4mjLBcArGaWBjVmMixnp3ZDFjfmOfy+yVZIrF668xgcWum+4hlqY4F5NSXYNla4Ury80b4XIKxUZPyjhFitNfLE3h3SFdQBOUIyTc7JP4N4SPoxgeuDF7iZ0rUe6lFJqSBDcXumpGv27UJovoaQUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728544208; c=relaxed/simple;
	bh=yZT/9pdr+/AR7muoIRcY/SOdGoJ4sLB1+oHPWSF0rhA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ggKWpZ8enuxLAEfKlQ10smdwPHAoW1bfuLChuJvpSL64JfYGECVVIYP3OfaI86OcJ21U2uCUO0+RtAo0/Q4Cw3HqLy9ATKflQR9A1uc+3cH3rDVMHcofAoOydgDCQqtqs2E4bfNMuQ2qw/kxzRjfQOvj3hR/8ZEcWZTZnYH9Z9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnY1CKyI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02505C4CECC
	for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2024 07:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728544208;
	bh=yZT/9pdr+/AR7muoIRcY/SOdGoJ4sLB1+oHPWSF0rhA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KnY1CKyIbtj6YnPESxp+4I9OlyPQlGE8ec6iz7QIrMH6C2MT7J4BsvHUm+Od4eZ05
	 naJfYaHNdY6GKGLvNyvEhZJmTqK5wfU/xQofXMzJ8tvYvxTIDJibK6psFF6AsXZspu
	 1vcFI8DdDULKntSZTLD6HcFBjMwzrxy47+SGGChLqzH6BHdDMFwdLZFbpujhxM3n63
	 SuBAvoethnLIqCbIq2KNRBu+QLh7wn7aJhkIrtz4SwTaqnuAggaeQ2ZDJyvIm+So+8
	 m8SeLFdXcRHgYX+Z2RmRnKlTDV82MMlMun/PfvSudTDDXTEMnQ08q+HFPb6RXe4mwa
	 ENsOZ5/ZqzR7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EEEFBC53BC9; Thu, 10 Oct 2024 07:10:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Thu, 10 Oct 2024 07:10:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Power Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-xciWSdhSTa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #18 from Tomas Mudrunka (harviecz@gmail.com) ---
But sync followed by poweroff -f  does not unmount the filesystems...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

