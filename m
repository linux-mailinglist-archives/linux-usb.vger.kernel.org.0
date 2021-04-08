Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44FA357F67
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 11:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhDHJgx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 05:36:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44377 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230412AbhDHJgw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 05:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617874601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wTM1I51JiZsJTUXUcb2nxEiCnAUVBmnDvU5v/ZRgEw4=;
        b=hbSz3s2jkpmtH5OTjDkvlF1hC4fDqEXE9N0Hj1PgnNAqEpbx/hqCqJCNxPNyXT4eDlTtBz
        t3fGVDxku82sqoEeUmzpLViESTHBt12CQv/vMrtYQoRCdyXLmDCQqGzncd0DCVIQLXUpCB
        RWBDlotizck1qrlGEKvZj2e96oH0LHo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-jyQBF0fAPhOUa3oFf4kqng-1; Thu, 08 Apr 2021 05:36:40 -0400
X-MC-Unique: jyQBF0fAPhOUa3oFf4kqng-1
Received: by mail-ed1-f70.google.com with SMTP id h9so739031edb.10
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 02:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wTM1I51JiZsJTUXUcb2nxEiCnAUVBmnDvU5v/ZRgEw4=;
        b=s7nXPHDtepb0RohJUsPWqI+qNUruJLv98RJfRCDx1fExqc6FwHDMMesFJm8DgFCxXj
         S+7m+2N1VT7J156/VudTGsWOALNNvLwT+7JOsw6x8WkQB2s3jMXKxAJl+s2RTrMW+lhd
         AXafMgEit69ak617pY1Wf0PwwD0QNdSN1bCgd9VmvVwWcg6pabtMFixAy7UtFXoifRdp
         9tYMHdOL1dqsHE4KRDE1wGDFUVZFyRXiJ4fyk+J95e3DtQmxiGXSOixD5Re4FAFNjZEW
         VFlluG3bhOWDFoDrBGA//BRMWy9zWIWr0QrSkv+R38HnbMl2I2fLk/SQZWZgb6REtqj4
         hOIA==
X-Gm-Message-State: AOAM530eQitXLW0glhCEBveJkN2bUkxkAccUc0z/v6dcFp3nfe5wArhm
        qTYckJiVvpG4MwoSLrkb2tKPLJo34RyyicHK8xQwpu8xHJl2b76qIGgNtBxhWwtbhSUi4VyjQCn
        CjM2S6foc6PxmWMkRLmzd
X-Received: by 2002:a05:6402:440d:: with SMTP id y13mr10173749eda.316.1617874599128;
        Thu, 08 Apr 2021 02:36:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUBHZrOf3Gnnmrz1bbvSo4L3xkAULh43bt4NcE+gsmzaskCY3bVY8lUC4Ce/gr9PP5rscmSQ==
X-Received: by 2002:a05:6402:440d:: with SMTP id y13mr10173727eda.316.1617874598948;
        Thu, 08 Apr 2021 02:36:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id zc4sm514279ejb.77.2021.04.08.02.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 02:36:38 -0700 (PDT)
Subject: Re: [PATCH 1/1] usb: typec: tcpm: remove unused static variable
 'tcpm_altmode_ops'
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Zhen Lei <thunder.leizhen@huawei.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210407091540.2815-1-thunder.leizhen@huawei.com>
 <7e2797f7-0ba7-0362-ae34-a1d4fb265cd7@redhat.com>
 <YG7MG2yZbRlSJg9E@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a6465113-62b0-171b-9dad-55cbd1464607@redhat.com>
Date:   Thu, 8 Apr 2021 11:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YG7MG2yZbRlSJg9E@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/8/21 11:25 AM, Heikki Krogerus wrote:
> On Thu, Apr 08, 2021 at 11:10:38AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 4/7/21 11:15 AM, Zhen Lei wrote:
>>> Fixes the following W=1 kernel build warning:
>>>
>>> drivers/usb/typec/tcpm/tcpm.c:2107:39: warning: ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
>>>
>>> The reference to the variable 'tcpm_altmode_ops' is deleted by the
>>> commit a079973f462a ("usb: typec: tcpm: Remove tcpc_config configuration
>>> mechanism").
>>>
>>> By the way, the static functions referenced only by the variable
>>> 'tcpm_altmode_ops' are deleted accordingly.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>
>> I have a patch pending:
>>
>> https://www.spinics.net/lists/linux-usb/msg197684.html
>>
>> Which actually uses this. I really need to (and plan to) brush the dust of
>> this one soon and submit a new version.
>>
>> As such I would prefer for these ops to not get removed. But I guess I
>> can always include a patch in my series reverting the removal...
> 
> Well, can we then just leave the ops there? If we're going to
> re-introduce them back soon in any case, then why drop them in the
> first place.

Yes I'm in favor of just leaving them in place too, sorry if that was
not clear.

Regards,

Hans

