Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF8B790CDB
	for <lists+linux-usb@lfdr.de>; Sun,  3 Sep 2023 18:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244458AbjICQJY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Sep 2023 12:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbjICQJX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Sep 2023 12:09:23 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B953FE
        for <linux-usb@vger.kernel.org>; Sun,  3 Sep 2023 09:09:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 750B6CE0AD7
        for <linux-usb@vger.kernel.org>; Sun,  3 Sep 2023 16:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F5B8C433C8
        for <linux-usb@vger.kernel.org>; Sun,  3 Sep 2023 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693757356;
        bh=3qK7XjDisJeaQQ26pr1G8rm12AP3qG+zUDCYyzo/QCE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=emVBjroD3cigH7pLaAx/+zGI/Na8w/sl5ju4q7wTxVLkN08aq5k4nMV/jbAabwjBD
         ORfMoZL29tU0N7ZKa92YYBufRW25kFsHvFrXdelo0IfbzKKnjuLTBI32Xl2JmpLVoK
         3D578dgE11sO6r3b3QVvD4jICay/hwai/SZ/Y5AC+Fq2HTGuHJfJtfkM31FNxzQK8i
         zrcv3/WEOTESVC5Y7ocp1o4Ll0OzyrN/2yGkWDoXPU8xUxUwhFPKOEYAgBsdAUPl4G
         AUjLOpg5dQSyI4kuNV1zif0W2qS3AMkdOU+gUGbHhZeRw1SgXEcfmbCxVrqrB+60aK
         VzZ/lxgaRYb4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7F493C53BD0; Sun,  3 Sep 2023 16:09:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Sun, 03 Sep 2023 16:09:16 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217862-208809-OhkxclKTYI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #4 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 305027
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305027&action=3Dedit
Fix IO buffer on stack in alauda subdriver

Try the attached patch.  It should fix all the other instances of I/O done =
to a
buffer on the stack in the alauda driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
