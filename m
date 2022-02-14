Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 387974B5133
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 14:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244408AbiBNNJc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 08:09:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233014AbiBNNJb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 08:09:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719DD4EA0F
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 05:09:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D230614AC
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 13:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68E73C340F2
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644844163;
        bh=0Rq/4oIuLUdCb9eDMj2LoWB6Fkohu4I++KvT6HcvgmU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CWqHBqDsc2Srg78JkgabMiaG5Us2WI1bknKE7LJnaoE1+r3PCA0HCdJyAOZ9KYepM
         VgmN/VQ0H1yYR44+lSUOhUrqO5xV5cspS0ycjVMJlYoqQFeCEyglsg9lunuU+Eyxnq
         cVU3vy5SPwyPjNfg/eIAEU1nNY5Vlx2/k/nKBcl3ksp+/0zRgqzdiXTgySQQSrJ99B
         wFai4y+2tMmUWt4xjgOM2vLcevZ8LjJAHg5UXBCGvAXwbV3FjJ/WDGeKD4+h5y4+p5
         LFpCJ3oLEBa6OGSXa4Uos7MYRLiuR6dADPrzzG0hBj6vYMQxwXliroQ77SYUK4Bogh
         wqCbUZmE7Nvsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 53A86CC13A6; Mon, 14 Feb 2022 13:09:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Mon, 14 Feb 2022 13:09:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215561-208809-ej8Sp0xM47@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

Takashi Iwai (tiwai@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #15 from Takashi Iwai (tiwai@suse.de) ---
Good to hear.

The fix patch was submitted and merged to sound.git tree for the next PR:
  https://lore.kernel.org/r/20220214125711.20531-1-tiwai@suse.de

It'll be backported to stable tree once after it gets merged to Linus tree.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
