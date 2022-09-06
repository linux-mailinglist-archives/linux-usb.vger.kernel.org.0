Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CF25AE55B
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 12:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbiIFK3W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Sep 2022 06:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiIFK3S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Sep 2022 06:29:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1708B5FD1
        for <linux-usb@vger.kernel.org>; Tue,  6 Sep 2022 03:29:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BAF6DB816E9
        for <linux-usb@vger.kernel.org>; Tue,  6 Sep 2022 10:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80674C43141
        for <linux-usb@vger.kernel.org>; Tue,  6 Sep 2022 10:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662460154;
        bh=J2fw5awUqA/PrtZt6CdLcPh7vsyr9Ot4WiC9bUbTfZc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KjhFTueN1Kkqz9z7atNbmykvfbrYI1JeQVrXLGsT8HIGnwTM8UBqW3l4k1YJpSZQT
         6gRVXvMn3wQWMYZg+5ftnymc3AA9ikJLJV9KtnEDJNDV/qkERkw3cKaHb+kcmYhNfv
         41E1mvgeTeGrny94lzNMN+/QwJvO+ExFlTsY6sKxu7liRq0QpKWMU8KPL0Qt+qqsab
         r1V6+qhgEtIOAANK7UioU9hZ5G8uMPTdP59gbdEu266EJDk9YOtS1mxA/Jwoc5EUGw
         rzytOl3hoYgZ1WBpO3XVJziJMNV0fZ9OkniavUcC0ohLefQzzGizvPMnjJJwqjxwSM
         alJZZ5vjOjOqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5F1F3C433E4; Tue,  6 Sep 2022 10:29:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Tue, 06 Sep 2022 10:29:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-nd9RwbhhnA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #30 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
I'll clean up the patch and send it out tomorrow.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
