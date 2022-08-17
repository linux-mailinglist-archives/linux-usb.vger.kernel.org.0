Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E907A5978FA
	for <lists+linux-usb@lfdr.de>; Wed, 17 Aug 2022 23:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241533AbiHQVep (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Aug 2022 17:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233927AbiHQVeo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Aug 2022 17:34:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18876C762
        for <linux-usb@vger.kernel.org>; Wed, 17 Aug 2022 14:34:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8DEA76160D
        for <linux-usb@vger.kernel.org>; Wed, 17 Aug 2022 21:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE81AC43143
        for <linux-usb@vger.kernel.org>; Wed, 17 Aug 2022 21:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660772083;
        bh=m05/y0bTWwbwuNS5HI4Vfx0zw5ThonssAfkMxGbclJU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KZ0LcZxhI5Ec+FyzCIY/W1IuR/Amsq7wqoHbGzpk/rMK8Q5yNHd3q+dBmsK/Wl6NH
         oK7zKqignniYZd212YhTEtsrRWCVayx3OvxKo1wldgBI6HBEFg6uVipRK8rE/lgiBd
         enBrqqkdlVqOjyycohISeWbwiahCwGQh40oBvbuJ+0iE64HuqEVBUZ1Ql3lCHrReIB
         Po755mQRlVkV0MkmIjzThs6poM1Z7xw8yXVuYGdeKhq1yN8olFL4JJmsOgDe1L/4G6
         zSPVD7AnckDpk6qlKz5GbOoiAgeH6gUGKRgYX2oB9aMVyqB3ZaNxXuW+gb01yl+MHc
         VEo0KK5iGu+CA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DD38FC433E4; Wed, 17 Aug 2022 21:34:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Wed, 17 Aug 2022 21:34:42 +0000
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
Message-ID: <bug-210425-208809-KUEqsQw68x@https.bugzilla.kernel.org/>
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

--- Comment #21 from grzegorz.alibozek@gmail.com ---
I don't know if it's related:

sie 17 18:06:54 kernel: ucsi_acpi USBC000:00: ucsi_handle_connector_change:
GET_CONNECTOR_STATUS failed (-110)
sie 17 18:06:54 kernel: ucsi_acpi USBC000:00: PPM init failed (-110)

on 5.19.2-arch1-1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
