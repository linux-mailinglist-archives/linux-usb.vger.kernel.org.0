Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CA23D4C88
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 09:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhGYGnY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 02:43:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:53892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhGYGnT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Jul 2021 02:43:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0A9CC60F11
        for <linux-usb@vger.kernel.org>; Sun, 25 Jul 2021 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627197830;
        bh=Tk+8PC4vDkWOrHUZxUBNwdy6DGRt4ZylVpHEmzMxkMU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ceX6NN4kvn0F9FmUNO299ssvcSg7aDNr52j4OgtpJJiDbnnHOye8CFlAb6k3Ocfhy
         H+ht1OLVSLZ4YCdRtroiqPn5JVMowUXrRboDb5pIbphQHzIkkDcygFYfLIpk1bl7sS
         wjW7oloqI5ALGhejxnPcgh7FeqVAlXbF17FXfqSPNO2f6KMmdOBKjN9xIhQEXe3+L6
         ph8ZQaumYjqVOAifNkVz46aO22CGss8/ZJdvNkYAHTblQ2P5+Xlg2HdhtsTT+g4aS1
         zh14ZHlbw+rCQKUvmxk/65rGxqPJK03AtdBsXUlnDHZUSrJ8m+iNHdaQoYlIS39FOy
         Ng3Nc1wf/QYmg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id F3DE360E9A; Sun, 25 Jul 2021 07:23:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Sun, 25 Jul 2021 07:23:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Minas.Harutyunyan@synopsys.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-Y0Z3S1I9cl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #10 from Minas Harutyunyan (Minas.Harutyunyan@synopsys.com) ---
On 7/25/2021 11:16 AM, Minas Harutyunyan wrote:
> Hi Yunhao,
>=20
> On 7/25/2021 10:55 AM, bugzilla-daemon@bugzilla.kernel.org wrote:
>>
>> https://urldefense.com/v3/__https://bugzilla.kernel.org/show_bug.cgi?id=
=3D209555__;!!A4F2R9G_pg!L6dlphg0375bx1FF7IECNRnSiIv6e_sCQ5e1ooYvcCkyTte-dE=
Qp2ry8RyopRZNUdnLaQpSh$
>>
>> --- Comment #8 from Yunhao Tian (t123yh@outlook.com) ---
>> (In reply to Minas Harutyunyan from comment #7)
>>
>>> Could you please apply patch "[PATCH v2] usb: phy: Fix page fault from
>>> usb_phy_uevent" from Artur Petrosyan and test again.
>>>
>>
>> Hi Minas, Thanks for your reply!
>>
>> It doesn't seem to make a difference with the patch applied.
>>
>> I enabled the dwc2 debug logging option in menuconfig,
>> and captured the logs when I plug in, disconnect and re-plug in.
>>
>> The link to log file is
>>
>> https://urldefense.com/v3/__https://drive.google.com/file/d/1ID3bDp4NA6v=
SXf4AqN8w2WiDhaFbnb59/view?usp=3Dsharing__;!!A4F2R9G_pg!L6dlphg0375bx1FF7IE=
CNRnSiIv6e_sCQ5e1ooYvcCkyTte-dEQp2ry8RyopRZNUdp04G9mX$
>>
>=20
> drive.google.com not accessible from my corporate laptop. Could you
> please put debug log on bugzilla.kernel.org?
>=20

Also please send your params dump.

> Thanks,
> Minas
>=20
>> At [   32.964469] the gadget config was bound to the device;
>> At [   38.002792] the device was plugged to a PC;
>> At roughly [   43.063762] the device was disconnected; at [   45.640378]=
 the
>> device was re-plugged.
>>
>> After a short period of time the kernel freezes, no more logs can be out=
put.
>>
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
