Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E81278FDCB
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 14:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245425AbjIAMye (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 08:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245221AbjIAMye (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 08:54:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85DAE0
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 05:54:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 693B0B82526
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F065C433C8
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693572869;
        bh=ZczwOQi8NSxQvJ+R7aDpm4URBVqbSbVGfeg0fUPJyIQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RXIs1izckLZk+UxZZROJ+GL7ajEREc3E+vQ+R5gMEIxEkRexVuSl9WxQxhv5DEvVP
         ZUMF6nU3RpiygVO8AeI73nzs8wEyVLSmKEwLb0XTlACN8WrqPOMgKcnfZZILixZZXr
         ttp/5AeAjYs0FfCLVx/IfoYK1iQRA8Z+gFvwaWRXqj2ehpw+ZmYis7CYKC9Wil/u1j
         JOt/eEtj35MvIT0O4EyySK5Xgq7QUR9OBPZcgNVrc/7GOlaOWqUSs0x3oOfJ6J96iW
         JvcJP6A3e6/0O34D021nxIwjALQZKsVvYsgMhh/Rx5IskQN6a/0ZfWIOUx/JrwtD84
         GhPJ6rBrf8Hng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0D196C4332E; Fri,  1 Sep 2023 12:54:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 12:54:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz.rostanski@thalesgroup.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217670-208809-On5vLcpOi5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #18 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
Created attachment 305007
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305007&action=3Dedit
0005-usb-dwc3-core-add-gfladj_refclk_lpm_sel-quirk.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
