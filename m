Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66DBF6A7086
	for <lists+linux-usb@lfdr.de>; Wed,  1 Mar 2023 17:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjCAQHf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 11:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjCAQHd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 11:07:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306C1460AA
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 08:07:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE9A9B80EF8
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 16:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 838D7C433AC
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677686850;
        bh=0WnDF4aTTp/T1fEwBDq8y8anwBEZgMsbdM19IYw719Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EMoEcz2dlOLJ9E2zyaOoClGPqmW5xRtcXwX81Pb2MVldZepjEusmqE0CnQu+Cv0AQ
         0sNN/LO/85/TkmnIlymKIYQildbPr/fsHFj1GZ93M0EXCuOYTx36iAaci7F6bhH65M
         cvSYE2kXYODRnOnjPE4BTHRBq27JOalrCJDVKwbWzTeAHIAHgGTHk28fxU4tO+7jY+
         7jzwsS32aDJsCZz2t9AHWYCDIyaISV/OCPEWR6fN5JKJSN3nCaXO4yDnbM3bxYjDMB
         R9ti+Ea/SNvbq/NLvbenX52dXx7oETlaT8i3xxEPaq93eN7+GpFRZjPw4eFTp1d8FV
         mly10VUMoqadA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 72748C3278F; Wed,  1 Mar 2023 16:07:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Wed, 01 Mar 2023 16:07:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-xmSTnFda08@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #22 from Alan Stern (stern@rowland.harvard.edu) ---
Oh. It has to be done by the person who originally opened the bug report
(valino) or the person to whom the report is assigned (Greg).

But I see the status has already been changed to RESOLVED IMPLEMENTED, so
nothing more needs to be done.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
