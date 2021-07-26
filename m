Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDAC3D52BA
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 07:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhGZE15 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 00:27:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:34252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhGZE15 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Jul 2021 00:27:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D1B16056B
        for <linux-usb@vger.kernel.org>; Mon, 26 Jul 2021 05:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627276106;
        bh=uGlP3oimI2kT2cDxpYRvXoFhzyUkwP/HQlJRQ5Hkm7E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LBQrK/MxX7+LWKzIaPUKlxutH54VREjftpUeUCaL44CcC7eLQ2Fdn6/K6RelPdynG
         +wUWideobCUGrSvvtbnJ8LIwiYh5dXrzYos+rJkmhGb5gSbnEzkn3jg1/sle0C3LBa
         EWVY0EWZ6pvG7BJoS4fA8v7AoziiH3yJq1t9Vuuq/Dl56PpdlwGa+dVNJq8Zle5ldS
         NhCKMPG8bPyQVZ50bbTRT/ytOttStbrixUqKvJ7m1bBsuTbyNe/os/Kbpr1UtXRTyg
         4mBzgSCvVU6+e0RZqGhwdl4AgsSQvXErCCvN3kM0b67cFvI6Tfhgo2Zzhcv9b1IAHa
         i5ALmUbx4VoUQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 83C9A60EB3; Mon, 26 Jul 2021 05:08:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Mon, 26 Jul 2021 05:08:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t123yh@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-5d0xEfCarN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #22 from Yunhao Tian (t123yh@outlook.com) ---
Hi Minas,

I changed UAC2_DEF_REQ_NUM to 8, still not working. The log is attached.

To make sure this value is actually changed, I added two debug prints in
u_audio.c. You can see the two printk's in the attached log.

for (i =3D 0; i < params->req_number; i++) {
  printk("REQ NUM (c) %d\n", i);  // <=3D=3D=3D Added
    if (!prm->reqs[i]) {
      printk("ALLOC %d\n", i);    // <=3D=3D=3D Added
      req =3D usb_ep_alloc_request(ep, GFP_ATOMIC);


The symptom is still the same, getting BNA interrupt. The log is attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
