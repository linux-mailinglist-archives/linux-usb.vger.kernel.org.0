Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBEB6A4D30
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 22:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjB0VaV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 16:30:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjB0VaT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 16:30:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1953322A1F
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 13:30:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A549860F24
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1488FC433D2
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677533418;
        bh=qz5DwpdE1M9yacS9PPZ4+WdfykAYzFhi+vULX02uvxk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jBkMFmMLFukwD6QbIN2y9OGWBL4Yiq6fGdvyuTa7ZthgGhaD8MnxwkcP0vDy/N9/Q
         YT+MNssdveNbjePizIBvSo1Hn+U8GUNT6dx9JI4gSpP/pyRGEY1S9avFAJAMSCEiXe
         AmLncGhKsta3xJDu2RL8BE9njKwLVBaR3lMeOt7w+nxXVa2aevRl+fis5Vor2Uqb4b
         a2lSkduSW5f8hXYobgXxR5TCZWgDq79NzeWs6rJHb1r9dVKXFP96DfjUlxFP9CpRss
         9KwlqXClfeE39AXy1ez4TiS/p+G72VMv9lXOs1qI9BZq4B5JHRCKoojRKesOmjNYhw
         0wMwG+dyyVehQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 02BF4C43141; Mon, 27 Feb 2023 21:30:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217088] xone23c mixer
Date:   Mon, 27 Feb 2023 21:30:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaufmich@valino.info
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-217088-208809-vTZ3ySZo3v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217088-208809@https.bugzilla.kernel.org/>
References: <bug-217088-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217088

valino (kaufmich@valino.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|CODE_FIX                    |MOVED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
