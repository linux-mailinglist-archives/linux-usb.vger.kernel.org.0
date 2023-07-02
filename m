Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A279A744FE4
	for <lists+linux-usb@lfdr.de>; Sun,  2 Jul 2023 20:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjGBSt4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Jul 2023 14:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGBStz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Jul 2023 14:49:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1388FC3
        for <linux-usb@vger.kernel.org>; Sun,  2 Jul 2023 11:49:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A506260C75
        for <linux-usb@vger.kernel.org>; Sun,  2 Jul 2023 18:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 145F5C433D9
        for <linux-usb@vger.kernel.org>; Sun,  2 Jul 2023 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688323794;
        bh=ChxislNisF92jvtPlL8WFjSEywTXdPkRPVYFklj3ih8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dehElyk9um8UZSrbPx+cc5LfFYZWKiQKVfBHlfZy2iT+lD4wP4Ug5W55ffhuiwN4e
         W+d7ar4jFydecb4QInl4RctoAvbfOlKTWAcwDtRGtksYWPbsAMeFyFA3lUL+DA8xvy
         HkV2CwYgeYBHy8Fx78Eu9pzgkNxBQvL6Rt9/w5DZodwEMYsASoMxM7ic0lf0xVpvJi
         X0S5jJhyWDIOy+4t3/gdunonxybitsfRBio5G7fXvM3M97otUxphIWWShTyNQx9j7V
         DWrIhlmSFBm0RidiYYQ5v4TRx5VLIkrIUMK4RWTMmd45cuuhxnTGja2YK1rM7w2WSb
         e135Q1HEKq4Iw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 02951C53BCD; Sun,  2 Jul 2023 18:49:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Sun, 02 Jul 2023 18:49:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: dev@mattleach.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-216728-208809-Klt1xJ11eM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Matt L (dev@mattleach.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dev@mattleach.net

--- Comment #32 from Matt L (dev@mattleach.net) ---
Created attachment 304529
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304529&action=3Dedit
possible regression dmesg

Hello,

The above patch *may* have caused a regression on my system.  I have a
thunderbolt dock and if I disconnect it during suspend of my laptop (Dell X=
PS13
plus) the laptop fails to resume.  The laptop is alive but userspace proces=
ses
do not resumme.  The only way I've managed to fix this is to put the laptop
back to sleep, then the following resume starts userspace processes.

Attached is a dmesg with pci_dbg messages enabled.

Thanks,
Matt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
