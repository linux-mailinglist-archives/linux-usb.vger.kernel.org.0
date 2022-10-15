Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D03C5FFA0E
	for <lists+linux-usb@lfdr.de>; Sat, 15 Oct 2022 14:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiJOMxx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Oct 2022 08:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiJOMxw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Oct 2022 08:53:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C1049B50
        for <linux-usb@vger.kernel.org>; Sat, 15 Oct 2022 05:53:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9CA460CF6
        for <linux-usb@vger.kernel.org>; Sat, 15 Oct 2022 12:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EAFBC433C1
        for <linux-usb@vger.kernel.org>; Sat, 15 Oct 2022 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665838429;
        bh=/tS+NMHjwu2UilhT9L2KWFYfQ91ZJ4lIk5d/irwa01Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IKWjMP6d5vrMnmJ+wfVikxCuBtPYUDSvHtlSaxyfqsjdf/kAPRn1DIw77Q90ehAlm
         j9Qby2kFtSgRL3lJGH2bLoEtsRgaRvDrxrXWg+H2A/kgZrEI3fY5xivnYm8mYKok8K
         VqVeiluojRQU0aRmR2gTuFsZSHqe8bC7PkCBSfhGvYyJc4OAS/cyPcE1kRZMMeD7ni
         Ip/T6qfNFMoJsPNx1RuePvX+3gojeHmGx2n7N/h4YemlS/EHVPWjusq3kIp4UWVhNB
         pk4c/6LmdCKYmR41IgYFSTyI8DkTtHBzpXrG2YNoF4/nUGZkspm6KlkLIaSvdXtOfS
         GnZPXf8XYFJvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E0156C433E6; Sat, 15 Oct 2022 12:53:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216588] RTL9210(B) falsely detected as rotational disk
Date:   Sat, 15 Oct 2022 12:53:48 +0000
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
Message-ID: <bug-216588-208809-4k5w33xasu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216588-208809@https.bugzilla.kernel.org/>
References: <bug-216588-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216588

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
This bug should be assigned to the SCSI or block subsystem, not the USB
subsystem.  USB is not responsible for determining whether a disk drive is
rotational.  All it does is transfer commands from those higher layers to t=
he
drive and transfer the results from the drive back to the higher layers.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
