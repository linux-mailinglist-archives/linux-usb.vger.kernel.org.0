Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13BA06D38E7
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 17:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjDBPym (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Apr 2023 11:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDBPyl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Apr 2023 11:54:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876276582
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 08:54:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 38E30B80DD3
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 15:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C340AC433EF
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680450876;
        bh=oCAs6TTXSFVxfO9vRqR60CgeMfmy+19DoyhSfb4HHC4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DupEzw33OTwz75z3TUZxlaQZyBUjwzuOxSPQiVcW9c9tJ1eYWE5lr7YMeoMYMFmd3
         TWAopgBElL0IlaTrfnWBavhAnaTiQNmSVm0fpCI/UwkRjYA9SENbjB3mJFXNxbFF/e
         u5dlVbEvM+OQveVUhlzbbl6cIBvWVf2z73fHKYWeZV6K+nrfeAOwVUnulBCFYSSv6I
         +k5f+EVCCE+55tFyBFSMuyJNPjJawsGyo6uVm2ybiliS1jXxJuTTYJEph8Jp0VREG6
         uAl9yGSYQFaALuzhyTT1a9BPJdrwRe5fj77sP+CRDPJJJjkBhrV8r9b2fYklfZqPh6
         xNoE+P6lnziyA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AE13AC43144; Sun,  2 Apr 2023 15:54:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Sun, 02 Apr 2023 15:54:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hps@selasky.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-UwAtAwr3oU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #7 from hps@selasky.org ---
On 4/2/23 00:17, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217242
>=20
> --- Comment #6 from Austin Domino (austin.domino@hotmail.com) ---
> (In reply to Austin Domino from comment #4)
>> The setup that created the output in the previous two attached log files=
 is
>> described in more detail in related posts on:
>>
>> Ubuntu Forums -> https://ubuntuforums.org/showthread.php =E2=80=A6 st141=
36903
>> and
>> Ubuntu's Launchpad Bug Page -> https://bugs.launchpad.net/ubuntu/+sour =
=E2=80=A6
>> ug/2013390
> Try 3 (I wish I could edit posts, but I should not have pressed "Save
> Changes"
> so quickly. Sorry about this comment and my incompetence):
>=20
> Here are the actual links:
>=20
> Ubuntu Forums ->
> https://ubuntuforums.org/showthread.php?t=3D2485480&p=3D14136903#post1413=
6903
> and
> Ubuntu's Launchpad Bug Page ->
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2013390
>=20

Hi,

I don't have access to the bugzilla, but this looks like a out of memory=20
situation, and does not really point towards the USB XHCI. URB's are=20
typically submitted using
GFP_KERNEL, which allow memory allocators to sleep while waiting for=20
more memory. GFP_ATOMIC does not allow sleeping.

usb_submit_urb(xxx, GFP_KERNEL);

While that being said, I wish the Linux USB core would take the example=20
of the FreeBSD USB core, and pre-allocate all memory needed for USB=20
transfers, also called URB's, during device attach. Frequently going=20
through allocate and free cycles during operation, is not just=20
inefficient, but also greatly degrades the ability to debug the system.=20
USB is still quite essential when doing remote server access. Yeah, the=20
serial port is great too, but one day inb() and outb() will die :-)

--HPS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
