Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 801F063D673
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 14:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbiK3NR7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 08:17:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbiK3NR6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 08:17:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511AA20BF6
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 05:17:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E25C661AC1
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 13:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 491B9C433C1
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669814276;
        bh=Z1OjzxMWdwX8m7X+IwVQkpIHHc3uGhN6z3uFrjfk08c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=n/lZOGAfh3byNKgwKNjKrOspn/R//Xvtaenqa0lfSOlGVMiRHhqhNZxItUUAzluys
         +m/7V1LEAiQs1p//AMSEDfNzh+GCCfYnQV9sMKCngJIZWinUNUnL2YOWzgwDcuzopi
         w6ktyv48hMIGcaufGzcVrNymY3cFj++B9WowpizxPtw11ZS8JaO0QOYNyRz6TEeIzU
         Ve/KG++ui13Bct6giF/0qitoGONRTT1BkfJPQm/iq4ERZh/XMX1XCwzR1pBHuvyBWh
         2BfwGEZA2QglWogbto3at+X9bvo+hW59WHqykg9B6UtfBpxGA5Jxtos6mH96tyVXfP
         4T+3QugUvv9GA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 313BAC433E7; Wed, 30 Nov 2022 13:17:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 30 Nov 2022 13:17:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-o8TyWcVAD7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #17 from Chris Chiu (chris.chiu@canonical.com) ---
           +-1c.0-[01]----00.0  Realtek Semiconductor Co., Ltd. RTS525A PCI
Express Card Reader
           +-1c.4-[02-6b]----00.0-[03-6b]--+-00.0-[04]----00.0  Intel
Corporation JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018]
           |                               +-01.0-[05-37]--
           |                               +-02.0-[38]----00.0  Intel
Corporation JHL7540 Thunderbolt 3 USB Controller [Titan Ridge 4C 2018]
           |                               \-04.0-[39-6b]--


I disabled the aspm by assign 0 individually to=20
/sys/devices/pci0000:00/0000:00:1c.4/0000:02:00.0/0000:03:02.0/0000:38:00.0=
/link/l1_aspm

and=20

/sys/devices/pci0000:00/0000:00:1c.4/0000:02:00.0/link/l1_2_aspm
/sys/devices/pci0000:00/0000:00:1c.4/0000:02:00.0/link/l1_1_aspm
/sys/devices/pci0000:00/0000:00:1c.4/0000:02:00.0/link/l1_aspm

The same problem happens.

But I found something interesting which makes difference. If I disabled the
"Wake on Dell USB-C dock" feature in BIOS setting, the problem will be gone.
That matches the finding in the description, the power state change failure
will always happens then the HC died after. I'll ask more detail about this
feature. But also need suggestion about how we should handle this unexpected
wakeup for the xhci_hcd.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
