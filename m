Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A34A7358F
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 19:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbfGXR3v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 13:29:51 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:39369 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbfGXR3v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jul 2019 13:29:51 -0400
Received: by mail-pf1-f182.google.com with SMTP id f17so17294371pfn.6
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2019 10:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JN6xUChR3NM4dbajg98cbBd6z0Z7Rk/Cv+K4uTJPwHQ=;
        b=UsqijC8m8sIWMdlPI4BMedVlLjzYXRPIkwINwH8MuG5oGt03FPmCSMG4OG2koFza3V
         uOSDFTz9/R/qr27Xe/cqlRg/qHObk54DnBOBFnacbQSuworbf2CVeGCdeyeOO11+wOxU
         O+MUYmxKb9AeGDOLZE9HRQXbQ7ev03JYjS4Cz1TOzGgz1a/HwBhI3fINU0POh7XQEWRk
         ytoJM2xIKWhC7bpHXIiHiy0f32fJKdcFqq+em75Q8j6Mb0opWnViYhQwRpMytBRVP6zd
         dJIIoCSarw6Tq7tfkC4iiNkF0Ze35O+i6g6ASST7nybhjKWYzCBaEJ0zFCvNUNqpcJSL
         Nv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JN6xUChR3NM4dbajg98cbBd6z0Z7Rk/Cv+K4uTJPwHQ=;
        b=OF/40G00Hfhh2xYvO3eijtL164jhMSP3LZFXIae1XWFPhASB0wEl5SPiTam+au1GxV
         tFFXcqvXyJlfzfqSxKQGQuKC1Fj2CxMzgVqpi4a8M2EMJpeutIBmOFLmMZoblmXe6f0Q
         RDpCV3GtpaRplb/mKWUt+ZERHIlOuU/dsEsDWyv25OarwJp21/ADTWW2p9HB3N/UoQ1d
         y7ms6DOpFPD4ddVtmGoMuXECPYQaSzoSrBiHcFZBwGHjAiN/VCpE9jIUFSuvImaWdM5e
         8SpcUML0IlVT2MWN+jI4XWctGqIjluK+GjmXe2R0XoLHpO1Uw0O2Cs5jQhAzcPwNgno/
         p2HA==
X-Gm-Message-State: APjAAAXHb7hS0BxmLygXi+r468lEYzwwZgRL8j1cI0UYe1VtTuYyZ4Qx
        INEQTX3JyYlJv0UIaILuXIc=
X-Google-Smtp-Source: APXvYqyaQKMv2YDllhqiOTluBMaxR/tLioK0bqOLwgzC7JS/xWEC8cOdQUH5LevlfCDx+2u4qhgmGg==
X-Received: by 2002:a17:90a:5887:: with SMTP id j7mr87685350pji.136.1563988934697;
        Wed, 24 Jul 2019 10:22:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m9sm85017614pgr.24.2019.07.24.10.22.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 10:22:13 -0700 (PDT)
