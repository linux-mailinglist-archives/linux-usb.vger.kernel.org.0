Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B15B626AE12
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 21:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgIOTt4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 15:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727836AbgIORKu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 13:10:50 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2DBC06174A
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 09:43:53 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id u21so6072854eja.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=B8SH6MLmw0iR6ZRBGGqcRuOgEmW54TVc6fjjW9Xypw4=;
        b=BKWyqbW6Ao+1oa0b5pHrsZz+tTxcLEQNK9Vx3CKxs7X5Br5pYk++CkAjAQ76Ir0UHh
         BFppzojGYlWuqyrcxN3X4LaKP+tpgwcaCRYjLJZyj5dJ0+jP3Bt+re8AMxr7kd/Ya3jw
         tB7q5xsI0ybu7BN5WrXgAME9EEoENMT+9ll7x8Y7fJ4V7eS+XWvLlL3FBi2+XCSDYyu3
         ydhjSXSgSZi9Do3qzWvo4JUaKV6Y6j4xbU4MLrESKLLEpIRQVhN/c0P6uet0k9AYneiH
         iIilw1756kCBOftzMjum9jYLBbnRWtKZbafnxHF0oHaLnQY1QtfZ26B0ZwR2r/nsHp+J
         Um/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=B8SH6MLmw0iR6ZRBGGqcRuOgEmW54TVc6fjjW9Xypw4=;
        b=uc1r566u2YVH/0tG9semwKKW0Fqhpn4ouKU7XXtQVnKmSbYThHydRHAhv6WsPny12N
         AeljCKXikAb+W4Y2CrimYRty6xCXsbumIkzMTHSq56P6neXKrEbil4VZzXdu3LBDIE/7
         CHD1VPcCHuY2haLVGZicfPLB0rATrZi4I97QZlJJ4N8O4jaBN3lYZ4ME3AVKoAPQwX7v
         cZxF3R92hRiUWUPzRze+C9C5Ut3uFTPS5H7tb1ctHAP7B+9KbzCMNAOJCsjY7uJkC8km
         5+SD5SO8ojDtsxLQWsm2f+imI8/jCmq3KXg6bFzvhtmD8ECZQp5ZC60AnrVTR3U8cqh1
         EGhQ==
X-Gm-Message-State: AOAM5323zr766bEcf9OSHr6eqM3giewBSKqeeZXHhcnbAtAf3SOU/L3J
        IDoiMzw7/kjS80Y6bF/1TNdrJih/B2E=
X-Google-Smtp-Source: ABdhPJzB0DJFM1ozMTQu+8dr0qDPQ/hMAGyxc7PAJni+fgXQoTNTbGzuX2lN5wjYrpzFpYcTDWvBhQ==
X-Received: by 2002:a17:906:56c2:: with SMTP id an2mr21437960ejc.118.1600188231609;
        Tue, 15 Sep 2020 09:43:51 -0700 (PDT)
Received: from [10.10.0.12] ([141.98.255.147])
        by smtp.googlemail.com with ESMTPSA id dm22sm12244937edb.49.2020.09.15.09.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 09:43:50 -0700 (PDT)
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
 <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
 <20200811193150.GA344152@rowland.harvard.edu>
 <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
 <20200812061451.GE1299081@kroah.com>
 <95be674d-ee98-b904-6856-2f662ac7838f@gmail.com>
 <20200818085502.GB28036@kroah.com>
 <83a5be3e-9f93-e601-5161-cbb5d1957c5a@gmail.com>
 <20200818183420.GB152667@rowland.harvard.edu>
From:   Patrik Nilsson <nipatriknilsson@gmail.com>
Message-ID: <0975cb43-5520-543c-987c-57de5e7b258b@gmail.com>
Date:   Tue, 15 Sep 2020 18:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818183420.GB152667@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Unfortunately the options you suggested didn't help.

The patch below works and is tested with Ubuntu kernel 5.4.0.47.50.

I have stress tested the usb system. To the USB is now seven mechanical 
hard disks and two ssd disks connected. Six processes are at the same 
time writing random data to the disks. One of them is to the ssd disk I 
couldn't write data to before without it failed. Also the other usb-ssd 
disk is my root partition.

Before I applied the patch, my root partition sometimes failed to be 
kept mounted. Now I have not had any crashes.

This is a quick fix for hard disks, but working. It continued to work 
when I started three virtualbox guests and let them also do work. The 
guests' hard disks is on my usb-root partition.

It doesn't work if I also use my usb2ethernet adapter (ID 2001:4a00 
D-Link Corp.), although my root partition and two randomize tests 
survived. Maybe a much larger timeout in this case will help? But this I 
don't find as a good solution.

The behavior is the same on the other (much slower) computer with a 
different usb hub. I have also tested it with exactly the same setup as 
earlier, with no mechanical hard disks, and it works with the patch and 
not without it.

Any suggestion on how to solve this? In a good way.

Best regards,
Patrik

---start of diff---
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5b768b80d1ee..3c550934815c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -105,7 +105,7 @@ MODULE_PARM_DESC(use_both_schemes,
  DECLARE_RWSEM(ehci_cf_port_reset_rwsem);
  EXPORT_SYMBOL_GPL(ehci_cf_port_reset_rwsem);

-#define HUB_DEBOUNCE_TIMEOUT    2000
+#define HUB_DEBOUNCE_TIMEOUT    10000
  #define HUB_DEBOUNCE_STEP      25
  #define HUB_DEBOUNCE_STABLE     100

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 20c555db4621..e64d441bb78f 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1841,8 +1841,8 @@ extern int usb_set_configuration(struct usb_device 
*dev, int configuration);
   * USB identifies 5 second timeouts, maybe more in a few cases, and a few
   * slow devices (like some MGE Ellipse UPSes) actually push that limit.
   */
-#define USB_CTRL_GET_TIMEOUT    5000
-#define USB_CTRL_SET_TIMEOUT    5000
+#define USB_CTRL_GET_TIMEOUT    10000
+#define USB_CTRL_SET_TIMEOUT    10000


  /**
---end of diff---


On 18/08/2020 20:34, Alan Stern wrote:
> On Tue, Aug 18, 2020 at 08:22:55PM +0200, Patrik Nilsson wrote:
>> Hi Greg,
>>
>> Thank you for debugging the issue!
>>
>> Is there a way to set a speed limit to the device? I mean like setting the
>> usb-quirks. (i.e. usb-storage.quirks=174c:55aa:u)
>>
>> Instead of buying a new enclosing for the drive... :(
> You can try setting usb-storage.quirks=174c:55aa:g or :m.  They will
> slow down the data transfer rates.  The :g flag is used by the uas
> driver and the :m flag is used by usb-storage.
>
> Alan Stern

-- 
PGP-key fingerprint: 1B30 7F61 AF9E 538A FCD6  2BE7 CED7 B0E4 3BF9 8D6C

