Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAB946384D7
	for <lists+linux-usb@lfdr.de>; Fri, 25 Nov 2022 08:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiKYH6Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Nov 2022 02:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiKYH6W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Nov 2022 02:58:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0A62035A
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 23:58:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B159FB82962
        for <linux-usb@vger.kernel.org>; Fri, 25 Nov 2022 07:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78D20C433C1
        for <linux-usb@vger.kernel.org>; Fri, 25 Nov 2022 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669363099;
        bh=kvhyrYIXnRkW9d+XoTeU3ZZ/ScAZxAU1IIkLJT+YVdo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HVnJlw+KV3j0ARrX5A9MK/8+Rdka+TkQeNHSwP5Rb4sPMmwMmT3s/v662QvayWVP0
         Hw4jEgHo4/eowEv+9B3NYQqQqz/Xpin/f+La8MnnYJ0qUFHD6yZPtba19HiJ95UnPi
         DFFHc20pzyK4V2OXRNPXY8hvKmMmlZqGKDaFbwYClbDH7ys7fbEScZOdK+bKozMeHC
         dqZV0kGk0g7G88ZuaiLAM81Gq72N+y+J/7c5enwSdDC5KPh2b9ISJDJoUrwAfEm2+N
         SEJvvCM2yKdVx6m4AgdpyYQcAOJwD4PrcPAgPCSvLq02VBmdwSxLFwHJ02K8sujMVj
         XHeQ6KMGj5UiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6350EC433E7; Fri, 25 Nov 2022 07:58:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Fri, 25 Nov 2022 07:58:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-mygQJ1irXt@https.bugzilla.kernel.org/>
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

--- Comment #6 from Chris Chiu (chris.chiu@canonical.com) ---
The nvm_version shows 61.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
