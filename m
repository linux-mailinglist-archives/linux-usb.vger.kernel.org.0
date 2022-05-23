Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDB60531421
	for <lists+linux-usb@lfdr.de>; Mon, 23 May 2022 18:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236197AbiEWNZ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 May 2022 09:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236208AbiEWNZY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 May 2022 09:25:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563823A5DA
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 06:25:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DBE416133B
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 13:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D4CAC34118
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653312317;
        bh=p6mYim5pWpA9nv7rxcx3FY09jk1v8u1NRveKujyl42g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ilg+XXvpb41Ep5kd2qclDSW8nYsJGHNAvCG5O7+cYiuQPx31lixNnw3sWIWAeJl5D
         D/dNUK7oIqBpjzQCn1CbZq/qEWnXmM48AhEB9lFWKW0hIJLaO6rpBAxAIgN7ptQjKK
         2XWxq4pkWe7FWTHTAMVj2JvjdTGX8tDaRFk3bwG4exLvSSQjv/frmNl9R2Ourjo7I2
         yvn+f8KqCzYlfTffz3y9cTLrodUUbLAdljpIbXGfnocPmbA4jGDW3ukMSeCHGzKxYg
         yfAsDOoqQCl8SAZKXR+HfNNyMS//orXbLQWipNAmP580ZQkj+ZbZ96L/RKH+DRlx4U
         duznEbwYhs1sg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 38B5FC05FD6; Mon, 23 May 2022 13:25:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 23 May 2022 13:25:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-AA5Pb8KOcz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #19 from wse@tuxedocomputers.com ---
Thank you for the patch.

Yes, "X170KM-G" is the exact match for /sys/class/dmi/id/board_name on the
affected device.

Kernel with patch series is compiling atm. Will add another post wether or =
not
it worked.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
