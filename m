Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10E6CA2609
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 20:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbfH2Sd4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 14:33:56 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:45823 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728694AbfH2Sdv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Aug 2019 14:33:51 -0400
Received: by mail-wr1-f41.google.com with SMTP id q12so4405088wrj.12
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2019 11:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=JnlWXDTbrqHM8aJAgZjpLz1LLb9hmD20EbvrUOM0KGI=;
        b=XSrapY5Kx1bo12d4hYZAHZXRs0MbVq1hvDxiW7Nz5tHbj0+MfY9g3mXtAmC/kT+68h
         RGiEw9yiqWxFDoBn0SECplfevSUXKJIlbWTrIM3jLuENwj6ouwm5EGKtJ3pt/woV6QRB
         T3sYpqDkqhjlUiMR3sGxN9jlAPByHGXuT8PM+UJbsw6Ky+QZUKyqwyNPAd3pfMsyFDvF
         EHxGKYCV1yQP+N4jadE9F91jGFr/DQadCM3j03VVtZ908k7A+GR1xEiF397qzuCZyzEc
         /n6RbLljz5ZfFtfgmE0rdk4+H/Z+A09c2pPKEQIiPwrQWY0F3CUzFD1YUOnRlrTBNeWk
         b9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JnlWXDTbrqHM8aJAgZjpLz1LLb9hmD20EbvrUOM0KGI=;
        b=rlyBe9tBsrB4Q189B7eXhbkj7hgFmwWJJiVuYtCwuKyRVbno8vPI62vyuGO1e40qzR
         1fFdEkOHfoEh/SABexWSXWGkONFJIpYTJpxgUhW6lD8/YucgiWe+Fe36/Mm5+5NCiIdP
         vt/Yxi5NdBnuEMdhN91gPi/AxzsTIBeU5M741SH8TTy9i+vXy2NYniJsJAqAa3JzWTzR
         ha9Ca2k5UayDAwx5bO9KThZnE7ULZTOu+TJY83Xnnx0HUk2PlfZkO7D47NuD8bsMuEDU
         QJDir5ezGJMJ2eCYVuuOeAhrJv+DhMIKAMwgS7K4UOWN95dmzy7j4TEj9mUaRpQuxugT
         NFLw==
X-Gm-Message-State: APjAAAWE6Wnd7o/iQfC8S4JnxpxV/UkRTANKaZLmib/KA21WwjvH+/yM
        BL38oOtgHcLPJM3Wq+tVg0YG3Z9n
X-Google-Smtp-Source: APXvYqzbT6ATUyH3hRlRo98ShjDh8kvaZDg0arsS4Jw6QJ08O//KxUTsJDIKFCaFEgRz4EJSpYNQxw==
X-Received: by 2002:adf:ea08:: with SMTP id q8mr14036819wrm.188.1567103628166;
        Thu, 29 Aug 2019 11:33:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1964:6740:352a:955f:edef:b4dc? ([2a02:908:1964:6740:352a:955f:edef:b4dc])
        by smtp.gmail.com with ESMTPSA id k6sm9462510wrg.0.2019.08.29.11.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2019 11:33:47 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
From:   Julian Sikorski <belegdol@gmail.com>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
 <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
 <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
 <1566595393.8347.56.camel@suse.com>
 <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
Message-ID: <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
Date:   Thu, 29 Aug 2019 20:33:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

W dniu 24.08.2019 o 09:08, Julian Sikorski pisze:
> W dniu 23.08.2019 o 23:23, Oliver Neukum pisze:
>> Am Freitag, den 23.08.2019, 16:21 +0200 schrieb Julian Sikorski:
>>>
>>> I did some further digging regarding whether this is a regression: the
>>> quirk file on the laptop is from 15 July 2014. The machine is from ca.
>>> May 2011. Looking through my earlier posts to linux-usb it appears that
>>> the addition of the quirk is related to this thread:
>>>
>>> https://marc.info/?l=linux-usb&m=140537519907935&w=2
>>>
>>> At the same time, back in 2011, I reported that the drive was working
>>> after some fixes:
>>>
>>> https://marc.info/?l=linux-usb&m=132276407611433&w=2
>>
>> Hi,
>>
>> this is alarming. Was this physically the same drive? I am asking
>> because we have seen cases where two different devices were sold
>> under the same name.
>>
>> 	Regards
>> 		Oliver
>>
> Hi,
> 
> I do indeed own two lacie rugged drives which do differ a bit. The older
> one (which was definitely working without the need for the quirk) is at
> work, I will bring it home and test it in a few days.
> Having said that, it appears that July 2014 is about when uas was rolled
> out to the public. So maybe the drive has worked using usb storage before.
> 
> Best regards,
> Julian
> 
Hi,

I have finally managed to try the second, older drive. It turns out that 
the USB IDs are different and that the older drive (059f:103e) does 
indeed appear to work with UAS whereas the newer one (059f:1031) does not.
I can now also confirm that I bought the newer drive in November 2013 
which means that the initial attempts of getting a drive to work from 
2011 must have been with the older (working) one. This makes a 
regression less likely. My educated guess is that the newer drive was 
working from November 2013 until July 2014 when linux 3.15 came out and 
uas rollout broke the drive, after which I added the quirk and have been 
using it since.
Below is the dmesg output from connecting and disconnecting both drives, 
older (working) first and newer (not working) second:

