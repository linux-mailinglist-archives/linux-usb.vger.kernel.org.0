Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A870691239
	for <lists+linux-usb@lfdr.de>; Sat, 17 Aug 2019 20:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfHQSc6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Aug 2019 14:32:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40948 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbfHQSc6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 17 Aug 2019 14:32:58 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7B8D2C08E2A3
        for <linux-usb@vger.kernel.org>; Sat, 17 Aug 2019 18:32:57 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id l15so5309906edw.15
        for <linux-usb@vger.kernel.org>; Sat, 17 Aug 2019 11:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OC9PiftOYbFbLhkC7jHXHNO9YNnO83z5oBIxRe8ZowI=;
        b=QjTz1VXE4wN6d2Oxyo2JuLaGt+7FaBrJJ7oIiGZuWw/z3KyumaW5KUl/B/Sf4AACnf
         0J5ppTp8fQrRRZbuU4iPBixQF7qjyzQu0CFuGfjUBowneiAqMXz6igBcee3WkTvTxr2V
         vhsgl6jjvEh4O05RR32ZBr633PvgG+jzTOMLEGi06vVjPiP9HVWKcGok0QTlNHkU0MFL
         HEr/G7ScQW3QHbUPQnow3cyv3HWztE+HXD0c7Q8Lz+BNYo/oJqwopoU7imLz4HdrFGzc
         UqDs2zE6Vb1H1Jbn94K0AQz3dlEysHEyympFnhRVWclFCcE1oExoXwJIEjI7mmIDIaUA
         ngtg==
X-Gm-Message-State: APjAAAXf8A3+Nw7eTo7HyAgt/ud3cEPhouD/4PgnQn8/LBvuZ+1WuRt+
        gKtMGkQh7Ue9lreOb4Lel4SgUfV2Idzb46PIMqUdsE621Zeu98S/PNoFZSQngefN29Lpswsg1gf
        OPwzn1cYFBLG46CF47s2+
X-Received: by 2002:a17:906:b29a:: with SMTP id q26mr14468856ejz.144.1566066775861;
        Sat, 17 Aug 2019 11:32:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzTOdtUHTz5vXufY/kxfvimIAsKLzu2viIu+rZcPE0C1kbx873yacRka3/ht9rj65JtRE/zzg==
X-Received: by 2002:a17:906:b29a:: with SMTP id q26mr14468848ejz.144.1566066775686;
        Sat, 17 Aug 2019 11:32:55 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id f35sm1777709edf.70.2019.08.17.11.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Aug 2019 11:32:54 -0700 (PDT)
Subject: Re: [PATCH 2/3] usb: typec: fusb: Use usb_debug_root as root for our
 debugfs entry
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
References: <20190815191815.755606-1-hdegoede@redhat.com>
 <20190815191815.755606-2-hdegoede@redhat.com>
 <20190816075109.GF24772@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2c94af50-3011-9374-5afb-0d4d69b712f3@redhat.com>
Date:   Sat, 17 Aug 2019 20:32:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816075109.GF24772@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 16-08-19 09:51, Heikki Krogerus wrote:
> On Thu, Aug 15, 2019 at 09:18:14PM +0200, Hans de Goede wrote:
>> Use usb_debug_root as root for our debugfs entry instead of creating our
>> own subdirectory under the debugfs root.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I have one question below. Otherwise:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
>> ---
>>   drivers/usb/typec/tcpm/fusb302.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
>> index 93244d6c4bff..69a2afaf8f68 100644
>> --- a/drivers/usb/typec/tcpm/fusb302.c
>> +++ b/drivers/usb/typec/tcpm/fusb302.c
>> @@ -26,6 +26,7 @@
>>   #include <linux/spinlock.h>
>>   #include <linux/string.h>
>>   #include <linux/types.h>
>> +#include <linux/usb.h>
>>   #include <linux/usb/typec.h>
>>   #include <linux/usb/tcpm.h>
>>   #include <linux/usb/pd.h>
>> @@ -206,23 +207,17 @@ static int fusb302_debug_show(struct seq_file *s, void *v)
>>   }
>>   DEFINE_SHOW_ATTRIBUTE(fusb302_debug);
>>   
>> -static struct dentry *rootdir;
>> -
>>   static void fusb302_debugfs_init(struct fusb302_chip *chip)
>>   {
>>   	mutex_init(&chip->logbuffer_lock);
>> -	if (!rootdir)
>> -		rootdir = debugfs_create_dir("fusb302", NULL);
>> -
>>   	chip->dentry = debugfs_create_file(dev_name(chip->dev),
>> -					   S_IFREG | 0444, rootdir,
>> +					   S_IFREG | 0444, usb_debug_root,
>>   					   chip, &fusb302_debug_fops);
> 
> In tcpm.c you named the entries "tcpm-%s", dev_name(...
> 
> Shouldn't we do something similar with these as well? I mean,
> even though this is just debugfs, shouldn't we give some hint for the
> user how to identify these entries?

Well on my test-machinw te dev_name is i2c-fusb302, but I realize the
dev_name is not always going to be so descriptive, so I will send
out a v2 adding a "fusb302-" prefix, like how we are doing for the
tcpm.c debug entry already.

> How about if we still continue grouping the entries under the
> "fusb302" directory, but just place that under usb_debug_root?

I would rather go with a prefix, the whole purpose of dropping the
subdir is so that we do not have a resource (the dir) shared between
multiple instances of the driver.

Regards,

Hans

