Return-Path: <linux-usb+bounces-25132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D1AEA325
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 18:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDA35653B1
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 16:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84461C84D0;
	Thu, 26 Jun 2025 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLrcKPxf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298DF8632C
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 16:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953752; cv=none; b=T6HNrdw82ObCmxljDNoHq3MSh42Uie8eDG2r6WeaR9cVwJ/+pJx4a2V64TEUlzCw8ZoEvsHOEs2vd+1zSR7IJ9Fnxmie7ZUiH02w1bqmMVxIj0+vxbzsJ4Hz0zsRmEDajC3X+nRzHpsnciXlc1KFtP+rhDm/tCLb37LCI60uSU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953752; c=relaxed/simple;
	bh=Sy+oReiwbgLrad/fHgH5Ug4G0okObEIx0AXWWhFPke8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hneOOZHm2+ojSkLTkVHKKGJFR5YNvHMV330GaxHjBD93sfdulY4ZYbmi+21Sr+gYNpbdGQXsELhQ5oNK0e9ptiqKjm0RJMhN5RCNXOKkllz1+9XHduNTLrDO7AUyS04OJsS7hTd2Rf5Cy+Z0DBVmQE2ApJql4tX0wgxP9H0CeTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLrcKPxf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAA25C4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750953751;
	bh=Sy+oReiwbgLrad/fHgH5Ug4G0okObEIx0AXWWhFPke8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bLrcKPxfqW4mqGpkqXzEO8dzgGkKslFDtA3ToIr1HfpNrfDpa45sejd6AZslnhJqp
	 +aknNcpV+adloo09+Up/+kkJjxr1eJM499MII/7Drx/1wQ9+OTXtysjUuRMFXpXcsd
	 0N7GMvYXo4SlD8eqFGPRZHMtUNCJ3091bFCm4cMx5oUBP1c1gLWFN1aZ/4ePE5K3LE
	 +K9A/xPqel6ItsxZ+VwQ7NPCfwbtH/5DdeBM3fQ9rP90nLhQzHrZLfjn/sN0xe4Qau
	 JYfWs+lHox/imGSg+cf5b/g8lf4Zbd9ujfkqeNQrza4kYKNL5WZLa9NNT3S3diW4Lg
	 rsIIZF10Lj+rg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A5ACDC3279F; Thu, 26 Jun 2025 16:02:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Thu, 26 Jun 2025 16:02:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220272-208809-7jntWai7JQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #3 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Created attachment 308314
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308314&action=3Dedit
Optimized memset_64.S for Intel Raptor Lake (patch)

Added the made changes to memset_64.S as a patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

