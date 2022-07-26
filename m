Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64427581A33
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 21:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbiGZTUf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 15:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbiGZTUd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 15:20:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2781E63D6
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 12:20:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C2D37B80D63
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 19:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C467C433D7
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658863230;
        bh=5sdLAzNHR3aZDzVp35YLUv9oGIMAnFbMu8t4ce5OPZM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=j0bN7/LFU8t56Foc4dvJAUQO/9JuYhhbn5k2E1odzN4IxWtrZqDK0vqaTvil4uitw
         e7oZiLhwRMAhYOscYkGz6ETVAPhEyk6o5VA0GCKzT0UhwLLRm7oPE02g4QwbOCL9AI
         cLop91P+b7bjLx6PiaHUt1lnks9lXl67HN8bwO54yeJkR7yb966U2pC8F4bSOqgcnO
         jJnA9x+JAO46IfLe9RxCxyGuW3Vo9F7RiCvFshvlln/k0SGFmGgrdXnU2j/gz7kn9Y
         IYfdYaZSjIVTzqTR38aslLdfyfLHbPD8IjXRbxaJAnDv5LWwMqs9fJUFNg5a0uen3Z
         H+HrfFs8Q0uaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 28F5FC433E6; Tue, 26 Jul 2022 19:20:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 19:20:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-yDT75zqZS2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

--- Comment #11 from audioprof2001@yahoo.com ---
$ sudo mount -t debugfs none /sys/kernel/debug
[sudo] password:=20
mount: /sys/kernel/debug: none already mounted on
/run/credentials/systemd-sysusers.service.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
