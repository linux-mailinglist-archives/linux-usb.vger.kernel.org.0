Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB0F70EA73
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 02:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238694AbjEXAtZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 20:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236442AbjEXAtX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 20:49:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0AF1A8
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 17:49:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BDAB56249D
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 00:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 289C0C433D2
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 00:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684889358;
        bh=vdOl7nynxu3xhuaSB7UhuPE+lyKAyheQLHyjRf4sB+s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fXkhA3mQkX+UXBSIhVyvTVIcLN/cJwnehbeuaWOIaKh3q3Erm4LC3wGKbsnCs8BAR
         Qb/Oy0qdqvDiTym++4h/80ptvydMEW/98rhdg7KYNi0XnRhVTGGiq1+XB1jbFaO5Jm
         8s4TxJH4f4d8ZiAuZZfFe3acqfhjTLVlQT4XjFL8hKB2Ip/ah7dIDF5XmkaH9TjQC2
         z+Go0eIV22EWUFtpIPoTikyHWHvUs0MkwaFaLQfqHN8pvBK/XARoogU+v7JHWy1oH3
         teo/HL371fL0utLDCpo61Tc1Q5ZPAuopLmafIqWRKHZd4eHbbYrpRRizr8jsyZ3JwB
         pF0cmik9SGOFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0CFC3C43141; Wed, 24 May 2023 00:49:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217475] Foxconn / Hon Hai Bluetooth adapter 0489:e0cd stops
 working on ThinkPad T14s AMD Gen1
Date:   Wed, 24 May 2023 00:49:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217475-208809-80bNq1OHv1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217475-208809@https.bugzilla.kernel.org/>
References: <bug-217475-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217475

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #1 from Bagas Sanjaya (bagasdotme@gmail.com) ---
What kernel version did you have this issue? If it is regression, what is l=
ast
working version?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
