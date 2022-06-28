Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1CB855DD52
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345360AbiF1L3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jun 2022 07:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245301AbiF1L33 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jun 2022 07:29:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECB32253F
        for <linux-usb@vger.kernel.org>; Tue, 28 Jun 2022 04:29:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ACFF2B81B97
        for <linux-usb@vger.kernel.org>; Tue, 28 Jun 2022 11:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F564C3411D
        for <linux-usb@vger.kernel.org>; Tue, 28 Jun 2022 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656415766;
        bh=vJxp/EBsF5GhIUDE2uaxA5TxPXGK5fz9B6kJvetV6BA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Szw2GK62ARLYdRqvIAixfVtGDBgQu2IE9MD3qofgTBXFdUUG1aq8yDGLNiaVS+57X
         sH//3arMn+j1JP6Au+bndDCuv9Zk0Nf+DqbQaJFv7Ue5qmpUQomAoHCy7rdwforDZ3
         q10uS9TdCw0C0uRzmdMirvrk7dvWcMY0Rl9W2K04WjzPkOqa0MlKrc7VVTyqiusZO0
         eQekbbDQSoQLPklwLGjDpo6XVKOXSnuSu02KZnzBqYZg1MgxYAgskCYiCV3n3Ap4HO
         YL8T6gGW30a/STOJVglYIbGBgpBrOrQxq8vtsOAP0S/aiABnSUaQVt4GB7dKj48Mqc
         O10DZX+BWcugA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5C58CC05FD5; Tue, 28 Jun 2022 11:29:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216140] rtsx_usb causes error: xhci_hcd rejecting DMA map of
 vmalloc memory
Date:   Tue, 28 Jun 2022 11:29:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: buboleck@abv.bg
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216140-208809-HbaY2LYZVe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216140-208809@https.bugzilla.kernel.org/>
References: <bug-216140-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216140

--- Comment #3 from Dimitar Kosev (buboleck@abv.bg) ---
(In reply to Mitchell Augustin from comment #2)
> You may want to try 5.19-rc4. My ASUS Vivobook s510un's trackpad seems to
> work correctly with that version.

I don't have issues with the trackpad. No change, still the same with 5.19-=
rc4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
