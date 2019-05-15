Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 610861E98E
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 09:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfEOH4T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 May 2019 03:56:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56109 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOH4S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 May 2019 03:56:18 -0400
Received: by mail-wm1-f66.google.com with SMTP id x64so1543832wmb.5
        for <linux-usb@vger.kernel.org>; Wed, 15 May 2019 00:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rBex1R9irR8avZOElxAJHU70GLvNreCgKQt4QdExZ90=;
        b=SluTyKcCl6WXTC6B8cG+tW+gV5I+1HneedKnl9R9nJTDQ57laZrekoNH50LMRQinL9
         jKO+siRsPSvuCwp3kHA1Sx0eQJCBWdQNOEM8sDGGtRXfgvtEf2aQiLXkrAvbz+IM91z/
         BUIY167oEXuCYY0FWhWXcuA91jEcWdqwOI6yQ/vmFEI0vki/7NRIYXgs2hgq5SYCNuBB
         qt+okyGxmOtqrK3BM6nVxdOdiJ6uQ5bjIWVB9OzTVVSdGJOvOgchDigYT0KsO+EF1XMj
         arWXYW3LLFZrhDbrJZwjUibn4DikorvpDIs5HdWnUpplB7D/eq6B+Z2/ULf4rE/D9ipY
         zBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rBex1R9irR8avZOElxAJHU70GLvNreCgKQt4QdExZ90=;
        b=qszWQRrWkTW0xsvQde4qoMR0M5G46GnM7927lejbe2Oa+0kK/ffMDxEx0OJSrRJ6Z7
         1uAg7CE3JGAmYMtQiME4FugUASNIYBKbL7ToJ4/GdUL/WWSgzok2dB3UHgVfBH4E7t/y
         lDSgh3Ez56d0cRt1zC5mOw0Qeh/pKw7VMVf5mwPcwQF7Dzb0g11v/+zWbX+Txaj9BYYa
         MLljHouDwlvAg4DyG85uXsx2KSetL+7Go2gCqYcFUHMHGssb/IVHiD9vSBoGgx/yUIin
         4Hv74NZuHUderTLQpa1q6O2luRGF2Eqye/FwcBe9SdYBzuc0iRAA6HBsybt1VPUYjKvc
         KOvw==
X-Gm-Message-State: APjAAAV5WrZead5tzacfUddg6jPryHxg/NATa9ct6kc8WRnzasziL8MJ
        emH6b3CPHOfhAvP6HSW/J+g=
X-Google-Smtp-Source: APXvYqymW2MN2a95wioLbYgs+h+ZvgQ2fCj8d+MFdr1X2p+Qp5IRpPGBDrFLcxJpHTU9duQ4YsELTw==
X-Received: by 2002:a1c:f311:: with SMTP id q17mr22419717wmq.144.1557906976425;
        Wed, 15 May 2019 00:56:16 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id s124sm1613878wmf.42.2019.05.15.00.56.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 00:56:15 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on AMD
 boards.
To:     Joerg Roedel <joro@8bytes.org>, Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        iommu@lists.linux-foundation.org
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
 <20190429094847.GI26546@localhost> <20190503153716.GE11605@8bytes.org>
 <8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
Message-ID: <4e7f0267-eba8-81c3-4036-25924ea9df98@gmail.com>
Date:   Wed, 15 May 2019 09:54:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
can I still help with this problem? It's very important for us. Thank you.

starosta

Dne 6.5.2019 v 9:10 StarostaCZ@gmail.com napsal(a):
> New test on kernel Linux version 5.1.0-050100-generic. Same problem, 
> system crash after a few seconds.
> Full kern.log: https://paste.ee/p/EmLsw
> I can do access to my pc through SSH if useful.
>
> starosta
>
> Dne 3.5.2019 v 17:37 Joerg Roedel napsal(a):
>> On Mon, Apr 29, 2019 at 11:48:47AM +0200, Johan Hovold wrote:
>>> So this is a debian 4.18 kernel seemingly crashing due to a xhci or
>>> iommu issue.
>>>
>>> Can you reproduce this on a mainline kernel?
>>>
>>> If so, please post the corresponding logs to the lists and CC the xhci
>>> and iommu maintainers (added to CC).
>> Your kernel is probably missing this upstream fix:
>>
>>     4e50ce03976f iommu/amd: fix sg->dma_address for sg->offset bigger 
>> than PAGE_SIZE
>>
>> Regards,
>>
>>     Joerg
>>
>

