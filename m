Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD46F55D810
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238443AbiF0XCa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 19:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240955AbiF0XC1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 19:02:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159FF21E1A
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 16:02:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3D43614F6
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 23:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C3D0C34115
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 23:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656370946;
        bh=B9OLwp6UhvcXocLXMsaA7uGkELBHJ/jLC6Xwif6crr4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rxlqIv6WBi0pYYFCCeF6FHJpAJuOgSuHw6NDJQKTy9V+0zcHuM94GFJuvMTsNl8vU
         cv0JGEVj5ANXipOr7sXezweDfKE1cCJzhz04k0eIO/O5LM83Mc8vhbM9CVTNk/td9R
         Qv46cGo2frZ4Vyo9kW42pR0zV0wIkyVtMGiIrIOblhGogZKAZ73slIphLYQpMzs5Dz
         J3cq42GHeoUFVxVtLR+g727lSM7Pg48PXsZYwl2aGynEp/auW6OWjoKkRRgVKDpYnV
         VI6Px9RpeMv3D9PuXN++BOliAjchHcolkEJYh3A2knuC8WwUTfLDYQkOI3FLPlDWGR
         zzgVg0+sZb/5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E3A31CAC6E2; Mon, 27 Jun 2022 23:02:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216140] rtsx_usb causes error: xhci_hcd rejecting DMA map of
 vmalloc memory
Date:   Mon, 27 Jun 2022 23:02:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@mitchellaugustin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216140-208809-DFW0fTl9bA@https.bugzilla.kernel.org/>
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

Mitchell Augustin (kernel@mitchellaugustin.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel@mitchellaugustin.com

--- Comment #2 from Mitchell Augustin (kernel@mitchellaugustin.com) ---
You may want to try 5.19-rc4. My ASUS Vivobook s510un's trackpad seems to w=
ork
correctly with that version.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
