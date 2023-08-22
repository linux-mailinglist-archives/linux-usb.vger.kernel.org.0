Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8111784500
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 17:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbjHVPHJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 11:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbjHVPHJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 11:07:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9454126
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 08:07:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4190E6219D
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 15:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4662C433C9
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692716826;
        bh=OyCLG8s/rIhNus+I3W5Juo7ufuOKJE5/2AApMNVYi0g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=b0/UfZRZ4DOPrURO0guZ6SkePpRv0nxyYUq4XGN0iipLvSUJm5deJ0UjIcRwWhzsK
         pPHgH3BCMIZSh2kIPiwYOawdJ7/4ISS/gacyP1gW09gFX08rgJgZ01beExxkXe0aIK
         7q05RR2F7hHSJleykWD5Bq/OnzOkVf6I51QR0ruK5bhyz8QiXQ+T/7zBir2Lc51DlW
         pJPFav3WoVdg1qpGSCAmPodlZcdDX06Puk65/GgTw0TYqDpMFqWDw9RzIXBDl4Ei5+
         IZHZqMJZEHAfVyVn0/axFjWP3049MHnDlQCijvzK0hvuoaxNnyC6qTtrHsHbRFuUuT
         sYYLiKekg8h7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8048EC4332E; Tue, 22 Aug 2023 15:07:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217811] usbhid driver misses right-click event for Rapoo
 wireless mouse
Date:   Tue, 22 Aug 2023 15:07:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.byrecki@techniline.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INSUFFICIENT_DATA
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217811-208809-Thy1O1Rr6n@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217811-208809@https.bugzilla.kernel.org/>
References: <bug-217811-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217811

--- Comment #4 from Michal Byrecki (michal.byrecki@techniline.com) ---
Today I've realized, that the right click started working:
Event: time 1692716651.620865, -------------- SYN_REPORT ------------
Event: time 1692716651.724863, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90=
002
Event: time 1692716651.724863, type 1 (EV_KEY), code 273 (BTN_RIGHT), value=
 0
Event: time 1692716651.724863, -------------- SYN_REPORT ------------

I really have no clue what's going on.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
