Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8571A39804B
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 06:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhFBE13 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 00:27:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:35628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229469AbhFBE13 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 00:27:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2D5DB6108C
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 04:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622607947;
        bh=EeUSZ5YMyW7KVeAVG9XiJP90/W8L1H+hnOEINRRtJlM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=exhQt52dq5qnXblpNp+uDoc5phPTnQPCQu3xMQmZcjKSRhXXoWpyv8pOdMjaH6DIm
         3MOZWMWkNIVUosiQ24LzjIJFluBUojfevOT+wM78XCHysTQqfZV2dNBHA1m4sTYBz/
         MGcM4doYanRqBEtq9n4mJVHty2N3NJeE4zyHs6iyYNucFu66Cy6aD4XgJk5f7PNBFG
         AQnQfTZag61wae7K2cDL/c8erzBfOMWJtMLQ0TSXxcfbZQRJno7bH1nDQe7/rVftdr
         FBCKl5QuygvO4JKCvo1PgqIIaLdq/Y+u1USpvQtoh81/dRxrmWBBMFgEuHGXFFEdmb
         S0AEX0fGNKzKA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1A4AD61155; Wed,  2 Jun 2021 04:25:47 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Wed, 02 Jun 2021 04:25:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-mrRVLwVyXw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #12 from Lucas Endres (jaffa225man@gmail.com) ---
(In reply to Alan Stern from comment #9)
> Interesting.  I don't see any particular differences as far as the USB co=
re
> is concerned, but there are major differences in the way the device gets
> used.  You can even see it in the dmesg output:
>=20
> [  963.375444] usb 4-1.5: 0:1: add audio endpoint 0x2
> [  963.376273] usb 4-1.5: 1:1: add audio endpoint 0x81
>=20
> Those lines are present in 5.9 but not in 5.12, and they occur before the
> problem happens.  These messages may not be directly relevant to the prob=
lem
> at hand, but they do point to changes in the audio drivers.  Those changes
> may expose a bug somewhere else.
>=20
> Judging from these results, I will guess that your bisection tests will
> pinpoint a commit that affects the snd-ua101 audio driver.

I'm not on a RISC processor, by the way, just a run-of-the-mill intel i5-24=
00.
So, yes, to me this seems to be a wider commit that may affect much more.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
