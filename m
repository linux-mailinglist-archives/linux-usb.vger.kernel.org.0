Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B72E53429B
	for <lists+linux-usb@lfdr.de>; Wed, 25 May 2022 19:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343624AbiEYR6m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 May 2022 13:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343621AbiEYR6k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 May 2022 13:58:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826A61D321
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 10:58:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 21BE8B81E99
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 17:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D990CC385B8
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 17:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653501516;
        bh=5LlAUVcZHfOTIb4e3in3W9P4QfYCZlEqhAlCR1TOVoU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=m8CTqISpOkQa3emAdwfXEK/C9o4Kwhwf9SHIAvKRiZd4662nR35tUiHS/E0LTOg4l
         aokFmES5Ttneo3KuuWBNwzwT8WXLEGWELb8IIWnvJo0wyOw0T84GduroA9Ikd4aBEa
         tzkK9SGVxKmrNhPvv86186MXqo4xQWa2RpQTzYyCCXrzkf3BOMYo73gDEUILcern5i
         yRwupgCIrcumfXFSTU8YX41/EX8gbw1lAPg1a1Hb41V01MgJsgOsxodXdFGzbia4Mx
         XivH32ueRymN+kHNgLgdl80SBFUbavBh6ZVc7ClI6eYr7Ja77DOKCo2Vmb86nBD21l
         L08ZL/RsQX8yw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BE2F8C05FD4; Wed, 25 May 2022 17:58:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Wed, 25 May 2022 17:58:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215890-208809-AFYocQvu1G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

Satadru Pramanik (satadru@umich.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #22 from Satadru Pramanik (satadru@umich.edu) ---
This is resolved with both 5.18-rc7 and the release version of 5.18.0 .

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
