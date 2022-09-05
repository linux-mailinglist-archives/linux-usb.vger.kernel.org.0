Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08C4E5ACD99
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 10:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236273AbiIEIWl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 04:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235860AbiIEIWk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 04:22:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E171F31344
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 01:22:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8434DB80EDC
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 08:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F4B3C43142
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662366156;
        bh=oefGQXrLLTHBbNFXw10XLf+RncX+46K/nKYNyez16AI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ma3Uo8ruvwaKBK82F7F1ujK9LmlQBs3SY/LVPMSunnuJagqXZ0cEkFG5ytCvdwyiA
         cftbI7usOkgc4QChT+GtLaBxwHGT8mIuOAzoFdFgdzhRmc7TKGufAOtK1irbHW64V7
         R1Ya0+0hZxlJPpExAk4OzS0HsncAhKVaAqKHagL5rr0YqNakMVKJk2FCajosadYkcD
         8pBYg2FdruPG3bGZRRgEMjwWjJmwBkIo2lG6gJwH3xL8srHkWf2oNoAntOlxoqANLc
         15ciN3mExdr+u/0ToRC/0T4OhdhuNRpcbygXcFOlGOTmo8sPs1qZ9Sc3S4ikcAQRDe
         tB9+jjh4FF8Jg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2DB88C433E9; Mon,  5 Sep 2022 08:22:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 05 Sep 2022 08:22:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorz.alibozek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-08YdzUhPqG@https.bugzilla.kernel.org/>
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

--- Comment #28 from Grzegorz Alibo=C5=BCek (grzegorz.alibozek@gmail.com) -=
--
for the sake of clarity, I had this warning also before your patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
