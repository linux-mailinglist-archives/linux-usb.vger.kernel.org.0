Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44A6712BB9A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2019 23:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfL0WaR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Dec 2019 17:30:17 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37069 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfL0WaR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Dec 2019 17:30:17 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so5497739pjb.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Dec 2019 14:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZyneZl/G+ai0/NpoiLmhjrVLR8OnaQHKtfkH0OWX5U8=;
        b=X6cQSfn7BnQZw89iIkZaGJ6ELj5kL14xvokkxsiEIGn509z9vIZQXmlWZ+wV3y0mr1
         +fkP6bwtBO0Dl/8f1fVGtA/syFo6U1nVb9fg0c4chQXjaayQ50jOnbQeT5/9/CP0S1Ni
         dafJrQlSi8DRLP6rPABpjQUmIQMrkxFOiG9yiqLsF6DobUJI8bVtq2lsMY0VfF/6Os4t
         agW/eHHKFyW0KzfilQBcCVU6ZlSiDwHKrB/g4DpYneZ+SW9L4GTmcG/wSqua+uLUP8FL
         IDFb/u2m+7ODWTB2aKQDVKthGUB8GvIUcStOE87aYOEUvZtP4H6va49EQ5nFYDdapVcg
         55JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZyneZl/G+ai0/NpoiLmhjrVLR8OnaQHKtfkH0OWX5U8=;
        b=aedjKy/i5rCRreF3ezGEKh3FQq2oBga9h+OxWCKI7DwHb8+b1Ey7fu8De64Kin/0fv
         sZgaSzxOkaRIaGlVeefOchYIihzDI+C0axoUV3K74YDPCDq1TDAaz4C/UP7JAQfLyMR8
         V5Oa1HjfllRB2813nSr4IjtSLmOZ/fcJwR9+5//6g1HBwUmt+0P+t7E7NJzPxLaCP9JE
         Q5VvUCfY9N5yHFZaDW6d9EGkjzzCacQkS/K7xR3cEIsdA4krY7WRXAubVehU3hp1bEon
         QTGsALhlwP/kXtWP8oWCm99qIta7gYCC3DtYlp46O9brar0DzNwP5AdGsvD1tOM9T0oo
         zsmw==
X-Gm-Message-State: APjAAAVKAhcF4jiGJpyPIopYBcVjk2Gt3TRl0WPa75Yrgg0IZkTyHglf
        m2igAdVEFSE7HW98x05w4ifeRGeD
X-Google-Smtp-Source: APXvYqyB+BvuNUH9HXBAgO8h87YldYOBe64wJvbZvpOBrYJI2jCOEoUKQrXgrGiGyxHytH5Ajt0q7A==
X-Received: by 2002:a17:90a:2201:: with SMTP id c1mr28590394pje.31.1577485816915;
        Fri, 27 Dec 2019 14:30:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e25sm38294261pge.64.2019.12.27.14.30.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Dec 2019 14:30:15 -0800 (PST)
