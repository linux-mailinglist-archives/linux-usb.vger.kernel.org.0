Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C07955DEC0
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234489AbiF0LSo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 07:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234233AbiF0LSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 07:18:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F6E654C
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 04:18:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7663F6142E
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 11:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8D74C3411D
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656328721;
        bh=nZ6xYWYvu3mBfpb23cCOu0WDKNZau1FhZpYE7g2WqfE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=I95b/8tR+/vfAKZ0eGGZ6VDpsRLyOPKzd/U7+0LdMSUikeYKc8SdsmRLak+W7LDSZ
         QD7HU/8GaXudi57MXsCJgJ5rh3nhA5t3joauC5oXbA69BDz4CZxFpxu+6LJooYM07a
         w3JUP0Ztkyp1yolQlV32q8lVorUTb4QmH3Ag1xNIAGZ7D1SlDvn+jIDVii9dd+aK4a
         Z6s1J0u/BB1xsbErFXLUe08kuN7GypVsS89QNoQU2H8Ms18Bzxn1d5qwPtbFj4nW3F
         nyph+bLVr9dbAT12uKcS0XIQqd1qXrqb3gbi63qNYzdU+iRynHih8QE1ow/doXbR5P
         dVSBj2WlPSBRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C6F07CAC6E2; Mon, 27 Jun 2022 11:18:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216171] Hibernation not working because of xhci_hcd
Date:   Mon, 27 Jun 2022 11:18:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216171-208809-cb4ih45e2f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216171-208809@https.bugzilla.kernel.org/>
References: <bug-216171-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216171

--- Comment #1 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
On 25.6.2022 20.19, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D216171
>=20
>              Bug ID: 216171
>             Summary: Hibernation not working because of xhci_hcd
>             Product: Drivers
>             Version: 2.5
>      Kernel Version: 5.18.6-arch1-1
>            Hardware: All
>                  OS: Linux
>                Tree: Mainline
>              Status: NEW
>            Severity: normal
>            Priority: P1
>           Component: USB
>            Assignee: drivers_usb@kernel-bugs.kernel.org
>            Reporter: prz.kopa@gmail.com
>          Regression: No
>=20
> Created attachment 301268
>    --> https://bugzilla.kernel.org/attachment.cgi?id=3D301268&action=3Ded=
it
> Dmesg log with failed hibernation attempt
>=20
> Starting from 5.18.4 my notebook (Dell Latitude 3340) won't hibernate -
> hibernation fails with dmesg errors related to xhci_hcd. I'm attaching dm=
esg
> log with failed hibernation attempt. Problem goes away after reverting co=
mmit
> 63acaa8e9c65dc34dc249440216f8e977f5d2748 (USB: hcd-pci: Fully suspend acr=
oss
> freeze/thaw cycle). After reverting this commit on linux 5.18.6 my system=
 can
> again successfully hibernate.
>=20

Looks like there is a pending wakeup:

[   30.475168] xhci_hcd 0000:00:14.0: PM: pci_pm_freeze():
hcd_pci_suspend+0x0/0x30 returns -16

Guessing suspend_common() in hcd-pci.c retruns -EBUSY because
HCD_WAKEUP_PENDING(hcd) flag is set.

Does xhci dynamic debug show some port event before this?

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control

Thanks
-Mathias

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
