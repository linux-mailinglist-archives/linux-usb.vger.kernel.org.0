Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48CEB6DBF38
	for <lists+linux-usb@lfdr.de>; Sun,  9 Apr 2023 10:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjDIIsD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Apr 2023 04:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIIsD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Apr 2023 04:48:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617923C21
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 01:48:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EAEE060AFD
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 08:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4827FC433EF
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681030081;
        bh=ycsa3CPqXMygeXLGJ1Frt0QsxlDApvb1zvJ3n1iLEqM=;
        h=From:To:Subject:Date:From;
        b=fc8mbk60MG8h93h6odxnjxtpd2YKyLdaG0/HvbBANTNH+mZ7vymT9AKJfydZA7M69
         rHY+uRlU8o5okfDnLY55by4Klqo9zhHGh0fueM+rlLISd+xOEGlpmCeFj38gDT3J43
         LF/4SLXnqurdV1aZUOXFAEeZ9cgRWWCQ49kyDJhKBIO4Y7guNVMwTO9UQ07ucIUADy
         FLvS21c4Zg6lucx4fkhL4GG/4zd1OnnAAH+lwCpyU5tabqD5uJIFp+FuWX40rSGLH8
         dGEswiD8TOpxOyMxB6gM1/y9DexJiFeX+dEqu7uLY/MOrYY+59zPwvtdMntSCNA2U0
         nq7F359g98V+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 28F09C43142; Sun,  9 Apr 2023 08:48:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217314] New: Mackie Profx12v3 not working, showing unable to
 find clock source
Date:   Sun, 09 Apr 2023 08:48:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vu3ezx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217314-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217314

            Bug ID: 217314
           Summary: Mackie Profx12v3 not working, showing unable to find
                    clock source
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: vu3ezx@gmail.com
        Regression: No

Created attachment 304100
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304100&action=3Dedit
dmesg

Mackie Profx12v3 usb mixer not working, showing unable to find clock source

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
