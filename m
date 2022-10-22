Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E3060856F
	for <lists+linux-usb@lfdr.de>; Sat, 22 Oct 2022 09:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbiJVH0M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Oct 2022 03:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJVH0J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Oct 2022 03:26:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4421B1547
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 00:26:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B185D60AAF
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 07:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11D62C4347C
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 07:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666423565;
        bh=TH9BomQH6TX6QIZlJZp/rzapGqOTzN/+3RQW4mTgYUI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a3sFMumbeSsGsgaOkIjzHnr3x56nWuBd30e92Nw9HTlEtNXQBX9jAWP14h2169HDT
         XXIrTUPVqlZdSYpdNK5Yr0e8iiUqsv38iAZGTjadKIGaxJeBHlT++NMqjr+7nUAFIv
         m8CrWSHXiS6nb7SqDycbtfUFGpSEcEyw/35TVFgmKkMPFmZEcasTaC1FummlbyvTYq
         bU0rB4rAQgkOMUQRRgOJnIqWTRsE0tJwqup/o6EOeUADp0sZDQwUOSE88HWK3L9Rw2
         Ent7LkOKGXrXlqToyVi4kuM9FyoWvzDgUpZf1QpcJAdjEO4U1s3t3trArOWXOBGI1v
         YowAoseexXWKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F14E2C05F8D; Sat, 22 Oct 2022 07:26:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216588] RTL9210(B) falsely detected as rotational disk
Date:   Sat, 22 Oct 2022 07:26:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supgesu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216588-208809-eBeOS3Z0Bz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216588-208809@https.bugzilla.kernel.org/>
References: <bug-216588-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216588

--- Comment #4 from Elias (supgesu@gmail.com) ---
(In reply to Martin K. Petersen from comment #3)
> I propose you create a udev rule to override what the device firmware
> erroneously reports.

The whole point of such an adapter is to make the disk portable, which make=
s it
possible to quickly connect it to many different machines (where some aren't
mine).

Creating a udev rule on every new machine is:
1.) annoying
2.) not possible since I don't always have root access

This is only a workaround limited to own personal machines. But it would be
much more useful if it was auto detected ootb correctly, hence this bug rep=
ort.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