[  103.728860] usb 1-4: new full-speed USB device number 6 using xhci_hcd
[  103.933051] usb 1-4: device descriptor read/64, error -71
[  104.214040] usb 1-4: device descriptor read/64, error -71
[  104.494718] usb 1-4: new full-speed USB device number 7 using xhci_hcd
[  105.888012] usb 2-4: new SuperSpeed Gen 1 USB device number 2 using 
xhci_hcd
[  105.910020] usb 2-4: New USB device found, idVendor=059f, 
idProduct=103e, bcdDevice= 0.02
[  105.910023] usb 2-4: New USB device strings: Mfr=2, Product=3, 
SerialNumber=1
[  105.910025] usb 2-4: Product: Rugged USB 3
[  105.910027] usb 2-4: Manufacturer: LaCie
[  105.910029] usb 2-4: SerialNumber: ce0238914a4c0000000
[  105.960279] usb-storage 2-4:1.0: USB Mass Storage device detected
[  105.960654] scsi host12: usb-storage 2-4:1.0
[  105.960719] usbcore: registered new interface driver usb-storage
[  105.962877] usbcore: registered new interface driver uas
[  107.705420] scsi 12:0:0:0: Direct-Access     ST950032 5AS 
  0002 PQ: 0 ANSI: 0
[  107.706014] sd 12:0:0:0: [sdb] 976773168 512-byte logical blocks: 
(500 GB/466 GiB)
[  107.706101] sd 12:0:0:0: Attached scsi generic sg1 type 0
[  107.706935] sd 12:0:0:0: [sdb] Write Protect is off
[  107.706939] sd 12:0:0:0: [sdb] Mode Sense: 23 00 00 00
[  107.707942] sd 12:0:0:0: [sdb] No Caching mode page found
[  107.707945] sd 12:0:0:0: [sdb] Assuming drive cache: write through
[  107.842540]  sdb: sdb1 sdb2
[  107.845196] sd 12:0:0:0: [sdb] Attached SCSI disk
[  347.637498] usb 2-4: USB disconnect, device number 2
[  362.208749] usb 2-4: new SuperSpeed Gen 1 USB device number 3 using 
xhci_hcd
[  362.230833] usb 2-4: New USB device found, idVendor=059f, 
idProduct=1061, bcdDevice= 0.01
[  362.230837] usb 2-4: New USB device strings: Mfr=2, Product=3, 
SerialNumber=1
[  362.230839] usb 2-4: Product: Rugged USB3-FW
[  362.230841] usb 2-4: Manufacturer: LaCie
[  362.230842] usb 2-4: SerialNumber: 00000000157f928920fa
[  362.270100] scsi host12: uas
[  362.270720] scsi 12:0:0:0: Direct-Access     LaCie    Rugged FW USB3 
  051E PQ: 0 ANSI: 6
[  362.271472] sd 12:0:0:0: Attached scsi generic sg1 type 0
[  362.280344] sd 12:0:0:0: [sdb] 1953525168 512-byte logical blocks: 
(1.00 TB/932 GiB)
[  362.280422] sd 12:0:0:0: [sdb] Write Protect is off
[  362.280423] sd 12:0:0:0: [sdb] Mode Sense: 43 00 00 00
[  362.280544] sd 12:0:0:0: [sdb] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[  392.672691] sd 12:0:0:0: tag#29 uas_eh_abort_handler 0 uas-tag 1 
inflight: IN
[  392.672697] sd 12:0:0:0: tag#29 CDB: Report supported operation codes 
a3 0c 01 12 00 00 00 00 02 00 00 00
[  392.678304] scsi host12: uas_eh_device_reset_handler start
[  392.800099] usb 2-4: reset SuperSpeed Gen 1 USB device number 3 using 
xhci_hcd
[  392.848154] scsi host12: uas_eh_device_reset_handler success
[  422.875443] scsi host12: uas_eh_device_reset_handler start
[  422.875650] sd 12:0:0:0: tag#16 uas_zap_pending 0 uas-tag 1 inflight:
[  422.875654] sd 12:0:0:0: tag#16 CDB: Report supported operation codes 
a3 0c 01 12 00 00 00 00 02 00 00 00
[  422.997556] usb 2-4: reset SuperSpeed Gen 1 USB device number 3 using 
xhci_hcd
[  423.046525] scsi host12: uas_eh_device_reset_handler success
[  431.853505] usb 2-4: USB disconnect, device number 3
[  431.903459] sd 12:0:0:0: [sdb] Optimal transfer size 33553920 bytes
[  432.064456] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result: 
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[  432.064459] sd 12:0:0:0: [sdb] Sense not available.
[  432.184595] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result: 
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[  432.184599] sd 12:0:0:0: [sdb] Sense not available.
[  432.232451] sd 12:0:0:0: [sdb] 0 512-byte logical blocks: (0 B/0 B)
[  432.424484] sd 12:0:0:0: [sdb] Attached SCSI disk

Best regards,
Julian
