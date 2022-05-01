Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A94516468
	for <lists+linux-usb@lfdr.de>; Sun,  1 May 2022 14:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347158AbiEAMf3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 May 2022 08:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240202AbiEAMf2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 May 2022 08:35:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EC75C34C
        for <linux-usb@vger.kernel.org>; Sun,  1 May 2022 05:32:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1203B60E9C
        for <linux-usb@vger.kernel.org>; Sun,  1 May 2022 12:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66FAFC385AF
        for <linux-usb@vger.kernel.org>; Sun,  1 May 2022 12:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651408320;
        bh=SaNSB3AIPa0rQH4YmtVkK+rAaEFZvXkoZRFkgjTqzN4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ycobc+Leu4lgLt8beM3sx2kBUiSGBNe7BP/M20wm5IuTYXx8fKE8ORb0Yp/U/SSOr
         jwJYKnV6T+T0GpkwoZUs9NdVJHT8m61gDOR5ok+sPraxMEJNv7Y/ycFnRPcc55rljz
         U0vfmSEJgD3zxaIb4bhi6F2Mx1fzifJZUJzxQMd5dT9/BL3XjjIhg2p+ZVELt2n0xr
         dhNiXA357GL3aYbSSkaowWMzZpJP/60ShoXdmBhzNW9/igrmZh74RwCRHOo3Rv9KQz
         qv+vZc3YiRn3FGTLhjXCytO9DPscs6fC9sbUONnjcPU+/0e02kFoWsrqiZBK9upwR5
         swsmG81KiL2HA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 43704C05FD2; Sun,  1 May 2022 12:32:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date:   Sun, 01 May 2022 12:32:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: royston@shufflebotham.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-RZ4nUNh8DM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #1 from Royston Shufflebotham (royston@shufflebotham.org) ---
I just hit exactly the same issue when upgrading the kernel from v5.13.0-40=
 to
v5.15.0-27. With no devices plugged in, the USB hub reports everything as o=
k.
Plugging in a USB keyboard worked for a minute or two, and then I get exact=
ly
the same errors from [+0,229229] to [+0,000004] above.

Same USB controller chipset as OP by the looks of things. I've managed to l=
ist
the Capabilities in case that's any help:
03:00.0 USB controller: VIA Technologies, Inc. VL805/806 xHCI USB 3.0
Controller (rev 01) (prog-if 30 [XHCI])
        Subsystem: VIA Technologies, Inc. VL805/806 xHCI USB 3.0 Controller
        Flags: bus master, fast devsel, latency 0, IRQ 28, IOMMU group 12
        Memory at e0a00000 (64-bit, non-prefetchable) [size=3D4K]
        Capabilities: [80] Power Management version 3
        Capabilities: [90] MSI: Enable+ Count=3D1/4 Maskable- 64bit+
        Capabilities: [c4] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

Downgrading back to v5.13.0-40 fixes the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
