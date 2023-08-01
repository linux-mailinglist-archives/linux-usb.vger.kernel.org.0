Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C59EF76B1C8
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 12:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbjHAK32 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 06:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjHAK30 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 06:29:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9D0DB
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 03:29:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5936E61528
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 10:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBAF6C433C7
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690885764;
        bh=+5bgkXlwMmE5+z/x2hD3L5/pOqUI+BkrPoSqKljFMZg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HGvZCb6A8WioGyX+jUMZpP5vt4g6+b3GICwvjvQCy4ABd1S6sAZIXFukB2Z0VEk6y
         vbnuEhF0ODtAdrjnt5jnC7jhR8BEZKKTeZ4k7zkPevj+5PUYigqD9pk+T/DEDWoUby
         Px0aTW06XuX3LM2GYL0Lo4e6+UY+Fuenp8g1UCty+YhY8zBoTb/k0cHxdMFWVdWIlv
         8qAERgL8RMb1NvcqqQlof05VMLvaYBUH7SfWObpXPinb5RO+i21sVMXMly9+f5Dbli
         Wg+C6KgZtOd/JdaXjPL1/bkXNGQxz7d5VqVyJqPkKmCqtrjVMi0s4U80GarQR7JpJB
         ilODDTZwPV6yg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AD4DFC53BD0; Tue,  1 Aug 2023 10:29:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217744] "usb usb2-port3: Cannot enable. Maybe the USB cable is
 bad?" Tiger Lake-LP Thunderbolt 4 [8086:9a13]
Date:   Tue, 01 Aug 2023 10:29:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@iam.tj
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217744-208809-Y335XiBD4g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217744-208809@https.bugzilla.kernel.org/>
References: <bug-217744-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217744

--- Comment #1 from TJ (linux@iam.tj) ---
Created attachment 304747
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304747&action=3Dedit
lspci -nnk

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
