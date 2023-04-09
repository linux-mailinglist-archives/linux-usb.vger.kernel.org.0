Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C606DBF3B
	for <lists+linux-usb@lfdr.de>; Sun,  9 Apr 2023 10:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjDIIsi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Apr 2023 04:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDIIsh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Apr 2023 04:48:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D4E1FC1
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 01:48:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6555601BE
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 08:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3571AC433EF
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681030116;
        bh=zoy6C16355l+gZ5/OcaCa18eMd/HhoJomAwJOGuVjuM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OfW2kePJehNTdmGq3iehEjNwkfKModiU6yWD4mxWbRNfZQmAdVGr8RWmQg2DFGCqO
         NCW7+wGrrYvfOVUBBc3JmdxDp6C80/SVveVzlQMCFGjPM9ZHwOIetfsOsa6YDHD/aw
         LUDeLWkv8Ra8oLXwT3eZA1i4xNniFQ8TGy/2haXBzZpbnNado5aJDl03UmBEGpsWtk
         1IURAOeWoKUm2LNbRLmMj+aMqmbIT15HfzkVTiCuMN/DSfI3akCS7CUKIJYTCPMCmH
         mMvOs2IynRQJcJRklUuR6NNS2F/e5lGZnEzLUfctmr9NkToHxdNhp/oGEE+kGuwcRp
         BKNFen6vTPGYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 24653C43141; Sun,  9 Apr 2023 08:48:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217314] Mackie Profx12v3 not working, showing unable to find
 clock source
Date:   Sun, 09 Apr 2023 08:48:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vu3ezx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217314-208809-ZsC3e3raq6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217314-208809@https.bugzilla.kernel.org/>
References: <bug-217314-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217314

--- Comment #1 from Arindam Ghoshal (vu3ezx@gmail.com) ---
Created attachment 304101
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304101&action=3Dedit
lsusb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
