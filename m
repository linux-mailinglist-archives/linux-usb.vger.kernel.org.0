Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D132A5A3D5C
	for <lists+linux-usb@lfdr.de>; Sun, 28 Aug 2022 13:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbiH1L2s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Aug 2022 07:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiH1L2q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Aug 2022 07:28:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F6933E20
        for <linux-usb@vger.kernel.org>; Sun, 28 Aug 2022 04:28:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D803AB80A4D
        for <linux-usb@vger.kernel.org>; Sun, 28 Aug 2022 11:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6CD8C433C1
        for <linux-usb@vger.kernel.org>; Sun, 28 Aug 2022 11:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661686122;
        bh=lIDlmObMZ0X3fRWJaB16CW8+MAFPh00gPu9qslNIE8c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Kx/G3gFfVVNdWcX8L4fKpG133Jv/idWb4HhE4e6S29wJGPY299vr/AkNvu/QMUWIg
         13yjF47lpPd342HmQbq953z3itHIcHrscTD8TluOKUmEtMs2IfZu+YBNRfn3czNpZp
         KEpGwbjZKaufDly+PkG4V4tdFggz7wCL8EaW0z2BFfeTjAHgFxnHgKHFXfwsbq4GJb
         Q8VX9OAdFo9XENkS1vcR80vIc4jyVwtnFnHQIFedJx0+ViJWlAF7P4Wq3MBwq+Z8qe
         5B8XFTwIQXrV9ZaOO1rTe0nfnxs3Xb0M4FVtvAcZfjBydasUr9lUGy4eN1O5hgGcMr
         W9sFOwVC1K+wQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 938C1C433E7; Sun, 28 Aug 2022 11:28:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216422] BUG: kernel NULL pointer dereference, address:
 0000000000000000
Date:   Sun, 28 Aug 2022 11:28:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216422-208809-R87IMgW2bj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216422-208809@https.bugzilla.kernel.org/>
References: <bug-216422-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216422

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info,
                   |                            |tiwai@suse.de

--- Comment #3 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Thx for the bisect. That commits is known to cause some trouble. See this
thread:
https://lore.kernel.org/all/87r11cmbx0.wl-tiwai@suse.de/

A fix for that problem is heading towards mainline currently:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?h=3Dmaster&id=3D5f73aa2cf8bef4a39baa1591c3144ede4788826e

Might be worth giving it a shot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
