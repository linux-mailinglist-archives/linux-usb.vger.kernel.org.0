Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3E982319D
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 12:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732015AbfETKrj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 06:47:39 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:51437 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731483AbfETKri (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 06:47:38 -0400
Received: by mail-wm1-f53.google.com with SMTP id c77so11280368wmd.1
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2019 03:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=35aFXwKXWIL1RZrD7exPIwV+uXvt30SdrGN8tEgn2UM=;
        b=JjdjAMMTqp9jQcBQ5BK79hWPx2L2sLVpepM5BT2oHfoTELCbS/1cq58zwBPSv2TS4D
         8XcfgvSrc4BNTlL3KQe+PBRj85yPnTYxuwdh+w4duG5cnx1jZiv1kwM/KAQa7wdggRmq
         9WyW7D93EidNQYtXG1P75alN486fH2b2RTM6ojMieUH40yjvPsxIHrqHMBm1FqRFnNq2
         fxO8IPW977KgOFKTK9ov0tNyoKKAyOCf6QBmTP0IvpuQcbMncfcziL6ktCRWUHfoVTSO
         UEidMwN5vfAtH2QQLDEX9XFlyj2OYUmj4tpyDu6rNoQqCbi97s2T98eCkDKrdLDkO0Ln
         FjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=35aFXwKXWIL1RZrD7exPIwV+uXvt30SdrGN8tEgn2UM=;
        b=rUnmwxgNjOSLdYx8RBFHECVlYVA2jlF1M1M/+VpkVAZSXGSKn14om58/SJu7kF/8Fk
         f4Nc/mHKPJTzPqOum1u2Gy4jFB3jXqzxjl3mCD0UCpfZCuaxBQl51Di5aK+/TyuNgLJX
         T2q/s5SJoSUAwRuK/GXfMhvjBqFLWD5UEAbWH2fLnPKwON6p0/nccBgkaX+fDnDVt9m5
         7XyZHuGA78GbW/P6lUFibrcMq75IGv80SSNh7rM20xHLirNTkXBmIgEBhi5OLvWY5F8l
         vxNNHsD8+KfvxwMxr9qYWH/WB58xC/l9a50lzUyokQa/xkRNunW+YAfp1UDQC9BSsvcY
         36Jw==
X-Gm-Message-State: APjAAAVGRD1ZsH41pPotKQakJWlrQnH9b4TICIMygGlpyrrsCP/f8152
        IoSIIEavDgQm99MSXLUcthrO3zzX
X-Google-Smtp-Source: APXvYqyNsLncCDEDEQF/SrPeEU62nmShrKt4VzmEJoVe5tZwWx6BlZKcMa0yTg5t4Wzo5qK3dhNa3A==
X-Received: by 2002:a1c:7d04:: with SMTP id y4mr39438952wmc.123.1558349256762;
        Mon, 20 May 2019 03:47:36 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id b12sm20706011wmg.27.2019.05.20.03.47.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 03:47:35 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Re: Kernel crash with FTDI FT232R on AMD boards.
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <11678333-2e1a-8c0f-109f-a1aefa54ef9a@gmail.com>
 <20190516135612.GA28564@localhost>
 <0d499fe2-80df-cd6d-17a2-7725df240ee8@linux.intel.com>
Message-ID: <c5d97281-e9c2-657f-f617-72af8c5da06b@gmail.com>
Date:   Mon, 20 May 2019 12:45:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0d499fe2-80df-cd6d-17a2-7725df240ee8@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 16.5.2019 v 16:34 Mathias Nyman napsal(a):
> To get xhci traces and logs please do:
>
> mount -t debugfs none /sys/kernel/debug
I get message:
mount: /sys/kernel/debug: none already mounted or mount point busy.

> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> < read EEPROM using the usb serial converter >
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace 

I made all as you wrote, but problem is, that the system completely 
freezes and I must power it off.
After power up there is not any logs (header only) in 
/sys/kernel/debug/tracing/trace.
dmesg created before eeprom reading: https://paste.ee/p/xb16H

starosta
