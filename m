Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 547AC17948E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 17:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbgCDQKM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 11:10:12 -0500
Received: from mail-lj1-f170.google.com ([209.85.208.170]:33095 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgCDQKM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 11:10:12 -0500
Received: by mail-lj1-f170.google.com with SMTP id f13so2661608ljp.0;
        Wed, 04 Mar 2020 08:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=muR/a1rwNRfnpNPUEP6bKf6C4WkMfc6xHbPZajvJGVk=;
        b=QfqOc5yS6VcamnHOpXUgAizj6Ssgsyc62WMVgt3y0uM93P2/dMse53MwUZ0VbiG0IE
         +FcKCaG/Agp+zIHHdVWESQAfCoxK0FRnmBal2iCsZcFLy23Rv3UtEvYoOEMS929J5r1V
         ZjUKTcvUzGkOCr4mmvA72DCghTvIeMkhCdsLK19ynhJZb54ToGriCnJCg6ZkDoklod0T
         Qx2IhA7Wpoau8II6v0SqLLApkctxX4kpAEYP5i5J30T6xhXJffMrFNo/caCLuS2AKpUB
         pk+A1GaNC7CIIRTS4AL4Cuo42u6rpXQRNbBhtWpH8BZIbOq9BZvLn6IRQYVmCotMkwIR
         j8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=muR/a1rwNRfnpNPUEP6bKf6C4WkMfc6xHbPZajvJGVk=;
        b=f8lK/sHOzd3Kb+elxnWs0QH4TCfNtVOsGOvJo3V8BgMQ4uqknxB6ZA7TJrgB1JS3Pf
         Xo2ybRxUlwYt9nyfFh8EAnVaK2C4T/zgCy1uxMUWfeeQbDLYhq5UHz7YskDG997jdpvl
         xaJMjXhaW9CzaapcxGMeElRwRM05CJnRvCtdKhEYY/IkJ8DLJZ3h6UR3knOwPCIVZNz8
         wdQeAt5D6UQ0m6VhplBerhe39+rb9N1g9rRBOGKwl33vSZ4lBFeJ96cNE8zjeBUmiehx
         ExB6E9RIC7Z9/Iz5Kb05IlPmnUesbCPRFSVT+Oxozwc8nzPEDmF7J5Le6pMgTqgIbObo
         7QXQ==
X-Gm-Message-State: ANhLgQ3wylzdC+LtYLeCIGG3zPZ3f0VjDLerSJGmU4jPfzB/hOjiayhi
        4R+vLhBhffmTdEJCOn7wwR7FDZoH
X-Google-Smtp-Source: ADFU+vtw56gSWqgMCehzJJ+VSKjMpRPUI7NiAy2Ic7jhj3aGlWpmYyVGyvnmMpZN4H7YUq4RUmsFYQ==
X-Received: by 2002:a2e:9182:: with SMTP id f2mr2409633ljg.110.1583338209685;
        Wed, 04 Mar 2020 08:10:09 -0800 (PST)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id i5sm14652912ljj.29.2020.03.04.08.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 08:10:09 -0800 (PST)
To:     Peter Chen <Peter.Chen@nxp.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Subject: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Message-ID: <bfa5b2f7-cf52-0055-ffb2-2cb8278a1181@gmail.com>
Date:   Wed, 4 Mar 2020 19:10:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I was trying out today's linux-next-20200304 and noticed this splat in KMSG:

[    1.161244] BUG: sleeping function called from invalid context at
drivers/base/power/runtime.c:1075
[    1.161393] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid:
37, name: kworker/u8:1
[    1.161481] CPU: 1 PID: 37 Comm: kworker/u8:1 Not tainted
5.6.0-rc4-next-20200304-00181-gbebfd2a5be98 #1588
[    1.161616] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    1.161769] Workqueue: ci_otg ci_otg_work
[    1.161882] [<c010e8bd>] (unwind_backtrace) from [<c010a315>]
(show_stack+0x11/0x14)
[    1.162035] [<c010a315>] (show_stack) from [<c0987d29>]
(dump_stack+0x85/0x94)
[    1.162132] [<c0987d29>] (dump_stack) from [<c013e77f>]
(___might_sleep+0xeb/0x118)
[    1.162281] [<c013e77f>] (___might_sleep) from [<c052fa1d>]
(__pm_runtime_resume+0x75/0x78)
[    1.162427] [<c052fa1d>] (__pm_runtime_resume) from [<c0627a33>]
(ci_udc_pullup+0x23/0x74)
[    1.162575] [<c0627a33>] (ci_udc_pullup) from [<c062fb93>]
(usb_gadget_connect+0x2b/0xcc)
[    1.162665] [<c062fb93>] (usb_gadget_connect) from [<c062769d>]
(ci_hdrc_gadget_connect+0x59/0x104)
[    1.162807] [<c062769d>] (ci_hdrc_gadget_connect) from [<c062778b>]
(ci_udc_vbus_session+0x43/0x48)
[    1.162949] [<c062778b>] (ci_udc_vbus_session) from [<c062f997>]
(usb_gadget_vbus_connect+0x17/0x9c)
[    1.163089] [<c062f997>] (usb_gadget_vbus_connect) from [<c062634d>]
(ci_otg_work+0xbd/0x128)
[    1.163245] [<c062634d>] (ci_otg_work) from [<c0134719>]
(process_one_work+0x149/0x404)
[    1.163335] [<c0134719>] (process_one_work) from [<c0134acb>]
(worker_thread+0xf7/0x3bc)
[    1.163479] [<c0134acb>] (worker_thread) from [<c0139433>]
(kthread+0xf3/0x118)
[    1.163621] [<c0139433>] (kthread) from [<c01010bd>]
(ret_from_fork+0x11/0x34)

I haven't tried to figure out what change causes this problem, it didn't
happen using next-20200218. Please take a look, thanks in advance.
