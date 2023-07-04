Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1F7747A49
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jul 2023 01:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjGDXNe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jul 2023 19:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGDXNe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jul 2023 19:13:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F7AE72
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 16:13:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7FAB6123F
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 23:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EFBAC433C8
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 23:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688512412;
        bh=ADv9uP/BhdHHiC/rWB2vPOFJZ0TycJQ/aW0enAjL7Uo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=E7aKPeLGZd7p5Zb1xmRy5QjxsnFlb9vTRk93jgEzZKxkmWD+0tjg8W1ge3qsihD6/
         L7iGcQ/88YxSBQ8dvlJC0vixJS6+PoFtAvoRSF+ZgNx/ri2FT2j9ZNMGcKpw0NCPZ+
         EKHC1gIT3LcCgMmfUtoGU2nYCMW4QcH7Wz6+l2zR834RbqEwPXYEmPXbCi8fvRV0Vd
         ttjso2Zp801joWBGRo4qsIodssWQxOwdLUtFmIcFGFSzZolUefsb6cjU9KQhtUefT+
         wDq6UZKO7WhC28yYosPyL4bkcvL8TOxOSrqS6c4WsJiphaIeIw56E0dldQh4Qm9hiP
         +0xOOhzVeai/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 17F13C53BCD; Tue,  4 Jul 2023 23:13:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217632] 3 more broken Zaurii - SL-5600, A300, C700
Date:   Tue, 04 Jul 2023 23:13:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217632-208809-dyfCz3LYJW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217632-208809@https.bugzilla.kernel.org/>
References: <bug-217632-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217632

--- Comment #2 from Ross Maynard (bids.7405@bigpond.com) ---
The problem is that networking to SL-5600 / A300 / C700 devices does not=20
work. I cannot ping the devices.

The error is occurring in zaurus.c. dmesg is missing the following line:

zaurus 2-2:1.0 usb0: register 'zaurus' at usb-0000:00:1d.0-2,=20
pseudo-MDLM (BLAN) device, 2a:01:39:93:bc:1a

A patch was created in 2022 to fix the same problem with the SL-6000:

USB: zaurus: support another broken Zaurus -=20
[6605cc67ca18b9d583eb96e18a20f5f4e726103c]

Could you please create another patch for the 3 devices: SL-5600 / A300=20
/ C700?

Thank you.


On 4/7/23 7:28 pm, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217632
>
> Bagas Sanjaya (bagasdotme@gmail.com) changed:
>
>             What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>                   CC|                            |bagasdotme@gmail.com
>
> --- Comment #1 from Bagas Sanjaya (bagasdotme@gmail.com) ---
> (In reply to Ross Maynard from comment #0)
>> Created attachment 304541 [details]
>> dmesg and lsusb output
>>
>> The following patch broke support of 3 more Zaurus models: SL-5600, A300=
 and
>> C700
>>
>> [16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad mod=
ule
>> alias from zaurus
>>
>> dmesg and lsusb output attached.
> What problem do you have on your Zaurus devices?
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
