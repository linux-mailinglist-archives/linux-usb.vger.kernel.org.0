Return-Path: <linux-usb+bounces-16610-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091039AD5C9
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 22:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D401F22796
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 20:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921581E7C2B;
	Wed, 23 Oct 2024 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjYYIcH6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA621E6DFE
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 20:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729716584; cv=none; b=pbTTAuMND0HoiAG9dTsWFILTuC1QtAjSV8EHBaRdjfieM2fGyETAMlSK2MjK7CB42gP3dLAGg03eCaWXeX16ProfWZDC6V+YrHyk9tvq9kwN7peWiccMJLt+VbdPYybJE3gYZ+27p7RibfMgynaqNvvaOYqrxs5Zhg5oMIlEv/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729716584; c=relaxed/simple;
	bh=nQOzNg9ry2tFWdaXtLNrIFtu3EScL4MyruylaSdHO2I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PC3uMTXZ5bPkQ55xf2zPF5EIMy17RGEga/1RlK8FJQWAZ/55ggUtotqmHwY76ZTze1VHebyUJ7CAW4G0vWnHyAhCIAdQCvH4KTNRnlblN7LoyJaReHnsewbkpqvkPW1VnVZ6RAJom+NEJaIpBRcWET8q2cMBiveKrNQwIsUS8EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjYYIcH6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABBDCC4CEE9
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729716583;
	bh=nQOzNg9ry2tFWdaXtLNrIFtu3EScL4MyruylaSdHO2I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TjYYIcH6qpw4iImNlpRQDbnPuX7M5q8sP8+W4Vl/U+t9Md2dvon6oBRz9t3iSfIK4
	 Gm12OqlCXr/rXqMxgprI80VzWb5kGCQinz03SIO5xfoxc+3GbR2xidm2F2eyPK98OY
	 qsrRC65kZ+LEoxEeQL6BnokeKPcfZO9nBu9sYzt64BACfj95NDR/h/o421g4Husfod
	 OuZqCwX2H5JbEO6MTsO2QKf+GDyZS9BLfuchhS8tqE94nS4A2U6mMzNRY83tZH8f4t
	 Ttxiwkotj5cCssPQ6qoGEh7eNP5+tp2PIK1xN/uKwgObnRA4XyLVTxW+hVQoEWnfD9
	 3vuVD9RfNrkpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A36B5C53BCE; Wed, 23 Oct 2024 20:49:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219422] Hard crash when USB4 cable is disconnected during sleep
Date: Wed, 23 Oct 2024 20:49:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_pci@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-219422-208809-dXoietfYIj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219422-208809@https.bugzilla.kernel.org/>
References: <bug-219422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219422

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |PCI
           Assignee|drivers_usb@kernel-bugs.ker |drivers_pci@kernel-bugs.osd
                   |nel.org                     |l.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

