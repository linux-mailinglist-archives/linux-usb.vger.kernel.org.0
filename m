Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B21E6083E8
	for <lists+linux-usb@lfdr.de>; Sat, 22 Oct 2022 05:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiJVDmB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Oct 2022 23:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiJVDl4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 23:41:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A59D275BB4
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 20:41:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C6AA60EF9
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 03:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01CA7C4347C
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 03:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666410109;
        bh=uW/J2sYl2QYLJhnIk4+CsQiUd9sV5AUVnpvbhuw6bvs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Cg2ejygDLkfBSZQ6kPuKUxj8iplK6FsxxWk9HlsZVmaY1E1x3ihwvPFDPePBvsryb
         JTeSY6+8Ui/pQXrmmunyvMxAnmXVTLpws2AXQA7eBhpcNgsptfmM8M7NxDHqxQfyuY
         Bndsx1eXpUE647lt72Xj0Ipo4ix15rZY042mKYrdJh/odjNb0NnsSW7eNSLmDszuPR
         9qJEWpVimmggdQaznXWbzBc5l2OL8peUDVgfihoVEaR8cGr+kvWGQq5IjZPlESrkdb
         FoaLKIQV3jwJ46loh3MobWzZ5dVO/sZi3IZiok3Vjsv2Nv5JPN0ofuVjnPAQ80b2uH
         wYR6oOxd2LI6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E6188C433E4; Sat, 22 Oct 2022 03:41:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216588] RTL9210(B) falsely detected as rotational disk
Date:   Sat, 22 Oct 2022 03:41:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mkp@mkp.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216588-208809-JcHotynafa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216588-208809@https.bugzilla.kernel.org/>
References: <bug-216588-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216588

Martin K. Petersen (mkp@mkp.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mkp@mkp.net

--- Comment #3 from Martin K. Petersen (mkp@mkp.net) ---
I propose you create a udev rule to override what the device firmware
erroneously reports.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
