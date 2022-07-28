Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFD9584431
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 18:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiG1Qc5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 12:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiG1Qcz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 12:32:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BDE2A408
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 09:32:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 552FFB824AE
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 16:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D946BC43140
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659025971;
        bh=47psiHeRK9Z/k6/KF3yzg7KINvUR9oJvK9ecVTkHhmw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Iq1kVXL+6IqXafrbEbTPkrVm/srrkQmB4cTa0MK2EGQxD2lQO45KSdECqQqiwPD1i
         C+k6zb0bCs8cfIJeGgjpfEnYLTzBxR+vZw9r1dBthVdGIpfy0Yh3rXw5I+TgU6N6S+
         DRObJgFYRo0xBA9mEMJmHHf5bGc6k1Z/7L0AoxthczjEQqUKfnSutao0vZwJfaseUD
         utQxcxqqeVU6wxBXJfWYx/QiGRM7K4UsC6cgQ5nV+yqqjnx1p3vYI+H/IYrWAK6qRg
         4iTnbRt0E/6pLrVpQ0NV6lyKVsdGKGrQU76BafzwVre8E889UrShCi35KYNNy+kJvh
         pZyVhEmENiRRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C4530C433E4; Thu, 28 Jul 2022 16:32:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Thu, 28 Jul 2022 16:32:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-Rau1zwTw6K@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #23 from wse@tuxedocomputers.com ---
(In reply to Konrad J Hambrick from comment #21)
> Hans --
>=20
> I have exactly the same Hardware and when I Enable my Discrete ThunderBolt
> in the BIOS, I experience a series of TimeOut delays during Boot.
>=20
> I am running 5.15.53 on Slackware64 15.0 ...
>=20
> I don't have a Dock for my LapTop so I am not sure this bug is a duplicate
> of https://bugzilla.kernel.org/show_bug.cgi?id=3D206459
>=20
> Q1: Is your Patch Series still viable ?
>=20
> If so, your second link above for the patch series no longer works:=20=20
> https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=3D=
pci/
> resource
>=20
> Q2:  Was this patch ever included in the kernel source tree ?
>=20
> If so, what version should I try ?
>=20
> Thanks !
>=20
> -- kjh

The series got merged in mainline:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=
=3Dgrep&q=3DAdd+kernel+cmdline+options+to+use%2Fignore+E820+reserved+regions

the kernel.org cgit is always a good option to search if a patch got applie=
d in
the end

Also don't forget to check linux-next
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=
=3Dgrep&q=3DAdd+kernel+cmdline+options+to+use%2Fignore+E820+reserved+regions

or subsystem specific branches like drm-tip (on the fredesktop cgit:
https://cgit.freedesktop.org/)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
