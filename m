Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B876B50CA
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 20:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjCJTQs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 14:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjCJTQn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 14:16:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C43D1308D9
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 11:16:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 10DDA60ED2
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 19:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D03BC433EF
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678475801;
        bh=+ecnQPNxi6MRzeO4eaBJTRN/H8Wqn8FhaAq0f9QMH/o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YCiucUdf36fOsOv1oqf9Ti3+G04HOcivEgsQ8yNV7AfXefxIfEI3rUqA1drcrkN2V
         +lndpLQ4LrskDNUFzEqoGPp2x4NDzrFo96SZN2zFounynod/akt4eKrHSoPFsrr7xF
         3PxmGyUppdOY/eKuhCTVs63wAOJsnUsNp4ANVZKs6HRVVc70H+UV1jFPH65gMI5VLa
         iVAj+KtqXFLPOnKfSxSWrkNVfzYmsOSknJn58LKyOQKP+wIwGj9+vDk7PsWBVyYOt0
         ayUh7HfPJfecreHcF5v22GUMPZkZhVfmO68Kz8xJkzlr0QtRLlv1o6KdwEgNVM5Nrf
         obJ4zScMKrsSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4B95CC43141; Fri, 10 Mar 2023 19:16:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217174] Plugging in usb external drive, mount and umount causes
 kernel Oops
Date:   Fri, 10 Mar 2023 19:16:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gjunk2@sapience.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217174-208809-1oWu7xb62v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217174-208809@https.bugzilla.kernel.org/>
References: <bug-217174-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217174

--- Comment #2 from Gene (gjunk2@sapience.com) ---
Forgot to say in my case no USB - just 1 nvme and 7 sata drives.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
