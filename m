Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D0B5F06E7
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 10:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbiI3Ixh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 04:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiI3Ixe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 04:53:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B65F166F3D
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 01:53:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4224962289
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 08:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0934C433D7
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664528012;
        bh=l4ksFv8tjQuFPY4JTV4oKF488RiOBBqSRhTxNiJ6+oc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rD4SLpmR918R1+KTNpnRtmHZg4VKlb26l41IEjx4NFtIj1ixfSdFFLPnBwPgWLK1m
         7p19fGShkeOR9KvHMJQxo2O4ipS9WaguF4SZuZg5TyRGcA5bl/GIpn75Eq+bn9s2Op
         8jl+2QQ6BCySZBxAnwvve/MDTG4dQ7Uv3o7Jfk7mlTdWgVWE6pPeiEUajqtAIlPvip
         1ufPpZohuwCCVYSH9oka+7GuQRklQsMF1QieEgtiqSl0FhDhn3tbUVHmlE+x6VFSWv
         QfumcYq1mDx+s07DIQuAd6XOHNvoI9YXdPPrwleBdFJCIjmf2lkvLJf5QWmY/+6Px9
         DW2qzoOvv/jAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 818ACC433E9; Fri, 30 Sep 2022 08:53:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216543] kernel NULL pointer dereference usb_hcd_alloc_bandwidth
Date:   Fri, 30 Sep 2022 08:53:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216543-208809-U9YWjWF0Sl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216543-208809@https.bugzilla.kernel.org/>
References: <bug-216543-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216543

--- Comment #1 from gregkh@linuxfoundation.org ---
On Thu, Sep 29, 2022 at 06:53:46PM +0000, bugzilla-daemon@kernel.org wrote:
> With a flaky USB 3.0 cable (3m extension + 2m cable + 90 degree adapter) =
and
> Logitech BRIO webcam I got exactly the same null pointer dereference twice
> already.

That's really an unstable and unsupported system, sorry.  If you fix
your cable it should work properly, right?

> Here are two instances (from different boots):
> [64977.148098] BUG: kernel NULL pointer dereference, address:
> 0000000000000000
> [64977.148101] #PF: supervisor read access in kernel mode
> [64977.148102] #PF: error_code(0x0000) - not-present page
> [64977.148103] PGD 101370067 P4D 101370067 PUD 0
> [64977.148105] Oops: 0000 [#1] SMP NOPTI
> [64977.148107] CPU: 14 PID: 27951 Comm: VideoCapture Not tainted
> 5.19.10-xanmod1-x64v2 #0~20220920.git017c598

What about any kernel log messages from right before this crashed?
There should be some disconnect or other USB messages, right?  Specifics
here would be good to see.


> [64977.148109] Hardware name: Gigabyte Technology Co., Ltd. B550 VISION
> D/B550
> VISION D, BIOS F15d 07/20/2022
> [64977.148109] RIP: 0010:usb_ifnum_to_if+0x34/0x60
> [64977.148113] Code: 74 33 0f b6 4a 04 84 c9 74 33 83 e9 01 48 8d 82 98 0=
0 00
> 00 48 8d bc ca a0 00 00 00 eb 09 48 83 c0 08 48 39 f8 74 16 48 8b 10 <48>=
 8b
> 0a
> 0f b6 49 02 39 f1 75 e9 48 89 d0 c3 cc cc cc cc 31 d2 48
> [64977.148114] RSP: 0018:ffffb20951407bb0 EFLAGS: 00010202
> [64977.148115] RAX: ffff8cfbbc618098 RBX: ffff8ceb844cc800 RCX:
> 0000000000000004
> [64977.148116] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
> ffff8cfbbc6180c0
> [64977.148117] RBP: 0000000000000000 R08: 0000000080000000 R09:
> ffffffff8f590de8
> [64977.148117] R10: 0000000000000001 R11: 0000000000000001 R12:
> ffff8cf67c70f398
> [64977.148118] R13: 0000000000000000 R14: ffff8cf67c70f208 R15:
> ffff8ceb8123c000
> [64977.148119] FS:  00007f5f51379640(0000) GS:ffff8d0a3ed80000(0000)
> knlGS:0000000000000000
> [64977.148120] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [64977.148120] CR2: 0000000000000000 CR3: 000000023b842000 CR4:
> 0000000000750ee0
> [64977.148121] PKRU: 55555554
> [64977.148122] Call Trace:
> [64977.148123]  <TASK>
> [64977.148124]  usb_hcd_alloc_bandwidth+0x241/0x360
> [64977.148127]  usb_set_interface+0x11d/0x340
> [64977.148130]  uvc_video_start_transfer+0x17b/0x4b0 [uvcvideo]

This isn't good, we shouldn't crash when a device is removed, but this
might be an issue with some reference counting.  More log messages might
help out here.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
