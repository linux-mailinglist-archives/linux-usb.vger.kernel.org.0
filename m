Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D877977FB
	for <lists+linux-usb@lfdr.de>; Thu,  7 Sep 2023 18:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241042AbjIGQiy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Sep 2023 12:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243673AbjIGQiJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Sep 2023 12:38:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEB944BB
        for <linux-usb@vger.kernel.org>; Thu,  7 Sep 2023 09:22:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72DADC3278C
        for <linux-usb@vger.kernel.org>; Thu,  7 Sep 2023 13:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694091748;
        bh=5LqiDarIt5WCqjn4qJ1J1IZ42GEFPCnLaNOFVR59NqI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=m5oyNzxKIQVOWc7uEC56TQgB/LwoDCqn16+STYPRsEFDoiQSE1pi4Zx+ldyy80cYH
         zaMQlXgi8bmhyMvoPUj6LVVr5fSmmzYrhHxl9jVtdl/y56fLWwWKneFT51OZn672cj
         yQnQpS2t0+XKcvvChIwJW77uIydsxLVOBpW9B58BRZTR9cGhemh5J14lQmgQUWycRE
         J+a2mH3QC4nJNWCqcZMoq9ywoIuOElRRR98uYx/zuuhLSrSgKH8MGenIr0/rUpFOVf
         Y5lJHLKJuXbPNtTNNsSdQJhdlgRn292jEAmjtUACP/7yxI7hB37RaXx1fD8fv1DX+X
         Go3JA/lNjjbUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 59641C53BD0; Thu,  7 Sep 2023 13:02:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Thu, 07 Sep 2023 13:02:28 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217862-208809-Rg8yMFkiM3@https.bugzilla.kernel.org/>
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

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 305064
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305064&action=3Dedit
Override default bulk-OUT pipe

All right!  So let's see what happens when the driver uses endpoint 3 inste=
ad
of endpoint 1.  That's what the attached patch will do.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
