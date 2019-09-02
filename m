Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2E8A5CF2
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2019 22:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfIBUKI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Sep 2019 16:10:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35302 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfIBUKH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Sep 2019 16:10:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id g7so15139986wrx.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Sep 2019 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=qPhdHh2mfNSn/AtKFl6WbsZWT4lAMBYkT+oCtg1dZXg=;
        b=CHGcf1m1GZRwvWovT/c6nM/ebfxfAkRzoiZRVPNGT73clq8V67Ll0q5tRNCvZPdico
         1cOYYphwmjgyyYEF1hKH0cOmMikaj8QgKG5ecjW03uUyoYbB4AZMTcC0X5BdfgVCRYPN
         m845qYg4jlRxlNWYd495MCd+3pOmcOLdLoQMTHuIOtKtyl+1TAXGtubVLD1zoceKXHku
         BQnc1MWyXIN4rKbzHINu0QeVgA1jeiipw6Dx155TEQI1d6XTEIl9FpaoOjD/V3QrK/tl
         AnBCrHZlunRfhAzn8E8nfi0KM1fjKoa4RBkrKFiOPOf4jlaUlVpZhi3rQC0y3ci+iWCC
         F7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=qPhdHh2mfNSn/AtKFl6WbsZWT4lAMBYkT+oCtg1dZXg=;
        b=V4dXA+xS1f/Pjmh6n6kWz+0KJfXawrZ72VpqeGRtYIChCXLPfWCSIDNo8rBPQVYK9B
         hvn+dgdPi4pSp+UJTkoRkK8g2yMY52UhVCPCbkfupl5q2QjfSzAdtgbJvZBH4OlWu5Rg
         vd/CnXohKe52xgvnhcGuFjG9ZaN14uRnoIzdjJrswLsqmKi4yACFNmfqmJ2xVUlFxVF3
         VCeMHM2VoJSordu9hRraTRRevaE2GzdEU5pY1vMRzVnGyNK+678br1e2f+QdHh/L1plH
         YPIHzhF0KC53MjBh+rPrVMuOOn7a8vW6emiJ761nlfGvEHoRSf5qvauznXlepMC0fL4H
         5wDw==
X-Gm-Message-State: APjAAAUeheBryOitoksPkY6dTkyIxTQOvCSTdkWKQpx2aRNEQMIFENlc
        qLjHdKBLE8TBva/KmMEselcfEG6d99s=
X-Google-Smtp-Source: APXvYqxyWqCCatoqbIQmfmVD+wbiwy3bKS4b/c1ivQxCPs+vLzrYHSmr/A3m+AkoiByl0fGIbbE4HA==
X-Received: by 2002:adf:e3ce:: with SMTP id k14mr35809050wrm.303.1567455003690;
        Mon, 02 Sep 2019 13:10:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1964:6740:352a:955f:edef:b4dc? ([2a02:908:1964:6740:352a:955f:edef:b4dc])
        by smtp.gmail.com with ESMTPSA id e30sm24176996wra.48.2019.09.02.13.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2019 13:10:03 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
 <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
 <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
 <1566595393.8347.56.camel@suse.com>
 <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
 <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
 <1567424535.2469.11.camel@suse.com>
