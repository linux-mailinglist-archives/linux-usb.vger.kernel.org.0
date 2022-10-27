Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D73610271
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 22:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235862AbiJ0UM4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 16:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235472AbiJ0UMz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 16:12:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC852D1DC
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 13:12:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA186624C9
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 20:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53D75C433D6
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 20:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666901574;
        bh=AiNNgoULqVvllWdm2+g9N91V5W3cORhEGGpCW7dwMmY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ACbu9TkTW+mjOamWLZ1PixoyF71Jb3j3rrP73LpiyODe2IWtEHDMsAScf/BcIlKPS
         KIZ277AaWM2Nf+dHJGVZwpe8vvoB9UeTFOU3T06MOWhAndXcf2AK0jyVmb0GcfOJXa
         uoGJMlbFTzjX8T0lj8fc7t3CPdaO2YZyHYUkGjJqa8G0jG8gh6XZXNhyFk/uK4Mdbs
         +5lVU6sLjtt3uB7NhWx4w6JhChSgC1j7Uo3+17HfAq6SVH6JMR3Qw7WqqaRWaEqSb/
         chUniJcNgpUSX7cd3y/iXTbaAYuMZrgA+PTopg28/a/W5TPBZxXP3q90Td3qB1Bs60
         Pna7XDhFoQSPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 29A06C433E6; Thu, 27 Oct 2022 20:12:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216630] config 1 has an invalid interface number: 2 but max is
 1
Date:   Thu, 27 Oct 2022 20:12:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216630-208809-bReOfAt1cP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216630-208809@https.bugzilla.kernel.org/>
References: <bug-216630-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216630

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Alan Stern from comment #1)
> These messages indicate that the device's firmware doesn't conform to the
> USB specification.  You can see the problem in the lsusb output for Port 6
> Dev 3.  The two entries say "If 0" and "If 2".  But the USB spec says that
> interface numbers must be consecutive (starting at 0).
>=20
> It's a harmless error.

Thanks a lot for the explanation!

Since these messages can be seen at: dmesg -t --level=3Dalert,crit,err,emer=
g,warn

is is it possible to decrease their level to e.g. notice or info?

I've google for it and there are literally hundreds of affected systems. I
don't think it's worth alerting the use to something they are unable to fix=
 or
get fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
