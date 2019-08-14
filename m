Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499A18D4D5
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 15:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfHNNgU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 09:36:20 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45911 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfHNNgU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 09:36:20 -0400
Received: by mail-ed1-f66.google.com with SMTP id x19so104021579eda.12
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 06:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=68DB8FpNyz/xvwHTz/53FL52+cNRcvVUiqSY+S0JFvo=;
        b=JcYDryIewBdNOdLmAytHRS7bZvFsJk12ha1VFwc9zw3vmDQwi5wHszwWlLS+nH0g64
         YGu3kY+s63zjCeONmI5N/JmPeK4nXU/aOu7IEH01v/q4qEq2ylEseXniIGy3b17kWdi4
         uOmEFbjqqZ4HqZBllluYO/b7GhWqHAPPgfXgrodpk1+9s+Ck4zXEVG6qlg1C1AcuqNLE
         dXnqze8qgUeZMV5sxSUu8Vkfh50Dq6cXEXASzUWK3ZE4AwHX8fWJDspLPJuN9jiiarks
         8ZJ5A4Mt86JV82A9laxHdwAk7CRCH8rJjLM8Jm9BBSJQmtvQr/3Y9tvONFGomDsKRCGL
         yBCA==
X-Gm-Message-State: APjAAAUOynFmMNF9m5MamxmJLLMfie4SrZYl4BmaH/mZLqN4xTbLzBvr
        g5ZPQyUEwS9rJSFOueQHjibrBaw42lw=
X-Google-Smtp-Source: APXvYqxwHCscSvRHUlb/17nhOuGAT9JAw/bMFkewGIFB9Qbh3GoDo1odWi3rfGE5iQivSL/yoFEOdg==
X-Received: by 2002:a17:906:b203:: with SMTP id p3mr40149340ejz.223.1565789778436;
        Wed, 14 Aug 2019 06:36:18 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id f24sm24883381edt.82.2019.08.14.06.36.17
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 06:36:17 -0700 (PDT)
Subject: Re: AW: [PATCH] usb: xhci-pci: reorder removal to avoid
 use-after-free
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <1565782781938.37795@mentor.com>
 <15aa45c7-6e45-d03f-9336-4291f8b2dc66@redhat.com>
 <29aadcf136bb4d5285afb4fc5b500b49@SVR-IES-MBX-03.mgc.mentorg.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <662c2014-f52c-a4a7-cbf0-78d43c3a4f22@redhat.com>
Date:   Wed, 14 Aug 2019 15:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <29aadcf136bb4d5285afb4fc5b500b49@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 14-08-19 15:32, Schmid, Carsten wrote:
>>> On driver removal, the platform_device_unregister call
>>> attached through devm_add_action_or_reset was executed
>>> after usb_hcd_pci_remove.
>>> This lead to a use-after-free for the iomem resorce of
>>> the xhci-ext-caps driver in the platform removal
>>> because the parent of the resource was freed earlier.
>>>
>>> Fix this by reordering of the removal sequence.
>>>
>>> Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
>>
>> Assuming this has been tested, overal this looks good to me.
> 
> Tested on 4.14.129, ported to v5.2.7, compiled there.
> 
>>
>> But there are 2 things to fix:
>>
>> 1) Maybe pick a more descriptive struct member name then pdev.
>>      pdev with pci-devices often points to a pci_device ...
>>      How about: role_switch_pdev ?
> 
> Ok, good point. Had platform dev pdev in mind ...
> 
>>
>> 2) xhci_ext_cap_init() is not the last call which can fail in
>>      xhci_pci_probe(), since you now no longer use
>> devm_add_action_or_reset
>>      for auto-cleanup, you must now manually cleanup by calling
>>      xhci_ext_cap_remove() when later steps of xhci_pci_probe() fail.
>>      it looks like you will need a new ext_cap_remove error-exit label
>>      for this put above the put_usb3_hcd label and goto this new label
>>      instead of to put_usb3_hcd in all error paths after a successful call
>>      to xhci_ext_cap_init()
> 
> Right. Will review this path and correct accordingly.
> 
> Maybe an additional label isn't required because pdev is only set when
> xhci_ext_cap_init created the platform device, and xhci_ext_cap_remove
> checks for pdev being set.
> So a call to xhci_ext_cap_remove doesn't harm if pdev is not set up yet.
> But for readability it might be better to create a label.

Right, when taking a quick look myself I realized that an extra label would
not be necessary, but not having the extra label will confuse the reader
of the code, since now we are undoing something which we did not do,
so I would prefer if you use the extra label.

Regards,

Hans

