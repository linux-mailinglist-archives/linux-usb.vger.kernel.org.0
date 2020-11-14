Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326E62B2D42
	for <lists+linux-usb@lfdr.de>; Sat, 14 Nov 2020 14:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgKNNAn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Nov 2020 08:00:43 -0500
Received: from static-213-198-238-194.adsl.eunet.rs ([213.198.238.194]:36558
        "EHLO fx.arvanta.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgKNNAm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Nov 2020 08:00:42 -0500
X-Greylist: delayed 324 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Nov 2020 08:00:41 EST
Received: from arya.arvanta.net (arya.arvanta.net [10.5.1.6])
        by fx.arvanta.net (Postfix) with ESMTP id 5DA4815F55
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2020 13:55:14 +0100 (CET)
Date:   Sat, 14 Nov 2020 13:55:13 +0100
From:   Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
To:     linux-usb@vger.kernel.org
Subject: driver/net/usb/r8152 stop working after some time with kernel
 5.10-rc series
Message-ID: <X6/TsY8hd+Z3ITtL@arya.arvanta.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

[ I'm not subscribed to list so please Cc to me
  and sorry if this is not polite ]

I'm using driver r8152 'Realtek Semiconductor Corp. RTL8153 Gigabit
Ethernet Adapter' (that is what lsusb shows) which is included in
external usb-c dongle which is listed as 'VIA Labs, Inc. USB3.0 Hub'.

Driver loads and work some time but at unpredictable time it stops and
starts to flood 'dmesg' output until shutdown (eth) interface.

Machine where I test this is arm64 ACER R13 chromebook.

'dmesg' shows a lot of such messages:

[305186.211284] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.211367] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.211450] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.211533] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.211615] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.211698] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.211781] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.211863] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.211951] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212034] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212117] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212200] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212282] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212365] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212448] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212530] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212613] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212696] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212778] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212861] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.212948] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213032] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213115] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213197] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213280] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213362] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213445] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213528] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213610] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213693] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213776] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213859] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.213941] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
[305186.214028] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11

-- 
Kind regards
