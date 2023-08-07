Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690927729B5
	for <lists+linux-usb@lfdr.de>; Mon,  7 Aug 2023 17:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjHGPrg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Aug 2023 11:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbjHGPre (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Aug 2023 11:47:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68BBE79
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 08:47:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AE4461E78
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 15:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5F06C433C8
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691423250;
        bh=9kcqn2APk7oFXjcoggoKIgPFNSCsoBVSe0Vwj2SogCc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=d64Js+EHkEXRta9KJayK9Ua8PdYSTb9nUxZS4NmjXzNV5FydYSJVfYuUC2k22aANW
         79678DQXyI5u6NcO7SGZlDnLHLBMwq+V8QB/JS7w0/Wj4OWrybOutP6jX7FBBSOY3a
         OVKcXnfBEhYwOisH4NyMEyx7ssSM4UbzxPtNEyIbFKAK0hL3f0ED6a+yXMRgv1NqHc
         Ko6tNdrf7TfnbSFMhMNRg+sPmYabXmchgL1I/iv5RO2oAEdbsXFKTaF3ouDH2ME48t
         3Fi34tNdPzBAsmk/OYPHiDPwhZLNqwSLRkqaCPXEW2JbT8GSHN/kXPe3qEV2nNsVfQ
         PQYyqQYehbudw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 92ED1C4332E; Mon,  7 Aug 2023 15:47:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 07 Aug 2023 15:47:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-LRdquEir6a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #33 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
This seems like it probably is a different problem than the original one. I
suggest opening a new issue; and if you can please remove the VM from the
equation to make it easier to follow and reproduce.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
