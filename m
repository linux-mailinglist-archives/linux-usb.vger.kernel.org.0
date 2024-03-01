Return-Path: <linux-usb+bounces-7399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4CB86E6F5
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 18:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEA451F29498
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 17:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF9F5228;
	Fri,  1 Mar 2024 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5W9lrYX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2112F3E
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 17:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709313277; cv=none; b=MFNVVEbopZhyPMDIpZSDktpZ56nx3n1n6NiU+ef+2VEvIFcrk6jAV7G7Sy9qJISTdlgr+noUeEpJWsfGH65g5X/kv8yYppoYw0PgKlSwnl0CC4iRf+ZQJb4bU9fKdng18r2Qe4YsZwdppVtTSXECXq88Cr+uHNTMMDXlrU6qGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709313277; c=relaxed/simple;
	bh=y/EhCJ5Bhp82cnG3pPQ+DTzXkbwH9Jli7JXw1NxFHlk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WsIKZvE2rheNGhI4ycCznwJEriZJm21ATDr15ECwmwfkugIoPZFEY0k0B+NosqruFXQBtSRUXCZBnDhiImjMRxcz1AENB17NyYMRnMELdqJ6QfCVKEUqSKgewsJWy8viGc3YfyemOlKdWIopBfHBSHvTk9nt8EMqrZw+Q/8b6+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5W9lrYX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 628F8C43390
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 17:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709313277;
	bh=y/EhCJ5Bhp82cnG3pPQ+DTzXkbwH9Jli7JXw1NxFHlk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j5W9lrYXHetmXiXcAGMAvSv7MZz5LNYZTEsG2zPdXtc+pDoenIKeXRjZ81IEIv2sS
	 RzOXLwPur25HxUDS+KNbxJtJ5O+6RjMqr6A9epkTldbkqyw7B3lSNxNIc37730qQ+V
	 LQmWLx7ehK/Cp7xjW21QIJ9k01Y3gxCIgA5dztqABr4HpWB09ySCatBJrF7fKMy7AM
	 +BTBmthDTedWoB9H1CuL3nPuKr18QME3RTHw48iFImgrJcTPGe+svXnXFHuT/SqVEY
	 Oahocr3xSYPd4m/9urDQVBlEXk/I4OCqCA232/OGZ4LVQgM892G1LI4SqESlkZUdBR
	 +n603m8mcgygQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4D5DEC53BD0; Fri,  1 Mar 2024 17:14:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 01 Mar 2024 17:14:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ibmalone@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218544-208809-4XXOQPJ3Pl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

--- Comment #6 from Ian Malone (ibmalone@gmail.com) ---
Created attachment 305938
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305938&action=3Dedit
/sys/kernel/debug/usb/devices other devices disabled

Disabling the onboard camera, bluetooth and (other bus, but for good measur=
e)
qmi_wwan:
# echo 0 > /sys/bus/usb/devices/1-1.4/bConfigurationValue
# echo 0 > /sys/bus/usb/devices/1-1.6/bConfigurationValue
# echo 0 > /sys/bus/usb/devices/2-1.4/bConfigurationValue

(/sys/kernel/debug/usb/devices attached) sadly the same problem. I've also
tried blacklisting the modules for the other devices (uvcvideo, btusb,
qcserial, qmi_wwan) with no change. The rear port appears to be the other b=
us,
but using that also has the same result:
# lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/3p, 480M
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/6p, 480M
        |__ Port 004: Dev 003, 12M
        |__ Port 006: Dev 004, 480M
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/3p, 480M
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
        |__ Port 001: Dev 004, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio,=
 12M
        |__ Port 001: Dev 004, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio,=
 12M
        |__ Port 001: Dev 004, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio,=
 12M
        |__ Port 001: Dev 004, If 3, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
        |__ Port 004: Dev 003, 480M

(All three devices are onboard, so difficult to remove)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

