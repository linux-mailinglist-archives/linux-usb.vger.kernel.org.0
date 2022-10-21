Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9531A6081E2
	for <lists+linux-usb@lfdr.de>; Sat, 22 Oct 2022 00:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJUW5Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Oct 2022 18:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiJUW5V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 18:57:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4D4297F2D
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 15:57:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A7F74B81CC2
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 22:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63054C433C1
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 22:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666393038;
        bh=QlrTRX4m9VfpDwwKEVmNxODISfGUikfQSPTSp+LEjfY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Lf99WLseanugpMcnMbFtfAchA7CUrI44aiz96MWD0YOpZ1R+knYLkqnKimpGXlUYn
         gmJLM8P+kTYgOG55F/eZa0jjcmN1ZaioFZ0ADNz9enpjGxQQ1PCMi2d2cVmkNLdqT5
         8tmMvgcAt76+pHmy2qkxmANVtqcEn0k0tjHeox8YsIlwuzO4pWusYpYdQBtsrrEaec
         XfU/xQ2+lTCoWFzj3Dm5vLVDKkRG8rGyIBS/dDEPAl1BSK+gp0LrijgXDl4EcVY4y5
         hjoGTmjmA0vprVRkb4B/Bn1uCFDL/CDGbFcuR+o7iPA1GbpbYS345InIW/h4FAMgxT
         VAUblN+Ol/IWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4F1DDC433E6; Fri, 21 Oct 2022 22:57:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216588] RTL9210(B) falsely detected as rotational disk
Date:   Fri, 21 Oct 2022 22:57:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supgesu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216588-208809-YHGlC1fP84@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216588-208809@https.bugzilla.kernel.org/>
References: <bug-216588-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216588

--- Comment #2 from Elias (supgesu@gmail.com) ---
Thanks Alan for the hint, I changed it. But unfortunately I can't change the
Assignee, which is still on drivers_usb.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
