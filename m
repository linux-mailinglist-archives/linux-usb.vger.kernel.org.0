Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5226A50FC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 03:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjB1COC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 21:14:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjB1COA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 21:14:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04B74233
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 18:13:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 664B960F80
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 02:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C33F6C433D2
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 02:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677550435;
        bh=EZvVBxt4SRJ/eXFfA0zOcoKk5+yN3/ZaZ5bvkaEwDF4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NL2f1HGN5yMNy54JBO/xMXlzT0gEjUiOdvFcp+sEdGC4fVY6wOcbT1Cel09MuIEmF
         Hokvd7DxmRkWQ2eetJEHnCnLG3kyZhv/WOyBi3GeQjRRHXRQS+iIAwusHWmYArlivi
         RWXRLm3j1KIFgbEewxPSb3FggEGDDWknpxm7apQZmttpMnNHHY83T0UjHYF6njdYLM
         WEvg9MLLbintHoazv6n/iMj4J6ZkVi+mlxs3tBt0rXYl37wqdl/Q2cDl0HcD/0TRNI
         7jwb7Cb5HbRWfaG9KYXrkI2KpBGtet2JW3Zx3VYABm7wHmmSxnQPXJ32uht2xUkkCj
         +SV0987THZ97w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AE2A6C43141; Tue, 28 Feb 2023 02:13:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Tue, 28 Feb 2023 02:13:55 +0000
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
Message-ID: <bug-217089-208809-vWK1AJfAVC@https.bugzilla.kernel.org/>
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

--- Comment #10 from Alan Stern (stern@rowland.harvard.edu) ---
The attachments are pretty clear.  The most likely explanation is that
something gets sent to the device under one kernel but not the other, somet=
hing
which causes it to change its firmware.

The next step is to collect a usbmon trace showing what happens when the de=
vice
is plugged in.  As root, do:

   cat /sys/kernel/debug/usb/usbmon/1u >FILENAME

before plugging in the device.  A few seconds after the Xone is plugged in,
kill the command with ^C and attach the output file to this bug report.  Do
this for both of the kernels, and we'll see if anything is different between
them.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
