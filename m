Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574825809D4
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 05:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237509AbiGZDN7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 23:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbiGZDN5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 23:13:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDAE2A414
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 20:13:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CD6460B84
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 03:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B97DAC341C6
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 03:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658805235;
        bh=y3TTq9sH9/KErY6Wnyi0cBywxVRa0k4DhJNZ7OuCPLE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uULxQawsBG3Xf+c1lyNUENrQGG8Mzfo3cqv6G30xPY8aMRysmBkhfhld24KKrjEbB
         MlYvA6eTRWvWhTqOkRtoyaZvKYq4VaUUscZhmyyzDcksBBYW37eSGW1H91ypqrTR/0
         wyxfOoe6qeeuZlxdFCdZEvqDq+Yy5LkwqArawFEo94aCE5WqizbqKNJ24Him219nDT
         PbfQwZslOnjvHEyRy6sVXvKviAaM9kW13qXrJcjujqqHUV+Du3yypV1LtgkZmoj1LJ
         FUhXnS+cMwBNqHMgZXRypHVTGZHymloszul0vhSbQLDj1ioIWDrfIaTzZOVFCzvTfa
         HXw60Y1ED2kGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 98A3DC05FD2; Tue, 26 Jul 2022 03:13:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 03:13:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-yCHxKVGF5i@https.bugzilla.kernel.org/>
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

--- Comment #4 from audioprof2001@yahoo.com ---
Serial number 00001,
its the same enclosure type TT BlacX, i have 2 same,
but 0001 has an SSD Crucial MX500
reads 440MB/s
using gnone-disks benchmark
because its a cheap TLC, but Not as cheap as the BX500 with No ram.

serial 0002 has the mechanical 3.5" HDD.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
