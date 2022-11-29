Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D2363BF1C
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 12:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbiK2LeA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 06:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbiK2Ldf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 06:33:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D901B9F8
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 03:33:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 362D7616CB
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 11:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DFF1C433D6
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669721612;
        bh=112CjQvfpJbA01ue7iZJIusG+4l/1MmF1P+5Q8TKjOc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Bx3wC2AKVu5LhoU0NF7PhTckSUVKNgEdNvmuOomRdZ5A/XvfQqmoghxRaNQNx8IkM
         LqYgmi2Z6S0VvZAw7FeZmu/2wSlgrrpBQqQRjaVaGSLekiXSfUK7jPqHHiXSThxGWZ
         Icbp3NHdUomzCzcY4vJnovIYcKuPLQ4zzUjH2rk8TWftmW5sHjtaGeDKc1VL00/azy
         vMIU+vgstk6mzrx98I3xc4kRji1ui7q2iq5cg/8q4bWRflwX3hGxNOQL9cJlkLxnif
         a3Iu6PZdw3+7ZCRiTQVyk2rE7qgz9TT+VQFFIpFkPtVS09DzAY3JPUZpe9gUHN1BSH
         gvJ5vR8Lx5Q6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 78529C433E6; Tue, 29 Nov 2022 11:33:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Tue, 29 Nov 2022 11:33:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-lLMPLOB04F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #13 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Also if possible try to disable ASPM.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
