Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A460468103
	for <lists+linux-usb@lfdr.de>; Sat,  4 Dec 2021 01:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354194AbhLDAGR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 19:06:17 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:42552 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbhLDAGQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 19:06:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C8DFD62D60
        for <linux-usb@vger.kernel.org>; Sat,  4 Dec 2021 00:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 320D9C339E0
        for <linux-usb@vger.kernel.org>; Sat,  4 Dec 2021 00:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638576171;
        bh=MEZXZDOUwDLZBGxKO/sHrrBZ/qOUlsRaFrxMALyE88g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IOaUK0KMu2QvMT12sSA3fyty/CMwlze2RKaQtEAO2TRENey7B1fG9AVsDH+XmeHd1
         07RtLEUl5MrZmp+r0p6qQmfgXkmtJ75alj/cbvc0jG4TTvcOu21G+B9AqBMsrWABY4
         t+GwpmmzmkbpOwq4cUjrxbwdye0fm31YXMAPYIHgQZRQlVlMfBX8HZkgN/7FoT/FbC
         khl8XIFS4id3ly67nkoilGzDZhnNNjjjB/uSmpOtM3Vi3cI+51LjPBFsw7pxg7daJu
         UfNXygTsDt2pI+z1Y9NdFS4xEsYhAFn/76LMVXVpKNfIEJThp4/wCzYIgjeT+QxlDt
         BUjP8bwJw+jkQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 16FEC61101; Sat,  4 Dec 2021 00:02:51 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Sat, 04 Dec 2021 00:02:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: seanvk.dev@oregontracks.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214789-208809-O02Z0lpp2B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

Sean V Kelley (seanvk.dev@oregontracks.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |seanvk.dev@oregontracks.org

--- Comment #26 from Sean V Kelley (seanvk.dev@oregontracks.org) ---
Hi,

Thanks for reaching out Krzysztof.

So this platform is a Xeon E7-8867.  which makes it a broadwell based Xeon.=
=20

I don't see it in the logs, what is the reported device ID?  Those Xeon have
the capability disable the route to the ICH, which is these quirks are mean=
t to
work with.

It also looks like you are using an out of tree driver?  Is that correct?

Are you unable to use MSI with this device?

Sean

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
