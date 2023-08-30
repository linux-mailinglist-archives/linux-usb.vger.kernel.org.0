Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5A678D132
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 02:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236185AbjH3AlY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 20:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238507AbjH3AlU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 20:41:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF31519A
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 17:41:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74BDD63651
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 00:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCBAAC43395
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 00:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693356074;
        bh=5nUwFcRhO9yv7sSI/kIshV/x7utmn6hS/mOViUV7Vqk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DaQ5lFeqL5SCOTaM1fq9DrxcIUV/3s9bqTujR33dWtbE9yvHQwFm35u/7mbE/oiKo
         OMw0N5TP/VmhnlqnMfphqAv6Ui+VNWauWF6F61crXJuSdOy9i2IEbJxliQNiKWTKCt
         3YIP86V0L4rRxiIBlYNGms4lQwDGHq5yADgAxLbsDy8IcBKXbhuKmHF1RJFAXlYkfq
         TFOGvqZDpF6Vvrw2P+7Z1zKPVH7Wg2HegesoszkebyjlfRRNumD7wlOI1hM6N6wDWS
         vX0+oMAvdXgSY1N6+ehQTEpTIXl/U2gFpKXO75/c+l1V728tqS7cglqHqHrOTtLBxU
         QbG7TAV4V6YjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C036AC53BD0; Wed, 30 Aug 2023 00:41:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 30 Aug 2023 00:41:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-AQI0cuSwUU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Mark Blakeney (mark.blakeney@bullet-systems.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mark.blakeney@bullet-system
                   |                            |s.net

--- Comment #37 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
I'd like to confirm the same issue as Matt L reports just above (yay, I fin=
ally
found somebody else reporting this issue!). I have a Dell laptop and Dell
Thunderbolt dock and normally work on 2 dock connected screens + keyboard +
mouse with the laptop screen closed. If my laptop suspends like this, and I
then unplug the dock (e.g. to take the laptop away) then the screen stays b=
lank
when I try to resume. This started when Arch Linux updated the kernel from
6.3.9 (good) to 6.4.1 (bad) and I have tested it bad with every point relea=
se
of 6.4 since up to 6.4.12 and is also bad on today's 6.5 which just rolled =
in
to Arch. I have generally been using the LTS kernel (6.1.49) to avoid this =
bug.

Actually, if you wait 2.5 minutes then the screen does kick back in to life
although this is inconsistent now on 6.5.

@Kamil, I was guided here from your similar bug at
(https://bugzilla.redhat.com/show_bug.cgi?id=3D2230357). I wouldn't be so q=
uick
to say this is a Lenovo firmware issue. Seems to me there is something dodgy
with resume and thunderbolt and kernel 6.4/6.5.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
