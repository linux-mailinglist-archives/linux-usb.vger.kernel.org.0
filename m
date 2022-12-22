Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9B9653B03
	for <lists+linux-usb@lfdr.de>; Thu, 22 Dec 2022 04:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiLVDur (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 22:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiLVDuo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 22:50:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D00BE6E
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 19:50:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2A434B81CF8
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 03:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9F86C433F0
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 03:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671681040;
        bh=fo9RuBtVGwCvhHbODDVKPwMvXD44uMGMCOqDLnLoHHI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k/Nn5JzTe55ydTKjNcxhd3wfVIjQ8IwIcB/+BtIKWcZQy4knlwgPdzrkB4aTehAhG
         loFOaMnS1ONrcEO/Uw06fmtoB/iwmo309/4znNqTOqJQscW1Y0CJ5ud9gswbL89854
         laomRA4GJZhWkmepdEfkxfBTzSaknh/Gs9oKc8d8ruBxXeaSY9TuTE9gnSPWUdKzJ/
         FCPOZ2rDp6CyPS3Pauf22H+xx4jLuGXLIb1ibjGaCTe/5HFc1WenFWE18IR8fkgFXd
         9k9MJY5BaQPxnW74d2Rvsgb0AUH76Jku1y8SQxLvave+zQ5G5t2Jd6z381XGncq1jR
         edtvosV4aGqog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 93D83C43142; Thu, 22 Dec 2022 03:50:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216822] Thunderbolt USB Controller (Maple Ridge) and its
 upstream pcie port fail to runtime resume
Date:   Thu, 22 Dec 2022 03:50:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@jakemoroni.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216822-208809-DVPvAgESvT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216822-208809@https.bugzilla.kernel.org/>
References: <bug-216822-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216822

Jacob Moroni (mail@jakemoroni.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mail@jakemoroni.com

--- Comment #3 from Jacob Moroni (mail@jakemoroni.com) ---
I see similar behavior with the Gigabyte GC-Maple Ridge add-in card, except=
 I
can=E2=80=99t even get my USB devices to show up after setting power/contro=
l to =E2=80=9Con=E2=80=9D.

There are no kernel log messages printed at all when plugging/removing USBC
devices on this card.

True Thunderbolt devices seem to work though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
