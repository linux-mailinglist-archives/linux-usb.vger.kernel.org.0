Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89B98ED95
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 16:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732663AbfHOODQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 10:03:16 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36480 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732205AbfHOODP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 10:03:15 -0400
Received: by mail-wr1-f67.google.com with SMTP id r3so2336683wrt.3
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 07:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4sFRcD1ANoWWQjD+WhW2uig+aUbXyWs74RzRVjo7E7o=;
        b=rvdUxbMqlxROAeNx8rB59CCad1zoXoGzWJ/hRL0HlSv2Eo6k8OB18xu6AWHS9DHHUz
         eU1gzMCbwCp/guc2t9847h4VnBurj1/WCoY5kQIKy6C5pZuF6s0uzx9jxHbi7Yyfu1AM
         zTzUuZhB+FsSq/LQRHyZ26+xd5GPBwyWDLxkpKhETiSQyL2KG15Jfh8n/1O4Ov+EhoKV
         3vZ1MdRuwXIM5pR+hOsuSKDOCNahI2HegF5RYzqyhYfyA5qsW/43fUkOO5F5Lxs7B0jM
         rrocg4Lm6+k7r/6DGqKID9PV/mM6jk2gJ0wfn4bO1g7+1jSt66V0RjELII6UYt3Xw7/X
         Fsng==
X-Gm-Message-State: APjAAAVe6NsIZMg8XN2Z746G5AJH1ACYqnmjHdEN2pIF+rNkGuY8ZUmq
        +/Wbpw/uaqkAn7ZejVHtitdBHQ==
X-Google-Smtp-Source: APXvYqwOA1TUL5mIA6h1Tmg6qNpWnTKtEDEY963alOerUO+bTFmeEckdF/0ltUvBOOFFdQ5wGxXd6g==
X-Received: by 2002:adf:f0ce:: with SMTP id x14mr5695032wro.31.1565877793938;
        Thu, 15 Aug 2019 07:03:13 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id t63sm1590627wmt.6.2019.08.15.07.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 07:03:13 -0700 (PDT)
Subject: Re: [PATCH 0/3] usb: typec: fusb302: Small changes
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190814132419.39759-1-heikki.krogerus@linux.intel.com>
 <a826c351-4e9d-8a33-ad0f-764d13aeb1ed@redhat.com>
 <20190815125544.GC24270@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3f44f67a-9f13-3851-e218-7f9c14d8f996@redhat.com>
Date:   Thu, 15 Aug 2019 16:03:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815125544.GC24270@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 15-08-19 14:55, Greg Kroah-Hartman wrote:
> On Wed, Aug 14, 2019 at 03:42:46PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 14-08-19 15:24, Heikki Krogerus wrote:
>>> Hi,
>>>
>>> This series removes the deprecated fusb302 specific properties, and
>>> stops using struct tcpc_config in the driver.
>>
>> Series looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> This has a small conflict with my
>> "[PATCH] usb: typec: fusb302: Call fusb302_debugfs_init earlier"
>> patch.
>>
>> Since we've agreed to do the rootdir leak fix as a separate patch
>> (which I will write when I find some time probably tomorrow), I
>> was wondering if we can merge my patch first. I would like to see
>> a "Cc: stable@vger.kernel.org" added to my patch and then it would
>> be good to have it merged first.
>>
>> Regardless we should probable prepare one series with all patches
>> for Greg to make this easy to merge for him.
> 
> I'll take this series now, and you can redo your patch based on my
> usb-next branch with them in it.

Ok.

Regards,

Hans
