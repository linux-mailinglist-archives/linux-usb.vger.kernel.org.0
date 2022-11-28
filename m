Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9A7863A652
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 11:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiK1KrU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 05:47:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiK1KrT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 05:47:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB47017583
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 02:47:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 47C146108A
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 10:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2B03C433D7
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669632437;
        bh=1/NxSMmyYljBKMbfb85Q9TnezpE2BlPPyFUj+NrsFzk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oeSoR6rFluXxw4xypCv7m5SmfaSAbKsApw8XjfjUgvRXGtbxKr/erHBXNLZqJEAeB
         wC+vq0WrHIzEyAkaM8N+c8eOEu5syprDwwRfhPYkyqst8v15w//LZ91TyET1Y7m6I4
         St30iJHPtMkoseVIhftLCNX38rSNx7OdYhADq52wRrTf24cu1QuAZRxhdw65Hinsiu
         ZgFJQQeCrPoeNmzBqPOu56rvR+DWJMkFOkmvGhvJ4GlBkgKGuVdGuSl9ZHzNNMt/4z
         ZWxnp7lishiGBXYAOh9HQRVHsAdzFi3r1JQ6Hq9lE6dsA4NhIKxyu6gt5u7ps+XjgR
         B+AdcX60k7/oQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 856CAC433E7; Mon, 28 Nov 2022 10:47:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Mon, 28 Nov 2022 10:47:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-mcpKAhJn8Z@https.bugzilla.kernel.org/>
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

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #7 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
dmesg is from a 5.15.0-52-generic kernel.
There are some changes in pci code in this area since then.
Does a 6.0 or 6.1-rc kernel behave the same?

The "HC died; cleaning up" message is expected when xhci driver
can't read a mmio xHC registers (gets 0xffffffff).
This is normally the case when PCI device is removed, or as in this
case not yet powered (still in D3)

No idea why PCI link fails to go to D0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
