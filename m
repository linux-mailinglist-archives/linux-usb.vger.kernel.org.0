Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4783D793F71
	for <lists+linux-usb@lfdr.de>; Wed,  6 Sep 2023 16:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbjIFOts (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Sep 2023 10:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbjIFOtr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Sep 2023 10:49:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451C410D0
        for <linux-usb@vger.kernel.org>; Wed,  6 Sep 2023 07:49:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D64FFC433C9
        for <linux-usb@vger.kernel.org>; Wed,  6 Sep 2023 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694011783;
        bh=m1q5PWk3VITjtP4WUHjOYykhvVfOTG78Yh0MqOwyUYE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uwr3RdCOiDZQJkfQ3mQu1rabE85HK5FSGGzPo8JLg4dbO/oEzXo7wnKiFUz1Fc+x1
         J8Dy8wWRYUmDMLIzNuxdCoj6jT3PYC6HxLbvGiV1+8c5Qn4EwdVXH+7CuV5TZ0id/n
         FaEJ8ouHF1mhbySnLLX4Q2lLT9OFbWJLEbY56PW2nPl9dbPq494wkirhyr3azwaVni
         I2AjFg4Z7yAqLpFJymvjorlZ9bSSV9erg21oubLxF/En0JVT5MiS352r/FXH4h2uxr
         OxjhNGy86Gu04v92ve39Ql6cRf31hvBO9mvoPVc2wZS6mrgeNr3+wTEblDiY/QwqBe
         eFxucOKzqTnhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BE203C53BCD; Wed,  6 Sep 2023 14:49:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Wed, 06 Sep 2023 14:49:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217862-208809-BtytsCMGt6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|stern@rowland.harvard.edu   |

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
There is a significant difference between the two reports: the bulk endpoint
numbers.  The Windows output shows it using endpoint 3 for bulk OUT whereas
Linux uses endpoint 1.  That's got to be the reason why the Bulk Reset Media
and Bulk Get Redundancy Data commands are failing.

Let's see what "lsusb -v" shows for this device.  I expect it will list both
endpoints, and the Windows driver uses one but the Linux driver uses the ot=
her.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
