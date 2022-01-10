Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0494897A8
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 12:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244861AbiAJLkc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 06:40:32 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34170 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244960AbiAJLim (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 06:38:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19413B81617
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 11:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2908C36AE3
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641814715;
        bh=5oOq2lbhSREP3GdtdZkoWzQb0BQ5dEK+T5YnzIerEnI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ENYi1xd59yvaY18YADaEwKdELyr/U+CrIuBdMQlx/+OYi6KrPmxRt5LVhX0W3EWCB
         wIGxcDdZZE3jcGcnhmN2hhL7CWeofJJOE2PIO3so7GfJ5sNUrMuz4BROM+jW8/ZIWm
         XgDnqydVFapbeKPiSoXf6jDrMLWLNkgAjpRCpj29LyE/GpdfzRSdDYxfhkaDcqXo2Y
         8BnspcYqa6ws1l+v5xEb60weWnF69teGahBjekXaxq3f0vJMtt2m3VeJ55rnoH57+7
         xWVdyZsWZz6RM/Cl5fguNUrunegMtgwGJ8Q1izc++W6FSvHwSqxAGWb/djNqkYHP7S
         PI8Z2UKgaKpBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C75A8C05FF3; Mon, 10 Jan 2022 11:38:35 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215475] RMNET data connection speed would be reduced to about
 80-100Mb/s from 150Mb/s  if try to re-connect it
Date:   Mon, 10 Jan 2022 11:38:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215475-208809-N6dLvi6DM0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215475-208809@https.bugzilla.kernel.org/>
References: <bug-215475-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215475

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Mon, Jan 10, 2022 at 11:23:13AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215475
>=20
>             Bug ID: 215475
>            Summary: RMNET data connection speed would be reduced to about
>                     80-100Mb/s from 150Mb/s  if try to re-connect it
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.13.0

Does this also happen on 5.16?

> Created attachment 300251
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D300251&action=3Dedit
> iperf test result
>=20
> We have a Qualcomm modem device which support MBIM and RMNET over USB.
>   For RMNET, the download-link speed would be reduced to 80 Mb/s if
>   re-connect
> it once. The expected speed should be 150 Mb/s.
>   Test step as below:
>   1. Switch device to RMNET USB composition.
>   2. Connect it to host PC(kernel 5.13).
>   3. Start a data connection with nmcli related settings.
>   4. Start a iperf test with simulated network(CMW500). Test result is ab=
out
> 145 Mb/s ,and protocol is TCP.
>   5. Disconnect the connection by turning off the signal, setting AT+CFUN=
=3D0=EF=BC=8C
>   or
> deleting the data connection in the host.
>   6. Re-connect it again.
>   7. The TCP iperf test could only reach to about 80-100Mb/s.

If you look at the usb traces, is the data the same?  Any long pauses?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