Date:   Fri, 27 Dec 2019 14:30:14 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Douglas Gilbert <dgilbert@interlog.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb-c pd: PD_MAX_PAYLOAD too small
Message-ID: <20191227223014.GA29215@roeck-us.net>
References: <f000d0e7-eb7f-5df6-ee2b-188e68f0baa9@interlog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f000d0e7-eb7f-5df6-ee2b-188e68f0baa9@interlog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 27, 2019 at 12:18:11PM -0500, Douglas Gilbert wrote:
> Samsung have an optional USB-C charger for their 10+
> tablet ***. This optional unit is one of the first PPS
> capable PD power adapters on the mass market at a
> reasonable price (around $50). Its part number is
> EP-TA485 and is described as a 45 Watt "Travel Adapter".
> 
> I have a rig using an Acme Arietta and a NXP OM 13588 board
> which can do USB-C sink/source. And the EP-TA485 is plugged
> into the OM 13588 which pushes that latter into (power)
> sink mode.
> 
> From 'cat /sys/kernel/debug/usb/tcpm-1-0050' that adapter
> advertises these PDOs (and PDO[4] implies at 11 Volts it
> can supply 5 Amps which is worrying for a 45 Watt supply):
> 
> [   19.207338]  PDO 0: type 0, 5000 mV, 3000 mA [E]
> [   19.207361]  PDO 1: type 0, 9000 mV, 3000 mA []
> [   19.207383]  PDO 2: type 0, 15000 mV, 3000 mA []
> [   19.207428]  PDO 3: type 0, 20000 mV, 2250 mA []
> [   19.207448]  PDO 4: type 3, 3300-11000 mV, 5000 mA
> [   19.207466]  PDO 5: type 3, 3300-16000 mV, 3000 mA
> [   19.207484]  PDO 6: type 3, 3300-21000 mV, 2250 mA
> 
> And whenever drivers/usb/typec/tcpm/tcpci.c fetches those
> PDOs, it fires this warning at line 443 (lk 5.4.6):
> 
>            if (WARN_ON(cnt > sizeof(msg.payload)))

Thanks a lot for the report.

The question here is if cnt includes the header bytes, which would
make it too large for the check if there are indeed 7 PDOs.
I'll have to check in the specification after I am back from vacation
(early January).

Thanks,
Guenter

> 
> And that implies in include/linux/usb/pd.h
> 
> struct pd_message {
>         __le16 header;
>         union {
>                 __le32 payload[PD_MAX_PAYLOAD];
>                 struct pd_chunked_ext_message_data ext_msg;
>         };
> } __packed;
> 
> ... that PD_MAX_PAYLOAD is too small (or off by one). It is 7
> in lk 5.4.6 and linux-stable.
> 
> Doug Gilbert
> 
> 
> *** When 10+ tablet is purchased it comes with a less capable
>     (i.e. no PPS) 35 Watt adapter (I believe). Samsung say if
>     the owner wants "fast" charging to buy the EP-TA485.
>     If PPS catches one, it will effectively move power
>     electronics from the smartphone or tablet into the
>     power adapter. And that could be a win for laptops as well.
> 
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1154 at drivers/usb/typec/tcpm/tcpci.c:443
> tcpci_irq+0x1b4/0x1e0 [tcpci]
> Modules linked in: tcpci tcpm roles typec asix usbnet mii
> CPU: 0 PID: 1154 Comm: irq/37-1-0050 Tainted: G        W         5.4.6-armv5-r0 #1
> Hardware name: Atmel AT91SAM9
> [<c000f9b4>] (unwind_backtrace) from [<c000d7e0>] (show_stack+0x10/0x14)
> [<c000d7e0>] (show_stack) from [<c00188b8>] (__warn+0xac/0xd0)
> [<c00188b8>] (__warn) from [<c0018984>] (warn_slowpath_fmt+0xa8/0xb8)
> [<c0018984>] (warn_slowpath_fmt) from [<bf053398>] (tcpci_irq+0x1b4/0x1e0 [tcpci])
> [<bf053398>] (tcpci_irq [tcpci]) from [<c0050e78>] (irq_thread_fn+0x1c/0x78)
> [<c0050e78>] (irq_thread_fn) from [<c00510f0>] (irq_thread+0x104/0x1ec)
> [<c00510f0>] (irq_thread) from [<c0034460>] (kthread+0x11c/0x130)
> [<c0034460>] (kthread) from [<c00090e0>] (ret_from_fork+0x14/0x34)
> Exception stack(0xc55dffb0 to 0xc55dfff8)
> ffa0:                                     00000000 00000000 00000000 00000000
> ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace 2ab4ab025e97eabd ]---
> 
> 
> Finally:
> From other (non-Linux) equipment I can tell that the EP-TA485 adapter is
> only advertising 7 PDOs, so there is no 8th PDO being truncated in Linux.
