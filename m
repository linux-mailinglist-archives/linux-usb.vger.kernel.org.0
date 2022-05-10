Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F125225DC
	for <lists+linux-usb@lfdr.de>; Tue, 10 May 2022 22:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiEJUut (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 16:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiEJUur (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 16:50:47 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F337F1C115
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 13:50:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 56E3DCE2023
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 20:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95779C385C8
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652215840;
        bh=dz3PZ1ONioSkYIHn4qYv0JiQySSXRvelnMN6/xNa6HE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R+LQT+Kcpc52wAxdm2A+JKTlF6Euxvde91W7Rub1Y5T1+Rnfygger2ufu+AOsHeLv
         +Yiio6zcoufHOPuQmxFSqbWbSsg/SlWnyFVCBTa+L5ERr1SdAc/bNOYZJvpzZKhEFM
         iq8N2Vouc1q301jJ8muKf5g78j95NLQRwPuMGqpinId4cmIWm4FjkSzr2HCIAu/jlW
         iREjVuV2eTjctmTxRzgd4eF6z1v/Tr2uuWwn5cj1lbQXvCtADkbgL/8NCi1XVPiAsV
         g2e5XZ7VUytILGyE4WRWVnGlyevggPJczrVzavnvPvu3oa+l7h9QpoMY7vzuF4yPUe
         QoVzgTzfDhRyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 74C83CC13AF; Tue, 10 May 2022 20:50:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Tue, 10 May 2022 20:50:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-HJx1Rs5PDP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #5 from Satadru Pramanik (satadru@umich.edu) ---
5.18-rc1 has the same issue...

Is it worth bisecting between 5.17 ad 5.18-rc1?

Maybe there are obvious suspect commits to start with?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
