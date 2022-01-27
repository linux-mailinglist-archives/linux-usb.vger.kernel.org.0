Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B22149DBD5
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 08:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237463AbiA0HqD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 02:46:03 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:39166 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237459AbiA0HqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jan 2022 02:46:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7E0161A00
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 07:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B24DC340E4
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643269560;
        bh=/daDGQQlUfReSuoT80iYWoLAs46dDYz7tVKZ0T9kuyY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZFz6RaF57fbf9AXMbrXmWs451ll0XAoSAt+YZj/MwfHmf0tYVT/FEZpHB6qgpfK5i
         6wa55VXkBSdZ75jO10lHeTRuzkEyesfEkls6sZycirXYieaH1oOhmeaBNTLdyQYYTm
         7QWhR8cBkkRk+0+zEJeobObX4GOxdbfiLi7q61UyaC75u1yWMWQKv7ZUjHdj+1hg0Z
         7bbbFhZH38PRf3LYuK05LV3sJJ9Mh/FKN497hcszpBxAO2TR4YQs9gVTd+YvnMIDaQ
         GfnH4QmQEWZ7Wte4bxVpn7cs2RubGK4oHnN1rbszw8yusBO1/SnpHd734gzbB3/wiF
         R8bCPOKt03RIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1F93FCC13B2; Thu, 27 Jan 2022 07:46:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Thu, 27 Jan 2022 07:45:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215361-208809-uc72ZkurZE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

--- Comment #10 from Ross Maynard (bids.7405@bigpond.com) ---
Hi Oliver,

Please see attached: lsusb.txt

Thanks

On 27/1/22 5:00 pm, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215361
>
> Oliver Neukum (oliver@neukum.org) changed:
>
>             What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>                   CC|                            |oliver@neukum.org
>
> --- Comment #9 from Oliver Neukum (oliver@neukum.org) ---
> The SL-6000 is explicitly listed with the device and vendor IDs given her=
e.
> Looks like multiple versions of the same device. Please give the output of
> 'lsusb -v' for your device.
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
