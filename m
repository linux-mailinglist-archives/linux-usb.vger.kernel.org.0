Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333B87904C7
	for <lists+linux-usb@lfdr.de>; Sat,  2 Sep 2023 04:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347286AbjIBCt1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 22:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIBCt0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 22:49:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6F1E56
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 19:49:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D6020B826C7
        for <linux-usb@vger.kernel.org>; Sat,  2 Sep 2023 02:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E704C433C8
        for <linux-usb@vger.kernel.org>; Sat,  2 Sep 2023 02:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693622961;
        bh=kC8+o2gbmeYgPFhA9Q4LZa54AQgm3aMyj5Fdvttv/+Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cCSV0SMD3xV+3GSNNluBQqxb3S2Gv15pbrYSVbY/N3E6iZPgJ/eD8myQ6R757zkuj
         OqvURlQ/Fuqp57ogo0BcggmVL8uiuf9Pd5/TwNXnNXNGdJDFbcfN2fiCg+zbp0TU7A
         UdtW5pGlgLb7E2ACJN/un5g4H470r1MR0KUmA9Yj52rKqhQ6mxoR6Nlc2e+3ZPFBPJ
         tB5Fd3wzjTwsW8tzNgMFZ5Gnioi14FPBcGf39XtlEvq9f2t0Fe+/6kERDpvkMDELi1
         oPZG1SQhNMM+Vos0rr89FWU2O0ZD6GBFHLjCThD1LMLB70+VpS6FQNuKNF2q5ab6Ne
         FYDLesGtndraw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 59A0FC53BCD; Sat,  2 Sep 2023 02:49:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Sat, 02 Sep 2023 02:49:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217862-208809-3jbFzKIIFU@https.bugzilla.kernel.org/>
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

--- Comment #2 from Alan Stern (stern@rowland.harvard.edu) ---
Please try this again after applying the commit in

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=
=3Da6ff6e7a9dd69364547751db0f626a10a6d628d2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
