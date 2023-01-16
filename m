Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FA866BAF5
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jan 2023 10:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjAPJx1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Jan 2023 04:53:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjAPJwx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Jan 2023 04:52:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524E2193E0
        for <linux-usb@vger.kernel.org>; Mon, 16 Jan 2023 01:52:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E251060F3E
        for <linux-usb@vger.kernel.org>; Mon, 16 Jan 2023 09:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 539DCC433EF
        for <linux-usb@vger.kernel.org>; Mon, 16 Jan 2023 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673862762;
        bh=AXonYKeqSwnUCENBXW8olQVaMyKDdqTFRbDK0RGpon0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=L2c3G0YzincPQKLiQR6tGIlMY2EKw5oXARip2ib1cyUALan94juzj1ca7EnnOgI/3
         eU0aYmLS4dhthgyrm1dWUlJrzdN1eFizObumwzQejDTYAiqKhljjjf5WIE51H+i42D
         +Y95lpaaNsUZbJa17w/pXxoBpo1asF2ZxxHwIW3gra3sVEFLApZCT8gXKVUWYdGEaw
         ubNe4LAjBcrOwlxSylLu3TXWrVcRC/6UQYirNcyhwynZvAVtXTIMLCB+EgwEro1JpZ
         OMMUhIzFuGnxJbF3mS2IMDgIwS+G++BzIz/FUf+twFMP25GNI8SMSnQTIkGYciOGkO
         fgM4+Q8xC9vhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 42963C43142; Mon, 16 Jan 2023 09:52:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 16 Jan 2023 09:52:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew.co@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-RVRtirUCl1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #47 from Adrien (andrew.co@free.fr) ---
Works for me too with kernel 6.1.6 on Slackware (current)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
