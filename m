Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E07B261FBA4
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 18:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbiKGRkv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 12:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbiKGRku (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 12:40:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E771A383
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 09:40:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D24C2611DA
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 17:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42C50C43470
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667842847;
        bh=Bzl3kS0F8umjcdM6mVc096C4FIeTNL3CG2KTZMo3a8I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QuLR+VvdVbvuBP/LA6/EvyrTSJsGVLjwJCg5EwFFUPrsdBtELHKrUa9Q9lVv3HVYP
         fPUweunalBIs/JnZam+cdeZXRjL2pSv5Xm3gEi0JL96rXxw2hcXNfIe8Xho3zBzAFP
         CWXZvX7p/gnp1CTOeMscqeP1XfzigURgKcd3jv1uJlOVQWmtD3QKRGm3Q3MYe0hubU
         BMmp5cXES7iwZFixwDxTpTJbDbaeLpMnzrpfEuAYC2rf+Lx6ey0u+YWzzSQWLmsT/A
         pSFaUdZixgnoYqlGO7FIN3adS5feCxJnYvuZvG0ZyJBlz3iraIGnDYdfM0qvVVBP9B
         G2429Jwb5/pog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2A79DC433E4; Mon,  7 Nov 2022 17:40:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 17:40:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-oa0Z9E6hNZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #41 from wse@tuxedocomputers.com ---
Just tested 6.1-rc4 (from ubuntu mainline ppa)

Still same behaviour: 4*20s delay during boot, but works just fine afterwar=
ds.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
