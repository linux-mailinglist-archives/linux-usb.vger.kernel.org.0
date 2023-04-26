Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140756EF7A1
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 17:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240511AbjDZPSP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 11:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbjDZPSN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 11:18:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E37230E5
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 08:18:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BFD4360FE3
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 15:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24C05C433EF
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682522292;
        bh=duJ9rudAo64/1QJQxctywlZkXp2UkI6t6mDtYqU6nAM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TbEfmNYIOXgNR6GGAXT93p9davjoB5TtoU1oBSDTKaa7joS5f2zV6uhPVcqGLhmmr
         iu46rwRC1O4FxbBKWHifg5yWrlwUPD9CEvXgV+eYtf2WyVLFeopPg3bnVG2HdWWAAJ
         msBv3Pxd6ULEAZtXTSpUJUhY9I86MkxDfDJElU7UcWeEPzT0DdiGb2VYnBA7rZc5UR
         PxwP3jN7inUgi4NkevzYzLIrEnnvtGdhUkNcjmph7Ql9bHXYj0ai3DT66Xl/l2D8am
         IVXDT1H4fcx1Jmko06H2FYJ3PGUMvbCY5mxySu8dW/2WEM4lPnQsLmy+X+lX8uuJn9
         FEnX7/q8WnbPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0E621C43143; Wed, 26 Apr 2023 15:18:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Wed, 26 Apr 2023 15:18:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-3VymVilhAz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #31 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thanks, I cleaned up the debug patch and turned into a real fix.
It can be found in my tree in the fix_ring_expansion branch:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git=20

https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=3Dfi=
x_ring_expansion

The larger rework of ring expansion is also done, but not very well tested.
If you can try it out as well it would be appreciated.
It can be found in the same tree in the rework_ring_expansion branch

https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=3Dre=
work_ring_expansion

In fear of regression I think I'll submit the smaller fix to 6.4 and older
stable kernels, and then rebase the larger rework on top of that, and submi=
t it
to usb-next. (6.5 kernels and later)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
