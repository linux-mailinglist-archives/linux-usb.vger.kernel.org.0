Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D52177971B
	for <lists+linux-usb@lfdr.de>; Fri, 11 Aug 2023 20:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbjHKSaH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Aug 2023 14:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbjHKSaG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Aug 2023 14:30:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE1030DC
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 11:30:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CDB1A66E07
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 18:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32116C433C8
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 18:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691778605;
        bh=NkDhY1TktCRbEfLO/TcIAmJJlubimxC5Xamiximqk58=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OI/Vle+0Qc8wSkhO3/rusz+tJ/JGkAME6DUtXuKvC2CTzpcEUwDZp1Rpkn4svFvie
         o5PGHgIiVTQ6vx564YDlX76uzg6HPtX7qaG358OtVcUpwHWVAEqCb2jcergW0PcGQh
         XTnYkmoMHPZJDqdg9SzQxq+UQbkO6jZL7f95ppWleIwhIGSPyhF721n1MszcgF+fq8
         LaI5FFdzOUYJ0QR38sgy5O4Q5mE3QoUR78As3wwcx5uQmT6kaEwN9PZBgr1anRnnjV
         vwViBb0KGyODydscqK/baMnXtLqRLEmiEx0DZ+v7dOj+UiSOm35YT2lFmrvb+2e/St
         5Z2uC9qiB4ZLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 18949C53BD2; Fri, 11 Aug 2023 18:30:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216483] Logitech HID++ feature ADC_MEASUREMENT=0x1F20 reports
 battery information
Date:   Fri, 11 Aug 2023 18:30:04 +0000
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
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216483-208809-u2CI43iHAg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216483-208809@https.bugzilla.kernel.org/>
References: <bug-216483-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216483

Bastien Nocera (bugzilla@hadess.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #2 from Bastien Nocera (bugzilla@hadess.net) ---
Support was merged upstream in:
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=3Dc3=
61982a13c91

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
