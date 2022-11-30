Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32D6163CD83
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 03:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbiK3Cup (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 21:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbiK3Cun (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 21:50:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF52D6CA15
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 18:50:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F344B819F7
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 02:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BDDCC433D7
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669776640;
        bh=KvERSsKI+Mm2UhZMEeNhZ5SOGpv/hamPMyJMgzCe4ww=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lOaTHnS8PzyClAnbHoQ2/Knqyi46ZE66KKqzg4dfDIhn6h4GTaXvmZvVzNDtxZXPj
         YmnbqXNfAQGCfM14BaeGB0tyNHYz350hkrc9lBWG24qjXQ+EO+7nHfNi1htsvceTJa
         c8ImQXCh2X+CDqyOWRDxjEN4cuBzqESpVKyEVhn/hlYDiCuYYzoOtdp9YBK1x5gEzv
         8meITGP6/RhVBdqm/FqMhm5FqNwJU0HOaw7nhWxWF9jVJGrTyb0voTNdy3mX/SQY6C
         gZ3qulqDIYgzqESHNiab2+PYgGLC5OfYVwEmujmFFETKOWEpJq3/JwOUFcPQWEDAP/
         AmeOH6qxgnZQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E595CC433E7; Wed, 30 Nov 2022 02:50:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 30 Nov 2022 02:50:39 +0000
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
Message-ID: <bug-216728-208809-th662an97d@https.bugzilla.kernel.org/>
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

--- Comment #14 from Chris Chiu (chris.chiu@canonical.com) ---
Created attachment 303328
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303328&action=3Dedit
dmesg for add d3dcold delay

Add delay seems no help. Please refer to the log if you're interested.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
