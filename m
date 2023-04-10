Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48CDC6DCA06
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 19:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjDJRcW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 13:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjDJRcV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 13:32:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642551BC7
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 10:32:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F2CD461DEB
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 17:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58DB0C4339C
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681147939;
        bh=Vnb1Aqk2fU+KP4YnX2Bc5ojXoytrll3ckj6AYi/sYiU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KHrRRsEA56rPxrgXJMrh7YZz0/drADLX1ACImXomOiUsET0kHN4LCRgDY8uweH+5H
         Witd9C54ZY27s+U+hs1d647onv4xH1J9YZicps9dLY3AG5c2DlS4ROPNKxLJXTORmm
         m2g+XdpnUHPbmAJ5awcFL8SokejuNq+xmoAM8Q7TuTmoZWP59s8xw2viD4MJrkMj9u
         q5oTlQij/1bNTt1k+hkwPNjRpKWPLAYZytWligZObLtsjPzXN8gqJBBTv6NT1oS/fB
         Ug8u9mr6MgN3d3DIv1i69T1rP9/BTxETdB2x97OCmqxqf5ElUiDRw5MBH1MAhvirOS
         IYh363zz51uvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3BC19C43142; Mon, 10 Apr 2023 17:32:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Mon, 10 Apr 2023 17:32:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: austin.domino@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-1VaI2YYvmB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #12 from Austin Domino (austin.domino@hotmail.com) ---
After some more testing, I found this bug was most likely introduced between
kernel version 5.11 and 5.13, but more testing will need to be done to narr=
ow
verify and narrow things down further.  Although, it should be noted that t=
he
lockup that occurred on kernel version 5.13 appeared in a slightly different
manner than I've seen before.  I've uploaded a short exert from that kernel
log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
