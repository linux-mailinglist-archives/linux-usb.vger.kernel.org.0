Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E6F63CD89
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 03:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbiK3Cwr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 21:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiK3Cwo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 21:52:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD1CA451
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 18:52:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39C31B819F9
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 02:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5260C433D7
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 02:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669776760;
        bh=rP0aTTQjLYJ2Aul2E6qXztBH/wyKgskOTKYL43fUYsw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IZShp8e2rpeIF7QzKtr8pw9TTJxWLK2tCDT5O8A7l+NpGSUGI+7FC/U2tFzIMhF14
         xmst6Ytc0Hi5OhqpH4CuKC3Gw69BQ7Ex74mg+HOFvN7psiXBH35b/n8KVXOAWE8ats
         ZXe8lsV3eBvNCyQEl8v0R/UjezGHyeNZTF0S68ewT8uESYsH5ZFb16vbAZnzLb5Eac
         1qc1DjG8n1uTZivbrNGpgKXOOFb2TJdzT75JnEugGO2Iqcjdbxu6w/hpOgcGwMzbgk
         Pec8Xuh6KEBmgoOZ7iSwpFRNHZTSARxofih+n6sOlVKbuhNpS7iLZLreVF5pzlXCmS
         4u3Gjnf8Jghtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BDCA5C433E7; Wed, 30 Nov 2022 02:52:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 30 Nov 2022 02:52:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216728-208809-RggvUOQhYU@https.bugzilla.kernel.org/>
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

--- Comment #15 from Chris Chiu (chris.chiu@canonical.com) ---
Created attachment 303329
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303329&action=3Dedit
dmesg with aspm off

I forced the ASPM off with kernel parameter `pcie_aspm=3Doff`. It does help=
 and
at least the usb4 can survive across many suspend/resume. What do you sugge=
st
for next step? Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
