Return-Path: <linux-usb+bounces-17135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D379BD378
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 18:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FA24283592
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 17:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532311E25FB;
	Tue,  5 Nov 2024 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYiubnPQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92A31D5AB2
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828188; cv=none; b=hZ47fETSIY9A2dga9EqwizX9205uVt4bBqYKUH2l1u4us/cUmNmqhCTt5GyZteQvDqDzZw2+8vX7XVwFUGmi7QfCOn3BXaluJyEkJWpbVMd/HnQ3f/2UN6e/EPvhTy0vK7e0c4EyX1ObM/+MbgW1TX6qyw6GNu5+2JqbfIsQf5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828188; c=relaxed/simple;
	bh=zlStYau5pSHxM5HBVbEtdC+J9GVVdObNcUqOa8YdBuk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EEbVrUYE87qIJbxAon/iGLtf2T5IDPFXBm3lmFSHjm93XjQqNgHvf1HG94MIknTwF5LLvulPDiQSAKVMluEXykmoDnqEh/qRCXjMc/7XYdNr68ZVuWUBV6UgpdjJIPZfZ827HxFh3Tn7hD0K2T6NJaHDdX9eaXDA8nZ04rw1SQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYiubnPQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68FF8C4CED1
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730828188;
	bh=zlStYau5pSHxM5HBVbEtdC+J9GVVdObNcUqOa8YdBuk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GYiubnPQJILiowAKGHPNeEjHPjYBPt8Ia9wzIsZS9xJJ0uQybBf0pRuQHesZJ7fBu
	 DLXYo1ss6E0b7Mtf68I87kRE3hu6bcc/cJ4KvVeTH0urdLAA8ooZWrme/84xChMUMn
	 slVRcGsGxga+4UWZrbmR46yZ8H7JzxDr8/AbGLbwoH8se4ZZBVBt10DrcFfdiw5NI7
	 1F3ELDlClXSUVkJgUE2lf+kwjbecb5tAnFNCEkCTECXsnu+7xXXJ81mJDXCRivewHv
	 OEaJBbciQK2I7O9NBpuEMzZPh91VA+dF6nTLdNM9o67iqHniZBPmqxVUfiwpKt7eXQ
	 ctirKMZMZDoMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5FA13C53BC4; Tue,  5 Nov 2024 17:36:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] USB4 / Thunderbolt + AMD: unstable and slow link (many
 uncorrectable errors)
Date: Tue, 05 Nov 2024 17:36:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glite60@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218795-208809-6hXnnhdwQh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218795-208809@https.bugzilla.kernel.org/>
References: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

--- Comment #2 from Eduard Kachur (glite60@gmail.com) ---
Created attachment 307145
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307145&action=3Dedit
trace log with thunderbolt and pci

I have similar case with eGPU and VFIO passtrough into Windows VM, which
crashes.

Laptop specs
HP Zbook Firefly G10 A=20
Ryzen 7 7840 HS
Wikingoo Q1L box with JHL6340, also bought and tried Wikingoo P1-60W-M with
JHL7440 told by manufacturer, but lspci names it JHL7540.
Nvidia Quadro P1000
Ubuntu 24.10 Kernel 6.11

System gives lots of:
[ 6323.581954] pcieport 0000:00:04.1: AER: Correctable error message receiv=
ed
from 0000:64:01.0
[ 6323.581966] pcieport 0000:64:01.0: PCIe Bus Error: severity=3DCorrectabl=
e,
type=3DData Link Layer, (Receiver ID)
[ 6323.581969] pcieport 0000:64:01.0:   device [8086:15da] error
status/mask=3D00000080/00002000
[ 6323.581973] pcieport 0000:64:01.0:    [ 7] BadDLLP=20=20=20=20=20

And eventually crashes VM with:
[ 6360.466620] pcieport 0000:00:04.1: AER: Multiple Uncorrectable (Non-Fata=
l)
error message received from 0000:65:00.0
[ 6360.466648] vfio-pci 0000:65:00.0: PCIe Bus Error: severity=3DUncorrecta=
ble
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 6360.466652] vfio-pci 0000:65:00.0:   device [10de:1cb1] error
status/mask=3D00004000/00000000
[ 6360.466655] vfio-pci 0000:65:00.0:    [14] CmpltTO                (First)

Box with newer JHL7440 doesn't have so many BadDLLP errors, but also crashes
with  CmpltTO.
Without passtrough and Nvidia driver on host system there are still lots of
BadDLLP errors, but I haven't seen a crash.

I tried pcie_aspm=3Doff with those boxes, but they are not initialized in t=
hat
case with hotplug and in coldboot case, Intel based system has same behavio=
ur.
pcie_aspm=3Dforce causes some additional errors on PCIe bus.

Possible workaround for me to get a stable system with passtrough is to use
pci=3Dnommconf, but this causes graphical glitches on host GPU in 3D render=
ing
case.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

