Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADCFE78FDE2
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 14:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245224AbjIAM5x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 08:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245005AbjIAM5w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 08:57:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1094910D3
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 05:57:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 97995B8252B
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F7F7C433C7
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693573067;
        bh=8/fYnawty/8iCJ2nsEJn5rzPqjcByErR1Dx5MR/vdAg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=H3rsRLvTAfkEoFOXzJqJYRJBpB3rTqiz4aRoZbjA4fKQCbfW+lpHhbXCCkRzzTJ6n
         L76jEBG8KysfZsQsQ989zNFwF/mfJbkzSkvhQtL/YyGpVVnlZen/zL6FVRUPAPba3E
         4wI3ZIiNKIRyf70uIO2c9jUhj3F928anSoCGe7ni0bNJU+M+jy3sr+LvlUwlyNqCDQ
         pXftl6LFWsCnyCVTWMcRO9PFd4lzavRacF+xwCHrt1MQMadXG+BadWTh+cVCBiBT2b
         2ajQ1Gx/K486uyOs/GxWn1XiL3btHfsAwMtT1fSodXcjU6qmvHrgNrELg1EFHc7Dmk
         pMAG+BJHTvihQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3EBC6C4332E; Fri,  1 Sep 2023 12:57:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 12:57:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz.rostanski@thalesgroup.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-n7b2fLHqQy@https.bugzilla.kernel.org/>
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

--- Comment #24 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
I have attached rebased patches against 5.15.129:
0001-usb-dwc3-reference-clock-period-configuration.patch
0002-usb-dwc3-Get-clocks-individually.patch
0003-usb-dwc3-Calculate-REFCLKPER-based-on-reference-cloc.patch
0004-usb-dwc3-Program-GFLADJ.patch
0005-usb-dwc3-core-add-gfladj_refclk_lpm_sel-quirk.patch
apply with git am.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
