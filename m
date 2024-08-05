Return-Path: <linux-usb+bounces-13096-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B4F947C08
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 15:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EDE41F22E7B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 13:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F514381B9;
	Mon,  5 Aug 2024 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cx/hmD8c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C5D3A267
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722865302; cv=none; b=Dqfh1pR+z1y32z+cR31faVss8Rq7xSwYl9yL9gs5ZrmBdD77dHrnnFx5abK1Sfe3z20nlO2a3XSJvdCQ64fkaPeo1W5ScR9RtA8pAvfVx4d/zqVVpoyy6fKntrMqmFIIIxfgOfmJMn7F39oXCE1GxLQFyTzFo5RrZA9XvQ2ULP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722865302; c=relaxed/simple;
	bh=YA+QVWpvfdVQm0RPyVyJ44W9YW18+XzLxVsvSyGWfAY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iekLCJglLx+xVXCxC0BHLE4xXh3/cdPHM58RpFH3Pr77g+4ULRwuB75bNzRkGj8+NAxJHMH43k05jJ0F39ZmzQ/UOl2tOgzVx4H7OKQWRdTlery/jnQjwzZ4qkKMrgrmonxUfQNTfab1Qv0OlBSFQXr0i/LLnngdQJYAj/JsrZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cx/hmD8c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC618C32782
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 13:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722865302;
	bh=YA+QVWpvfdVQm0RPyVyJ44W9YW18+XzLxVsvSyGWfAY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cx/hmD8cJxYbdXNYBN9amI+HDrKML3qULJqQT9iFcHJXX9b7X6L6aKI0u1Nwsesbq
	 nU+L+q0fliClQVkhc2cWbpcRc5EIl+JtuwpUpgDgh7lFjmkm6iQ2Emg3MSotORwaB2
	 reXfP70/96ljgnXSOANTuedOtI/f0zWQqJMbt6WASImRJr7Kd4nQj/FMZaYoktzteq
	 GUPrjozGbq6al6W0G7c+0X6sdd5jtbszoFSXI//yPTpjgc6toOm35xAMyTVozfxy++
	 VsUlUp8n9NJY/bnTtopzNXs4jUR/Fs5xY8GzcKjjnXRYY6vZuamHOMbpxKhj/oc26L
	 bkJOQQsHj+r3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E1BB9C53B73; Mon,  5 Aug 2024 13:41:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Mon, 05 Aug 2024 13:41:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-yMFkrmtDVt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #21 from CH (com+bugzilla-kernel@c-henry.fr) ---
I did the previous capture. Does that help you?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

