Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F54957BCA5
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 19:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbiGTR31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 13:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbiGTR3Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 13:29:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EFD6EEAC
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 10:29:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1A7D1B82177
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 17:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3CC0C341C7
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658338161;
        bh=biKssn1RmScPxHaUjOcFSKndLsEbQ23WxyIb2PBWkE4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FV/eZkpgXbMCObKML6UhArnbq2IYrDs9qaHIBvVyYcSzM7hrACLelFAtxFnoQKqf7
         G7+fuTmssnu2K4HAs2KmgoShikHIKWSvZQZVmKSM49jsT+5TimC+0wqUEcrtPXh34C
         53fSGDqXkoel9mvDy5HG0Mil+3P+ciw6f+uLUtsOfmMczvTMoaSr9WMyxLG82oTMrc
         hEiVrEV7lqyNznwHxeLAGuBUurIB9tz/wuGtgUKPikHR6GiGcPA3BP5Zrr0KFF+ZfP
         tQT5ac+/Rg8N3VpFRh7D3QMmigdeBSRK1/uOO+MyggbCee0+DIX+zkwBcQpvilyDN7
         cS6hRYZv2hC7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 81A4EC05FD6; Wed, 20 Jul 2022 17:29:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216243] Shutdown successful but machine does not power off
Date:   Wed, 20 Jul 2022 17:29:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bminaker@uwindsor.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216243-208809-LfDRtJcPH8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216243-208809@https.bugzilla.kernel.org/>
References: <bug-216243-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216243

--- Comment #3 from bminaker@uwindsor.ca ---
Created attachment 301464
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301464&action=3Dedit
dynamic debug on, journalctl -b -1 --no-pager > log.txt

update to latest kernel 5.18.12-arch1-1

echo 'module xhci_hcd =3Dp' >  /sys/kernel/debug/dynamic_debug/control
reboot (machine fails to power off)

journalctl -b -1 --no-pager > log.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
