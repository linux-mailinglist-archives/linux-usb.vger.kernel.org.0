Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF195F10EB
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 19:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbiI3RdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 13:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbiI3RdC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 13:33:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E0A17059
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 10:33:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC2FF623E2
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 17:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42E8BC43144
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 17:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664559180;
        bh=xIikoemJPC30m+bF9LwF/OibTIrSIY7lXGCnwop6iRA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZzEzIYk8HXqNTPl2lsr6xaIMW2LCcIv2/llfgU/KhXqeVc2QOEZnhb+avkXmS8u6v
         cIN4RAeg96m3aU6SAATqgnMsQ5lPJBPIO9Hl62AnifIRYlP4kCx52JDgFgTN9PnE08
         Ovt67igbDyr300heGNFiB9QaSvIRr0otVD6kjF7jv2ApHeyZ7Cg8qm/T8Wf3zfvcCt
         lL6D5tMgIqEL+m1jOIs9N/BsvXFWOVuafXYRqtyy5nYQ2Tdg7cUUft6cOyzNr7JiBL
         a58Akb6tMwCfEMg75nwBMdtgTFjWfkTxjLPY01MmZW4UF04ukoh1mTFG/sHa60F4sC
         tYmKxANT9gTzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 340EEC05F8D; Fri, 30 Sep 2022 17:33:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Fri, 30 Sep 2022 17:32:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorz.alibozek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-RZExt7Byjs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #37 from Grzegorz Alibo=C5=BCek (grzegorz.alibozek@gmail.com) -=
--
@Heikki, maybe problem which @Bastian had was caused by:

usb: typec: ucsi: add a common function ucsi_unregister_connectors()

and is now resolved, because this commit was reverted in 5.19.8

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dv5.19.8&id=3D3d4044c9e6d2e3f11f1f8b5e0ee8647d3eb1afad

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
