Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27CC825A27
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 23:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfEUVrL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 17:47:11 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:43971 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726907AbfEUVrK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 17:47:10 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D9E7021FC1
        for <linux-usb@vger.kernel.org>; Tue, 21 May 2019 17:47:09 -0400 (EDT)
Received: from imap6 ([10.202.2.56])
  by compute6.internal (MEProxy); Tue, 21 May 2019 17:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm2; bh=RuM+yNwF9z1/7ky7LnJmngWVbt/GzSjtgprJYMPkAQ8=; b=i6w28/Gi
        NnrmSHkuQa/oukmrqD3JczIHK9KiOznKkbxjxJxGk08OYgjUfWI8saqeJmhqUoTf
        rcxXHLvoBQPDoCBhaQRmc+SAFzVFWYFS5+v/JV4Y5NfOu9MVT86QXoHPler7OwCG
        +X58cPkalgI0suDQ/4qds68BFs8lCmjDZYb8E6uWOEzjdWqnXzrFGjZRSpNNjSoz
        UNJFkgxW08svNHyUeADrdangjqwAOco43KT0t+rXP/1y6IcS6MLEcSTaVnsVV0xI
        +QXZ66gFa0sWMOvMe8DNW6gOkRwdayumGodtw8mZzQGsl7+Uw6N/EWIwe0W7Rlg6
        0EwpGdUpm3Zn0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=RuM+yNwF9z1/7ky7LnJmngWVbt/Gz
        SjtgprJYMPkAQ8=; b=6Zgb4UOnSGlrHzDvArhpz3futmW+9Bh2N6s7SZkxVtJqu
        IoHcP4tINfEYK88pzLCnRvDVU7tkW74q9f/5U2pE8wziv0frItXx1HWWfAz4DEJ9
        4OpDF3GCOjdgPbnXWoI3+9seyu5t559wjLaTJ6Zmbe7gUndkYDpnc62nWn6XKxuS
        2YVHs107mer9Cvrb7ln+6eYfxNIFkQpy94SA97xSoxeDC7j/FuQ4c2xGaeEIOMxf
        DsHogCKOjN5l7T7TX+t9vPWfziOTEY/KMOQ97C5OXbRWY0QeQvwddvzQp9Adw5X9
        WJN66eqIYf7nsKqBvxJuznbmXesXBBDAG2dmKs7mQ==
X-ME-Sender: <xms:3XHkXKmgbD1YuqxHujJUURsYB2J0K8XOYppnYxjIHcli_RmR73_61w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduuddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erreejnecuhfhrohhmpedftegurghmucfirghushhmrghnnhdfuceorghgrghushhmrghn
    nhesfhgrshhtmhgrihhlrdgtohhmqeenucfrrghrrghmpehmrghilhhfrhhomheprghgrg
    hushhmrghnnhesfhgrshhtmhgrihhlrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:3XHkXCPycjOMfAVYB8noX3UsB1r3Wcpdy3dSmue5Lh-lpSlk58xE6g>
    <xmx:3XHkXJyYej5r_wuynLKNdedfDZTLLIHtIH0JfEB_2hDsxlOSLIsLWQ>
    <xmx:3XHkXKnT8FQd3RFQqCiyZUqcmzkmY3LBLAk87WfVLUCuRwkPFBIcYw>
    <xmx:3XHkXGI6wkLZf276KGbLf-zubrP0zq9q-yRUSKTu5dktEd_BJimj9w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 99A9082F4B; Tue, 21 May 2019 17:47:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-550-g29afa21-fmstable-20190520v1
Mime-Version: 1.0
Message-Id: <1b819641-609b-4e0e-86a3-afe81eb73efc@www.fastmail.com>
Date:   Tue, 21 May 2019 16:49:14 -0500
From:   "Adam Gausmann" <agausmann@fastmail.com>
To:     linux-usb@vger.kernel.org
Subject: =?UTF-8?Q?Raven_Ridge_xhci=5Fhcd_not_working:_"Refused_to_change_power_s?=
 =?UTF-8?Q?tate,_currently_in_D3"_?=
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On my ThinkPad E585, with a Ryzen 5 2500U, my XHCI driver crashes when plugging in a device after switching power states, or during switching itself.

Steps to Reproduce: 

- Unplug the AC power, or start the computer with AC unplugged. If the computer has AC power at boot, it will work properly, but plugging it in after running unplugged will not.

The xhci_hcd and xhci_pci modules remain loaded after the error. Reloading them appears to reset it, and the scenarios above still apply as if the computer was just started.

These tests were performed with laptop_mode disabled; enabling it alters the behavior. I will test that more later.

Results:

The USB device fails to register, and `lsusb` remains unchanged. No other errors will appear after the first one occurs.
One of two error messages will appear in kernel logs:

[   51.276650] xhci_hcd 0000:05:00.4: Refused to change power state, currently in D3
[   51.276658] xhci_hcd 0000:05:00.3: Refused to change power state, currently in D3
[   51.277051] xhci_hcd 0000:05:00.3: enabling device (0000 -> 0002)
[   51.277074] xhci_hcd 0000:05:00.3: WARN: xHC restore state timeout
[   51.277077] xhci_hcd 0000:05:00.3: PCI post-resume error -110!
[   51.279316] xhci_hcd 0000:05:00.3: HC died; cleaning up
[   51.288669] xhci_hcd 0000:05:00.4: enabling device (0000 -> 0002)

[ 5258.438021] xhci_hcd 0000:05:00.3: Refused to change power state, currently in D3
[ 5258.438328] xhci_hcd 0000:05:00.4: Refused to change power state, currently in D3
[ 5258.450026] xhci_hcd 0000:05:00.3: enabling device (0000 -> 0002)
[ 5258.450511] xhci_hcd 0000:05:00.4: enabling device (0000 -> 0002)
[ 5266.112941] xhci_hcd 0000:05:00.3: Error while assigning device slot ID
[ 5266.112952] xhci_hcd 0000:05:00.3: Max number of devices this xHCI host supports is 64.
[ 5266.112963] usb usb1-port2: couldn't allocate usb_device
[ 5280.960968] xhci_hcd 0000:05:00.3: Error while assigning device slot ID
[ 5280.960979] xhci_hcd 0000:05:00.3: Max number of devices this xHCI host supports is 64.
[ 5280.960993] usb usb1-port2: couldn't allocate usb_device

Expected results: 

Device connects, powers on, and registers properly, showing up in `lsusb`.

Build: 

Linux 4.19.44_1 #1 SMP PREEMPT Wed Mar 27 20:41:38 UTC 2019 x86_64 GNU/Linux, with firmware 20181218

Has been an issue since 4.19.28 and possibly earlier.

-- 
  Adam Gausmann
  agausmann@fastmail.com
