Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E140E76B6A6
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 16:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbjHAODl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 10:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234454AbjHAOD3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 10:03:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66F6213E
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 07:03:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EF5E2615BA
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 14:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D870C433C9
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690898601;
        bh=70X9XXv3kdX2wNG1c9IpVVs9vIlipYAIUt00829U7V0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OZ+gXOA902OZxpsZHrlhGavU/jtUfixL39zfKhQzZg2nSm7xzB7yRuIVd9lcyW+D8
         Gt+r2XjCWm5OgL1rmrghDTuCfQeyiwwFSfWGm5gNQw2xlBhOxyxkcwLNrH62IXXWqS
         O/4FmfY4+d3sWKF6popIjK2mHZ/eeCKlDy8BPnqKhaCQ2S/RMTmXNuVyXyYJ7c+ePe
         +L56sqqXM4RUrrZuSMYGC+Cwp/dwAQxoY/5AowtbnKoRw3uauKjlwQ7+04uBJaf3HU
         GF0tqEXxtOSbJS7p/nSwyZIe2BmlNEDY/nNXz9zOshcKGP3UJA8aK8dA+nDr7hVPOJ
         jNQdMYm0+t+bQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3729BC53BCD; Tue,  1 Aug 2023 14:03:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217744] Resume: "usb usb2-port3: Cannot enable. Maybe the USB
 cable is bad?" Tiger Lake-LP Thunderbolt 4 [8086:9a13]
Date:   Tue, 01 Aug 2023 14:03:20 +0000
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
Message-ID: <bug-217744-208809-2MEohKLaCy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217744-208809@https.bugzilla.kernel.org/>
References: <bug-217744-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217744

--- Comment #4 from TJ (linux@iam.tj) ---
(In reply to Bagas Sanjaya from comment #3)

> Does v6.0 not have this issue? Or is it hardware issue too?

Cannot say. The system when presented has Debian 12 amd64 which uses v6.1
kernel; Trying latest mainline was to test if the issue has been fixed sinc=
e.

I've asked the owner to update the PC to the most recent firmware in case t=
here
is some issue there but I do not see anything in the firmware changelog to
indicate it.

It seems to be the Lenovo Thinkpad USB3.x dock - I have seen other people
mention something like this in support chat channels but never focused on t=
hose
issues myself so no idea if this is a systemic problem.

Hopefully the owner can contribute more precise detail here with the precise
make/model/ID of the external dock.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
