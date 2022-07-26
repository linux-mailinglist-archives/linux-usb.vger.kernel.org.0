Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0474D5808FA
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 03:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236904AbiGZBUO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 21:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236868AbiGZBUM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 21:20:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDADC5D
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 18:20:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09421B8114B
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 01:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AECADC341C8
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658798408;
        bh=l0GSA26lnJ8d6Ue4Zht9w6B994Y8EfdkHLccCLQyOlw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pPspczZV9qDZKEJQRAer+t19NZsv2c3q7am2iGP8kPV8cWsntdZFLGs4Ww8dg1Hb4
         rWqlCD3gTpnd+oewy2hkb2M2roC90EOFV2X2bK7IHHSw6xaUjzqvUWrD/OwxUIkBZK
         WkaKn0+83vr/Q0GaA2xjDjsoLRPso0x8+yeGWEpY+NLG5NY91BlTt4QJIRd8o7j0au
         y19olscwh2DN2IYl5Qu6c1GfSZuZq57SGQquwsK/TxAooA08Ea3RuiLxYzt8qIgkQe
         JuO8jeNs4e1kERW4XTjBCawoMDRwUnEf0q/WalwA985TVFgopQTf98u4A2APfjoCWJ
         WkQPBzqM6Dr2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8D3F4C05FD2; Tue, 26 Jul 2022 01:20:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 01:20:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-pJTxoh36kX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
What delay time are you referring to?

What speed does Linux detect?

What does "lsusb -v" show for this drive?

What shows up in the dmesg log when the HDD is detected and when it is not
detected?

In your lsusb output, where it says "ASM1051 SATA 3Gb/s bridge", that 3Gb/s
speed is not what Linux detects; it is part of the device's product name.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
