Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C83968607C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 08:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjBAHUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 02:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbjBAHUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 02:20:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F185CD31
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 23:20:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0761161198
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 07:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F336C4339B
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 07:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675236050;
        bh=borb4+b7Oby1Rg8A1h22R47ksqsfIqUOl1UKuPVaC7c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=htzsngMhb6AG/ATSBgpsRtAZYmEr4wIAeprJaZ/TIYqgXQOMq0NMyL1E/bqixoG4q
         WU7Pg6bq8oNltVxoAYusVX1u69lMGvtJ0P0+6fBUkohhB+vszgyHIwEK+Z6oPwNcw8
         DgzTz2v8sY4xtK7beTLvsTQ0Ml363/3o4FMHIGK+Pt+J/ue6oSH/TPJcJwscOhoVj8
         CuHPvwqVJ2ta7RML7u6a60jBrIUvEkYRpSl1HKEnKseshQwFyHNHMrA7lbS3mzfHP9
         /esX8UlKj7adGrDpJBUEMpmEKiQj1NW4p2KwAf9qsXBghOL38ME4lmMumQR+sm3pZd
         WT8Oia67+hM8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 474B7C43142; Wed,  1 Feb 2023 07:20:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 01 Feb 2023 07:20:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-216728-208809-PW62HdIvPG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Mika Westerberg (mika.westerberg@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303594|0                           |1
        is obsolete|                            |

--- Comment #23 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Created attachment 303670
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303670&action=3Dedit
Use pci_dev_wait() to check if the xHCI is reponsive after the link is
activated (corrected)

Sorry, I attached wrong patch. Can you please try this one instead.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
