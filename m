Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9C651994B
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 10:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346076AbiEDINo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 04:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346069AbiEDINm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 04:13:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7B122520
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 01:10:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC9AB61790
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 08:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 473BCC385AE
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651651806;
        bh=hofRbXzBQUPdRUUAKAY21BXrTtXFJmcOrtZi1ETr6qY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=K0C37l53cCHeNRY2tk+W63QtOuzVWN19VpnV3Cx1B5RBQU7eFAv8dldk9yRiVHkfV
         4eHbK3DBCcOcbrrFIZ+iEuJGhy6e3KaBEoqLWAqSAylB/w5hdoafLFlU6NMGA3KUfs
         B07mLWwKeTwIUqFk7xqxMUkt9mG+rj/ZhkHuSa6BBd7Jsu6eCN4xmWuosmTrC3yiNY
         pnf1a1W3tV60cKlsvuIK7Frfd97QudDaz4dF2XXkTDv/bQ47qJT140kxfyZOv5aWAo
         8+fb3Oslbyn7mnI3wN0/jkgbnFazTiN+m+dJqjwVWPNVsa4u17azUiHcM0WETLXD8W
         FmBYTKgx0IhTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 11BDECAC6E2; Wed,  4 May 2022 08:10:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date:   Wed, 04 May 2022 08:10:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lukas@wunner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215740-208809-XfbdvoLzuo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Lukas Wunner (lukas@wunner.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lukas@wunner.de

--- Comment #6 from Lukas Wunner (lukas@wunner.de) ---
Ferry Toth reports that the warning only occurs when connecting a LAN9514 U=
SB
Ethernet (drivers/net/usb/smsc95xx.c). Other USB devices (memory sticks, Wi=
Fi,
Bluetooth) do not trigger the warning:

https://lore.kernel.org/netdev/2a436486-a54d-a9b3-d839-232a38653af3@gmail.c=
om/

Curiously, the above-linked other reports seem to indicate that the warning
occurs when connecting USB hubs. It's unclear what those have in common with
the LAN9514.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