From:   Julian Sikorski <belegdol@gmail.com>
Message-ID: <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
Date:   Mon, 2 Sep 2019 22:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567424535.2469.11.camel@suse.com>
Content-Type: multipart/mixed;
 boundary="------------C2860785187233FF34F7590A"
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------C2860785187233FF34F7590A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 02.09.2019 o 13:42, Oliver Neukum pisze:
> Am Donnerstag, den 29.08.2019, 20:33 +0200 schrieb Julian Sikorski:
> 
> Hi,
> 
> this is a relief. If necessary we can blacklist the new device.
> Howevera, as that costs performance, I would appriciate if
> you take first try out an alternative approach.
> 
>> [  362.230833] usb 2-4: New USB device found, idVendor=059f,
>> idProduct=1061, bcdDevice= 0.01
>> [  362.230837] usb 2-4: New USB device strings: Mfr=2, Product=3,
>> SerialNumber=1
>> [  362.230839] usb 2-4: Product: Rugged USB3-FW
>> [  362.230841] usb 2-4: Manufacturer: LaCie
>> [  362.230842] usb 2-4: SerialNumber: 00000000157f928920fa
>> [  362.270100] scsi host12: uas
>> [  362.270720] scsi 12:0:0:0: Direct-Access     LaCie    Rugged FW USB3
>>    051E PQ: 0 ANSI: 6
>> [  362.271472] sd 12:0:0:0: Attached scsi generic sg1 type 0
>> [  362.280344] sd 12:0:0:0: [sdb] 1953525168 512-byte logical blocks:
>> (1.00 TB/932 GiB)
>> [  362.280422] sd 12:0:0:0: [sdb] Write Protect is off
>> [  362.280423] sd 12:0:0:0: [sdb] Mode Sense: 43 00 00 00
>> [  362.280544] sd 12:0:0:0: [sdb] Write cache: enabled, read cache:
>> enabled, doesn't support DPO or FUA
> 
> This means that at least the earliest commandos did get through.
> 
>> [  392.672691] sd 12:0:0:0: tag#29 uas_eh_abort_handler 0 uas-tag 1
>> inflight: IN
>> [  392.672697] sd 12:0:0:0: tag#29 CDB: Report supported operation codes
>> a3 0c 01 12 00 00 00 00 02 00 00 00
>> [  392.678304] scsi host12: uas_eh_device_reset_handler start
>> [  392.800099] usb 2-4: reset SuperSpeed Gen 1 USB device number 3 using
>> xhci_hcd
>> [  392.848154] scsi host12: uas_eh_device_reset_handler success
>> [  422.875443] scsi host12: uas_eh_device_reset_handler start
>> [  422.875650] sd 12:0:0:0: tag#16 uas_zap_pending 0 uas-tag 1 inflight:
>> [  422.875654] sd 12:0:0:0: tag#16 CDB: Report supported operation codes
>> a3 0c 01 12 00 00 00 00 02 00 00 00
>> [  422.997556] usb 2-4: reset SuperSpeed Gen 1 USB device number 3 using
>> xhci_hcd
>> [  423.046525] scsi host12: uas_eh_device_reset_handler success
>> [  431.853505] usb 2-4: USB disconnect, device number 3
>> [  431.903459] sd 12:0:0:0: [sdb] Optimal transfer size 33553920 bytes
>> [  432.064456] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result:
>> hostbyte=DID_ERROR driverbyte=DRIVER_OK
> 
> Read Capacity(16) failed
> 
>> [  432.064459] sd 12:0:0:0: [sdb] Sense not available.
>> [  432.184595] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result:
>> hostbyte=DID_ERROR driverbyte=DRIVER_OK
> 
> Read Capacity(10) failed
> 
> There is a chance that this device can deal only with Read Capacity(10)
> and crashes on Read Capacity(16). One difference between Usb-storage
> and UAS is the order in which the 10 and 16 versions are tried.
> The attached patches introduce a quirk to reverse the order
> for this particular device under UAS. Could you try them?
> 
> 	Regards
> 		Oliver
> 

Hi,

thanks for the patch! It appears that we got the drives confused, the 
one needing quirks is 059f:1061. Unfortunately, even after hand-editing 
the patch to match (attached for confirmation), uas is still not 
working. The dmesg log is unchanged:

[   67.925435] usb 2-4: new SuperSpeed Gen 1 USB device number 2 using 
xhci_hcd
[   67.947738] usb 2-4: New USB device found, idVendor=059f, 
idProduct=1061, bcdDevice= 0.01
[   67.947739] usb 2-4: New USB device strings: Mfr=2, Product=3, 
SerialNumber=1
[   67.947740] usb 2-4: Product: Rugged USB3-FW
[   67.947741] usb 2-4: Manufacturer: LaCie
[   67.947742] usb 2-4: SerialNumber: 00000000157f928920fa
[   67.978140] usbcore: registered new interface driver usb-storage
[   68.007356] scsi host12: uas
[   68.007520] usbcore: registered new interface driver uas
[   68.007781] scsi 12:0:0:0: Direct-Access     LaCie    Rugged FW USB3 
  051E PQ: 0 ANSI: 6
