Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 493A45FC3C3
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 12:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiJLKaq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 06:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiJLKao (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 06:30:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26298BC46D
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 03:30:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C9312B81694
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 10:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FDC1C433C1
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 10:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665570639;
        bh=liTTns0Jv7p4Fbq54anBosA68TZzH7M/Q07tjp+mNmo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WLCf8ZTRTWxF8ZRe26ETAw+GP/7288npmAj56x4uhm3vHhGtShHE9fKhTymxP/yAf
         9T3y1mYiP6wM3B7OGEHlZlLSFn18HT5iZlo6nFdnU4CYnJN/t9xXqB5F1crncTqGhH
         7XC0bd3QeUlLNgNOehNdNu6aZku/0SFw9fc+IUWa2Rm2ML2kNzrx/gBZcqaye6JKHT
         EQRTO2QjeSC3gkOvF3nnJXrG2C3UTV8JXy6L9yFUTTmBMNlM55PpMTuerGRsU7To8K
         hIs0N/qZ1C00PXMne1yljXKFygUEFIAyg9endhLh+r9yn6CUvEFFu8CSkbhnswOR25
         YHjbCeXNdmjAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5008AC433E6; Wed, 12 Oct 2022 10:30:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216071] rtsx_usb: probe of 1-4:1.0 failed with error -11
Date:   Wed, 12 Oct 2022 10:30:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patricknicolas@laposte.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216071-208809-uMo1Iq6zmF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216071-208809@https.bugzilla.kernel.org/>
References: <bug-216071-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216071

Patrick Nicolas (patricknicolas@laposte.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #1 from Patrick Nicolas (patricknicolas@laposte.net) ---
seems fixed as of 6.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
