Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17134F7DAE
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 13:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241947AbiDGLPz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 07:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbiDGLPy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 07:15:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727E113C726
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 04:13:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07F7A61E38
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 11:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 436BDC385A4
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 11:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649330029;
        bh=/5QGt9tfKLv6slzkxqN9epjtPoCEPDyGgFDCOCl8zoM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kfXSZRVIakbP2RXbvSwASOabxkc4I+3im1UOVyV10Oq6UfQv48C4OuTS2qfw9OoIh
         6dxTaoX53TIkeGkuS4UIALVjLHtJX0L/o4IgXIRFiSltMbXnHvDAUKeebDpzFkhYEj
         ofO8gu+cNuybghfB0+tPVekLpDUMDuZwjZKt5VXPTSIb3mdtZ97QgXaED8K4zDyuVX
         InEpKc2E1WcbvakfYyirpYB3eGG0ukAtuDqnH75g82P0PM1PgpYT1Yj/wmZXbrO42k
         nyirDE1K47cBs7oOCAc3hWJ9gmv7jXzmn/jXauf1hvM9R1FSMoP6f/4DgGWj8Y5MzK
         QrHxc3iTQrXaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2B176CAC6E2; Thu,  7 Apr 2022 11:13:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Thu, 07 Apr 2022 11:13:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla@hadess.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215799-208809-n757MqQpPi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215799-208809@https.bugzilla.kernel.org/>
References: <bug-215799-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215799

Bastien Nocera (bugzilla@hadess.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugzilla@hadess.net

--- Comment #7 from Bastien Nocera (bugzilla@hadess.net) ---
I replied about the problem on the linux-usb list and in
https://github.com/rickysarraf/laptop-mode-tools/issues/183

This is most certainly a bug in the script, not a problem with the driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
