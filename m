Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01DA7551625
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 12:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240242AbiFTKoP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 06:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240127AbiFTKoN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 06:44:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F05B13E28
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 03:44:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E770B81047
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 10:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6068C3411C
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655721849;
        bh=Gw3d2GVj4t12vTSFKZi2jgG9CaAF2PRbF6wqIopMLYE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QkU7Y81og9eEWHAX9hkZmwczuVtBnDTd2/dj5drmXNhnYfdTxim1WJPi6fcWeGTun
         vrAdWwSCgWbF5L/nEMiUEPL7wGH+3AtwvNo1AJ2l4AMVaOLimwuMG03eoQHl7oWIBz
         VrJnhGU9l7rE4eu8AV2+UYW2kvh/YcXlevgnfPvW0z7ORud/L5HJxEbZa1Hazl8UMU
         r0jb5korB5FgQRG2Q/KHvq6E1VGD1dG4SrUx9mPvjx2tNdpX5YzkwfXGGQSINobjqx
         pKU0VIJqgPOBhi7qbgOuNRcfTclbaSbL4TiEI1lfajiQpRrnitvRTYPgPavtcAYUuj
         dvErBGJJwW+KA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C5D05CAC6E2; Mon, 20 Jun 2022 10:44:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216140] rtsx_usb causes error: xhci_hcd rejecting DMA map of
 vmalloc memory
Date:   Mon, 20 Jun 2022 10:44:09 +0000
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
Message-ID: <bug-216140-208809-oUalSXjnFW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216140-208809@https.bugzilla.kernel.org/>
References: <bug-216140-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216140

--- Comment #1 from Dimitar Kosev (buboleck@abv.bg) ---
I can confirm reverting commit f5ff79fddf0efecca538046b5cc20fb3ded2ec4f
resolves the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
