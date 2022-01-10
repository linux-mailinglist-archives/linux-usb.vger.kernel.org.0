Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8C9489750
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 12:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244657AbiAJLXU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 06:23:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239620AbiAJLXO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 06:23:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C2FC06173F
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 03:23:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3894C61248
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 11:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2912C36AE3
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641813793;
        bh=XF9k2IxAwLzPpDMztQ+PNoekO+KHCwP0adIDnntBq+w=;
        h=From:To:Subject:Date:From;
        b=OArZJ/qkWQjvD+Ony8KGA2z5DtqdbKUzsql1lHlUquM+hC1qHVsPnGYzJm4H/KHEd
         fVhJtPxfn2F3fmiY0dJ5dBoYrJUUhjaaM00tFeb9VVohsQnN2fnD3lI8gBpKcbiKTL
         zvdrGQ9WtACWB3gbZKwhInIciR9I1p5QuB1ZczSvC4uXAUMawCNCZMrA4Zuw0INU2H
         a2TlgtnF4IpoSeL4EytI9CzfxuT8plps2bVP66ZJK+CcCZeKth9uVTv7zTG7C4aFYd
         mPisN5jTfUg4pLrr7B/rrnlMpdGjEu9LI08lnOBg/VMwq1qukq//+VtLZpHxSDVIuB
         drqAXU+17BSvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 80275C05FE3; Mon, 10 Jan 2022 11:23:13 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215475] New: RMNET data connection speed would be reduced to
 about 80-100Mb/s from 150Mb/s  if try to re-connect it
Date:   Mon, 10 Jan 2022 11:23:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: slark_xiao@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215475-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215475

            Bug ID: 215475
           Summary: RMNET data connection speed would be reduced to about
                    80-100Mb/s from 150Mb/s  if try to re-connect it
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: slark_xiao@163.com
        Regression: No

Created attachment 300251
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300251&action=3Dedit
iperf test result

We have a Qualcomm modem device which support MBIM and RMNET over USB.
  For RMNET, the download-link speed would be reduced to 80 Mb/s if re-conn=
ect
it once. The expected speed should be 150 Mb/s.
  Test step as below:
  1. Switch device to RMNET USB composition.
  2. Connect it to host PC(kernel 5.13).
  3. Start a data connection with nmcli related settings.
  4. Start a iperf test with simulated network(CMW500). Test result is about
145 Mb/s ,and protocol is TCP.
  5. Disconnect the connection by turning off the signal, setting AT+CFUN=
=3D0=EF=BC=8C or
deleting the data connection in the host.
  6. Re-connect it again.
  7. The TCP iperf test could only reach to about 80-100Mb/s.

  This issue can not reproduced with MBIM port.
  Also, Windows can't reproduce the RMNET issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
