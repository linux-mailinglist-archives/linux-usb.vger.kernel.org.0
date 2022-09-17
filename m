Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFE05BB9BC
	for <lists+linux-usb@lfdr.de>; Sat, 17 Sep 2022 19:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiIQRNF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Sep 2022 13:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiIQRND (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Sep 2022 13:13:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC223056C
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 10:13:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA8E2B80C90
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 17:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34E02C433D7
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663434780;
        bh=MZSJ411GxeSCSyc7cVl9u5wAHKgKlww4kYiCIhLDxHM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JbXBFjmkMrvM5RNNeOovqNjDB4VIH+MlDrjaspxUWJMFCFOODKjxw9f/3CFtRClOR
         LktLw6ZBMAi5WQUJpmR+yxAHkMEsqU1iGnLCyWW0YRqSazfJkzm65NF1Pw+IH0KSTK
         NS+/EgPOHeG8utbbbBJnBcbpeRKmjrnNMIp+aMLNRV/vHCIkvP92WRUL/nkyvpPMGe
         aUp3EKCSk7Wr7RHrMnxlfNmwBc3e0rYq6OPJg4ud9Fk/pmYqCwAsO7/1XqU0yNTX++
         mTJXEOD5twgydoguhz6pDFiwAcmsvEeZqQL07gFjrOnzn/U8rgZKJeElxvKzbXMDaN
         qNjwVSAlxLH6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 161A8C433E4; Sat, 17 Sep 2022 17:13:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Sat, 17 Sep 2022 17:12:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhnmlkvch9@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216497-208809-uFp0ps074i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

--- Comment #1 from Jonny Mako (jhnmlkvch9@gmail.com) ---
Ethernet port also does not work. So everything except the DisplayPorts on =
the
dock stopped working with the kernel update.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
