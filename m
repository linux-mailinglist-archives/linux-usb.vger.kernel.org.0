Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE3A642C7D
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 17:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbiLEQG0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 11:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiLEQGZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 11:06:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7BA13FA4
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 08:06:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 719CDB8111D
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 16:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FB7EC433C1
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670256382;
        bh=/RLC1kpY+Taxubve1f0h1WNrNQkDsXe0LYNvkWI/rQc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PYSBgjsHPyZFqy4D4fVkjLFUqdxgrdxiJ0emqHRvSBzOvKS24zwfYBivB3IeEdbvy
         E3yPmU24IttPsZhZHGz2ajx4sSCvwuFsgKHuTZTIjj+qB1qW+TFUqEkEcwa8vpQCCC
         a2mFZpVOpJ61rgcAN8uGDbOcaEToFLATwbl/RXhvwaxRoZmxSSZK2nLM0q4edAcDJZ
         t4Doni/lq7q28KQJWK32fG1gfqmzRSZR9rbHgkukYgmb8GYbgNb+D1GlJprLRaPt7s
         F3YGQYWDR7WKwbFghEFIzNfHfVD+hPYX2eH+/kmT88iLKMQ4AvMuAdz6TZTdebikjC
         fwh2jf66jFTOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F28FBC433E4; Mon,  5 Dec 2022 16:06:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216766] USB enumeration lockup
Date:   Mon, 05 Dec 2022 16:06:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216766-208809-oOsQ04wpC6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216766-208809@https.bugzilla.kernel.org/>
References: <bug-216766-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216766

--- Comment #6 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
But reading usbfs shouldn't block forever either, so there's something else
wrong as well.
Maybe we fails to give back an URB, or retry reading all the disconnected
devices forever.

Adding xhci and usb core dynamic debug could show more info about this.
before suspeding could you as root add:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
