Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7457D49D807
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 03:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbiA0C0A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 21:26:00 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:46888 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiA0CZ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 21:25:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 99B4B60C93
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 02:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E82AC340E7
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 02:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643250359;
        bh=R/U4sOt4ogVDTdOUB7UTtaEBiJZYKKFtr3GjwEwRTKo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GleMFCEbSp9P9BZk7d7WR1VpiqgeQK92wyQJPp+k+MOpEe0WlCtacXJGOBjJnnrj+
         6rgMbv/FDNrsxWAZPGyjer+j50TGnZj7eYCg3QowTchploL4VdSsZIXmUTLp4uNBDm
         1LmTYepeGA5RFneavTsYQrxvj8f0Pshm53jpgL1Hl6yMguCtQ8fqAvtBrLLzPigz1k
         LnJx3+mMTsihFNlhIE6VkoUd/Jfz21WXC+Gm6s2hBOw8+a9aObXvLgXTRSbY8UuD54
         +NVkhph4ahjWR1X6G5ePtJyEL3WtDNpQsVi60qLlE6/gnftG3R8Zxpgz6V3A5Hdn4e
         YNy0m67gA2abg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E979ACC13B1; Thu, 27 Jan 2022 02:25:58 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Thu, 27 Jan 2022 02:25:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215361-208809-s3aHARBDD4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

--- Comment #8 from Ross Maynard (bids.7405@bigpond.com) ---
Hi Greg,

I have sent an email to linux-usb@vger.kernel.org.

Thanks

On 26/1/22 11:32 pm, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215361
>
> --- Comment #7 from Greg Kroah-Hartman (greg@kroah.com) ---
> On Sun, Jan 16, 2022 at 04:23:55AM +0000, bugzilla-daemon@bugzilla.kernel=
.org
> wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D215361
>>
>> --- Comment #6 from Ross Maynard (bids.7405@bigpond.com) ---
>> Hi Greg,
>>
>> I found the patch:
>>
>> Bisecting: 0 revisions left to test after this (roughly 0 steps)
>> [16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad
>> module alias from zaurus.
> Great, can you send this information to the linux-usb mailing list so we
> know what id to add to the driver?
>
> thanks,
>
> greg k-h
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
