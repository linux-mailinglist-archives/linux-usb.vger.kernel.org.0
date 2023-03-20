Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC476C0CAB
	for <lists+linux-usb@lfdr.de>; Mon, 20 Mar 2023 10:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjCTJAT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Mar 2023 05:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjCTJAR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Mar 2023 05:00:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86188A5C
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 02:00:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 248956129B
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 09:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EE75C4339B
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 09:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679302813;
        bh=O6o+IURjpHY6zPCxmrD+pJf+arOXhn/wUfrx4+rz5mA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mpiz2IBlIohnualr7MGFOALNcXo7DXoJ2xCY1N0ZXOVW5B534M5XsLo4CNcjIkTAS
         +J/f5RwmUg0OxjHYH7lUbUHCdKqNffrUETc33BadU8Mfffk3IEBXkAS9d+LPG2e7oR
         K4l1hLftXoOzeNp5FBlkXuABCsWOPMOJKk844mCcB+FA+1o07HTk1hBwiULJDD/lvM
         hwnhOi5ovfKeRpJ3JFMaA3N7T2dRu69eSWfovrAVu14Fgt4u9V+RZLsb83de0tdEks
         j2S9sS0XxgIrUu3YZsUuiyncuslf7oixUm88iEX2+Kn7zWJfxh4ymgKpLWGpms3srZ
         4B5ZLuBSsCoIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 63EFDC43141; Mon, 20 Mar 2023 09:00:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217204] ASIX AX88179 does not work in 6.X kernel
Date:   Mon, 20 Mar 2023 09:00:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: petr.bahula@artisys.aero
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217204-208809-6f1HSfeiLP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217204-208809@https.bugzilla.kernel.org/>
References: <bug-217204-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217204

petr.bahula@artisys.aero changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from petr.bahula@artisys.aero ---
(In reply to Hector Martin from comment #1)
> I mentioned this by email, but to keep things in the bug tracker: Do you
> have CONFIG_USB_NET_CDC_NCM enabled? If not, please enable it. That driver
> is the correct driver to use for standard CDC NCM Ethernet devices.
>=20
Yes, you are true, the CONFIG_USB_NET_CDC_NCM must be enabled. All is worki=
ng
now.
I configured the device according the
https://linux-hardware.org/index.php?id=3Dusb:0b95-1790 and the
CONFIG_USB_NET_CDC_NCM is not listed there. I know not haw it is generated =
but
I will send info about mistake to info@linux-hardware.org.
Thanks for your help and sorry for lost your time.
Best regards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
