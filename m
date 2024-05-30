Return-Path: <linux-usb+bounces-10698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E338D5094
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 19:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C57FFB267A0
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 17:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8835A45BF9;
	Thu, 30 May 2024 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zq50rjcS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D4D46521
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088917; cv=none; b=uWxk0/XU7VWt+fCd+qpsYiL797NJMYGWY+F8RH3UkN8YngSUVbWKHMO6qFFUEgk5AwlnJ8F31Ei2MC/DLKJWJTAA7sZy7FNE0Z2idjFvfDGR4PNWxbnZz4Vzf5qFrcu1nQRmlbZdWdK3dDMjtAok1PHWxP2ZRwaKrIe2Prd7RT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088917; c=relaxed/simple;
	bh=HmQZ/sUFtBA3T9af3+2UGzq84rbQ/CQO4/W6QR7gKwE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NkxXgZbgx4kYfKPFnTAhhg7SODwzwENzPbBQYovEnGsAOXwuDh6MUPCn1Kdn3pmQAOFMrnh/umg+8g0vX8i37lASt+3doqalzLnJRS4AAAUUextJkTltYSd0YMUKApZD3oNFm3aTnI3hgG56ntTotrO/7AGrNHENsdnVtDSjX6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zq50rjcS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87617C32781
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717088916;
	bh=HmQZ/sUFtBA3T9af3+2UGzq84rbQ/CQO4/W6QR7gKwE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zq50rjcSyN25Lbzk9xmLeNt821sbZ90AkqROgPRFBdt4AyDa4jVgXua8rOKhJzuKe
	 icrJZU8hUX0B4JadyUQDgU7ogUoT4La3auZIWqHDYTzwh+UkXjnmSUb3nK8wwVDITB
	 f+1G+OXhbG/MSxhRFbMH+KLftdwUwj9UQdlRrbQ58hhEFN/W1BKrwvrb4TkmlY/qCm
	 fqNaAsgOppuzFIxHoNLmy2UDDdJcOSPIwokEaRnOaliB+/M3q31+SlqOjYX/LeeCu0
	 dTpn19qS5RLMs0bb1l3buKJP8K3TBdAbpV/mdBSkkLgXoylorOWyelHkQvbbHIHqM3
	 fXWiypbR+NrWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75E37C53B7E; Thu, 30 May 2024 17:08:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Thu, 30 May 2024 17:08:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218890-208809-ISXsODEmWC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #14 from Pierre Tomon (pierretom+12@ik.me) ---
Created attachment 306381
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306381&action=3Dedit
usbmon_6.9.3_with_patch.txt

Attachment: usbmon with the patch applied.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

