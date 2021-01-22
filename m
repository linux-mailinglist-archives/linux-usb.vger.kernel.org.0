Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F952FFDF7
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 09:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbhAVINo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 03:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbhAVINm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jan 2021 03:13:42 -0500
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87228C0613D6
        for <linux-usb@vger.kernel.org>; Fri, 22 Jan 2021 00:12:47 -0800 (PST)
Received: from [195.4.92.119] (helo=sub0.freenet.de)
        by mout1.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l2rSc-0008SC-JL
        for linux-usb@vger.kernel.org; Fri, 22 Jan 2021 09:06:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7Le3bgy8fK+Wceq1PyBKMI2IPAr+h4eTPN/iAS5dBK0=; b=SSXV8hbFa9md218r6LJhJXVKbz
        djcN/nps5j2FCkYZW3FXiR8xw4e2BUKWnw8OwlzmRZkIre3F6DnJ5M/2wL6zwtz8RIYR1Oddyt0xp
        CttbboPDHGKB09FpSfh8IkJl8aFgzTmRDJlQzSK2AF4JJW8IqPw62BTvQm21EvGL0GdFauuQASsuC
        5NNfPN6TYWNofVxgB4sZj1AB1btqUm1veGC2g1t4aEZeRK28+uOjYaxpws+7KAmdDSUW+ow3RVdMR
        U2IbEOzlC/VPO8LHJZU06aYuLTs6JT//45DuwgaOAkWcH12zM8pbuAC6/MDcY5wNBpKZKjPwP+/2i
        43e+Ws6g==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:41854 helo=mail.maya.org)
        by sub0.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l2rSc-0006M9-Gt
        for linux-usb@vger.kernel.org; Fri, 22 Jan 2021 09:06:26 +0100
Received: internal info suppressed
From:   Andreas Hartmann <andihartmann@01019freenet.de>
To:     linux-usb@vger.kernel.org
Subject: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN Wrong
 bounce buffer write length: 0 != 512
Message-ID: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
Date:   Fri, 22 Jan 2021 09:06:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!41854
X-FNSign: v=2 s=058E85E835C9DB31E4A52F08038E3A3A78AEDBC000230AB4E8EB9B4328812318
X-Scan-TS: Fri, 22 Jan 2021 09:06:26 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hello!

Since a new Notebook, which sadly only provides USB 3 interfaces, I have a more or 
less big problem with an old driver (rt5572sta), which not just sometimes produces 
those warn messages, but even stalls sometimes after those warn messages (e,g, 
Kernel 5.3.x or 5.10.x or 5.8.x) - see attached log file.

The driver uses the bulk method to communicate with the USB bus. By reducing the 
max. bulk size from 24 kByte to 12 kByte, I was able to massively reduce those 
warning messages and now, the USB bus even seldom stalls any more.

I achieved this by changing the building of the bulk package from

if (((ThisBulkSize&0xffff8000) != 0) || ((ThisBulkSize&0x6000) == 0x6000))

to

if (((ThisBulkSize&0xffff8000) != 0) || ((ThisBulkSize&0x3000) == 0x3000))


I can see this problem on two different AMD USB 3 controller, e.g. X370 Series 
Chipset USB 3.1 xHCI Controller [1022:43b9] (rev 02).

I'm wondering how to solve this problem? But mostly I'm wondering, why a USB 2 
device is handled by USB 3 code, expecting to follow USB 3 rules at all? Is it 
possible to bind the driver to the USB 2 code path?

At the moment I think, that the attempt to "transfer" a valid USB 2 package to a 
valid USB 3 package by xhci_hcd seems not always to be transparent to the driver 
producing and controlling its send packets. Could it be possible, that there are 
some situations, where the driver can't check the package after manipulation 
through xhci_hcd any more? Please see the attached log file.

Or how should I fix the driver to be USB 3 ready? Please take into account, that 
I'm not an USB protocol specialist and I don't know, at which level or how to 
build a valid bulk packet which confirms to USB3 rules.

At the time being, I'm debugging on base of the pretty loud debug messages of the 
rt5572sta driver and the xhci_hcd debug messages (echo "module xhci_hcd =pf" > 
/sys/kernel/debug/dynamic_debug/control)


Thanks for any idea how to proceed!
Andreas Hartmann
