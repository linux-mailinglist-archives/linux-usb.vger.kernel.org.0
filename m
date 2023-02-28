Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B43D6A5DB3
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 17:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjB1Qx6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 11:53:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjB1Qx6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 11:53:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8195F199DD
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 08:53:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF50761178
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 16:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AA18C433EF
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 16:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677603159;
        bh=NoMP3Wml2zwXIS1fsiw3OIOaSYEWEEiOiXEbMhii5pw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YdDZhkdC+PQ9+XipQM23SVQLGVWEeLIhlh+7ZWqs1QlzBFOoQXUk3VAdQTimlrgWv
         qVdg+Y9zj0+UHiYjs1HgX6sBbtGlFsRQMaeQToggSc35+c4QIg3wopIO/makQeNcFM
         3uPlPq7yVs/qYQ/jWaeXrLRG16V5Us0Kyjm8BWW/sHRVhm25dDPWniG9KXI8oSL9pr
         fVop36Hb4Z8KXXF53wInBFmqtCMv67p0dEg9T3lfWQy+mfQ0hC6wTlvOgicEXpq5h/
         MVTPK4+c+fHn2OzyjcaGtTPhVBK2dxOoNTTVwTlkI9ilYpo87ymydFN8yTfrJgUlVJ
         Zf7gGoyTS7mUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 35D20C43143; Tue, 28 Feb 2023 16:52:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Tue, 28 Feb 2023 16:52:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217089-208809-NECapsazYu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #16 from Pierre Germain (pierre2008@gmail.com) ---
Created attachment 303808
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303808&action=3Dedit
cat file old_scheme_first

Hello Alan,

Incredible (for me this all is like reading a foreign language), As you said
that last echo seems to make the xone be recognized as a 4x4 device (as see=
n in
the UI).

I add in this file all the commands you asked and also lsusb and dmesg after
pluggin in the device in the -37 kernel.

What would be the next steps ?

Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
