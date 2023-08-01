Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CB176BEE6
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 22:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbjHAU6x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 16:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232246AbjHAU6t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 16:58:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C96710C
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 13:58:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5DBD61708
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 20:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 568B8C433C8
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 20:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690923511;
        bh=gSNildqlB2w43PHQT9XcPUQ/nffKOzHuhfATmB+kyqY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ugWKlZY9wGsNBLU4isGWYGISeV3FfMdlw/S2gtRnyzg/dhYg6sXLykl3ztJeal4tA
         ORK7bXOqvLOmfTOBvEk+HL0IvBE0vUsb1aN/i/RLvS9RYS5bT9V8zIJALgPsW1h59M
         imAQBh18qC8I4/Wk2BfDk7A3P6PY41gZBmDhGlfaFErgYaaJMoWY/CZPBNuSyxCAZF
         v7OUyqdBNcfwUyITRAwXv4AbvNZYksdEApICsSPGsdBQuefE6630Z/m705farsnJ5n
         HzWGlMRhJbyfljKUk6D8PwiXYGBeqT6Ecm88ifeN/BWlLEdaQ9qdlRd+bhAyDukBNZ
         JiGlucAPiprWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 40C56C53BD0; Tue,  1 Aug 2023 20:58:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217744] Resume: "usb usb2-port3: Cannot enable. Maybe the USB
 cable is bad?" Tiger Lake-LP Thunderbolt 4 [8086:9a13]
Date:   Tue, 01 Aug 2023 20:58:31 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217744-208809-boZZINeQeM@https.bugzilla.kernel.org/>
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

--- Comment #5 from TJ (linux@iam.tj) ---
The owner tells me the USB dock is "lenovo thinkpad universal usb-c dock p/=
n:
40AY009US"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
