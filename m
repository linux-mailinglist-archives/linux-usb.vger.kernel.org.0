Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B90611B904
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2019 16:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730908AbfEMOsC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 May 2019 10:48:02 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:38781 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfEMOsC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 May 2019 10:48:02 -0400
Received: by mail-lj1-f178.google.com with SMTP id 14so11239566ljj.5
        for <linux-usb@vger.kernel.org>; Mon, 13 May 2019 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=wFeg9z0SL6Eer1ifdUUfg5QkI0QTx9B66RLmQUCIfFw=;
        b=aDyDotY0vaVbGcsklPhiPZBkt7o0HB3YoA3Lyii3VuvCuLQg7C8ss6C6fhMvz8cgrt
         dQT9Em0VHPOe0DmPtvbV8i4h4CYP3s/0hsGGkeFj+u+N2y6NC1RJTfaUblPOhptXj1wV
         tOQoLXBSN438UUntkl/24fx0JWkl278q+kyMMpUVRxhC3Ue0k8adinJtcRMFADnJam33
         a0y9UWrCTEd0Eeu//GyidP8I1/U7+6A/uAI/6d4sWyFSBFwNGirkgzRhnlXooEJxsXR7
         8QdR1WtycUzi09nl485/HM7w5esrZ9bawG/uyPGl55DkqQ48pvNbc1LsDo0ng0XPlEN6
         pAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=wFeg9z0SL6Eer1ifdUUfg5QkI0QTx9B66RLmQUCIfFw=;
        b=OUQeuGVZGidbb1ieI1sgBcQ+G97/mS7va3M75/6uKimUUdMu3TYRfpgrvJ0kDDR+CS
         kxELaRWvHJny4zhU6INhxGvBSPZQjmwM1BMM4sgqykPd0gYbScwEFH5x05iaOMEzNQWj
         FKzMg8rWqbjS3ZcKpHcV+r01sAuPvI8LrUUNYj5jNsY2q98DIU2M1DK3A5bqsXe+s//y
         uH7Eyhtbkaj6HjD4t84FjNxbVmchshmaWAWm194Y4w6M6Burwtfxj5BoX3iOJG7P+kD0
         gx7mfsTnEpn175phxbYx7ra6/89Bjro7UTOTJTCfA+BJajl2mcJMCYq/JrvoRmrHZ3mR
         +4FA==
X-Gm-Message-State: APjAAAXBYJDR16no4gy4B3ChXM0OUgfLbAPLUOlihEj18Y/8c8u0Z1PB
        F2RUZF7cktGheqwoDI2yl1xSXVMU
X-Google-Smtp-Source: APXvYqyQPlP5W/clpQNsW64ISwpqNHH0PvaQNKSdhgDKndzbkRirJC8hMI9pAVUukwj/AugKntpQDw==
X-Received: by 2002:a2e:9ac8:: with SMTP id p8mr3809377ljj.154.1557758880252;
        Mon, 13 May 2019 07:48:00 -0700 (PDT)
Received: from [192.168.1.10] ([95.174.107.249])
        by smtp.gmail.com with ESMTPSA id a25sm3214845ljd.32.2019.05.13.07.47.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 07:47:59 -0700 (PDT)
To:     Thibaut VARENE <varenet@parisc-linux.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
From:   Igor Plyatov <plyatov@gmail.com>
Subject: Unitialisation of SOC USB pads
Message-ID: <f846aeee-40dc-7ac9-a9c3-7c0353900116@gmail.com>
Date:   Mon, 13 May 2019 17:47:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Thibaut and others,

can you please explain who must configure AT91SAM9G20 SOC pads to 
operate as USB Host port - AT91Bootstrap, U-Boot bootloader, Linux 
kernel or this is not required at all?

I ask, because during connection of USB disk, my board complains

usb 1-1: device descriptor read/64, error -62
usb 1-1: device descriptor read/64, error -62
usb 1-1: device descriptor read/64, error -62
usb 1-1: device descriptor read/64, error -62
usb 1-1: device not accepting address 4, error -62
usb 1-1: device not accepting address 5, error -62
usb usb1-port1: unable to enumerate USB device


Looks like there is no connectivity between USB Host module of SOC and 
USB device. Or am I wrong?


My setup is:


* AT91SAM9G20 based custom board;
* Linux kernel 4.9.36, from LINUX4SAM project.
* USB disk connected to USB Host port 0 (HDPA, HDMA pins of SOC). 39 Ohm 
series resistors and 15 Kohm pull-down resistors added at these lines. 
Connectivity between SOC and USB device confirmed by Ohmmeter.
* USB_VBUS voltage measured at USB connector = 4.96 VDC.

Best wishes
--
Igor Plyatov
