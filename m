Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836746ACFD1
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 22:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjCFVHI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 16:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjCFVHF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 16:07:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231D343473
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 13:06:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D2C34B81107
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 21:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2058C433EF
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 21:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678136816;
        bh=Aqw1Df9hY2kIWyjWQFPnky4JV8toz3M+qkrtIYy0ts4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QXLOf4c0pn4bLX0Zyf4KKnAr1d9a64Ikc0bL7efRiFkCJy5xdoC0/U7o/9KHTpEbI
         wKVxfPr4VLYEJrpW7GU+53s91HrUfR0MSL7Ja1KYDGGMt9448HyjXzB2dORr0eAHDw
         /CaO2kXIJshVZNTFNeZpZ6VJHOdUcZr4rMrqtg9gib6Mn9n3xPE1BGtiQ7vRBdkLjo
         JHuG9mPz9LIVHLR7Dhnpt17NKt/DxoXFLqjU9bnRQ1CuNvzhm1I1syNk1mprzsaUo7
         hTo3ic0FAl0AkdVh4CPikNqVaLC4uA/pBuxnO+6AxmNF+eZ4rqoXBKJyzHYsow6d54
         wJDZl/LrQ2iFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4E98AC43142; Mon,  6 Mar 2023 21:06:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 06 Mar 2023 21:06:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-UUmG3XQpBN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #5 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
# jh @ laptop in ~ [22:03:49] C:1
$ cat /sys/bus/pci/drivers/xhci_hcd/0000:05:00.4/power/control=20
on

# jh @ laptop in ~ [22:04:00]=20
$ cat /sys/bus/pci/drivers/xhci_hcd/0000:05:00.3/power/control
on

So power management does not seem to be the root cause.

reagrding bisect, should i mark 6.0 as good or 6.0.19?

already have the git tree checked out and compiling (6.2) and I am willing =
to
go throught the maybe lengthy process.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
