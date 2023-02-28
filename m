Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9AF6A5783
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 12:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjB1LKG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 06:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbjB1LKA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 06:10:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFCF16ACE
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 03:09:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B00AB80D58
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 11:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2040CC4339B
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677582597;
        bh=nklAdTc0J2+nisQoze7PZXsrrOohPmK6JJx/BJvmdWI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cAjB1Ulr2PvjjSAFsc2wjV38Le5LOfD2wv7EXsSNz4E1WkKKM+lAnxmiugVoPTk6H
         P4Du1ay2kRKehYOwlmGRkv94a0KW1DHcPbKWYVSWgtB15Oy+LeTxilZo3c/QW/50IV
         J/twcyvINlfch2oqBIq43E3vrJ6Y8AxfcJTOes1DLEeLVq4JvLvs9mlfc+6dZDxJqq
         K4EppkMZA6KxHTeshNrJhPoifPHKSKPZ85vGqkNm6c8BblVJd602LoJyTkj1fa4rdm
         Cpbr0Rfg9VnBuCVq425gh5yW/6lrm7uxAM2TjDqeBVUw7WlsTs8gBqKwvJVUdUAkch
         NCLds1An/EVDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0DC9FC43143; Tue, 28 Feb 2023 11:09:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Tue, 28 Feb 2023 11:09:56 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-217089-208809-06WvuHwKXp@https.bugzilla.kernel.org/>
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

Pierre Germain (pierre2008@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303804|0                           |1
        is obsolete|                            |

--- Comment #13 from Pierre Germain (pierre2008@gmail.com) ---
Created attachment 303806
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303806&action=3Dedit
Log from usbmon kernel 5.4.0.33

Log from cat /sys/kernel/debug/usb/usbmon/1u >FILENAME under kernel  5.4.0.=
33

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
