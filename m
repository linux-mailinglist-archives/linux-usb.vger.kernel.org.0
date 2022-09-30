Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303305F0AC6
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 13:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbiI3Lkp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 07:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbiI3LkI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 07:40:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2455E325
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 04:32:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 432BEB8280C
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 11:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF694C433C1
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664537529;
        bh=/liDI7dBB3ff7xQ6tudjpkIshl85gwo13Fr0qO4DATw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WDBVADu++lAqZw+CxZqJZAymPtGeVIp4Dg1EPP2B5lZOn/SrM71qF1oxtkHN2FK9Y
         47DLd/3Qrw3izKsyanoPQk5Wy0NChUEE3LFLYaTuQTUIheNIa8f5QYc0a2As8aYqHN
         Rt5rnQi0GpzKEtPIXZaU3kz0BlCOiqRui8Rak6zfjhOOxvcw0oHYWaBjQhXWb6GlCw
         G2Tbh0a0bY0r8kzkXjipDGtM2KyJcv12b+4Z0QruAXqHds6OX0dFKxpfsEeKiwiov4
         RQywACPz2eNaU/tpfRdmDxdiUqat9L5HZu2SqbAz2TLN8LFyP3jTl/jgAwUiMNfCnq
         KLnkG5LryxR5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B7416C433E6; Fri, 30 Sep 2022 11:32:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216543] kernel NULL pointer dereference usb_hcd_alloc_bandwidth
Date:   Fri, 30 Sep 2022 11:32:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nazar@mokrynskyi.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216543-208809-rR7ul86oAt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216543-208809@https.bugzilla.kernel.org/>
References: <bug-216543-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216543

--- Comment #2 from Nazar Mokrynskyi (nazar@mokrynskyi.com) ---
Created attachment 301905
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301905&action=3Dedit
kernel log from latest crash

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
