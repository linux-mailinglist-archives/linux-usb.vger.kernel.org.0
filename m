Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B13D57BCCF
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 19:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbiGTRiB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 13:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241405AbiGTRhu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 13:37:50 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BDD70993
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 10:37:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E5EC2CE226F
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 17:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E06BC341CA
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 17:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658338661;
        bh=f4VV73quLAg8r2ItY7FnpEs8Ei2cwpdBQ+zOk6BSwf4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iWBeAG5cpEUYbQQZ04TgaEPE1t3NpktBV/uBp9bkgwJc4hdXPuqIln4PWZdQFY56K
         KpjcXP+L7xq4PVFwrw8zoVYfhxbnZ6i44JlsXPsfQBIi1oFn4bWKDzVsrWCbTuwTaG
         7NLIlirZsHuRjKQdmxZ8CxO+9o+yT4Ohnel65GD6xY0PTmdszwv02zrV5+AI1pjwqL
         7P/CyopFLsb1sgaDugRNUhhZATy5Xwhx4DDhGshx5a7egPSK+5JkVXK2g+PGL8Y30W
         E9AWcwBYaAYWn/TDz8BIgP3TZE7+PsGf4SZYCKh4xDZuDkAhd3rN3ZiKjWn3Fl17ci
         yyckrZ9R395YQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3E452C05FD6; Wed, 20 Jul 2022 17:37:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216243] Shutdown successful but machine does not power off
Date:   Wed, 20 Jul 2022 17:37:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joey.corleone@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216243-208809-rYHXHuQdzM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216243-208809@https.bugzilla.kernel.org/>
References: <bug-216243-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216243

--- Comment #4 from joey.corleone@mail.ru ---
(In reply to bminaker from comment #2)
> Sure, I will try, but one question first: once dynamic debug is enabled, =
and
> I get the log, how do I disable it? Is it reset at reboot?

Yes, rebooting will turn off dynamic debug output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
