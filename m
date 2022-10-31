Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E1B613E0B
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 20:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiJaTLJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 15:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiJaTLI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 15:11:08 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2117F958F
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 12:11:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 65944CE1370
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 19:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EDA2C43146
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 19:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667243463;
        bh=g/TYRR945q9r09iljwEdZMeDjulxDgLeMWkkoyChGi4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LWNCt3uIQZ8GZQoReovua2eMqfUst9CcucI2UYmJhySnbvk5VBWp9ffQjMJRJLK2w
         t8EpbzsNiLFY0taXuQhtmGlZeK7zuZkqE5vZxZOMYKVafo1QISr6d3YxT8K1h50PV2
         8RLoxQ14UnwYhinngU4QKg/Qq7o8APzhYQuO9leX8bLiQGMcZqGgu2YMN84yDU6MFx
         bN8cPzd839t853KKGfMrcDEhi5Fc6/f3WWuaN7Ek+PjnQQFvnD/bq63g0SYOxpSeGW
         Q2LquxvRLWOYYOQmkgomILGTnA2lwge+hYLtzJxogB5lEhn2PpzsoYp8B/14D/HQH1
         +ln6HTIF+lg+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6A53DC433E6; Mon, 31 Oct 2022 19:11:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Mon, 31 Oct 2022 19:11:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jk@kifmann.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203419-208809-IgGr9R0Nxw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203419

--- Comment #54 from jk@kifmann.net ---
(In reply to Peter Newcomb from comment #53)
> FWIW, I eventually discovered that after I updated the firmware of the
> device I no longer needed the patch.
Thanks for the hint about the firmware update, I did not expect one conside=
ring
the advanced age of this model, for today's product lifecycle. Using another
machine to run the latest updater (FWUpdateGroup_9.4.52.exe), it shows ther=
e is
in fact an update available for my Logitech Group, 9.1 to 9.4. The info scr=
een
reports it would update "audio" and "codec" from 8.6.102 to 8.6.111, leaving
both "video" and "eeprom" untouched at 1.4. Maybe someone who already has o=
ne
with USB device id 0x0882 can verify it has 9.4/8.6.111?

As the updater does not hint any roll-back function, I guess there is no ea=
sy
way to check things once I updated mine, so I did not do the update yet.

Considering that this updater is only available as exe, it would make sense
from my perspective to submit the patch from comment 50 any way. So people =
who
can not run the updater or when the updater is no longer available, could s=
till
use their Logitech Group.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
