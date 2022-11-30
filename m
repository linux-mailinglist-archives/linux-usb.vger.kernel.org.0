Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E74B63D01A
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 09:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiK3IGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 03:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbiK3IGi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 03:06:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAE74A58E
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 00:06:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BEB67B81A40
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 08:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 791DFC433C1
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669795595;
        bh=vudAqmlE0LkHNvSxE5XICU9tFXp+81QhjFRw9yz7XvU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RnWSYoBXs3v71y2Gy3aTuDvpM/IihKyNbjytyL+f8d/VxbvIcqpxzg1dt1gRHbgI6
         iktoORaG9IAT3eIOSx+G69Zk16gMUJgOzn07AkwY1NF/lmyTN4sgrEWZGvwVFnH6Xw
         reRiyglqphJKEvTsU9zvlD8qX4q5MViGjNa0XOoH8O2YKm3kDpzbqtVkcX7Y61c7+d
         T4MbsrNMGmSAdqP0y/vyM6ap4fRN3JkQl3koHAHJPHkxWlP3uAFAeFmHkLpsSyxZMz
         pLGuFfgBvPpBSU4lFcBwZhIJupOKbAwgfg4D/AhZrXOPC0AicHqiGJd07XebvlYHcZ
         QkOdG4GqRr1tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5B55EC433E4; Wed, 30 Nov 2022 08:06:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 30 Nov 2022 08:06:35 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-KKsJ7WdATQ@https.bugzilla.kernel.org/>
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

--- Comment #16 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
There is something wrong now:

[    0.372625] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig Segments =
MSI
EDR HPX-Type3]
[    0.372627] acpi PNP0A08:00: _OSC: not requesting OS control; OS requires
[ExtendedConfig ASPM ClockPM MSI]

This means pretty much no PCIe at all so this cannot work as expected. Is t=
here
no way of disabling ASPM from the BIOS side? Or then through sysfs between =
the
PCIe downstream port and the xHCI?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
