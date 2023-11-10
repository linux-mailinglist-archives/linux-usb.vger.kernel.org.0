Return-Path: <linux-usb+bounces-2770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E01E77E7ABB
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 10:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80530B21018
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 09:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE103125A1;
	Fri, 10 Nov 2023 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/G9c7zh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8E11CB2
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 09:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9C1CC433C7
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699608255;
	bh=hlaxDNnPYcudpf/c3aXDxvCrWfnDfYCesQ/GK8mZsu4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u/G9c7zh1YQoNwz7rUf3dQYPAlih3RWjAVPRI6PdIxodOCUSG2qqHmMxPbX/1Icd/
	 cT8U0pbXw5wZh8rMgMaoFvXc6uVQ7IL8kwiw7+AL0HD7X8xHRKf5trjxF1gLdzFcj+
	 3STihk4SlMG/BibemkeQLzWdkad+jqOQJ/6QTe7VDJ8t/D8Y4/OFftyZx48uoUNJQn
	 hfgw6oETIJfmpd8vpnc8/tFcmKWwxUWPAmpgiCwk+KqSEyVXWyFmQPh+YXHX1AZVJD
	 xTS1jeicDuH6GQYcG7Vg5UVfDeyIpzBrjPVIdUNLY5JjfjHwflb9v9OfA41Zt+gO2f
	 4EcWeuFofDv/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B8B43C4332E; Fri, 10 Nov 2023 09:24:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218118] USB3 port does not work on Chromebook XE303C12 with
 Linux kernel 6.5.11
Date: Fri, 10 Nov 2023 09:24:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quark@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218118-208809-rdeg8hLaTH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218118-208809@https.bugzilla.kernel.org/>
References: <bug-218118-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218118

--- Comment #5 from Andrew (quark@disroot.org) ---
Created attachment 305391
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305391&action=3Dedit
config patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

