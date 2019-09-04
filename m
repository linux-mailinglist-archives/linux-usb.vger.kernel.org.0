Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2E11A8D84
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 21:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731779AbfIDRK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 13:10:27 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:37519 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731635AbfIDRK1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 13:10:27 -0400
Received: by mail-wr1-f46.google.com with SMTP id z11so22097458wrt.4
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2019 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CgdnCCHn8VdnWTRcZpmPclU8Fif2yil6LaOCEiCJIQ8=;
        b=T1fhMTi/h04b0MWtJfXweCPMdvzzclHReCjgmVLLBwl4XgtUI5Rw7HVTj//5KW9Igd
         lK325J0f8V0pPAfiZwmktXFjPdZ7fm6Io/H6vonbmfOJaCNtbwrt8JPsaQNYa/7BB53A
         YebaeSikzBYjQH239Rw7aqOnEj+Y7YECwjPbNXdLFoFdLaPC8+dzvkMRzrLUFbkSIR1t
         pPcrTkMHCdVoiNn1jz7TWApcKz7HHS90iiZ12F3+o7nYUjOKwgfnHSkhEPU4g6G0NQCR
         dC/K28UQLnfZ8scqShmFd53iCYXQorUc8IeM0d1W4O1mGyaBvuRRrJIZC7y/lqRDxWuG
         u4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CgdnCCHn8VdnWTRcZpmPclU8Fif2yil6LaOCEiCJIQ8=;
        b=jyy0t46X4YP2E1SYCWZNwDNTisM1CerN2ARSjeER9tintjVPe3aLUW07UOd/NSG/kc
         mMnxyMzeY2BdhJKzOBQg7sbE2faS0D+8pOOjwcxXjiye+eFf5apTOmepSd6B0O1Q02/C
         ewYPwRp293QY5KVKM8+XxPHyvZB/Mg1APc4fJ+ZtO15mcUEZFXrYpugwGDSRc9eLJw1f
         S51dVnjs+kcmpAtYDC5KeHkx7Ni8Mta5eAjhQE0DcksFArKiF7c+6bU643VkL+Htm9Y3
         VsuJIcI80ucVOBXuxMIVifOx06NkjUUjhH/wQKaJXA4TDPVKCxrMb8kWBISuNCbjS6gk
         o9Fg==
X-Gm-Message-State: APjAAAWUFFw7+5SHT0BgMcRzSQe+lrQC+cPrfh/vkbt3FZJrwILqKG99
        WjcvoZU+KzsiXI4sY8eEbWOxC0Ce
X-Google-Smtp-Source: APXvYqx/NOyuWA7VZ68WDpZUUXvzXNQ73G7HYwMnxzZh7vv7MjqqTwnh5ztXGpU+XkI6NWPUbg35UQ==
X-Received: by 2002:adf:f404:: with SMTP id g4mr47876118wro.290.1567617024979;
        Wed, 04 Sep 2019 10:10:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1964:6740:352a:955f:edef:b4dc? ([2a02:908:1964:6740:352a:955f:edef:b4dc])
        by smtp.gmail.com with ESMTPSA id p85sm4569882wme.23.2019.09.04.10.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 10:10:24 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Nathan Stratton Treadway <vgerlists@nathanst.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
 <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
 <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
 <1566595393.8347.56.camel@suse.com>
 <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
 <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
 <1567424535.2469.11.camel@suse.com>
 <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
 <20190904155831.GE4337@nathanst.com>
From:   Julian Sikorski <belegdol@gmail.com>
Message-ID: <d11b22f3-3f09-2e3f-dc64-956193f2c5d3@gmail.com>
Date:   Wed, 4 Sep 2019 19:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904155831.GE4337@nathanst.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

W dniu 04.09.2019 o 17:58, Nathan Stratton Treadway pisze:
> On Mon, Sep 02, 2019 at 22:10:01 +0200, Julian Sikorski wrote:
>> thanks for the patch! It appears that we got the drives confused, the
>> one needing quirks is 059f:1061. Unfortunately, even after hand-editing
>> the patch to match (attached for confirmation), uas is still not
>> working. The dmesg log is unchanged:
>>
>> [   67.925435] usb 2-4: new SuperSpeed Gen 1 USB device number 2 using
>> xhci_hcd
>> [   67.947738] usb 2-4: New USB device found, idVendor=059f,
>> idProduct=1061, bcdDevice= 0.01
>> [   67.947739] usb 2-4: New USB device strings: Mfr=2, Product=3,
>> SerialNumber=1
>> [   67.947740] usb 2-4: Product: Rugged USB3-FW
>> [   67.947741] usb 2-4: Manufacturer: LaCie
>> [   67.947742] usb 2-4: SerialNumber: 00000000157f928920fa
>> [   67.978140] usbcore: registered new interface driver usb-storage
>> [   68.007356] scsi host12: uas
>> [   68.007520] usbcore: registered new interface driver uas
>> [   68.007781] scsi 12:0:0:0: Direct-Access     LaCie    Rugged FW USB3
>>   051E PQ: 0 ANSI: 6
> [...]
>> [  280.017821] usb 2-4: USB disconnect, device number 2
>> [  280.017869] scsi host12: uas_eh_device_reset_handler FAILED err -22
>> [  280.017876] sd 12:0:0:0: Device offlined - not ready after error recovery
>> [  280.043423] sd 12:0:0:0: [sdb] Optimal transfer size 33553920 bytes
>> [  280.204419] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result:
>> hostbyte=DID_ERROR driverbyte=DRIVER_OK
>> [  280.204422] sd 12:0:0:0: [sdb] Sense not available.
>> [  280.324417] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result:
>> hostbyte=DID_ERROR driverbyte=DRIVER_OK
>> [  280.324420] sd 12:0:0:0: [sdb] Sense not available.
> 
> 
> Oliver, does the presence of the "Read Capacity(16)" message here
> indicate that either the quirk was not applied to the device or that
> the patch didn't have the expected effect?
> 
> (Is there any way to check what quirks flags are actually in effect for
> a device attached to the UAS driver?  For the usb-storage driver there's
> both a "Quirks match for vid..." dmesg line and the Quirks: line in the
> /proc/scsi/usb-storage/* file -- but neither of those seem to exist for
> the UAS driver....)
> 
> 							Nathan
> 
Moreover, does this matter that the two Read Capacity errors only appear 
after the device is disconnected?

Best regards,
Julian
