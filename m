Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C0C4C903C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 17:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236195AbiCAQWs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 11:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236210AbiCAQWp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 11:22:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85B59024B
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 08:22:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A89161787
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 16:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBC24C340EE
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646151719;
        bh=2hKF4oGWcdfTEDIypLX7NuRCmojIcn0OO7juWLLoug4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GPA4eE7VYPfX0GOBxN80OYFOgDKi4m5YsaO0DsKHIfaQDmv272sYHuHGnm641JbrL
         9b4I8FyKVLzXWxOcUjOTpn3CtidEwK9Djb+pxOQAtI0JKhtwveKc44aXHmRO110YDW
         /9nDvHP9bETmqHkH+JwbsGiEC3tWR+DoT12lZb0YLgK45dSC1kAlG0zkc3VqkpEn1H
         70Ksn3PmmMyDIAptKSLx0IFHvFOA4puzoSzpdLC1sq2JX4Zrekz4rOBzBAn8HXy2HW
         PF5uhwkMz+0NZnX0RXo+5R8AxkPQoA3MK0fG3NQz5HOE6OYwR4PoPSWD8KqWs3O2iy
         O5W8oI8crbbpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9C89FC05FCE; Tue,  1 Mar 2022 16:21:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215649] all usb devices stop working and forced to reboot the
 system
Date:   Tue, 01 Mar 2022 16:21:59 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215649-208809-FlAdQRC6oV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215649-208809@https.bugzilla.kernel.org/>
References: <bug-215649-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215649

--- Comment #2 from Nicola Ricciarelli (ricciare@libero.it) ---
Created attachment 300515
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300515&action=3Dedit
dmesg showing error messages when randomly only the mouse temporary freezes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
