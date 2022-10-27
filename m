Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331EF61025D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 22:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235579AbiJ0UJP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 16:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236828AbiJ0UJE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 16:09:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E828D89CF8
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 13:09:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6AC8B82640
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 20:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 505A7C433C1
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666901341;
        bh=LdEixUcR6GfZcOV+FxD4+YzqR78jCpSFHXX+dJzcrFo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nbtCk+sasLOd8eUM988oKWJx7jbImjEGV3LpresyI8Pwvu7TxgfUsCaPT2BN2ZYGX
         6IX5unQ3ad/3Fnn0yHHDYzbl1f+2782xjY89mVEy7ljrtn32rQQgno1kNv9esisLng
         H5fjvlyeQpGSnA8/a++dcjobi9em1+Wh8eUwej9oxDJLF+LB28T8TNXp95JrkKCgSs
         zFsBoVDY4tTLqAcQkj0q/9eNOCL3BgKtc6ERVVpsLcA9Th+6yrzrcsvo1jeEK0M6ft
         +ayewadTcwpwYqwdFfm60w4faVRSp5YLp76FDcKOp06XJU2MSEWQsk6CpH6pRxIzYi
         +y62rB7zvANSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2CD2AC433E4; Thu, 27 Oct 2022 20:09:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216630] config 1 has an invalid interface number: 2 but max is
 1
Date:   Thu, 27 Oct 2022 20:09:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216630-208809-xL89RpbPNG@https.bugzilla.kernel.org/>
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

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
These messages indicate that the device's firmware doesn't conform to the U=
SB
specification.  You can see the problem in the lsusb output for Port 6 Dev =
3.=20
The two entries say "If 0" and "If 2".  But the USB spec says that interface
numbers must be consecutive (starting at 0).

It's a harmless error.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
