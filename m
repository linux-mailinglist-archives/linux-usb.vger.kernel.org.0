Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3EE62FEC5
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 21:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbiKRUZo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 15:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbiKRUZl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 15:25:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297E661747
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 12:25:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D1EF6B824C9
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 942B0C433D6
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668803138;
        bh=7XgxYpoQDcdqyNcoVTgdt1zA+QAgKq3H3SfJzCez7Ng=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LI7kV11FQx6zMD0uXSqCkVdE7lOwngPgiMcXLdzbidYmXoHxt1BpwUq+i2gj6uS5n
         XQH3g66TvWObvRiFhqDOrhI8KsfQnDk3vh0KUuYp+1b3kJgNkOumlAxyWqkatgIZe5
         P4vFdyIQ9uEh2skn7Dvm9p0BvGP0PtrGQkFeo4fpZKARB8pWgW90AvL5IwxebieETY
         Vyr3a7UEgLGKlxZ9dAfd1v+an0iGsuu65JsHCKEvCTyZgJ7zVqMr+X+F1/5rgkpkWA
         z797Mn49Q11ARGPzZAmDRRB4T0KP57SnNJzAZaUc/ZopMbbvCmvihUC6xBIyIB9VIS
         50mMIHSIO0Aew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 82ED6C433E6; Fri, 18 Nov 2022 20:25:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216706] USBC resume callback takes far too long, between 650ms
 and 1200ms
Date:   Fri, 18 Nov 2022 20:25:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216706-208809-kBYNt7FFf1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216706-208809@https.bugzilla.kernel.org/>
References: <bug-216706-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216706

--- Comment #3 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 303221
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303221&action=3Dedit
otcpl-adl-n-1_freeze.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
