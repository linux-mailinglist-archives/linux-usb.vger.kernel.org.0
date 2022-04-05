Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F9F4F35C3
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 15:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239090AbiDEKys (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Apr 2022 06:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349199AbiDEJt0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Apr 2022 05:49:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A2D2251E
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 02:42:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 857AC6164D
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 09:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9EFAC385A1
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 09:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649151754;
        bh=ufS37hQX5V6TbTKuVdmMhVtjv8HD6W+b8I9peYXxmYE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MVDMP4UqaHGTc8IijFFWLervEOQaDUfWhnKnJxI+Psa1DOSSFflQwnYzh+KUQIXvV
         JIu+4IHZTJZdwUBH6ce+io5YDSsiYdJo8uLSsEP3VYCmAJTB7aF39W/pB9kC4bbD+W
         vVK3onw2EdxtnWqnG18wiKPw+Z8+oMB0z7ytvbNOHqsFDO6xwchVeer9xAzXg8FIa0
         8qvpmr0wNsfSND82LY1D4/hK06YplZx0uYMkA0KRX/EzhGv1XLOnPEcMOar2Mo9yzV
         az33wN9iR4fhTS/49PQV6NalJt+RUidpvkVNLbLPeDb7/hpui+RODAqpGVsFNfN5jB
         hXdR3TR6ZBVBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D5F38C05FD6; Tue,  5 Apr 2022 09:42:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Tue, 05 Apr 2022 09:42:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215799-208809-kbxmdbmxxa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215799-208809@https.bugzilla.kernel.org/>
References: <bug-215799-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215799

--- Comment #3 from Oliver Neukum (oliver@neukum.org) ---
Created attachment 300701
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300701&action=3Dedit
correction of type of power source

Please test this patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
