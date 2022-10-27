Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32116103A7
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 23:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236728AbiJ0VCc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 17:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235955AbiJ0VCR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 17:02:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD2C6BD55
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 13:53:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DFBFE62350
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 20:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E955C433D6
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666904034;
        bh=NhnO1RdNI2y8qdxU2kScImAKQzAQyFW2qY9AOXtXB94=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J7m3feTvC2d13E8tW94sO+AZawN9wH7h/sOMgOO7Fi/t3pmT9tkOUk1jiIs0LrrhR
         CjYZQAcCrdhuj2PSDudVMfU+rICdmfuYLAgiBdtbNFQ7bgblZ6T6/WNgjs6LdUXAEM
         fQJiu0iyUjCTidctQVQfw/Ok6hidOibs7yJ1bB6rpv/d1xVgwhk/8YKWJ8GcgKJFDv
         QWr+Bkkdl6K5FMRGRWWpE/e+kPsPfpag5ZXAg+/LV37je+bdXBLx03OAqvs2Hr8VKH
         dzo3Tl4a+tEqNJpXPDH8uvZLUWU00fmRdJiFJmn4He8ogHeGAABREEpKa5hT1tz0Yf
         /ABe5LECFVNWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3CA70C433E4; Thu, 27 Oct 2022 20:53:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216630] config 1 has an invalid interface number: 2 but max is
 1
Date:   Thu, 27 Oct 2022 20:53:54 +0000
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
Message-ID: <bug-216630-208809-1W0b6NDxGO@https.bugzilla.kernel.org/>
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

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Alan Stern from comment #3)
> I suppose these messages could be changed to log level notice instead of
> warning (although the documentation says that notice is for "normal but
> significant conditions", and these conditions are not normal).  The
> boundaries between the different log levels are not specified very clearl=
y.=20
> In particular, there's no explanation of what should count as a warning.
>=20

I like this idea a lot. Thanks a lot in advance!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
