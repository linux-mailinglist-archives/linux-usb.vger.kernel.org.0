Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBEC760EFB3
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 07:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234156AbiJ0F6J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 01:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbiJ0F6I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 01:58:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01BD156250
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 22:58:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 561FFB82148
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 05:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6155C433C1
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666850284;
        bh=fpRmMM2lDg9K5rHymqEJ+/s7/dMMZ8BB3oKrru3YrPw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A8wPwQGN3Gy63SBaGQ+u1V8ZB64tfYOi3XIaRgZHkAsNUM1vDb6OCaAM9jRRCCohv
         alM9FTyHRWn9bXM3zVjeEDtWzB1T+6an7hRK//N98yXauBIH9UUR2X0V2dXfDGVisP
         jAAy7bQFA6cYaKiS36z79KvOQARKCUoqcUxnFXH9sUamRU5dcUfkeN0FE/oQ8Z5PYS
         0U2JeDaRb0bHGsINkJcmr/F917q2TcihYHkxv43ScWfPhmeg92sE4x22hfBUJtUvYo
         RqBcsmBvflwJygjApqCsmHoJMXDogt7lqkPPab0fn/f8ZUUjCaKhysddkE/oiOXNie
         VttubXQyEswWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BD541C433E4; Thu, 27 Oct 2022 05:58:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215649] all usb devices stop working and forced to reboot the
 system
Date:   Thu, 27 Oct 2022 05:58:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ricciare@libero.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215649-208809-i6uyMWZIJO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215649-208809@https.bugzilla.kernel.org/>
References: <bug-215649-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215649

--- Comment #4 from Nicola Ricciarelli (ricciare@libero.it) ---
I'm using kernel 5.19.7 and that problem nomore happened ( it's about 5=20
months that nomore have such problem ... horns scaramantic sign=C2=A0 XDXD =
),=20
I've not yet tested linux kernel 6.0 . =C2=A0 Hardware is still the same,=20
nothing changed.

Nicola


Il 10/27/22 03:46, bugzilla-daemon@kernel.org ha scritto:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215649
>
> --- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
> These really look like hardware problems, not software bugs.  But I have =
no
> idea what components of your hardware might be the cause.
>
> Are the problems still present with current kernels?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
