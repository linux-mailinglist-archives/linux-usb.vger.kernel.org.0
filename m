Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109B26E15C3
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 22:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjDMUXn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 16:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjDMUXm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 16:23:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A9476B9
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 13:23:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9DF7964166
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 20:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE0FBC433D2
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 20:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681417419;
        bh=l7WZ/osyiuWjA0bgHSyeYhqoCOX/Pw6774SLybIILqo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MF/lAUWErk8ypd8gI4Sqt8igK3yf2fjg1gzL3xtlMK0CY/Oo1c6wsZ0jyu9ivg5Pg
         Fy6+MVHYXWYcv2EVD0FL359oCg0FcWG16OiJNhDUkLDTb0aUBVK34qr/h+WnnQPoRY
         9Qbf8UokqqTeR6HPOvdRg1/k9xE9mF/ZveICZiwo8P9fxbr2i1ojetuTSKt90+6wVe
         ucubYu+TXEhIuEbAlQa7IM3TntFQd2uy2zJrzSd/RRJXlu4MZP/QlWipxsdK+7I1/X
         Di9e7AyM7WyCd5dTbZOXs2XJ//d+R8CfyPOmDUM1IIuKb+rTnEVKSW3JL588bWmBa+
         RIjlh8cAXFTnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D0E23C43141; Thu, 13 Apr 2023 20:23:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Thu, 13 Apr 2023 20:23:38 +0000
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
Message-ID: <bug-217242-208809-Fuc50DVHof@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #18 from Austin Domino (austin.domino@hotmail.com) ---
I've narrowed down when this bug first appears to the 5.12 kernel release; I
ran a couple computers for a week on kernel version 5.11 and ran into 0
problems while running a program like the one above, but before doing this,=
 I
had 1 of those computers on kernel version 5.12 while running that same pro=
gram
with the same devices and it ran into this bug within 24 hours.


I looked at the number of TRBs for the computers that ran kernel version 5.=
11
for over a week with that program, and they were all at 512, so it's extrem=
ely
unlikely that the ring expansion problems are present in version 5.11.


This morning, out of curiosity, I took a computer running Ubuntu 18.04, wen=
t to
Ubuntu's kernel build page, https://kernel.ubuntu.com/~kernel-ppa/mainline/,
and tried a number of kernels to narrow down when the ring expansion proble=
ms
first appeared.  It seems that this problem is present in all the 5.12-rc
releases, and I know that it's present on 5.15; that was what this computer=
 was
running before all of this, so I'm assuming that it's present from 5.12 onw=
ard.
 Right now I have this computer running kernel "v5.12-rc1" from Ubuntu's ke=
rnel
page, the ring expansion problems are present; the maximum number of TRBs f=
or a
device the last time I checked was 8388608 after ~2.5 hours, and I'm curiou=
s if
this computer will run into a hard lockup.  I'm nearly certain that it will,
but we'll just have to wait and see to be certain.


Lastly, I went and looked at the changes that were done between v5.11 and
v5.12-rc2 within the "drivers/usb/host" directory and it appears that a
moderate amount of change took place (more than enough to make my head spin=
).=20
I haven't dealt with kernel source like this before and it'd take a while to
parse through everything to understand what's going on, so I don't know how
much further I will get involved. Anyhow, I hope that this information might
help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
