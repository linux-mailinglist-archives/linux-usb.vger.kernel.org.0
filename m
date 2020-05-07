Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A021C8D1A
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 15:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgEGN44 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 09:56:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26732 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725953AbgEGN4z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 09:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588859813;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IIqYBA+zWYHGIVHmWkMZmRc4/aV6/M/YLfOxCEStLzA=;
        b=GzlnyZLbxdcGrW2l2kAFqX1m6X3Q8s273drKMnalqo1E0q1Xx4HSeOz6bM/BpIEBXvumru
        uE7UQwiOebjRPxTmclywNRWPwkxj7fTiWrjk3UxAlCM6//d5DSQzgri7ckfTpOdic9y9NK
        59rSrcBaJXAvHGYG/5ybObcJKFjlGdo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-nLaaPef5O8uK9228IjgoyA-1; Thu, 07 May 2020 09:56:52 -0400
X-MC-Unique: nLaaPef5O8uK9228IjgoyA-1
Received: by mail-wr1-f71.google.com with SMTP id q13so3484955wrn.14
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 06:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IIqYBA+zWYHGIVHmWkMZmRc4/aV6/M/YLfOxCEStLzA=;
        b=mQASn0Tdtt5MPCTG8fDxh9/eualZyVhpmb5PZxidkBSa0zHVUWEb+wRHLZkL2OzYMu
         TstvflS5cwULD5V+atP6yAb4F1RgmTiKKTwKE/49dq5aJWhaPvZAb9zd3O+pT83lHOTg
         hnQrFRWfx94YAsShqVFj9zaDe3zHjs/84Nt9aszkWoeqG7AcMvT/hVxKF+UqVqRdHLpP
         9Wm4Kthih84bN65nntjLatv8iyPPW9KfCK4neBn/aiO/V0yRVsO1ZYoYPIDGp9XqJ+pZ
         kZf+WPbEZoUSMHPcVIg6xu28LSiBWZOadnkCv6GKvXHTUCr0KV7iDy/cd6OK1/N9EPAZ
         toNw==
X-Gm-Message-State: AGi0PubKwNT7vtHQucxw4iYDeo2Biac4CCqBsFeZeS+X+0FUV6Zoj1gq
        if6WobAjvbac2mYijtIg98+4bWTbgXL9pkheKnibcas0v/Nf1CUVX5TVPz4jPr6WQ1RkuvgRZHg
        yGnJw3MzFUwTdFyCibOx9
X-Received: by 2002:a1c:a344:: with SMTP id m65mr10426900wme.20.1588859811065;
        Thu, 07 May 2020 06:56:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypIwAnvoxefEcd/qKnkHg94tVMuIrv053je3Uo2/AtZRCKv+Fv1bbTvx0/evD1Xr2qh12tA8pg==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr10426877wme.20.1588859810862;
        Thu, 07 May 2020 06:56:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d27sm9082327wra.30.2020.05.07.06.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 06:56:50 -0700 (PDT)
Subject: Re: [PATCH] USB: uas: Add US_FL_NO_REPORT_OPCODES for LaCie 2Big
 Quadra USB3 external disk
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
        =?UTF-8?Q?Julian_Gro=c3=9f?= <julian.g@posteo.de>
References: <20200507131708.250871-1-hdegoede@redhat.com>
 <20200507134921.GA1798390@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7ba56932-5dc9-e55c-3091-1c84303320bc@redhat.com>
Date:   Thu, 7 May 2020 15:56:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200507134921.GA1798390@kroah.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 5/7/20 3:49 PM, Greg Kroah-Hartman wrote:
> On Thu, May 07, 2020 at 03:17:08PM +0200, Hans de Goede wrote:
>> The LaCie 2Big Quadra USB3 external disk does not like the REPORT_OPCODES
>> request, causing probing it to take several minutes (and several resets).
>>
>> Add US_FL_NO_REPORT_OPCODES flag for this model to fix the probing delay.
>>
>> Reported-by: Julian Groﬂ <julian.g@posteo.de>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/usb/storage/unusual_uas.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
>> index 1b23741036ee..37157ed9a881 100644
>> --- a/drivers/usb/storage/unusual_uas.h
>> +++ b/drivers/usb/storage/unusual_uas.h
>> @@ -28,6 +28,13 @@
>>    * and don't forget to CC: the USB development list <linux-usb@vger.kernel.org>
>>    */
>>   
>> +/* Reported-by: Julian Groﬂ <julian.g@posteo.de> */
>> +UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
>> +		"LaCie",
>> +		"2Big Quadra USB3",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES),
>> +
>>   /*
>>    * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
>>    * commands in UAS mode.  Observed with the 1.28 firmware; are there others?
>> -- 
>> 2.26.0
>>
> 
> Already in my tree and in linux-next and will go to Linus this week,
> sorry.

No problem, I'm happy to see small but important fixes like this getting
picked up :)

Regards,

Hans

