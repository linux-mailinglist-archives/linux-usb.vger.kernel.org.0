Return-Path: <linux-usb+bounces-6017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7F784D238
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 20:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9AE0B25B60
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 19:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B5985946;
	Wed,  7 Feb 2024 19:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZopGZsHs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF622065
	for <linux-usb@vger.kernel.org>; Wed,  7 Feb 2024 19:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707334046; cv=none; b=bui8jNcS4w2acywokXD1nvpzjMZuKk7dnawKswt8e78vGWkiRVEEKoKSAMgBLPnUkKp3Xe/S7s+uwpwk5Y9BvDpDEKSlQtut3LmWJ/Gkvg2eQQ3ltJzQzlR8ENEmQhuQlQMxzlowEbBtMDJIqDkR8Jpjdph5/wCRj8fALuY9OV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707334046; c=relaxed/simple;
	bh=2E3opWgFxYNhGx3/bYjPiP39wqTIv0ShhoYTfU1KDTE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tos8vRMVjuOqime5Kz6B8uUJ5wMOQGDSMTCsQ6IT9ovEH1shxWvrDDNBmixEQX+Knev8EDwoKyMyyOCqtWbVD/JLfhf1k2kXHUcJdO+Pvrra1q/QctgBrXOLK8ezmNO+w6UaND8AUlNrHH4OFVWqQaP4SFbBairLleCboixyX6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZopGZsHs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C740C433C7
	for <linux-usb@vger.kernel.org>; Wed,  7 Feb 2024 19:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707334045;
	bh=2E3opWgFxYNhGx3/bYjPiP39wqTIv0ShhoYTfU1KDTE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZopGZsHsMelHSijO0JXuoEWhGpCvXhYLbjYhp5QgicrX69dkEnalwOxQK68HrPhHI
	 PhvH0RpYYRseSrNxubAPY/6QDM4rYB19go0RvaDnmqVtQd2ECx9sp1lylVcOFzedp6
	 G8AXApS5oIZVIvlRsgrGTK/p2BD4Cb+YXjnAP1Na2WzOyqgwoXprwoFrk2i/Bl6npC
	 7sPjRPNCK5imkbB/Pek0yu4GUD9Lls9NQdlwrRe3MruLarrVIcX9wk9hpRtDVizUoI
	 ehwKI1WdncrVsCZL2qj3h7d2nnE8vFWCOhWumOcPgpLynJjzQEvQxFNVObbfn1MlxH
	 zqor6X8Ks6IgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 562A6C53BD3; Wed,  7 Feb 2024 19:27:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216474] Dell XPS 13 9360/Dell DA300: USB Type-C: PCIe Bus
 Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
Date: Wed, 07 Feb 2024 19:27:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216474-208809-GWxzlpXgrj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216474-208809@https.bugzilla.kernel.org/>
References: <bug-216474-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216474

Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bjorn.helgaas@gmail.com

--- Comment #6 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
I am still seeing this with Linux 6.6.

> I am going to test with `pcie_aspm=3Doff` next week.

`pcie_aspm=3Doff` gets rid of the warnings.

Should a quirk be added for the device to enable `pcie_aspm=3Doff` by defau=
lt?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

