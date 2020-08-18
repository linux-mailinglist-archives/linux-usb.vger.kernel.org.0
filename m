Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0E2248DDF
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 20:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgHRSXA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 14:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHRSW7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 14:22:59 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE086C061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 11:22:58 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id j22so10732132lfm.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5sDdcPMQONYD7K+b7mGP9n9idopP1YYex3xG5YKKLps=;
        b=OglmVawhTyCkjJB3jei6hQqIaicEv/MuVXKvpJO96VRQbkNt0poH5cWlNlaJW9L0ZZ
         Ll/S+9Z2fDiR3zDDUxJR0PSwI9AkIATBB+6t5nrK2aBCPTov3tpmt3C2wsYMTK0ALBxr
         tldlNgSV9uNZTtLWGBuPtUrB1NNfVoaO0hlZCU5NvD087yVD5hsJX9XyDs/yJlaCpkeb
         9EKLiVUbIRgZjM59zGHrRE2ntfZnQLr6TyrfPpfzVzSnysqjA3RioB0uAAf+oyNGJFwG
         lCD3ncf9zKNRrYQTH3u+9QsYPJdk+AcmDrR5rMgn9VceMmozEVSFbosPnwepuChXeO/6
         qWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5sDdcPMQONYD7K+b7mGP9n9idopP1YYex3xG5YKKLps=;
        b=ixuMW6GkSDFkaZIhi3iv3VfVSz+6/JBC3L1JtMjDfLjknGKdu/w7gSQuq/g0gDnh7w
         b4m7H8sAw1Kk4q8ZKs6VGpnY8A2xIOzSgh8glX8O9oesPDB5lZCO5NhlXJCed9SlPKqx
         S+t0VTZMYa7RJSgnDhsZyTsNhxtjuzxpLBmvNkkGXtFM5BBtTpkvFSIJZhZiA3Aw/RC3
         JPiTqvfYXReAnlma5OjiMduv5k5aJ/KAIIemf/B2bgbdl+c8l+NU7dgzfz7TiLB7dOkC
         AGxVrn+4AE7ndemTOYZ9s62vrKiIdkxv7bivkU6WuByUs0TKMVOg206HDaxBJFSbHlts
         zmbQ==
X-Gm-Message-State: AOAM5314ydGUfoLzKTQfLJ3LSGJqVEUPUtb2hVSOnqTVPws0sve+Trgz
        7ulH0SofGIp6SZtvhZJHue0=
X-Google-Smtp-Source: ABdhPJy+XIPE1M4kzrTBGa4BKQeiIqJ3khnbahSL12TIG7kxxYDDE+zR/uEcmNxtJmvApSHvISMZ2g==
X-Received: by 2002:a19:84ce:: with SMTP id g197mr10416584lfd.73.1597774977320;
        Tue, 18 Aug 2020 11:22:57 -0700 (PDT)
Received: from [10.10.0.15] ([185.65.135.177])
        by smtp.googlemail.com with ESMTPSA id u5sm6655224lfi.91.2020.08.18.11.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 11:22:56 -0700 (PDT)
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
 <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
 <20200811193150.GA344152@rowland.harvard.edu>
 <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
 <20200812061451.GE1299081@kroah.com>
 <95be674d-ee98-b904-6856-2f662ac7838f@gmail.com>
 <20200818085502.GB28036@kroah.com>
From:   Patrik Nilsson <nipatriknilsson@gmail.com>
Message-ID: <83a5be3e-9f93-e601-5161-cbb5d1957c5a@gmail.com>
Date:   Tue, 18 Aug 2020 20:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818085502.GB28036@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Thank you for debugging the issue!

Is there a way to set a speed limit to the device? I mean like setting 
the usb-quirks. (i.e. usb-storage.quirks=174c:55aa:u)

Instead of buying a new enclosing for the drive... :(

Best regards,
Patrik

On 18/08/2020 10:55, Greg KH wrote:
> On Sun, Aug 16, 2020 at 05:31:09PM +0200, Patrik Nilsson wrote:
>> [ 7981.203457] perf: interrupt took too long (3133 > 3132), lowering kernel.perf_event_max_sample_rate to 63750
>> [ 8263.612587] usb 2-2: USB disconnect, device number 3
> Your device disconnected itself from the bus, that is an electrical
> thing that the kernel can not control/prevent/change.
>
>> [ 8263.628508] blk_update_request: I/O error, dev sdb, sector 2678161400 op 0x1:(WRITE) flags 0x0 phys_seg 1674 prio class 0
>> [ 8263.628515] Buffer I/O error on dev sdb, logical block 2678161400, lost async page write
>> [ 8263.628519] Buffer I/O error on dev sdb, logical block 2678161401, lost async page write
>> [ 8263.628521] Buffer I/O error on dev sdb, logical block 2678161402, lost async page write
>> [ 8263.628524] Buffer I/O error on dev sdb, logical block 2678161403, lost async page write
>> [ 8263.628526] Buffer I/O error on dev sdb, logical block 2678161404, lost async page write
>> [ 8263.628528] Buffer I/O error on dev sdb, logical block 2678161405, lost async page write
>> [ 8263.628530] Buffer I/O error on dev sdb, logical block 2678161406, lost async page write
>> [ 8263.628533] Buffer I/O error on dev sdb, logical block 2678161407, lost async page write
>> [ 8263.628538] Buffer I/O error on dev sdb, logical block 2678161408, lost async page write
>> [ 8263.628541] Buffer I/O error on dev sdb, logical block 2678161409, lost async page write
>> [ 8263.629271] blk_update_request: I/O error, dev sdb, sector 2678163074 op 0x1:(WRITE) flags 0x4000 phys_seg 2048 prio class 0
>> [ 8263.630073] blk_update_request: I/O error, dev sdb, sector 2678165122 op 0x1:(WRITE) flags 0x0 phys_seg 6 prio class 0
>> [ 8263.630146] blk_update_request: I/O error, dev sdb, sector 2678165128 op 0x1:(WRITE) flags 0x800 phys_seg 112 prio class 0
>> [ 8263.630879] sd 4:0:0:0: [sdb] Synchronizing SCSI cache
>> [ 8263.630912] sd 4:0:0:0: [sdb] Synchronize Cache(10) failed: Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
>> [ 8263.630974] scsi 4:0:0:0: rejecting I/O to dead device
>> [ 8263.630980] blk_update_request: I/O error, dev sdb, sector 2678165240 op 0x1:(WRITE) flags 0x0 phys_seg 104 prio class 0
>> [ 8275.232507] usb 2-2: new SuperSpeed Gen 1 USB device number 10 using xhci_hcd
> And now it came back.
>
> So I really think this device is just sucking up too much power and
> eventually the hub disconnects it (or it disconnects itself by dropping
> the voltage too low) and then adds itself again.
>
> If you write data "slower" to it, it's fine, but by writing 0's to your
> device, it's constantly hammered and that's the hardest thing for a
> flash device to handle (flash starts out at all bits set and then drops
> them as needed to 0, so you are asking for the most work possible to be
> done by the flash chips.)
>
> It might be better to just buy a different disk drive :)
>
> sorry,
>
> greg k-h

-- 
PGP-key fingerprint: 1B30 7F61 AF9E 538A FCD6  2BE7 CED7 B0E4 3BF9 8D6C

