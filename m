Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB422DC8D8
	for <lists+linux-usb@lfdr.de>; Wed, 16 Dec 2020 23:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgLPWPx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Dec 2020 17:15:53 -0500
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net ([184.168.200.145]:60182
        "EHLO p3nlsmtpcp01-04.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727802AbgLPWPx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Dec 2020 17:15:53 -0500
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
        by : HOSTING RELAY : with ESMTP
        id pf3jkxw7qFpAepf3jkExxg; Wed, 16 Dec 2020 15:14:11 -0700
X-CMAE-Analysis: v=2.4 cv=aJs1FZxm c=1 sm=1 tr=0 ts=5fda86b3
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=eVCM4l/7qPqOXLB+rmEgmw==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=zTNgK-yGK50A:10
 a=JV2DFJz90kiXNa-k9IUA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from pool-173-63-55-86.nwrknj.fios.verizon.net ([173.63.55.86]:47582 helo=[192.168.62.65])
        by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <22t@tripolho.com>)
        id 1kpf3j-009mYD-O3; Wed, 16 Dec 2020 15:14:11 -0700
Subject: Re: kernel locks due to USB I/O
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20201111155130.GB237113@rowland.harvard.edu>
 <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
 <20201116170625.GC436089@rowland.harvard.edu>
 <1e58c6f4-c651-b45a-b0fc-7bee40fe61cb@tripolho.com>
 <20201119172250.GC576844@rowland.harvard.edu>
 <0125b936-46b9-0fb8-3fe2-63d1563a1e17@tripolho.com>
 <20201119200147.GB582614@rowland.harvard.edu>
 <4f8f545e-4846-45e0-b8f8-5c73876b150a@tripolho.com>
 <20201119225144.GA590990@rowland.harvard.edu>
 <3df90f9d-0af2-2aaa-9853-966f99e961a4@tripolho.com>
 <20201214171815.GA153671@rowland.harvard.edu>
From:   Alberto Sentieri <22t@tripolho.com>
Message-ID: <55bce71d-4282-2bff-009e-aea139e53315@tripolho.com>
Date:   Wed, 16 Dec 2020 17:14:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214171815.GA153671@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl0564.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tripolho.com
X-Get-Message-Sender-Via: p3plcpnl0564.prod.phx3.secureserver.net: authenticated_id: a1@tripolho.com
X-Authenticated-Sender: p3plcpnl0564.prod.phx3.secureserver.net: a1@tripolho.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4xfG1T9WlDmaCwKUGNWckF0CSp2j0SApE18hriuAjAedhqTuHZxjpmYb67WBsJqoa5L+aDxzInGFQ/rZzD/ukBFG8vOqxeFLrUbQA7iPvXCQELLKt1Yk+f
 ITBcOt4JpdOZnJTSAyA8c7f51vl02xXpV0tdy7LAlr5v3Q6XL0xoJMCnsa844MJbN9lmcK5wiJzeUbcPjdai4+WGVpbPXl2gXY3FM56pjU6ZrQkwna/4bUG/
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is just a quick status update. I am just checking if it rings any 
bell. I am still doing more tests.

The machine where all these problems are happening is a HP Z4 G4, as 
well as the other two in production. Until this morning it had BIOS 
v01.76 dated 04/22/2019. Today I update the BIOS to v02.63 dated 10/28/2020.

After updating the BIOS, the behavior definitively changed. Now both 
kernels (5.4.0-53-generic and 5.9.8) reboot unexpectedly instead of 
locking. After re-enabling the console, expecting to capture something, 
I could not see a lock or reboot. However the serial console, after 
displaying the whole boot, locked, and I cannot use it to login.

Alberto Sentieri

On 12/14/20 12:18 PM, Alan Stern wrote:
> We'll have to wait and see what the tests and debugging tools reveal.
> As for the comment about the hardware being reliable -- in fact, you
> can't be certain of this.  It may be that your test is stressing the
> hardware in a way that it never experienced during the prior six
> months.
>
> Alan Stern
