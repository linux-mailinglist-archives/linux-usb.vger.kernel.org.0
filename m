Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788074C419D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Feb 2022 10:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239178AbiBYJju (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Feb 2022 04:39:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbiBYJju (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Feb 2022 04:39:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9638F239304
        for <linux-usb@vger.kernel.org>; Fri, 25 Feb 2022 01:39:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5AC44B82D49
        for <linux-usb@vger.kernel.org>; Fri, 25 Feb 2022 09:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAD67C340E7
        for <linux-usb@vger.kernel.org>; Fri, 25 Feb 2022 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645781956;
        bh=wdF4HymfXoxJSiXP70U0DC70i0kxfDn1X5mjRYLmx04=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rLAVMjcXHg9NQyWyuiYVXnXl/+/XiSHex3HkivUl1oIxvJ5GiymR+XX3xYo2nKZxn
         AmlN8/NXNdAiY8milswj9H0fb8yxvDpg/Gp7CAtdfin7un+jQD+IPvpXQRb5JoXyEl
         FO+EWfB3v+ejn9gFtRNFCFk9VS33zq4YlzK5x4QmVFloFFX42JLMYWE+b5eIBvBWam
         cvwT8CGxXKCrK4JicMc0OxzNkIpxkSRTg2oLGtaWsB16hkCPDNDwC1WIYiL02ThcY1
         wHxHExtZ4JCW0yL+zHeeWbf/fMoWzN013ugirCmW5OAQPnPldumE6ZtTRaoiFshGI/
         KdyhFToqvIDUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CCDDDC05FD2; Fri, 25 Feb 2022 09:39:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215475] RMNET data connection speed would be reduced to about
 80-100Mb/s from 150Mb/s  if try to re-connect it
Date:   Fri, 25 Feb 2022 09:39:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: slark_xiao@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215475-208809-XcRDL3MdDQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215475-208809@https.bugzilla.kernel.org/>
References: <bug-215475-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215475

--- Comment #4 from slark_xiao@163.com ---
Hi all,
  According to Qualcomm analysis, there is no issue on IPA side. They suspe=
ct
that  USB is slow to drain is the Root Cause.
  We tried to enable QMAP to speed up from host side. Ping test is okay, but
failed in iperf test under simulator network.=20
  Do you have any good idea for further debugging?

Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
