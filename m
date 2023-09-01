Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D057C78FE1F
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 15:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbjIANOD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 09:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjIANOC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 09:14:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D97E7E
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 06:13:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 79B9BB82526
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 13:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 400B3C433C7
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693574037;
        bh=fd4FI6u7Ht98wy2y4f5QF++Uwc1OAL8kgN8O0RH01bM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QpBhhXi63IKlniPmE8gOEzz/uNAzlrjwAGG19TD3uMm+4eXalNO/Du5kNMHcEdnTw
         V6mzr2jrbQqV1inqfhF+qmTH1rHDq2YR1K/2cxnPv6rOHvQKQwt3lmIbsirVzC1/nv
         LnHfNZZEd1mEKoDu4WSi0EOfDFwUm6PPoUQZTeh4nOj9uHfl8Zxlbh6wmlzKqVNa65
         CNucL9wYVF8SRv3ngXMMaP1h1IycSC/GJ0hiKC5NXokDqVUaEBR44+49dt4GM4SyN+
         vCv3Cjaw64TpZY6EvmbFKn1k2KdNd0RIGuIM9+PwUQoj3+BtoSi8hr4+PaLBTB3TiF
         ciDxwtnMGOPDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 23DCDC4332E; Fri,  1 Sep 2023 13:13:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 13:13:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-H3bVSAtGsh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #25 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
That won't fly, bugzilla is not used like that by the kernel developers (and
the changelog is lost afaics, which is a no-go, too). Please submit them as
outline in
https://www.kernel.org/doc/html/next/process/stable-kernel-rules.html (you
likely need option 3 in case the patches need to be adjusted for the 5.15.y
branch, otherwise option 2 would do the trick)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
