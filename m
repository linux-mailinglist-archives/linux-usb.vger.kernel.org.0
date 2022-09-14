Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84EA55B8AE2
	for <lists+linux-usb@lfdr.de>; Wed, 14 Sep 2022 16:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiINOnt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Sep 2022 10:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiINOn3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Sep 2022 10:43:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5698359270
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 07:43:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D53661E0A
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 14:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF8FBC433D7
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663166604;
        bh=NS/QZDbM5WyfHS6Wtqhc6Nt3WI0d/DnYFOE3ahX+WME=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ocXF5YRCNKBiPABnaSst0dAmSwOrzO+GGc7lfmLtzUKzo/VKRTtnx97LCeWdAoClg
         l6udb16UhugjaLEi+/T1BJ9dVqf81kDFakDVd0CNipuN8oCX8JfirOAtWkw6K3aiiX
         UXXpjwbyUaxw3gJ66Ih+dYX4f/f9bvMKDHXIa8Tg4nbf2sD00Nhca8I5VmWESsvzyT
         Xaq0LEwfajOdJiNuVrRpyRdy9rEsmgTMwFGC5zN+s1qVgVAEsKz2958gHv/PG0xjou
         S1bFlD8B4NEC98FsB++5FcUOhlDBABqghBnqQJ0alMDmyD3fba9uBIFDzrjbJQjQ9d
         4sV+vsW6RXo5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B21F4C433E6; Wed, 14 Sep 2022 14:43:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216470] [Regression] xhci_hcd 0000:08:00.2: xHC error in
 resume, USBSTS 0x401, Reinit
Date:   Wed, 14 Sep 2022 14:43:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216470-208809-g11ybugQzi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216470-208809@https.bugzilla.kernel.org/>
References: <bug-216470-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216470

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #5 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Here is the fix queued up.
https://lore.kernel.org/linux-usb/02ef1ae2-9dae-6f02-9951-1230939f06e2@linu=
x.intel.com/T/#t

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
