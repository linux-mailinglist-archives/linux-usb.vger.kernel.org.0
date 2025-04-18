Return-Path: <linux-usb+bounces-23233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A48BDA93C28
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 19:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57D35188F841
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 17:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D03219A91;
	Fri, 18 Apr 2025 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhtVJIQz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA2913B590
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997973; cv=none; b=dYuLrK9gi9J6A1ddhbjyuj0TFzJOIZyd4fD5I5bEd6HAzBjWyk3PDYT0dDvZ3uqmQ+W7Jz4fg/Ad3M86iur71Vg+HkQmtSD6JZhUarDrs52zw9XuSnkVU9Ki08MbBUgQROGyiQ6E9Ls9o/m4g0PR5wDziXWHqeljqgpaxcqQz48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997973; c=relaxed/simple;
	bh=+6BfpOiyHiTC+qr7WeNRprweQQMsoB8dT4RUEjEKeio=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LWnNMW2brLpD06VXghdfVbxfMGRpUZDGCAu2ozXEQCsAxL6fHRgXQIzh+gCOBf4BJDqs6GfXd2zOmYeYwM/aTHe3MymASRNPMyYoSX7uAFuDRPskZwbmDS0eX5zdRiag09+++8qByw9/OTwnOXkvNYndwofx2SaY5yYrCpEJK7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhtVJIQz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F6A0C4CEEA
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744997973;
	bh=+6BfpOiyHiTC+qr7WeNRprweQQMsoB8dT4RUEjEKeio=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rhtVJIQzZDwbkSXYt5dTlMM24m6MUsPn1aCQsH3zmhQqRFj1bHpk9PjDpaGeieelV
	 f+PRTPFRGz0bVgXvJJk7gsUoEnCfEWE+8UpkhBR4DL18vn7sx6oivPFOhXzcCIHk3n
	 Pfwq9Or3TNAmyxMcNEFjtIWZwMKDMfKvSUfwFJ3Vm2P2DV88nnrF5LNGm2H+uc7pr5
	 bFnVkCGY0YJMD+XbCuhlcOwFvI1y3gAU8y/pxjoGB24b+dEth+4EFkRECdfqTNZlBl
	 8DkwByfPJQqediNB0b+shqFcK1NE2QP7msMRtocpSJdlHci9gXi2ittmkoJyzFOFqt
	 PAQzg8VtgOFfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 09043C53BC7; Fri, 18 Apr 2025 17:39:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 17:39:32 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-xiPAaBAH83@https.bugzilla.kernel.org/>
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

--- Comment #15 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307989
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307989&action=3Dedit
6.14.2 with realloc=3Doff, good keyboard

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

