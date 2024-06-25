Return-Path: <linux-usb+bounces-11629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B339916896
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 15:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF78B1F23619
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 13:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA00158A26;
	Tue, 25 Jun 2024 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZHtz59Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB8E156654
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719320846; cv=none; b=gy1X9R3nLLwVUVP3iJR8Txb/hfFaCUSDPVnXjHMqB6xhK/Pxr8C+RMT01/XCq9rTTse9AOyjIEa9LY+fxLyYnKtJ15CTLPyOWSAETTY/VMGRu7/QDGOt/BQcQBrov9XTE7SyUSKLAdRRNIkZHTh7rV75PyQctf6Tf4FrKkUOblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719320846; c=relaxed/simple;
	bh=JhvVjGCFUuTDNXrRyGHEYOAgQ9x003yMj2KPyrW2cyY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MxQgxpc7jDupAp7AIOgOlVEaiCfaCKSNQrpsgXRraWZoYBR4pHrClvP3T3iT2hlPU3Ww1UulL6Uw5PqmiQWK5kh4VUY4i1iqUv9qPxZPr/SlrrZu0Wppc+u/5AtHkJsi4dir5BlnvGDUH5Ezd6+1IfV4+HOGtSGekDzgbh/k6Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZHtz59Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EECAC4AF0B
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719320846;
	bh=JhvVjGCFUuTDNXrRyGHEYOAgQ9x003yMj2KPyrW2cyY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GZHtz59YDYuY+Fzg6EtYtcRMm/2sQMs1AMcf8/Ka/tHqYJpLeRabGIrHfXnREGCAp
	 eCfCLbbE8OMtqacmUcM6FwFW4OeHdUspH2Q0yl5J3azF0y+J3PIfFIVIdkyV3uDagD
	 UYkGFtVhdj1DtXBGDgQ4GFOuJOtucvSJHoQwHB5MBlAHqc8JZG9ILfkb8caZHEd9VZ
	 tHsdQCG6AEV0Newb/y1baT+5SdOkqbOg9d+T1c+s3ZikSjm/w347Yfqu4GxG+rbxed
	 UgKCYuHzUclsOClb7Na8RHjncyWbj60RiJGP2ogooffIrHfBHdm6ODHt0jGhiTA6gx
	 CugDsKPrEwAjg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 53E0DC433E5; Tue, 25 Jun 2024 13:07:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Tue, 25 Jun 2024 13:07:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: repk@triplefau.lt
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218987-208809-ZVnNVUe4qq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

--- Comment #1 from Remi Pommarel (repk@triplefau.lt) ---
Created attachment 306493
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306493&action=3Dedit
usbmon traces when unplug/replug Genesys Logic Hub based devices causing SRE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

