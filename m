Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D9D5B02DB
	for <lists+linux-usb@lfdr.de>; Wed,  7 Sep 2022 13:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiIGL0n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 07:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiIGL0k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 07:26:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19218B277B
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 04:26:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 958BDB81C56
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 11:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 473C7C43145
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 11:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662549996;
        bh=KV9kDWnll4V+tFZDq6tT5tTb+wx0LIb2FAvt60O6tEw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cZ3Fs6d2dJOTH+3FWge4oXA8iCCVvqhvih7V/FceiC6th3pqsO07aMI8f3g50cdR7
         2suEAfFN6xUAk/76pvOBdD8XZuj1H8n6I46xHyBbTLcbxwVPpQ6PMTkNLdY4g5c4Ri
         WxCchTaCqWJ91gQaUjzHpz5F8nQe9bQ3HYkYRLyCbqElSAJsndjRoXhRzl1oAxy8Mb
         +gYmTGNsZvjHy4xOiwzFJvZrrxcCJDm878t+g1lyD1ur5adNX4lvoAknb345bNELq3
         KoqnZdf7+BxlyVU/+WAfq8nBa+Zha6x5Rj9UdFjNb91RVmLN+w9ZNkCPgev2ahw6nH
         6BaUsAcK0BH7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 36EF5C433E7; Wed,  7 Sep 2022 11:26:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Wed, 07 Sep 2022 11:26:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorz.alibozek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-GD9vWwWZMb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #31 from Grzegorz Alibo=C5=BCek (grzegorz.alibozek@gmail.com) -=
--
Ok, thanks :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
