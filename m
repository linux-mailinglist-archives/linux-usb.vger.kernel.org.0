Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1376A577D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 12:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjB1LHb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 06:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjB1LH3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 06:07:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAB92CFD4
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 03:07:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 659D1B80C6E
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 11:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D6EEC433D2
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677582441;
        bh=dy4kfgApANd60RvYWPo56JvK8nB/6nkKXqkE1BlWDqs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qI3OBO0nPUZMy5kzJl8U4K79ASE9Nhe03IPS1AKA++UVeqBWXRp1MJVW0MM1c8x6b
         oRA7ZjhPiko9Yony77lSpGiMhwhd4VvrGbK/DFnfzPPTfZOtHHGXvXiG4Wv+2NP1+7
         WT0Bd4Su3G6sAzaAJDagOVBwEy853NOPG6/2vs2QeWUL/hGPc/fPh/HbMlIx4u48qO
         wI8PGPuAq/xupWS2l7EamO2jZeDFjrJFNiu5f5J0/EWyObWdpeWUV4Hh8PxKk9Z38D
         QM7DlrDyF60OH5DwWHlnTBpR8Bnxs7NyW0m1JLH3jSfP3FRXiDJoVUVIBppRcnWT7b
         CxHau85pNvaFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ED31BC43143; Tue, 28 Feb 2023 11:07:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Tue, 28 Feb 2023 11:07:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217089-208809-Lcat0FeQN0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #12 from Pierre Germain (pierre2008@gmail.com) ---
Created attachment 303805
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303805&action=3Dedit
Log from usbmon kernel 5.4.0.37

Log from cat /sys/kernel/debug/usb/usbmon/1u >FILENAME under kernel  5.4.0.=
37

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
