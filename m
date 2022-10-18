Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 254306023FA
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 07:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbiJRFnj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 01:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiJRFnV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 01:43:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D996A50DB
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 22:43:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 31235B81CCF
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 05:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBEFCC433C1
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 05:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666071761;
        bh=Ev6usGAmeKJ4QW8XOT85VwQZD3rmZJAZ9CxOZfPkcy8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oUCkaiGTYa7EuZi4atn7w8ysUhHkyc7Lu70pLIgfpeG4Bs9f8yFNwc87AKgQDRD0m
         82DXmI0O0jQRhuDGIlMGRFUfanUv55Vz0Q7cLFmgA5WKsO6rZ0oCFugioDnsinJZt+
         8wS3rPenmaoBOvVSmW+wE1/1z5Tl7BxjjHv/wf52v8E9qyBKjfhk1zv0/PXdt9nQA5
         KDDxpO882PmX2Qxd8bfustmnmHlnCezp5uTEB0mYXKa3RsWg1wb9AA2iuFmHaEuM56
         G1CHVdNE4muMx5jEx0SH3H3XUllW53bH+PId6JEKtt/JQKTXgd2C3bZ+IKy9czNSHM
         gO3U+SLnme+xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C6DFCC433E4; Tue, 18 Oct 2022 05:42:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216601] pci_pm_suspend(): hcd_pci_suspend+0x0/0x40 returns -16
Date:   Tue, 18 Oct 2022 05:42:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: koba.ko@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216601-208809-AVMg5K1c18@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216601-208809@https.bugzilla.kernel.org/>
References: <bug-216601-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216601

--- Comment #1 from KobaKo (koba.ko@canonical.com) ---
Created attachment 303024
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303024&action=3Dedit
lspci_t_202210061523

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
