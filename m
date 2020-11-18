Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347102B86F9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 22:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgKRVn5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 16:43:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28712 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725947AbgKRVn4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Nov 2020 16:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605735835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kj+T92G6A6K+o1IZ4t+vCMxhoP7c5ZhdFJiFe+XOOlQ=;
        b=Ob2Qv9iUb1p2EUPkwQb92cBSlZZ39V1fp7FWaLGk421shN2DYEmlX71mbd8HZRORsz7rXc
        gAK2kKJhTflYa1iS88fw8C4Gzvpcs/6mzKdUgfwbR7FHRhBxKqMKAgu8mx0GwOHZWFnbLX
        wLeaAbDZC6YBs9bmcTPyk//6OLGo5/w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-RyIcgSjZOIO4XmS1TFcP5w-1; Wed, 18 Nov 2020 16:43:52 -0500
X-MC-Unique: RyIcgSjZOIO4XmS1TFcP5w-1
Received: by mail-ej1-f70.google.com with SMTP id f21so1427061ejf.11
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2020 13:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kj+T92G6A6K+o1IZ4t+vCMxhoP7c5ZhdFJiFe+XOOlQ=;
        b=puxeuJvrcjZt1E8CtNvvFFgCW/3i2d/BVfa4pl+gOKJgqAbzgmrFpkAsbi2qHL+p79
         l7ObC3vPq/jZCXWEQwCY0olYcTdOo0F5tpzLPgS5mIfizAZax55roxHcz/JgKpHaRrBx
         ZZGYbv7Zpzx1M0x7hiQk5MXDBbxHpLVZpy/NycjEbDn+yUVbv8gjwWyWiK0lKR8sEeQV
         /ZUToyT9ZjPjUwTUl/CL51pQc1ynsvz99xtrOMy1Wgeg36GZC1hi2F90c/Wgxe/xyt4M
         bQX58ATRL0ZKZ7W37YK9P1jBBJ5jZfhUzszlkeZo54gD3zkfSmwC52EUKB92FuUqmVlC
         H0zg==
X-Gm-Message-State: AOAM532fmCq/Pik4pZmJldiJasLcAXXXzfoNTJ325/65pmYmWenQcz2I
        T5rwen3MkYDdTw1fGby88GC36BKQjBB57CIZRuVjnx2YpTpMuAY/tKnJYYhXj3Z1Fr+wMwXGEAw
        WGGpwixhZL/hab5L8GW8C
X-Received: by 2002:a17:906:6d13:: with SMTP id m19mr26056411ejr.345.1605735831306;
        Wed, 18 Nov 2020 13:43:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpVTOf712ePIqYNELgIb8+P2/JMA5z4qnKUkPQe6/OfuUT8AvEkwzkF3JEh0SALlmcAFbsSg==
X-Received: by 2002:a17:906:6d13:: with SMTP id m19mr26056392ejr.345.1605735831110;
        Wed, 18 Nov 2020 13:43:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id a26sm14131213edt.74.2020.11.18.13.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 13:43:50 -0800 (PST)
Subject: Re: 5.10 regression, many XHCI swiotlb buffer is full / DMAR: Device
 bounce map failed errors on thunderbolt connected XHCI controller
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org
References: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
Message-ID: <a2dd7f53-aeff-bf4d-67a7-5eb5f809da8b@redhat.com>
Date:   Wed, 18 Nov 2020 22:43:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

On 11/10/20 12:36 PM, Hans de Goede wrote:
> Hi All,
> 
> Not sure if this is a XHCI driver problem at all, but I needed to start
> somewhere with reporting this so I went with:
> 
> scripts/get_maintainer.pl -f drivers/usb/host/xhci-pci.c
> 
> And added a Cc: linux-pci@vger.kernel.org as bonus.
> 
> I'm seeing the following errors and very slow network performance with
> the USB NIC in a Lenovo Thunderbolt gen 2 dock.
> 
> Note that the USB NIC is connected to the XHCI controller which is
> embedded inside the dock and is connected over thunderbolt!

Ping? This is still happening and although the errors are not fatal,
outgoing network performance is very bad.

I know a lot of Linux users use thunderbolt docks and for some
reason almost all thunderbolt docks seem to be using USB attached
nics inside, so this is going to hit a lot of users if we do not
get this fixed before 5.10 gets released!

Regards,

Hans





> So the errors are:
> 
> [ 1148.744205] swiotlb_tbl_map_single: 6 callbacks suppressed
> [ 1148.744210] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1148.744218] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 16ea@1411c0000 dir 1 --- failed
> [ 1148.744226] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1148.744368] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1148.744375] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 16ea@10aabc000 dir 1 --- failed
> [ 1148.744381] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1148.745141] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1148.745148] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 118e@1411c0000 dir 1 --- failed
> [ 1148.745155] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1148.951282] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1148.951388] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 118e@140988000 dir 1 --- failed
> [ 1148.951420] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.013342] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1151.013357] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 1d2a@1411c0000 dir 1 --- failed
> [ 1151.013373] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.018660] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 18 (slots)
> [ 1151.018696] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@1411c0000 dir 1 --- failed
> [ 1151.018711] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.223022] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1151.223102] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@10aabc000 dir 1 --- failed
> [ 1151.223133] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.228810] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1151.228870] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@10aabc000 dir 1 --- failed
> [ 1151.228898] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.234792] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1151.234852] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@10aabc000 dir 1 --- failed
> [ 1151.234882] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> 
> etc.
> 
> This happens as soon as I generate any serious amount of outgoing network traffic. E.g. rsyncing files
> to another machine.
> 
> Regards,
> 
> Hans
> 

