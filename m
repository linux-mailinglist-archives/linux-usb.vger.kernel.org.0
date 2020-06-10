Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4C21F5108
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jun 2020 11:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgFJJVg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Jun 2020 05:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFJJVe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Jun 2020 05:21:34 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB746C03E96B
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2020 02:21:32 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a9so1569968ljn.6
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2020 02:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=23+iiOsH90npQiNR3ps23JQX9xIarhkMtgHXf80ZkjI=;
        b=OvZsfnmWeMFppV30C8OmPnNPBh8H3qR7jm2JTDO+Z+5ieP0haoDESFItogxILEfrRE
         p0wwUO+37uofpeY56pts1TIRdwk6C47pt3HpCJLpv8roUkr5Hp0WcB/7iqEIRE9Id5KE
         8ySDsiLxLjoLkK+cV+ZJWC0DbHa2yA5T71GO+jGXF1lQk+NX0Zy5qSZqNZrcNTzO3Rsb
         1MesZs0DMGC0sIz95KWpGVODAF0IDc3uL9v4HbvlCRt/yMgKVnjXK+LvUrKskLHUcIvU
         VQgrUer2Y3+NJ0lUBpveu+DvRVlHNW69SKoLmuPAEQ3ejgMYvVYrIjKYtr6nFBfjN3zG
         8A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=23+iiOsH90npQiNR3ps23JQX9xIarhkMtgHXf80ZkjI=;
        b=In8kv8lH/q4N1aczW5dVEuiVLenPkPD1+C/Wj4gP/pbP+coqV0O8Huy5kmTbGiqjbS
         LBKvgcw2VQ/cfBil6U1QtU6b35aEZ62mbcX7THfkxlq0Do982oqE8E7omqgnQPvkxA/R
         jP+C2VT9nffjGf/5ro12PCTsSa18gnRcBOrsaUe+TpAX+GzTmPbS+q3X/f5HVWioZbfG
         EtoGlE7bChab/9zJQzFgLUWP27UMv3vHvY82H2xOiMxk8a6RR17JrCC/j47Gg1aEUINg
         NgwadKkmy8ZcH6CNb+f8NjIVt6wSrmONBjHA+ZCJbQ7P7PCnoTF9VBNAzbof00Jv0XVy
         kGEg==
X-Gm-Message-State: AOAM530ZZ5EWkRqFzwG7dSV//BG0D4NFA1BMLdNjLF8m7ZrDkhQgXVw8
        mwuHWsnkl/5F8DKkUEl4c50qfg==
X-Google-Smtp-Source: ABdhPJy7mSTt4o8mEJOvvz/shV15r9ISy8PzaErKT4YGXs2IXm8khPEYLvIgs+gCZp86ZDeL/jGYIw==
X-Received: by 2002:a05:651c:1199:: with SMTP id w25mr1306889ljo.301.1591780891032;
        Wed, 10 Jun 2020 02:21:31 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8b6:350a:b96f:7066:1c4d:ff8d? ([2a00:1fa0:8b6:350a:b96f:7066:1c4d:ff8d])
        by smtp.gmail.com with ESMTPSA id o18sm4849528ljd.32.2020.06.10.02.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 02:21:30 -0700 (PDT)
Subject: Re: [PATCH 2/2] USB: hub: Suspend and resume port with LPM enabled
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        mathias.nyman@intel.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Qi Zhou <atmgnd@outlook.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        Keiya Nobuta <nobuta.keiya@fujitsu.com>,
        Jason Yan <yanaijie@huawei.com>,
        David Heinzelmann <heinzelmann.david@gmail.com>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200610064231.9454-1-kai.heng.feng@canonical.com>
 <20200610064231.9454-2-kai.heng.feng@canonical.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a6a241d4-309d-c022-b61b-050b90471324@cogentembedded.com>
Date:   Wed, 10 Jun 2020 12:21:20 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610064231.9454-2-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 10.06.2020 9:42, Kai-Heng Feng wrote:

> USB2 devices with LPM enabled may interrupt the system suspend:
> [  932.510475] usb 1-7: usb suspend, wakeup 0
> [  932.510549] hub 1-0:1.0: hub_suspend
> [  932.510581] usb usb1: bus suspend, wakeup 0
> [  932.510590] xhci_hcd 0000:00:14.0: port 9 not suspended
> [  932.510593] xhci_hcd 0000:00:14.0: port 8 not suspended
> ..
> [  932.520323] xhci_hcd 0000:00:14.0: Port change event, 1-7, id 7, portsc: 0x400e03
> ..
> [  932.591405] PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x30 returns -16
> [  932.591414] PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -16
> [  932.591418] PM: Device 0000:00:14.0 failed to suspend async: error -16
> 
> During system suspend, USB core will let HC suspends the device if it

    Suspend. Perhaps can be fixed while applying...

> doesn't have remote wakeup enabled and doesn't have any children.
> However, from the log above we can see that the usb 1-7 doesn't get bus
> suspended due to not in U0, because it requires a longer period for
> disabling LPM. After a while the port finished its U2 -> U0 transition,
> interrupts the suspend process.
> 
> Though PLC shouldn't be set for U2 -> U0 case, we can avoid all that by
> directly put the port from U0/U1/U2 to U3, and solves this issue.
            ^ putting                            ^ it?

> Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
[...]

MBR, Sergei
