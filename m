Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEBF62FEC0
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 21:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbiKRUY7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 15:24:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiKRUY6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 15:24:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F955E3E1
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 12:24:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1D470B824F8
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBCB6C433D6
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668803094;
        bh=uyPn3+R8hAVtydE7SlkFyO1+lAs8KPBS0t2kc/Yfu/0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cldzcXiRQ05ROqk2EUqLNQX2aSQqQWo9UBscAOCmd5GIhcSGPpRTqDmmYtn+GhSc5
         /C3KYOwufl3bsK/Uzk9RfUmsEOl/kcinG9H9tc5/TJjaOwyarigAohD0sEn84/iA5u
         8CLx43KWDaOPEb8r/81G3d8WRvqeiHlfYKQdPqJab7We4bNPVFuql1i6fM5oYLxgCN
         SOvxXRNsZVt9EQZ5LqGHwLzlF9l5IxD8zj1+KAZCap8Vsw60tztNGq5Dm1wfdZFMnr
         yQsxqkSl/IPfm2mkSzhKbtonyfUvBmr4VNbv+5xT+Xx91/S9ddRt5QbI6P8xU/bknS
         xMNLo846VF84g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CBD8BC433E4; Fri, 18 Nov 2022 20:24:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216706] USBC resume callback takes far too long, between 650ms
 and 1200ms
Date:   Fri, 18 Nov 2022 20:24:54 +0000
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
Message-ID: <bug-216706-208809-tZaGytkQCs@https.bugzilla.kernel.org/>
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

--- Comment #1 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 303219
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303219&action=3Dedit
lenb-Dell-XPS-13-9315_freeze.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
