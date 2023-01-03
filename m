Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F4165C1FD
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jan 2023 15:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbjACOau (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 09:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237666AbjACOat (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 09:30:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D8132E
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 06:30:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 256F0B80EC3
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7B80C43392
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 14:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672756243;
        bh=SXg9msuB4AHpoxMDvLvbtiP4dCb+5woEz+b4c1aE7QI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=f4MzzeiklmkrMfQn4daNfi9ClBYcIokBt+yEiclSWU4qiIBPGTQXkGzCmicBxbNcT
         ZivkfjwP8Okv8YQ9RZgUc9FGnrpEnTJZKjajHVekp+WqhRZirC3KwrkD3j+rlmvbOn
         y6dLr0sc8ZpoR2SgY7gE528uD0+ks8q6KGv7tDS07M5G3VZ72d4qL0p2YcOFTrmUO2
         7ixeNdZDIvDxP/89Pqp45JqUdCF2iRbwntOi5eT9tQFxd2Twi5lgR1BXL15pOGGJ2y
         0vFbkZ+z+ddcDPOriyyw1S5CcaG2TmahMqgtGQZGKrbNpqFf19KdQoHGtlWuy0H12H
         dm2Iz/L/SpdhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B7967C004D5; Tue,  3 Jan 2023 14:30:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216863] ThinkPad X1 Extreme Gen 5: PCIe Bus Error:
 severity=Corrected, type=Data Link Layer, (Transmitter ID) after resuming
 from sleep
Date:   Tue, 03 Jan 2023 14:30:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjorn@helgaas.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_pci@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-216863-208809-o60jtSSsmE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216863-208809@https.bugzilla.kernel.org/>
References: <bug-216863-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216863

Bjorn Helgaas (bjorn@helgaas.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bjorn@helgaas.com
          Component|USB                         |PCI
           Assignee|drivers_usb@kernel-bugs.ker |drivers_pci@kernel-bugs.osd
                   |nel.org                     |l.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
