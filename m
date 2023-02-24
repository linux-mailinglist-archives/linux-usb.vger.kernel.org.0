Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5056A1705
	for <lists+linux-usb@lfdr.de>; Fri, 24 Feb 2023 08:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjBXHW7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Feb 2023 02:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjBXHW6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Feb 2023 02:22:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B3213D45
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 23:22:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 62BD26182E
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 07:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCD89C433A4
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 07:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677223376;
        bh=JcqSe6LjZjutpkF6PoFKoNbpFOInKPwPoeng2lFigXs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NdPomUh5SfNUPZMeWGu9BGfERHhrA4R5hiqeApqnHnkx0H8Yb0C2xhQSml+xquKVu
         aW8qE8+XCz3prhj/YOC36hpWIEKVUkrWbwcoWtNZgG0jUgVWStujPz8LbRRVpGqDO9
         r+hEPNwYPC3OCtV8L3BffitCGTLVGqAHyI4LeGThdF5mGuB5iIllYQJiYrhn6A3HRb
         tbMN2G74/VEwzH2AyKjobTXdAsBgnPllBL0zWXoGw1jv1UxEf7ipUOLagsMk9O1lMj
         vtZuRHf+ALl9BN7LkMNI6klzm+/inSB6FUsgNUz4zdPSwF83+eq4zQ/PWPiq9XT74t
         iK386aRXx5NtQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B6186C43144; Fri, 24 Feb 2023 07:22:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217081] miss kzalloc check in mv_udc_probe
Date:   Fri, 24 Feb 2023 07:22:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217081-208809-yOhoNSMcx8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217081-208809@https.bugzilla.kernel.org/>
References: <bug-217081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217081

--- Comment #1 from gregkh@linuxfoundation.org ---
On Fri, Feb 24, 2023 at 07:11:13AM +0000, bugzilla-daemon@kernel.org wrote:
> miss a null check at
>
> https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/udc/mv_=
udc_core.c#L2232

Great!  Please submit a patch to resolve this issue if you think this can
ever actually happen.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
