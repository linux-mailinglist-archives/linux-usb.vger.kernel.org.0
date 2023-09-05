Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF25792AC6
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 19:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbjIEQmZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 12:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243302AbjIEQUR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 12:20:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA6D211E
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 09:17:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F34160A27
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 16:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2942C433C7
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693930579;
        bh=BZ2p72bI3wSy7DLye4jxnUTx9/yxaMmIiriXWJYWgVc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FrKrRzi2EdioChq5YJIUVQTpjhIBgVmAmAphPUUylpqbjvFbSFkN4j3X8WCwCf/S0
         uOXqi0VCMG+mZP3WuWbg3noRy76ThB4MCow3bnBTqCIJ2b92fw+O5A6RFafHnk6B++
         d3rEL/bGCUTNrtzaSVUrABzHk+CsOGs1E5TVkC6NVjO5B+8V/6ikwyezjPVjd2LMmO
         c7cwYg+r97zhxTp8RUPCvct0TxapFHtiO6FQUmzjmz2g2zlDuR/BQgs277j/In17Pt
         dZYplFsSPj8HDy0sUqpkRXPfJppW/SDEE0jLmzaN8isz2aOElauQa+ZWNl7he1AiRV
         mjqz0lw/NHBOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D3FBFC4332E; Tue,  5 Sep 2023 16:16:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Tue, 05 Sep 2023 16:16:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pawlick3r@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217862-208809-LRDMLqPEXk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #7 from pawlick3r@proton.me ---
Created attachment 305037
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305037&action=3Dedit
entire dmesg

I enabled debug messages for the mass storage driver and USB, recompiled, a=
nd
this is what I got. Instead of oopsing it instead ran past the error and fa=
iled
to read the 8mb card. I'm going to test the reader on a second computer with
the proper OS to rule out any reader issues as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
