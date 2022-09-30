Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29D965F10A1
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 19:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiI3RRQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 13:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiI3RRP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 13:17:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142661C2978
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 10:17:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AB1C6B82976
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 17:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D59FC43143
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664558232;
        bh=ff2lsWOdKbnO2VwEGMjdt7eyTLktV2HHY6RgBQ7UBLw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xu7ezKJ6uQnODuOyszB0CBkTJIJAjFYPZja9Km/0UFjkyRigufn3RThu7YXNio+gz
         7p3l33oKExmgYpf2rqW3UucDKEKhh5p+pHdLBHIIIgKG0fWZ+YoLKHSG7YV5V2eBcZ
         fkA3Weo6l7S6r6NZr8N3K1hcVTg0f2bJiNiJDmU2FpbUlayrRHpydyEAMuVFuy2np7
         XBAKZwhnQkvH3ID6gf+srs9LgxZXLBn7jjl8zMUcRwBMhMHrQOh+RLsAn1aNVG4T63
         n126qZUABvgILzgdXDgxkVllD5L/Z680HGvSctOH8P8mOl5BrFPMJ0YVgMBTOKjcEW
         5K2yaVVmNVNcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4C9EAC433E9; Fri, 30 Sep 2022 17:17:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Fri, 30 Sep 2022 17:17:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorz.alibozek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-8zoY7Q7lbH@https.bugzilla.kernel.org/>
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

--- Comment #36 from Grzegorz Alibo=C5=BCek (grzegorz.alibozek@gmail.com) -=
--
I'm still testing, currently on 5.19.12-arch1 and everything works fine

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
