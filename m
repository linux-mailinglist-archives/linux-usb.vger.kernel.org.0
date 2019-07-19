Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF836DDEA
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2019 06:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730143AbfGSEZN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jul 2019 00:25:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34796 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387448AbfGSEJK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jul 2019 00:09:10 -0400
Received: by mail-pf1-f196.google.com with SMTP id b13so13576899pfo.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Jul 2019 21:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OUawRzj0HC2FyLhPznZXUTxWMFP9kFRNCQTEDA5r5UA=;
        b=Mj/pz/1T8DIm0ZSxq6rgUT5LPRmG8hNJBSBXE4RudNLZhs2aQ5fux+brYAjBeyhiMK
         GX3xPe90pJ8Uv7UagddPuVB9PaN7n3/+TpY85WuQobp9Kppygov314idPuCpUmqzrlmj
         laVE1PWpyHQOLAS+Xm4Ys4fmZcfUuqSkXV9MQi/y4ROwionW76Y1AaZWEdxPb2JdYx01
         h71jS+0mAUhvGgX8TUY0qx6xZJfaTaJXT98SL9GR8ad/I4vXGtjGSvSK2ldH4f4coaUU
         VHGJ/aiKukeyVK6rH3nKs7zRnN001yR4AIDyC3rA6LcjAVMSi1bheGfvk5HkjQyt0b9/
         ZTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OUawRzj0HC2FyLhPznZXUTxWMFP9kFRNCQTEDA5r5UA=;
        b=kYzO56tGLeNOTQgtO72wyrq8SrFL+0riXMuBoKMWervl4ZeE/VQxN0yo/XBgf4CYhL
         qkGS5MWuMQGwMTnzWmTJ/66of6V9iATNYUM9b7C8Zo1JpLcELUzD/LWSE/SKNqWOFwal
         WQYZtwoVux7SDepX7GZP/5y6OpLaxVyKL/K7psRRhAK9/DcZUJJbscSAw7RqHMlRaNti
         JRCJuhxM1Uw8sEEv6J1g1rxmBDyI9gu+kB4EmNdisigKUtxZRvbKlpOnRRD5dohuz0/O
         cLe74RtHxy86W+UfzZQr/rQPCh9JdTT39r/EKP7nSyIhPVyF+yblddffHwbJ1nBpCaLH
         SMGw==
X-Gm-Message-State: APjAAAXCihV8Dw/hMB/GnIxFozpzJuneH/B+m7jFVDEtO2iLSgMjZG+8
        0QLXNLJNSUrLzn+/tgQU2ltNfh8DEk8=
X-Google-Smtp-Source: APXvYqzY+Sp50uVN5Rb0cYVHAKBIxk00HpEp31CyDb6NSRF/MsGaV1ex+NBE7iykF4rMrAYpyHeoeg==
X-Received: by 2002:a63:211c:: with SMTP id h28mr51518904pgh.438.1563509349645;
        Thu, 18 Jul 2019 21:09:09 -0700 (PDT)
Received: from [10.43.0.94] ([45.56.153.101])
        by smtp.googlemail.com with ESMTPSA id m4sm55521891pff.108.2019.07.18.21.09.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 21:09:09 -0700 (PDT)
Subject: Re: [PATCH v2] USB: serial: option: Add support for ZTE MF871A
To:     OKAMOTO Yoshiaki <yokamoto@allied-telesis.co.jp>,
        "johan@kernel.org" <johan@kernel.org>
Cc:     YAMAMOTO Hiroyuki <hyamamo@allied-telesis.co.jp>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20190716090553.GA3522@localhost>
 <156334196350.13827.8927178214233271211.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
 <5b4971b3-64e7-605a-948c-9e1e02b11eb2@gmail.com>
 <OSBPR01MB3973A00B1FB1E0930DF0AC13BCC80@OSBPR01MB3973.jpnprd01.prod.outlook.com>
From:   Lars Melin <larsm17@gmail.com>
Message-ID: <1dde5abb-2399-6bb7-531b-c88e5f0b4fae@gmail.com>
Date:   Fri, 19 Jul 2019 11:09:04 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB3973A00B1FB1E0930DF0AC13BCC80@OSBPR01MB3973.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/18/2019 21:46, OKAMOTO Yoshiaki wrote:
> 
> Hi Lars,
> 
>> Please do a full test of the interface attributes (Class/SubClass/Proto)
>> whenever possible, this could be helpful in case the mfgr makes a device
>> with different interface layout but re-uses an already used vid:pid.
>>
> What should we do specifically for "a full test of the interface attributes"?
> 
> 
>> Both interfaces has attributes ff/00/00 so there is no reason for doing a less accurate test.
>>
> Forgive me if I’m wrong, did you say mean that we should use USB_DEVICE_AND_INTERFACE_INFO" instead of "USB_DEVICE_INTERFACE_CLASS" ?
> 
> Regards,
> Yoshiaki Okamoto
> 


Yes, USB_DEVICE_AND_INTERFACE_INFO is the one to use when all the  
interfaces you add support for has identical class/subclass/protocol  
attributes.

rgds
/Lars

