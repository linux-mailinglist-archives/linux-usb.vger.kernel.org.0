Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA50878E922
	for <lists+linux-usb@lfdr.de>; Thu, 31 Aug 2023 11:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241805AbjHaJMb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Aug 2023 05:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjHaJMb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Aug 2023 05:12:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E96CE6
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 02:12:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 71FBC63684
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 09:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3AF2C433C9
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693473147;
        bh=mCawVO47S0d4tYmdsSLMo/m68qqKmXYPV/c4QszwBzU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RLreFPvxPbClYACWybUq6sH7p4miBIzSusKeKyeDVtCdAiEdp2Kf8OrD/dzXkxenL
         PYqMam9k91m8U7XXf7lQ5+qngcyba9puuen3PlQ85p4W9pMOLowxVcGngLzpmCicKu
         tveGr9tGh2fvNz+1z2TtmR8FgEa8Jgo+nCvtON1Fabps/fjktqo80bZ6UQxTMV88OW
         lJKW5oNTZUtaGmpVGeIJPY2bH7JgZOE4Rj9WJ3RD6jPBcF2/RDX6UF6fe0Cud3v9tm
         sizstpJGJ4wqr12C+HtOlvKkVMG5jL7MUFWeqT4y2Msjh0O6/OjNjLXGJJjT/l0h9u
         XYkzG+g3A39nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B5EC6C4332E; Thu, 31 Aug 2023 09:12:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Thu, 31 Aug 2023 09:12:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217670-208809-b2ZDvbzNj2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #9 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Tomasz Rostanski from comment #8)
>>> 7bee318838890 usb: dwc3: reference clock period configuration
>>> a5ae3cbe9dfcc usb: dwc3: Get clocks individually
>>> 5114c3ee24875 usb: dwc3: Calculate REFCLKPER based on reference clock
>>> 596c87856e08d usb: dwc3: Program GFLADJ
>>> a6fc2f1b09278 usb: dwc3: core: add gfladj_refclk_lpm_sel quirk
>>
>> Can you test this to verify that it does actually work for you?
>> thanks,
>>
>> greg k-h
>
> I confirm. It works for me.

Tomasz, was a fix ever merged to 5.15.y =E2=80=93 either a revert or the ch=
anges listed
above? Doesn't look like it from here, but I have the strong suspicion that=
 I'm
missing something here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
