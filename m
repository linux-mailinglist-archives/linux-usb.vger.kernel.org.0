Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B22234F8951
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 00:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbiDGV1S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 17:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbiDGV1H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 17:27:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2DD19C5A6
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 14:25:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D8E68B82998
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 21:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4504C385AC
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649366700;
        bh=8aizIFoYZlYFL5SzA32+n2FF3eNN39p6Is/673GJj2A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=g690b8AYUSb8gJizgMMq/gf/3J8ToPZKUHlfk//e1Bjz38LQyOB1qflCz44LeHre9
         kNp/l/fBwIT04GRKh+5ojPTe2u4ZcEWaAFQ4zgr7SSRg+8LF8bniiAVSnZ2Uu603Xd
         R4ur3dIK6l4aC/bpxgMgq53jHTCK2YXxPbJt7+YsrvZgCocDKxFlRVmb9c0cuqeUy5
         f7BYjzFqIw9pm7y3daqRt1pfoahBdxRLJ1J+C1ohK7ZdeOyzs+pitRWu2ZLa7j3cyt
         5eqHu/tNWf0Gi0E6GGjihffrRHai1oKjI0R7WxKJZStl5TKPrbUN82MKvoCkSL7ELq
         qlteedNb0IJ4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 88478CC13AD; Thu,  7 Apr 2022 21:25:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Thu, 07 Apr 2022 21:25:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stygarfield@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-214021-208809-m31Z8RLaSg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

stygarfield@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stygarfield@gmail.com

--- Comment #17 from stygarfield@gmail.com ---
Created attachment 300715
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300715&action=3Dedit
output of journalctl -b | grep -E "(xhci|\: usb)"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
