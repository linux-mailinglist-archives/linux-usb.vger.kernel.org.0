Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFC96C1404
	for <lists+linux-usb@lfdr.de>; Mon, 20 Mar 2023 14:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjCTNw0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Mar 2023 09:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjCTNwY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Mar 2023 09:52:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0836D9ED9
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 06:52:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7DB27614DA
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 13:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA5A1C433D2
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679320342;
        bh=QwwlFA5duFBhG1GpAEfyKd1uPIVtf/JAMHSkA/FK2zI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=beYAVAQY3DMWw5zla65Xq2BbUjo7snJIImh8MWUloN+qBAl5FVPiaaNQ+7p9GFmQu
         JuRQeqvzCg645xz1wmAKJQ8rttk73QYumLM1rKKkWRDvYjlG/Va/h9lnD2mBbR+CIJ
         9LDXFVldZeOqefYyIEC+wJ9RE/L8Rc55fcAgAEa4HFU8nqkgSb/Pn4nq2GiUPW7Rm0
         2lgBhajE8hufIFPmOoUB6gA+RmwFFhEGJ4/u/rBV7UE8PHamkJp0S889QVFhAoRhki
         9Ab6nYh3JF7FrLhcYFu43/7C09Vc0NH8AecAWm7/9vuW1O/8m628mTGR3VHW+sYNJ6
         26VR2QP0qDPhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B66BAC43142; Mon, 20 Mar 2023 13:52:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217215] Oops removing usb drive
Date:   Mon, 20 Mar 2023 13:52:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217215-208809-4gaxoVLZPf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217215-208809@https.bugzilla.kernel.org/>
References: <bug-217215-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217215

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
