Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB23360DEB4
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 12:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbiJZKNb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 06:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbiJZKN3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 06:13:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212CBCE2D
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 03:13:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 867BBB82148
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 10:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38F5EC43143
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666779206;
        bh=wgvPrS9LPH0HHqpE7HwcEaKoxjf4XwUyDoSXBkjKgOI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tBMASAkS5dLoaSAeVwnQH9N54Tl+zCVo60DFQ4CElH9tkXNKpIqV2N9skZhherp5A
         oLEVDyOiD1jAGsEIDw6+qio4aZL952a3G/TKMkSQaibh9qmhjjq+YPlCzBfY9xvi9s
         69JjDOr2Tmfn7xOHFPgRCJGEGGSFAHpu1+I2pBbHY8FENs7Inu/fhDwVZbNTL2VS7q
         79As5YxWUuIo1SM/3MVy+Fm7SDGPRZoWsWO80Qu/XhJNxKbjlhUqN9a5TDy1ASaYk9
         rzQyegUKyUiLelbNlhLTD3wzXOIir8lRuhIb3IZE9yx9s2p05ySyqtlhhanXVHfesO
         X+ytbYD41UEMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 28817C433EA; Wed, 26 Oct 2022 10:13:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Wed, 26 Oct 2022 10:13:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew.co@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-CnEQWwfdqN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #41 from Adrien (andrew.co@free.fr) ---
(In reply to Heikki Krogerus from comment #40)
> (In reply to Adrien from comment #39)
> > @heikki Today i have installed 5.19.17 kernel (btw it appears to be the
> last
> > 5.19.X kernel) I have saw that you made a fix regarding usci but the is=
sue
> > is still present on my machine. So I don't know if this fix was referri=
ng
> to
> > this specific issue, please let me know :)
> > thanks
>=20
> The fix for this bug is not in v5.19.17. It's not even part of mainline y=
et.
>=20
> It's now waiting in Greg's tree (there are actually two patches, but you =
can
> just keep an eye on this one):
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=
=3Dusb-
> linus&id=3D99f6d43611135bd6f211dec9e88bb41e4167e304
>=20
> Once it get's applied - presumable withing the next couple of weeks - I'm
> expecting there to be a bot that reacts by changing the status of this bu=
g.
> We shall see.

Thanks a lot for these information. I will keep an eye on status updates.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
