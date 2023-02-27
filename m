Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 136276A4D1D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 22:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjB0VZI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 16:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjB0VZH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 16:25:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21F810264
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 13:25:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6A0A1B80D2B
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D50AC433D2
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677533103;
        bh=Hwhw3DapqOoZPerNOkhYhgsPwS0lDtpDq5lsNsYX0P0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xrvm5278JasY4cYnk3Wig4r5HKTClV+pxXc7GKVZQzDPqsRMlntINe/dEcHX4j/UL
         UZFVXQYIVV6tHKgXwN0ZaODZPG9g1O+AsEmp5EtwvGi7N/Y9QcwjZS3uAy5LnmNJMq
         fF6hHxxzvs1nIjy14XctUWI32nR5+kUHNJcDzboR+fC0MhykdlT5Eia+Bm0fsrBmaM
         9hCy/d7ICvxJy8dG6OcLRbLFuT0F4hsXCDijlNAMbJEsA0mL/GLW9vI2dAZ0Nfpzom
         fSuDfVcWNdQBuYwL3ZEBR/D+tSX4cVFyABayUOPdaL3HJARO9M0VFwJ5DDlw0e9PfF
         MkIg2ReATllMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1C790C43143; Mon, 27 Feb 2023 21:25:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Mon, 27 Feb 2023 21:25:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217089-208809-cSY9ygfnqk@https.bugzilla.kernel.org/>
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

--- Comment #8 from Pierre Germain (pierre2008@gmail.com) ---
Created attachment 303802
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303802&action=3Dedit
UI showing the xone23-c under kernel 5.4.0.37. The audio device is NOT
recognized.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
