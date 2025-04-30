Return-Path: <linux-usb+bounces-23586-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31976AA4EF8
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 16:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C93DC4C1DDE
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 14:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E7D18C011;
	Wed, 30 Apr 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sC93M3Np"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4BD149DE8
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024413; cv=none; b=sorwHdkXAZnJ0zf0esA3yVrVVaD1fNdqWwFvN1bef1tcVwHBdpwKKh9bKWk9uy1fkXvmxWEMibt8TebZ0Me6Ui77hUpCRyInUGw6pWsV8HePJgCZ8zyf86DMANC1T6Jz5iFcwX6iwosL2XnoOgwCKieEmshJpV6dGtwvFCP2I4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024413; c=relaxed/simple;
	bh=XNDrA/UvJpEPOKxVBj/h4dnp1HsFFXopl/Wg/xhxjgE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eZ6iwvOba+ecacGL94tdLHfXqedlQBNmMv+bHp5DHmkuJwvznbgKd28WHsVAXz7JzZokEgtyVQk1+Fhs5aJb8gdLgFZFy5236i4W6fjBz5TO7AVizx7sSi5whFrCQZ77ZM59HcYOSm8maO5RvPdpllB9PCYF+b6KSNw/OW21q5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sC93M3Np; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA969C4CEF0
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746024413;
	bh=XNDrA/UvJpEPOKxVBj/h4dnp1HsFFXopl/Wg/xhxjgE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sC93M3NpvfSWJOvApKZooDalnfAxNpOBn666dqMUJfPgInjvyDH5tWu7IL/TbNqrk
	 udAgio55nwUoA6HD0VmLNuxKev+PdnTmAtsj5Lht1ncbOk5alaUEqOECuPTm51kJVh
	 rjZPJ2b5ZWnyGJg4mlyDegp7lHFsQShtotNPQjhwKlS3aMTnZfobmLvX6LIxEpDvRA
	 ou0nzMLTw/WdXqH9Y87XqolicBsRz85Lm5zBkl4vwuXpKZcPmhYm/PZjZ6BJtOd0BZ
	 JCpIr+CgSiSj7YNoY2HGFN45+2+dw/4CgJGJvVxs6RvDf5v1k9vb4z4sO7atwuw15j
	 c/TOWzkLT0fDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E3966C433E1; Wed, 30 Apr 2025 14:46:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 30 Apr 2025 14:46:52 +0000
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
Message-ID: <bug-220016-208809-gTYzKo5oKh@https.bugzilla.kernel.org/>
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

--- Comment #32 from Steven A. Falco (stevenfalco@gmail.com) ---
I ran the experiment and attached the journal log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

