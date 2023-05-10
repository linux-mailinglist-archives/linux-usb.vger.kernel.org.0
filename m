Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A98D6FE4E7
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 22:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235944AbjEJUPi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 16:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235708AbjEJUPg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 16:15:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE1B1FCB
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 13:15:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0126661267
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 20:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59866C433EF
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683749734;
        bh=1rTbEJQSA8PJ/Zwf1ClHRjdqBOd9b7uIdx/1TfgOF5g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mI71pUtVug6wh9U/Ep7f4FkvpqoB5bI+SXSZCRtMs8sqKPOhSaBPkMYwpErhrNWBL
         Kj8lcCiHmXwXIDablO3nrVgsBg0WYcswHh3tVYULAdYLZqjEjafZIi2RBcp5e2VfTR
         Obe2M3Il4CjQYksz1DX09ZVFIe3h6YuNb6xY0mLBjUMAbhHaG5h1tdu23G8GM/7qPV
         cPB4D0Ib7RnQj0Pm416HDFdQClxBr/beztN9lb7zNvOd/436GcARcv62I+TbIpmkAM
         UNe0tR+z2XaoMUvaMOrl1N6hg9Gxtt3NyKCf0JE24tCBXw8snVKnw0mmN1I83BREZz
         5GtnmZWsxfYIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 38348C43141; Wed, 10 May 2023 20:15:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 20:15:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-5atUJmjYLw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #14 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
That's ... interesting.=20=20

Do you have fTPM enabled in your BIOS?  If so, can you disable it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
