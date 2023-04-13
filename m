Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBFC96E0887
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 10:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjDMICc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 04:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjDMICb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 04:02:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01DB469E
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 01:02:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 621F163C51
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 08:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C23F7C4339B
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681372949;
        bh=RdxF9A00wLPp6mpkFDfZoTdSvOwvK4anWh5IM/TiAMc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XtaOqOk1MAQLqMKYtAuk70uxWpG0/ES5Vmi+nuO34o/iodP7SnSNayz2mX/gxpQi6
         XIB0PxGHwsCuIQSPQMcX4FDP0jiIHcOpJskLI5OlNGyKgcOnG6o/dk/4Spbu9VU6Ez
         xgI7edErjqc0wkWMUeKZppGSFfrXEWhqGezB2/lOmjqcKnaRXQb2taP5bRbhrTQOQV
         /dde85ECWL/DFiCn6kiUgTgwGB8pgHHl0cdpdl26XXNSKlZX3FJQFHkC4Jr4NXaudx
         0k+DQlOKEl8fL6eRW1UUoNJrC5zQfGl/RDADOQW99IT8/wyry3fvY6O3aUHgrqSRsP
         NVUwseH3EPYYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A7BA7C43143; Thu, 13 Apr 2023 08:02:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Thu, 13 Apr 2023 08:02:29 +0000
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
Message-ID: <bug-217242-208809-oCDwpjF8CP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #17 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thanks, one reason why ring expansion calculation is incorrect is that we t=
ry
to store a negative value in an unsigned int.=20

static int prepare_ring(...)
{
        unsigned int num_trbs_needed;=20=20=20=20=20=20=20=20
        ....
        num_trbs_needed =3D num_trbs - ep_ring->num_trbs_free;
}

ep_ring->num_trbs_free might be bigger than num_trbs

So we end up with a huge and incorrect num_trbs_needed

https://elixir.bootlin.com/linux/v6.2/source/drivers/usb/host/xhci-ring.c#L=
3186

In addition to this there is most likely a small bug in tracking
ep_ring->num_trbs_free, gradually decreasing it incorrectly.
Not sure where that happens

Still working on that debugging patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
