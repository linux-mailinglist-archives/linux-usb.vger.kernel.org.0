Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9474AA540
	for <lists+linux-usb@lfdr.de>; Sat,  5 Feb 2022 02:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238206AbiBEBQk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Feb 2022 20:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233537AbiBEBQj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Feb 2022 20:16:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCB9C061345
        for <linux-usb@vger.kernel.org>; Fri,  4 Feb 2022 17:16:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 35DF061D54
        for <linux-usb@vger.kernel.org>; Sat,  5 Feb 2022 01:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97BA3C340F3
        for <linux-usb@vger.kernel.org>; Sat,  5 Feb 2022 01:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644023794;
        bh=SzHun6fNa0uhqx9sWEWCm2QvYiyj8bL9v+HqeQhvp1g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pasOeSKT+ouEoEcXOZClcjEe2OIRvV8uoQxF0qBZfZbLo3GPgaoJ/Av5WY0mH4jwV
         qqHh3OgTpEhU5rr+o8EiOdnCBTB9a66wQq+fvy1CEcnj5ABzjQLYjzfEyqBPryUQU1
         xg/QftBJWv2g3PnxdnBiRlPNrNkl4/ErPvdaaccuDcdTLMme/RTOvzvIgMOa5Hp2ph
         dIysClToy9W7cUAR/y3MZr/pAXuasHPulrHyydcxJ3HCxubFT1ZesezeBMz8+I5USW
         ZRYFxqdHcWcPCnAwtAMBvLNUgOLgo24Bpo6kY9FYFUGTNDwUOy2ioQrZNOJmk1ixt2
         1zo2P6n2Bz9fQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7B7C4CC13A6; Sat,  5 Feb 2022 01:16:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Sat, 05 Feb 2022 01:16:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rubin@starset.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-FWavTZcYTI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

Rubin Abdi (rubin@starset.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rubin@starset.net

--- Comment #8 from Rubin Abdi (rubin@starset.net) ---
Still an issue with 5.15.0. ThinkPad T480s, Debian Sid.

$ uname -a
Linux lines 5.15.0-3-amd64 #1 SMP Debian 5.15.15-1 (2022-01-18) x86_64
GNU/Linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
