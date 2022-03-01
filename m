Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 882444C8EC5
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 16:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbiCAPTR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 10:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbiCAPTP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 10:19:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1561E4BBA7
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 07:18:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6F3AB8185C
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 15:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FE37C340F2
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646147911;
        bh=C1zsWe9MBXn69Wz7saFn8q1gKuG9VzYRlIGYnwQGjSE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pm6AWGBrVi3KazSWmrdp8oDzuzpmRcsbhfI1snB0MGpXoH7XwwpQWDFVLLYC/6u7s
         FCxWywj2V4GfrKr93Lf6k2vJJdLrldWF3CaI6f7XQa8sadFjelrCGOs/RYep6SAfi4
         wa4qDRGoZBdDNaC0qsQy4Bjbp6OeHpnepuj7oYjIg4RaQRt6DatcXKeiFSuFHEr6mq
         35fMyJnfiIdR/R6ctVqF7URmQljIkMsN8FN4q2HFqovU8mQuzmMm4KUODh6g0U/CwU
         77p9ZObViy7k7B+cqd8N206i5YvelTAtOp6Tda8/SqSTqy3qOe8MKEVM5Mwfx74Dkb
         5Ee8Ld1QDKe1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 22466C05FCE; Tue,  1 Mar 2022 15:18:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215649] all usb devices stop working and forced to reboot the
 system
Date:   Tue, 01 Mar 2022 15:18:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ricciare@libero.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215649-208809-zZ2VWtIvCQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215649-208809@https.bugzilla.kernel.org/>
References: <bug-215649-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215649

--- Comment #1 from Nicola Ricciarelli (ricciare@libero.it) ---
Created attachment 300514
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300514&action=3Dedit
this is the complete dmesg output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
