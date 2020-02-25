Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B73C16B785
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 03:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgBYCGR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 21:06:17 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42400 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgBYCGQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Feb 2020 21:06:16 -0500
Received: by mail-pl1-f195.google.com with SMTP id u3so507823plr.9
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2020 18:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=1CHI99P6OXzbIsUlNKnLj6/C20wsSN/f5nvpeDcrDZQ=;
        b=qK+uweoDB3+v7+LZkfO3DF6qyZPC8fs2X1QM2VCiyhB1iIUKxt7aVTlmMDAL/Kho/l
         bPVrn5QXuX8Yq37MyuaKblwofdNpfVat5eBTUV+t7Trn+W74gR8PEZV210iH1WAsUbxn
         CudJ33KkdRKrRhakKRn+LFW7G8KBbkNR30PgKXOUCXB+3GhRZpDQ31pc3jgsoqXGb64l
         +0jlCGuTLfxjoaciOTAJ40PI9tALuv+thYaglMwH3go3BOQBCptVN3kL9Qr8PGbXGaUt
         zFN4BMNvAIlOYZ01TgrQdY+EC4wckkDl18uMXGV6K5z78yx97P/wicRgw0j4A3rvvKRC
         c/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1CHI99P6OXzbIsUlNKnLj6/C20wsSN/f5nvpeDcrDZQ=;
        b=b7TitIgqh2lTfY8IU8nrCUTpeb8iuX2i0xRhvHS4yqZzRPGarFQ1c9Z8Zh0bkTJyE0
         XGH5SuXdbD4GVmXGSTmcBWFzLrmzD3NuuPrE1UnXQ14CCf05pFFSdyI4JrJqkOuhp9Sp
         5xKa4GuOpP6aGfcm7eoeHfRPjro0Ls5VqoxJFeDDghQkOaROn+hwTJ/QiamVhSF8A85I
         rAntQ27uuJksBeScl1DfsjyxklfEAnGwYJSxdt16Z7s+BJW++HWCbol8Yd4uNUDp8DSZ
         Y8K2N9VMfvGpSaZebCTSn2bNEwyXKB1F2Nchx+yv8QLvWMrxlMbCOaXGuwqnLUnH63c1
         qxNw==
X-Gm-Message-State: APjAAAVJju//JpO0XHcHN2eSdGHPh+APjhCLSM8NL/ltMBBEsGreC0VG
        1QprYgYBvJOZyCsVIfGAH6jTvKb9
X-Google-Smtp-Source: APXvYqyXt9zrKPyqFKao/MgKQ/qq88Z3/hIIewjhQnEh9iK9cc6U1vdUU7Pg0a8YJcgE5/lCMMEegg==
X-Received: by 2002:a17:902:107:: with SMTP id 7mr51226189plb.183.1582596375960;
        Mon, 24 Feb 2020 18:06:15 -0800 (PST)
Received: from [192.168.1.5] ([110.77.154.179])
        by smtp.googlemail.com with ESMTPSA id d23sm14238418pfo.176.2020.02.24.18.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2020 18:06:15 -0800 (PST)
Subject: Re: Driver fault
To:     PLENTY <plentypvp@gmail.com>, linux-usb@vger.kernel.org
References: <CALDgPpU+zqjeLbh7SnGGbe66RjJU9a2P6JiZUp-VJn=w44S_=A@mail.gmail.com>
From:   Lars Melin <larsm17@gmail.com>
Message-ID: <dd3597fd-f23b-24c1-7d8d-fe335e1f5755@gmail.com>
Date:   Tue, 25 Feb 2020 09:06:12 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CALDgPpU+zqjeLbh7SnGGbe66RjJU9a2P6JiZUp-VJn=w44S_=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/25/2020 04:23, PLENTY wrote:
> Hello. I'm using Ubuntu 18.04.3 LTS. I'm trying to get my JT308 RFID
> reader working. Please help.
> 
> $ sudo modprobe usbserial vendor=0xffff product=0x0035
> $ dmesg
> ...
> [  266.304578] usbserial_generic 2-1.5:1.1: The "generic" usb-serial
> driver is only for testing and one-off prototypes.
> [  266.304579] usbserial_generic 2-1.5:1.1: Tell
> linux-usb@vger.kernel.org to add your device to a proper driver.
> 
> $ lsusb -d ffff:0035 -v
> Bus 002 Device 003: ID ffff:0035
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               1.10
>    bDeviceClass            0 (Defined at Interface level)
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0         8
>    idVendor           0xffff
>    idProduct          0x0035
>    bcdDevice            1.00
>    iManufacturer           1 Sycreader
>    iProduct                2 USB Reader
>    iSerial                 3 08FF20150112
>    bNumConfigurations      1
> 

Your RFID reader does not have interfaces for a serial driver, the 
interfaces are for a HID driver.
Your verbose lsusb listing would have showed that had you not cut it 
short and your dmesg should also show a HID driver attempting to bind.


br
/Lars

