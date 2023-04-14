Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 938B16E2AE1
	for <lists+linux-usb@lfdr.de>; Fri, 14 Apr 2023 22:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjDNUCt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Apr 2023 16:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjDNUCt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Apr 2023 16:02:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B534FE
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 13:02:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE78464998
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 20:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5886DC433D2
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 20:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681502567;
        bh=8YtXugYBw5Ewi8glrCIyT+CcmTssgP21Bn+nqKNs3vo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=j7HiJsk1nMrvgn2LXSxMzRfgMCJ7fNzvJG1XsU6VnamuzoN6FsuZH1lQIzvy9jmTe
         fPRLsY0ywk0+5CVzTQpy+D2WHD5qHzWT/QS5SooML6UuKk3xuRVXt6pYefcrX6eJRb
         mNLSle7k9ghQX64nMY4dVsVYI6MmMqGiOlUxiDWERvX3O+5lHrjBvASIvujP7oAgpd
         4RcNevwjJTgW40Oj0FMiv1RpCoqs/+KS8PGqf5+nOck5nNC/HoLu0EEfNL20IurcPO
         8egJ5fVMpfPDoyBGswHJDGmGWi51lN3GM5M7PPfH1ohDESMqkTFjUcguJ5xW9JUpDD
         XR+pgiQ4umCIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 44C26C43143; Fri, 14 Apr 2023 20:02:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Fri, 14 Apr 2023 20:02:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-FRgu7jTpTD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #21 from Hunter M (miller.hunterc@gmail.com) ---
I'll get the kernel compiled with the patch and install it on some computers
next week. Will update with logs once they have ran for a few days.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
