Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8205EC17A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 13:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbiI0Ldz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 07:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbiI0Ldl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 07:33:41 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27732CF48A
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 04:33:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8AE14CE18F5
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 11:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED4CFC43144
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 11:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664278415;
        bh=8g2+tlF8/DZQ7EtOffO1dfA1OQiRSRK4+B+nJMJAbLI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uNCHVOVGXrjGqDSkEPiA/ska8rjSX8q4RNJr6GC3T/jElKQV1OMASwjMrCvGOw3sD
         Hy8VfCkjpiBV5GmJx70p06Suhr6+nHo1OplRdbyaki1pR3F86gBcZ1yBQTE2UoBa2b
         aOpDVbGKn0PunDPXcYqcsmrGpLh4UPX1AvStx6b45R0D43KKzB6W+lB9wfkGPfkns2
         dj+bzYUrHyOhk5udQn99DskS5GZHCaw8ENu9dSW624uHY27ZHXaAvUioqP9YPUi/Z5
         gqWTEMUHTICFqh3FXGmqbLbD1szUFY5UA9kdd8asu8C5XEGmF0jon5NLxa6R93OBsN
         O2vc/Axn9bcPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DE8A0C433E7; Tue, 27 Sep 2022 11:33:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Tue, 27 Sep 2022 11:33:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla@hadess.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-7wnHo7wCku@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #33 from Bastien Nocera (bugzilla@hadess.net) ---
(In reply to Heikki Krogerus from comment #32)
> Quick update. Bastien saw a WARNING that my patch causes.

I don't remember seeing anything, I don't even have the hardware to trigger
this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