[   68.008589] sd 12:0:0:0: Attached scsi generic sg1 type 0
[   68.017457] sd 12:0:0:0: [sdb] 1953525168 512-byte logical blocks: 
(1.00 TB/932 GiB)
[   68.017540] sd 12:0:0:0: [sdb] Write Protect is off
[   68.017542] sd 12:0:0:0: [sdb] Mode Sense: 43 00 00 00
[   68.017693] sd 12:0:0:0: [sdb] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[   98.221259] sd 12:0:0:0: tag#7 uas_eh_abort_handler 0 uas-tag 1 
inflight: IN
[   98.221264] sd 12:0:0:0: tag#7 CDB: Report supported operation codes 
a3 0c 01 12 00 00 00 00 02 00 00 00
[   98.226869] scsi host12: uas_eh_device_reset_handler start
[   98.348671] usb 2-4: reset SuperSpeed Gen 1 USB device number 2 using 
xhci_hcd
[   98.397136] scsi host12: uas_eh_device_reset_handler success
[  128.428023] scsi host12: uas_eh_device_reset_handler start
[  128.428224] sd 12:0:0:0: tag#4 uas_zap_pending 0 uas-tag 1 inflight:
[  128.428228] sd 12:0:0:0: tag#4 CDB: Report supported operation codes 
a3 0c 01 12 00 00 00 00 02 00 00 00
[  128.549805] usb 2-4: reset SuperSpeed Gen 1 USB device number 2 using 
xhci_hcd
[  128.597949] scsi host12: uas_eh_device_reset_handler success
[  158.632176] scsi host12: uas_eh_device_reset_handler start
[  158.632382] sd 12:0:0:0: tag#5 uas_zap_pending 0 uas-tag 1 inflight:
[  158.632385] sd 12:0:0:0: tag#5 CDB: Report supported operation codes 
a3 0c 01 12 00 00 00 00 02 00 00 00
[  158.754653] usb 2-4: reset SuperSpeed Gen 1 USB device number 2 using 
xhci_hcd
[  158.803047] scsi host12: uas_eh_device_reset_handler success
[  188.840196] scsi host12: uas_eh_device_reset_handler start
[  188.840395] sd 12:0:0:0: tag#20 uas_zap_pending 0 uas-tag 1 inflight:
[  188.840399] sd 12:0:0:0: tag#20 CDB: Report supported operation codes 
a3 0c 01 12 00 00 00 00 02 00 00 00
[  188.962059] usb 2-4: reset SuperSpeed Gen 1 USB device number 2 using 
xhci_hcd
[  189.010354] scsi host12: uas_eh_device_reset_handler success
[  219.053201] sd 12:0:0:0: tag#21 uas_eh_abort_handler 0 uas-tag 1 
inflight: IN
[  219.053206] sd 12:0:0:0: tag#21 CDB: Report supported operation codes 
a3 0c 01 93 00 00 00 00 02 00 00 00
[  219.059167] scsi host12: uas_eh_device_reset_handler start
[  219.179898] usb 2-4: reset SuperSpeed Gen 1 USB device number 2 using 
xhci_hcd
[  219.227613] scsi host12: uas_eh_device_reset_handler success
[  225.587481] nf_conntrack: default automatic helper assignment has 
been turned off for security reasons and CT-based  firewall rule not 
found. Use the iptables CT target to attach helpers instead.
[  249.255814] scsi host12: uas_eh_device_reset_handler start
[  249.256019] sd 12:0:0:0: tag#0 uas_zap_pending 0 uas-tag 1 inflight:
[  249.256023] sd 12:0:0:0: tag#0 CDB: Report supported operation codes 
a3 0c 01 93 00 00 00 00 02 00 00 00
[  249.377558] usb 2-4: reset SuperSpeed Gen 1 USB device number 2 using 
xhci_hcd
[  249.425499] scsi host12: uas_eh_device_reset_handler success
[  279.464424] scsi host12: uas_eh_device_reset_handler start
[  279.464630] sd 12:0:0:0: tag#15 uas_zap_pending 0 uas-tag 1 inflight:
[  279.464634] sd 12:0:0:0: tag#15 CDB: Report supported operation codes 
a3 0c 01 93 00 00 00 00 02 00 00 00

---disconnect---

[  280.017821] usb 2-4: USB disconnect, device number 2
[  280.017869] scsi host12: uas_eh_device_reset_handler FAILED err -22
[  280.017876] sd 12:0:0:0: Device offlined - not ready after error recovery
[  280.043423] sd 12:0:0:0: [sdb] Optimal transfer size 33553920 bytes
[  280.204419] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result: 
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[  280.204422] sd 12:0:0:0: [sdb] Sense not available.
[  280.324417] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result: 
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[  280.324420] sd 12:0:0:0: [sdb] Sense not available.
[  280.372418] sd 12:0:0:0: [sdb] 0 512-byte logical blocks: (0 B/0 B)
[  280.524416] sd 12:0:0:0: [sdb] Attached SCSI disk

Would it make sense to enable some debugging options?

Best regards,
Julian

--------------C2860785187233FF34F7590A
Content-Type: text/x-patch;
 name="0002-uas-quirk-for-LaCie-Rugged-USB-3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0002-uas-quirk-for-LaCie-Rugged-USB-3.patch"

From 115389ff678cae7cb636ac7e520f06e5182cd353 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 2 Sep 2019 13:30:00 +0200
Subject: [PATCH 2/2] uas: quirk for LaCie Rugged USB 3

No. CAPACITY16 for these devices.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/unusual_devs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index ea0d27a94afe..643bba41291e 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -806,6 +806,12 @@ UNUSUAL_DEV(  0x059f, 0x0651, 0x0000, 0x0000,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_WP_DETECT ),
 
+UNUSUAL_DEV(  0x059f, 0x1061, 0x0002, 0x0002,
+		"LaCie",
+		"Rugged FW USB3",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_READ_CAPACITY_16 ),
+
 /*
  * Submitted by Joel Bourquard <numlock@freesurf.ch>
  * Some versions of this device need the SubClass and Protocol overrides
-- 
2.16.4


--------------C2860785187233FF34F7590A--
