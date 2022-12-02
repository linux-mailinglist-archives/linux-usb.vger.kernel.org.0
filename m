Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBC0640F2E
	for <lists+linux-usb@lfdr.de>; Fri,  2 Dec 2022 21:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbiLBU1j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Dec 2022 15:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234230AbiLBU1h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Dec 2022 15:27:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068826427
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 12:27:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 983CD623B4
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 20:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3D72C433C1
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 20:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670012855;
        bh=OwoNfjdLGAwcUGgYNJYDHDPpElwev2RQP7ciQCwZHuw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KfP6NDgPUkNMwjbPC486zKuBlZ9mYAzi0qb6LYuAV2G8KzwwX2K1VIKF9kBqMZWOn
         0wWLpXOBKJBkwXTD/GY8KPPyWf4MJEqpHaySeEwSwh4QAUvr67vTPxOak3w/kwS6F/
         DUurMqdUPpYLSr2S+uER/o1ZGikzJ6W2GSx0V4IfznLW3ZdqG8MfMSqtA/57bKqfwp
         AfnIhnP+SQMo6t8GHhUpMrsKrPoHN/AWoeO7ciU/KCRl0uv6UnBjQCDMBQbwzyVuWN
         kuvlqqmnYE75vCF9bN/KHgT4RYkfWuj1cFq/6iP5HyEKYqxksfgU9qMKXiqbTM4s4N
         pFBrd8h6IM/zw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DBF12C433E6; Fri,  2 Dec 2022 20:27:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216766] USB enumeration lockup
Date:   Fri, 02 Dec 2022 20:27:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216766-208809-p7LEehQvf7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216766-208809@https.bugzilla.kernel.org/>
References: <bug-216766-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216766

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
Please attach a copy of the dmesg log following one of these hangs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
