Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C4452634A
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 15:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbiEMNxh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 09:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiEMNxa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 09:53:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9C85BD2C
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 06:51:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0CDD3B8302A
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 13:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C51D5C34100
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652449836;
        bh=m1JpITE2UgC7dYfkxwj34wFsw9rnOFH6owIIOJHHLX8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Mlye8GThIuvifEB0aRT5UKpKi6k1tB70aTqxWiWlBiANeV+lkUgMb5yirj5/nmGLm
         Z609QYtWZw/cdH7mBZs7ej4QZ+yjud2Sav+9LAvCcR6pR1h9FqKSzS1s4Y0bMPrrsz
         T5fEQDse0CNUCTqJRj2dw0OBvBRrW1y1XEf4lI8gIQgQa8dX6wW12pdzZYMJF1rQf+
         bEvZWoQs91VUykbegle3ryRzjIIL3ep90LYhnrSmxcasiPo8jMzX7Vp1Ld1j8sgk+w
         nqIPuMnkXwbfr3r5o+TRQ6G80IrKzW1zD073TYh9gw1D0OjZOnZcDbaonzBRpP+hKK
         4wnNLHgNNESiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A929ACAC6E2; Fri, 13 May 2022 13:50:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Fri, 13 May 2022 13:50:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-W7iTMoSQs3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #13 from Satadru Pramanik (satadru@umich.edu) ---
I will test this patch against 5.18-rc6 today on my hardware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
