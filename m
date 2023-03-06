Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 155F06AB482
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 03:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjCFCE0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Mar 2023 21:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjCFCEZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Mar 2023 21:04:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFABAD08
        for <linux-usb@vger.kernel.org>; Sun,  5 Mar 2023 18:04:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3437B80B8A
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 02:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BE63C433D2
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 02:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678068261;
        bh=0vhRiziIO5EuTkzIEsNt9Zp3SpD+KHcgFdzZlwMS4LE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dsDalUqritoSUwRJgcDaCBYY8uLOl/2pdfosEbBhAcS8lGlta9lzdlgcTEg6tXsmG
         ge/tf0T5htlGA5h9LubW0Z4v7R0WdtBUFB0HA6pAjamjrKoE4zyUCZoke8WqRQfdJ8
         l/+mwNcak8YKbEftvFaAES7d1Z7gUYtzJgVXx4uvOqSfvxIuczLAB973/Ha8W0Ax3E
         HX2W5NA1s6r6z4szlbt2oCRCh6RGnONsvaNBSoThEhxJnbOur8NDIvS5AyBIXRynOo
         l01x15x+q7LhDrGEEA4mBKz2fzDJdCyjJTsN3dwSV6lMQiUuUR60sXbt89HfOe1VU5
         GmHw1wtzYBsdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 46FFBC43142; Mon,  6 Mar 2023 02:04:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 06 Mar 2023 02:04:21 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217122-208809-NTMzQg3Tas@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #1 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
When you say "any 6.0 version", have you also checked 6.0.y releases?=20=20
As a guess - could this be related to runtime power management?  There is a
policy change that happened in 6.1, but it also backported to 6.0.y.  So if
that is the root cause I would have expected a failure in 6.0.y as well.

If it's not runtime PM, could you possibly do a bisect?
As it's an occasional issue it might be a lengthy process depending upon how
frequently it happens.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
