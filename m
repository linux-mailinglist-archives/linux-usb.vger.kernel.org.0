Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB35D5FC445
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 13:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiJLLWT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 07:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiJLLWS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 07:22:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0544EBEFB2
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 04:22:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 969246149C
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 11:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1CE9C433D6
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665573736;
        bh=48vqn6msp+luGeuCuEOf8VgoQj/15YZHU4m0ikoIaRY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dcYrCF1XAcc+2hZ3hNp0NEPfL1g6m8wSfvvg3Z2iafCe8cf3IGIJfEuUfO/thZD1X
         hwPNGLwVggHn6P5ShqJR/E0yxEi/MyZuCAJBmRdldUSkJCUdAUVJzrxtPvlAiw+3Oz
         wa40gH5EjEnzrviDxCGvlevH8KT5K2NO9s8ibrR4hJunMiPmz82p7yo6HMRQTWsUIC
         CRNffiYMRyQ99jzVR2kpAZk8bXmAnVrCOq94zFLXR4zYotPQVBGuQTvCtSpbNceEvR
         /BJQCPwsPv6uMdtgSh2xqSMzRV8iJs8f9BkwaRbGaddLyQpm5DV+WlMdjAikJ67q7h
         2qHnWEqSVRP6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C4F7AC433E7; Wed, 12 Oct 2022 11:22:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216558] Astro A20 audio headset require module unload/reload
Date:   Wed, 12 Oct 2022 11:22:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216558-208809-Thg5vTZrvP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216558-208809@https.bugzilla.kernel.org/>
References: <bug-216558-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216558

Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmenzel+bugzilla.kernel.org
                   |                            |@molgen.mpg.de

--- Comment #1 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Thank you for your bug report. Please share the Linux kernel version =E2=80=
=93 maybe
even attach the full output of `dmesg`.

Please contact the maintainers by sending an email to
alsa-devel@alsa-project.org and linux-usb@vger.kernel.org [1] with the summ=
ary
and a reference to the bug report.

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAI=
NTAINERS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
