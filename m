Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3A5633A2E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 11:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbiKVKdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 05:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbiKVKcO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 05:32:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA12554CB
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 02:29:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 36ACF6160E
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 10:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95409C433C1
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669112957;
        bh=pkJ7JQtzukfh/VaSxavyLNtnQYo9m3oOJCpPFEOdP60=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oXFlmBXv95ciRO0OI1HMBH+sVvFX3b1QlfVAk3ZuoKLWW8qs5JSWm0PwSG72X3ojT
         V0va5Ejj1Xp0azJdR335GXYCgFT6HSG5dm+9j7uWEYsju6YoJHarUJABRPmjCK6b7g
         8Lq6c0MLQ4lD4rudkEz973HhBCVwhZkviffT25nJquAy2SfVXDk7Ld3lm1NCkILjH+
         PcUSQvIKOVCliwW5nqjNi6pH4XoO65BMI/Sjk0vmVA7j3rdG7G2dGkdSufUT7nvQX0
         lTDeJhyUr0vURZ1EIR/Y647kzTXo8RhV8043cCcw3vLtSu0DMXw3pgko7m1FMyiZWS
         h/cmx1gcD/rag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7C4FFC433E4; Tue, 22 Nov 2022 10:29:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Tue, 22 Nov 2022 10:29:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216728-208809-vCYqIw04kZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #2 from Chris Chiu (chris.chiu@canonical.com) ---
Created attachment 303263
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303263&action=3Dedit
output of dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
