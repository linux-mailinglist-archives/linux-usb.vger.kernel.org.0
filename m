Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1599A0EB
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 22:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392928AbfHVUOV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 16:14:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8525 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390489AbfHVUOV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 16:14:21 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4418EC045106
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2019 20:14:20 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id e9so3986427edv.18
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2019 13:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2UvdvCuXrl0h7fJo/arldEWlkBLPCCL3Lm9j8LHMiWo=;
        b=G1QfEl5Es9C5P5Z03yCtyBTxvMma7cohJ47LzD5sILQ+HOP7OtdlK7FYuszYFO7YgJ
         I/sEUfjY+/XL3/NdMIoWJo+rzPO5k8x8sG/93svSEsLifvz766pQQUBlS9Ov+H3EyZN2
         sfaYOGfk9Vd9hTSEpa/tEb8wpCNqA3qCVxrloNKYdcbayukiM51FLeoEW/xNyw4Esw32
         7belx8fSICjMg1SveEQXwGXpz5mrOs7kA4+Sd5L2xjUy5/X8O4Y/1HQDcN6XV4vTWg5J
         vuKrXIZ7w579bQu83Bp9gNQlxOBnBfB78eC39g5dSWsr38JZwa6qyZIMzDhKb3n9lt0E
         unmg==
X-Gm-Message-State: APjAAAW5CQ/JKwkl1qNjxsr7zwzFFTTo+2Mp3ppI3rE4yXZ10T1OYFBw
        1aZ3Mjb9odYlvmwTw1ca0piLgJOpxRPraJ2wIspSgrtr+os9lvxxEtCoWozU21ee0AvC5n3OBtL
        LEk3GpgIZXS3eyHAJ3ECy
X-Received: by 2002:a50:fb82:: with SMTP id e2mr723749edq.15.1566504858729;
        Thu, 22 Aug 2019 13:14:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbddc1LoUBWNo4n9CR327g6EQAG1AqwOacYReIUDBQdjIeGXlo+FxcuvsKWYTNEkIV+B8+cg==
X-Received: by 2002:a50:fb82:: with SMTP id e2mr723735edq.15.1566504858590;
        Thu, 22 Aug 2019 13:14:18 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id t24sm84364eds.45.2019.08.22.13.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2019 13:14:17 -0700 (PDT)
Subject: Re: AW: [Resend] [PATCH v3] usb: xhci-pci: reorder removal to avoid
 use-after-free
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1565946200239.8897@mentor.com>
 <fbbf1ed3-c0c0-9b34-aeec-32a6f3645d7b@linux.intel.com>
 <6d245699-b7d6-2b40-62df-366c88cba7dc@redhat.com>
 <0012c7c76be947f68e30eb687599bed3@SVR-IES-MBX-03.mgc.mentorg.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5c3779b3-5f0f-ef3c-20d2-f7ce4762d922@redhat.com>
Date:   Thu, 22 Aug 2019 22:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0012c7c76be947f68e30eb687599bed3@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 22-08-19 17:48, Schmid, Carsten wrote:
>> On 22-08-19 17:23, Mathias Nyman wrote:
>>> On 16.8.2019 12.03, Schmid, Carsten wrote:
>>>> On driver removal, the platform_device_unregister call
>>>> attached through devm_add_action_or_reset was executed
>>>> after usb_hcd_pci_remove.
>>>> This lead to a use-after-free for the iomem resource of
>>>> the xhci-ext-caps driver in the platform removal
>>>> because the parent of the resource was freed earlier.
>>>>
>>>> Fix this by reordering of the removal sequence.
>>>>
>>>
>>> Could all this be avoided if usb_hcd_pci_probe()
>>> used managed device resources as well?
>>> (using devm_request_mem_region(), and devm_ioremap_nocache())
>>>
>>> This way the iomem resource would be added to the same devres list
>>> as the platform_unregister_call, and the iomem resource should be
>>> released after the platform_device_unregister as devres_release_all()
>>> releases the resources in reverse order.
>>
>> Yes I believe that that would work.
>>
> I don't think so, because xhci_create_intel_xhci_sw_pdev registers it's
> resource through platform_device_add_resources which does not use devm_.
> 
> The only thing what is done through devm in xhci_create_intel_xhci_sw_pdev is
> ret = devm_add_action_or_reset(...)

Right, so if I understand correctly the problem with the current code (before your patch)
is:

Probe:
1. usb_hcd_pci_probe() uses request_mem_region()
2. xhci_create_intel_xhci_sw_pde uses platform_device_add_resources() which are a child of the previous region

Remove:
3. usb_hcd_pci_remove does release_region() while the child region is still in use
4. At end of remove() devm code calls xhci_intel_unregister_pdev

And the problem is we want to swap 3 and 4.

Now if we make usb_hcd_pci_probe() use devm_request_mem_region and drop the cleanup from usb_hcd_pci_remove

Probe:
1. usb_hcd_pci_probe() uses devm_request_mem_region(), this registers a release_region() with devm as cleanup
2. xhci_create_intel_xhci_sw_pde uses platform_device_add_resources() which are a child of the previous region and calls
    devm_add_action_or_reset() to add xhci_intel_unregister_pdev as cleanup

Remove:
3. usb_hcd_pci_remove does nothing of relevance
4. At end of remove() devm code runs and calls the cleanups in reverse order of registration! so it calls:
    xhci_intel_unregister_pdev()
    release_region()

Note the trick here is that the devm framework calls devm registered cleanup functions in reverse order of their registration, putting things in the right order.

Regards,

Hans
