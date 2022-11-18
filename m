Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1338662FEC2
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 21:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiKRUZU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 15:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKRUZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 15:25:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435CE5F854
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 12:25:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E2E5AB8251E
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF937C433C1
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668803116;
        bh=XkrVMIDAKpzvu2mAudMCFsdgadMDqMUvgI1XhlWaC1I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pc7r0D70/8qW/ctY0UBUug/KZqQ3vC/aa4QHnWoZbx3H21+Xw91QCd5Zip9rT7wl1
         cojfmbJmh+bQCuGW19Mr4TtI5weghqVSYc94ytTGNTmrToRvFlEp1T6HRipCAEzoSI
         pD/ZCFZItUu4LKtLnbtlKtjyNhlv01iI/IDLjgteT5w2xLrn6yTpt7gsuAHo+EQKiN
         jdtq9avrndBtqbt7XjLeV3XZrxMXyoemAXyl+RejvGdVcCiqCM0tEGBYQdWl9DSpIB
         k4kHwfKNwgA3BGAogu0RIzRKr4f18CtxUN+zY6tjIYj1KcKxQ+M6l6z7xAxCzcnBuu
         GO7HrJvR8gUOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9E361C433E6; Fri, 18 Nov 2022 20:25:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216706] USBC resume callback takes far too long, between 650ms
 and 1200ms
Date:   Fri, 18 Nov 2022 20:25:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216706-208809-pFLO1hgkCV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216706-208809@https.bugzilla.kernel.org/>
References: <bug-216706-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216706

--- Comment #2 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 303220
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303220&action=3Dedit
otcpl-adl-m-1_freeze.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