Subject: Re: lk5.1.18: tcpm: another NULL pointer deref
To:     dgilbert@interlog.com
Cc:     USB list <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <72587ca6-ccba-2c70-ee01-8666e0e4c506@interlog.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7689f34b-9f2e-82dc-a6a6-229f16cc0d92@roeck-us.net>
Date:   Wed, 24 Jul 2019 10:22:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <72587ca6-ccba-2c70-ee01-8666e0e4c506@interlog.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/24/19 9:51 AM, Douglas Gilbert wrote:
> Hi,
> Same hardware setup as last time*** (NXP OM13588 + SAMA5D2_Xplained +
> lk 5.1.18) but not sure exactly how it was triggered. I was using the
> NXP test monitor (NXP software) with another OM13588+KL27Z at the other
> end of the USB Type C cable (it is also a PD DRP). When I looked back
> at the Linux debug window I saw this:
> 
> [36749.300000] Unable to handle kernel NULL pointer dereference at virtual address 000001f0
> [36749.310000] pgd = 41dad9a1
> [36749.310000] [000001f0] *pgd=00000000
> [36749.320000] Internal error: Oops: 5 [#1] THUMB2
> [36749.320000] Modules linked in: tcpci tcpm
> [36749.320000] CPU: 0 PID: 2338 Comm: kworker/u2:0 Not tainted 5.1.18-sama5-armv7-r2 #6
> [36749.320000] Hardware name: Atmel SAMA5
> [36749.320000] Workqueue: 2-0050 tcpm_pd_rx_handler [tcpm]
> [36749.320000] PC is at typec_altmode_attention+0x0/0x14
> [36749.320000] LR is at tcpm_pd_rx_handler+0xa3b/0xda0 [tcpm]

In tcpm_pd_svdm():
	adev = typec_match_altmode(...);
	...
	typec_altmode_attention(adev, p[1]);

typec_match_altmode() can return NULL. The calling code doesn't check
the returned pointer. I suspect that typec_match_altmode() returns NULL,
causing the crash.

Heikki, can this happen ? What would be the proper fix ?

Guenter

> [36749.320000] pc : [<c03fbee8>]    lr : [<bf8030fb>]    psr: 60030033
> [36749.320000] sp : df4a9e48  ip : 00000020  fp : 00000002
> [36749.320000] r10: 00000006  r9 : 00000000  r8 : 00000001
> [36749.320000] r7 : deee6044  r6 : c0907008  r5 : dd4a7900  r4 : deee6040
> [36749.320000] r3 : 00000001  r2 : 00001fc9  r1 : c0128525  r0 : 00000000
> [36749.320000] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb  Segment none
> [36749.320000] Control: 50c53c7d  Table: 3c5cc059  DAC: 00000051
> [36749.320000] Process kworker/u2:0 (pid: 2338, stack limit = 0x64d0912d)
> [36749.320000] Stack: (0xdf4a9e48 to 0xdf4aa000)
> [36749.320000] 9e40:                   00000006 00000001 ffb3b4c1 ffffffff c090e6c0 c090e6c0
> [36749.320000] 9e60: c090e6c0 c060373c c060373c 00000000 dd4a7916 c090e6c0 00000000 df730f00
> [36749.320000] 9e80: 1fc98106 c0128525 c090e6c0 df59a040 400e0013 df4a9ea0 df59a040 00000000
> [36749.320000] 9ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c094e650
> [36749.320000] 9ec0: df4a9f08 c012a647 c01031e9 c090ab8c 00000000 c0124f95 ffffffff 00000000
> [36749.320000] 9ee0: dc637580 c090e6c0 0bd6fbbc df747500 dc637580 c090e6c0 df4a9f08 968fe74d
> [36749.320000] 9f00: deea6e00 dd4a7900 ded05180 deedd100 80000000 df406000 dd4a7904 00000000
> [36749.320000] 9f20: 00000000 c012082b df406000 df406000 df4a9f48 ded05180 df406000 ded05194
> [36749.320000] 9f40: 50000000 c09132a0 df406014 df4a8000 df406000 c0120a6d dc5a1100 00000000
> [36749.320000] 9f60: df4a9f78 dc5a1080 dc5a1100 00000000 df4a8000 ded05180 c01209b1 df7c1eb0
> [36749.320000] 9f80: dc5a1098 c012431f ffffffff dc5a1100 c0124251 00000000 00000000 00000000
> [36749.320000] 9fa0: 00000000 00000000 00000000 c01010f9 00000000 00000000 00000000 00000000
> [36749.320000] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [36749.320000] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [36749.320000] [<c03fbee8>] (typec_altmode_attention) from [<bf8030fb>] (tcpm_pd_rx_handler+0xa3b/0xda0 [tcpm])
> [36749.320000] [<bf8030fb>] (tcpm_pd_rx_handler [tcpm]) from [<c012082b>] (process_one_work+0x123/0x2a8)
> [36749.320000] [<c012082b>] (process_one_work) from [<c0120a6d>] (worker_thread+0xbd/0x3b0)
> [36749.320000] [<c0120a6d>] (worker_thread) from [<c012431f>] (kthread+0xcf/0xf4)
> [36749.320000] [<c012431f>] (kthread) from [<c01010f9>] (ret_from_fork+0x11/0x38)
> [36749.320000] Exception stack(0xdf4a9fb0 to 0xdf4a9ff8)
> [36749.320000] 9fa0:                                     00000000 00000000 00000000 00000000
> [36749.320000] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [36749.320000] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [36749.320000] Code: f76d bbae 4770 bf00 (f8d0) 01f0
> [36749.590000] ---[ end trace ee6ff121ba861a9f ]---
> 
> Oops also attached.
> 
> Doug Gilbert
> 
> 
> *** Email: "Re: 5.1.18 oops: echo source > /sys/class/typec/port0/preferred_role"

