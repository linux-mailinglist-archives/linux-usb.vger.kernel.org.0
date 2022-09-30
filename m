Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B22EF5F0BC6
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 14:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbiI3McO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 08:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbiI3McM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 08:32:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A661114CF
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 05:32:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 72A4D622EB
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 12:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D31C8C433B5
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664541130;
        bh=Y6w3kK9p8irnDPWj5uzQ0wR2J7QZrcFaUoLPoW9hFnw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XV7Pw/+UKkm1eilFtwpXKy9lU7ocYHKM7CUnAJuOmE+c5ONIYQP+zLTszUJHmqYEI
         WGseKNjnAkOQTp+ihRBQPDn1zrf3L/c8Z91amytATQLbHCLtLAFDC5M2A3mV4gWAEX
         jIqlHZC4utZ7OndtynxzZkKdnmA8tq4XjbrKoDQo+okIEZGFOh2/ZnBaBHvuIcxpuw
         ZEcfGGoziFxyFcYdtQamow89Io04c3uhNQDob6oI31Z1Bekto6h8w6cycXlUrPMIaw
         bDjvltCawryUmRu1PjDY4LCgpJ588gYXqnDZiBq+CbwfuEwi1hRQzqeGYW1n4fkcnE
         yQcHOUcy3qt+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BF536C433E6; Fri, 30 Sep 2022 12:32:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216543] kernel NULL pointer dereference usb_hcd_alloc_bandwidth
Date:   Fri, 30 Sep 2022 12:32:10 +0000
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
Message-ID: <bug-216543-208809-Rk6UCOOyGB@https.bugzilla.kernel.org/>
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

--- Comment #5 from gregkh@linuxfoundation.org ---
On Fri, Sep 30, 2022 at 11:38:46AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D216543
>=20
> --- Comment #4 from Nazar Mokrynskyi (nazar@mokrynskyi.com) ---
> Created attachment 301906
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D301906&action=3Dedit
> kernel log from first crash
>=20
> Previously uploaded file is from second log snippet, this is the first one
> for
> completeness since stack traces are slightly different there.

The log file is full of warnings and other messages way before USB is
ever involved.  You might want to resolve those first.

Anyway, yes, the device disconnects itself from the USB bus which is an
electrical event and the video driver fails trying to send data to it,
and then things blow up again.  As there is a real solution for this
(fix the cable), I recommend doing that first :)

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
