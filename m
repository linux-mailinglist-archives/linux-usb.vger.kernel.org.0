Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31B717436A6
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 10:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjF3ILh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 04:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjF3ILf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 04:11:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190492D50
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 01:11:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0BAB616D8
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 08:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08C04C433C8
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688112694;
        bh=V5MUuvPXil8TJrAMwr0Xs7S48fGLVnOMqIotUsIx2t0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uePQWbg8zZ3cMXZuzLpxtBiEgN8CahKBF15ELmjbpwr1X5N8fnbJ6BCtNhfNAP9CB
         r8Wt8TdNybMich310uFkV/h3rLD4uXNe9Xi0TbZUOaosWBWMkLAAqvMoAJyUhFTVXV
         OZFRwlG8WrqvNIiuEfBbuJkKuOwcKMilXsuxKKIaU8IqL3hKRmfafWJC5HuUDaC1XE
         IsDD9OZwBjRDV3J7HR3aHQKfCZ4jELWmY4HCeLA+4wuHmluYHTZWVh1lvIIX1HLvWo
         f3Ui2tRKExTFRHBrsr8pC9h2h2wgQOJBlxPKXMhQiziEV1bdga+OZwAQaB173eZit+
         WeDOs+DFHrNlQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DE212C4332E; Fri, 30 Jun 2023 08:11:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217613] [BUG] [media] dvb-usb: possible data-inconsistency due
 to data races in dib0700_rc_query_old_firmware()
Date:   Fri, 30 Jun 2023 08:11:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: islituo@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217613-208809-Fg2bs8VzAA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217613-208809@https.bugzilla.kernel.org/>
References: <bug-217613-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217613

--- Comment #3 from Tuo Li (islituo@gmail.com) ---
(In reply to Greg Kroah-Hartman from comment #2)
> On Fri, Jun 30, 2023 at 01:35:28AM +0000, bugzilla-daemon@kernel.org wrot=
e:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217613
> >=20
> >             Bug ID: 217613
> >            Summary: [BUG] [media] dvb-usb: possible data-inconsistency =
due
> >                     to data races in dib0700_rc_query_old_firmware()
> >            Product: Drivers
> >            Version: 2.5
> >           Hardware: All
> >                 OS: Linux
> >             Status: NEW
> >           Severity: normal
> >           Priority: P3
> >          Component: USB
> >           Assignee: drivers_usb@kernel-bugs.kernel.org
> >           Reporter: islituo@gmail.com
> >         Regression: No
> >=20
> > Our static analysis tool finds some possible data races in the
> > DVB USB driver in Linux 6.4.0.
>=20
> Please report this to the mailing lists for these drivers, not in
> bugzilla.
>=20
> thanks,
>=20
> greg k-h

Thanks for your reply! I am really sorry to bother you. I have=20
reported this to the mailing lists for these drivers, but have=20
not received any reply.I have resent a report to the mailing lists
just now, and any feedback would be appreciated.

Thanks,
Tuo Li

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
