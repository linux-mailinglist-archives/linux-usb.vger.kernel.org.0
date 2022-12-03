Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B8D6413BC
	for <lists+linux-usb@lfdr.de>; Sat,  3 Dec 2022 03:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234804AbiLCCvc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Dec 2022 21:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235070AbiLCCv3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Dec 2022 21:51:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73B8E8007
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 18:51:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D404A6222C
        for <linux-usb@vger.kernel.org>; Sat,  3 Dec 2022 02:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41F49C433C1
        for <linux-usb@vger.kernel.org>; Sat,  3 Dec 2022 02:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670035886;
        bh=EiRG+o29c0YPrYN6FhFNrxkpujBZILkYq1j/0NSNf5g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sGHdmmVHeXGGirpEkpguQG6u5v6hsoRLsCEv/cGlxbfORFgyWKa/q61EQdLp00RKH
         pGfzG5A7aG9tfe/C0HdJikgLFLGRHbYrOam6ArQREqThmi+EnTgPO7Qgalu3zBjvhw
         1Bx/sNnSyoZVnJrRHjqwVHAMbHA/rHXiRD4NScn+9k+Sv2igrBI3Gcps9Le71+7hIr
         keTlbvtDbInpd6eGWaYdG9pmxPC/sk8hqMKO6CDug1AAPfXziZoW7eNNqRy/QksTCn
         uFSXD4EBNCye+4RElbY8uTKCoWSEtGjpk7WOLbtGC/kjY/Mb+NSlUfxk1hXBUm3A6H
         wTF6XjF0WJVdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 263DFC433E6; Sat,  3 Dec 2022 02:51:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216766] USB enumeration lockup
Date:   Sat, 03 Dec 2022 02:51:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216766-208809-t6IcfGuMaD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216766-208809@https.bugzilla.kernel.org/>
References: <bug-216766-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216766

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
Judging from the log, it looks like the problem is related to the xHCI
controller at 0000:06:00.3 (although another possibility is PCI, since the =
log
includes several PCI error messages).  The problem seems to begin when all =
the
USB devices connected to that controller disappear during the second system
resume and never show up again.

I suggest you send an email describing the problem (include a pointer to th=
is
Bugzilla entry) to the linux-usb@vger.kernel.org mailing list and CC: the x=
HCI
maintainer: Mathias Nyman <mathias.nyman@intel.com>.  He'll probably have s=
ome
requests for more tests you can run.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
