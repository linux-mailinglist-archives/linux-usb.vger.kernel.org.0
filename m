Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790086AAAD
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 16:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbfGPOfD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 10:35:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44015 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPOfD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 10:35:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id f25so9537018pgv.10
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2R7OgIABLceHFgV2ACZ6uadj21R788V47JENYqhfrRI=;
        b=AJEy+x8T4wkdU59jpzzZsqwyQvdRJPzG3ZR/9oCMCIFtr/jZrckqIQPtwFEJp9Ai5l
         snDqpIrYAg4Hx6b0KdXbS43kVLYCTbE35C+egXJVxFIiSVqPewj40nYQIj66wxeZFw4b
         EVM7KyDN0o38cmbNn5jC9TEFpbzErjFdeKa5gnpcIs8KSk1BnqkpX+twPrtZSKqDm0jc
         F4hVjbTHghJ5p9vOkp0C0B08MUUNvxKrvda6j5H4w9kQ3VS5XQh9GRUN1vJ2C8Hmi5zS
         as2MqBKsvpAjJh+9XXdn8w+1QlF4cvs+DvtXVJvwD4S1KUQH6bGDvGbGd9VjqD+R1c2W
         NbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2R7OgIABLceHFgV2ACZ6uadj21R788V47JENYqhfrRI=;
        b=r/WtKCqGHxYar3fv1asUlgCZPKdEU+VzC9ClW3LcC9ozkVRHNgDgiYnk25HFoOxGcG
         Y6sICGsGiWJvA5W6yUkTkUk98A+YD++swSqflVXA0BQTtdTflRxqzkRLI4KZq9O/eCWM
         U9QhfJIF3Dag8w4oxg9SAQEk/uS+FFdYa/JeHQhIRSXJv18mndRDgTtAvcg+kJXsQ2Ul
         DpTeVA8zw/XN/dilPd9ll/J/FJ7ZsEpq0JrhXy9ynM7xVdyIuVhlBkJUY4rLmrascgz6
         AILJQnCnFBGA+JOKjnpfAD5Kn72f4mAW9ramkeZWriT93ovF0liBqZXGIS+25KQeF0q+
         1dyg==
X-Gm-Message-State: APjAAAUbhha1zMNWNEo5cb3kNZBEpqwncNPAUUT6N7mPwJyJz6+RaPY5
        nc07HOgfTMySFRMQvCY8SGquFf0DVsk=
X-Google-Smtp-Source: APXvYqxhyQROlztUa2T/A5TglaOI7q6GApNma2zCaCRm8AW31Lsy+vZrFaj8Ej69qInW0qq51h7Jpw==
X-Received: by 2002:a17:90a:9a83:: with SMTP id e3mr36214820pjp.105.1563287702491;
        Tue, 16 Jul 2019 07:35:02 -0700 (PDT)
Received: from [192.168.1.5] ([110.77.195.91])
        by smtp.googlemail.com with ESMTPSA id 14sm32285925pfj.36.2019.07.16.07.35.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 07:35:01 -0700 (PDT)
Subject: Re: [PATCH] USB: serial: option: add D-Link DWM-222 device ID
 [version 2]
To:     Johan Hovold <johan@kernel.org>, Rogan Dawes <rogan@dawes.za.net>
Cc:     linux-usb@vger.kernel.org, Dan Williams <dcbw@redhat.com>
References: <20190711094012.GA16316@lisa.dawes.za.net>
 <20190711103457.GA17414@lisa.dawes.za.net> <20190716091122.GB3522@localhost>
 <CAOYdKdiEUsk9O=ytis=u2yD-69LoKNSE8=ivwer8K3sMNCd8Dw@mail.gmail.com>
 <20190716111711.GD3522@localhost>
From:   Lars Melin <larsm17@gmail.com>
Message-ID: <1eda7a85-f71d-950b-8efd-d3258ffeeab5@gmail.com>
Date:   Tue, 16 Jul 2019 21:34:56 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190716111711.GD3522@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/16/2019 18:17, Johan Hovold wrote:

snip

> Ok, thanks. Do you have any idea what all those vendor interface are
> for? Some of the other D-Link entries blacklist a speech and debug port
> for example.
> 
> We can always do that later if we need to, but perhaps you or someone
> already know (also adding Lars and Dan on CC).
> 
> Johan
> 

This is the interface composition:

MI_00 D-Link HS-USB Diagnostics
MI_01 D-Link HS-USB Modem
MI_02 D-Link HS-USB AT Port
MI_03 D-Link HS-USB NMEA
MI_04 D-Link HS-USB WWAN Adapter (qmi_wwan)
MI_05 USB Mass Storage Device

rgds
/Lars

