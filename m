Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7476D6D33FC
	for <lists+linux-usb@lfdr.de>; Sat,  1 Apr 2023 22:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjDAUzB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 16:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjDAUzA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 16:55:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA466133
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 13:54:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4FE4D60FCF
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 20:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD06BC4339B
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 20:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680382498;
        bh=Z9PeD6Uf7YtlCRQS7uFh/P4voph6ys6pQY0+p58eIsQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lG2TOVAUL6/Or2JhlE1WnEuEE+DOxD48EGqLRpdjkdMVEcLxK4YZbfHCcTvUO5+lH
         NQSlomnEVqtLxpO/nd+oza0wySJ88qi2ETe+ffGkb0w1HVwxQE6Cr2kPjWfvoGVRfr
         lcE90GgCZBHg+zg6saOFdtRCmE037zDV/fI7VWNy0DmrEl8K1zNQ3uhb0wenOlgwJj
         OAT0KnFjE4RESGiOuAll9k+ejREeGyGdh+LA6N1bXP5LF8LZeWM0+5eTT0PoRChQlx
         dov/q8uXWS1qQRjhURBzImz+pfBG4oZAiu7HnItY6N/bX5OA3OAqrZnGAJ/mK/bPWy
         zYDrJ+5xmrqrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8963AC43142; Sat,  1 Apr 2023 20:54:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Sat, 01 Apr 2023 20:54:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: austin.domino@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-FB1Jsx02wQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #2 from Austin Domino (austin.domino@hotmail.com) ---
Created attachment 304072
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304072&action=3Dedit
Log file displaying this problem on the ASRock NUC Box-1260P running kernel
version 6.2.8

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
