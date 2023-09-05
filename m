Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21906792D9C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 20:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbjIESqf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 14:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbjIESqf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 14:46:35 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1109BDD
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 11:46:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DC511CE0FD9
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 17:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A31BC433C7
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 17:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693936081;
        bh=pyTsi7egmbLs1q086YhW2AOKasBANlgjatTf4BbBj2M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YHfUjq4flnQwO85Q9HOr/rFrHl9YR1OXDd6bzCAIccQRAQKKQNiG8+2VxoTROOsMS
         lFG5Fc7QmHO5+14/FbdA2Xq0zPGGw9nKhdhwC1pauYo4Awo3CvNL+GPdEv3Ks5qPjw
         v7q3T1L4a8XJK1uJQzuPMLzM1hFO0eMZaij22m+zJ4w0Uw5vt3CikO9Y+kVNCx0jEV
         Mg/Hy8moFujR66Habw+YVmpdpT2Hj0BfV8dyCe2X11+7AKL4+2jYYHm6UhADhpVeEX
         1jmLUTpb2LGgrBdnXbhx868GTPFyPBhr++yHI2s48AhWw10cSeN9NseW50sEAi9qGI
         SgsMpw4EGiI4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 15616C4332E; Tue,  5 Sep 2023 17:48:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Tue, 05 Sep 2023 17:48:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pawlick3r@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217862-208809-IMrxNAi3DE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #10 from pawlick3r@proton.me ---
Created attachment 305045
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305045&action=3Dedit
usbmon output during oops

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
