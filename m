Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6266D2AD564
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 12:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731106AbgKJLgx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 06:36:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45156 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730117AbgKJLgx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Nov 2020 06:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605008211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=PrGAKVagvZ8eCK0FrYU3d1oHprXELoDjKZm4mUCI5qA=;
        b=gAQjkpBwAM+jMKKqq9kgUjhHNNUvqEx4yIB366wTY25nMZcvhFx1tc9GWhOLcuLDo/c4db
        2KTHMHo3uNgo+SdJl/tjHgUlWD5fn16XZ28/FzfRG/ytrxIxyeZqM8lIAR/dXbnrjzcK7P
        bJfN9xOxF38gZeTsYmpskb4bNTyWnO8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-YYaX-AxQM62Nc6Sr3SmIPQ-1; Tue, 10 Nov 2020 06:36:49 -0500
X-MC-Unique: YYaX-AxQM62Nc6Sr3SmIPQ-1
Received: by mail-ed1-f70.google.com with SMTP id h6so4061751edt.12
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2020 03:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=PrGAKVagvZ8eCK0FrYU3d1oHprXELoDjKZm4mUCI5qA=;
        b=VkEfG1FAdSi0ayvGKXeboAP4ngtlGz8CpJXTyN6QvxdfE0YJHs/jeI9H+JvttBV72C
         jRPh1iK7FdHRKLvzBL4rYt4yeYvrYSb6x/DLw5CAWII/CxDXKzNh6jNayQpIqr19l3It
         GHifOSBuldH7+j83hK8P6P7GAPzhZsZk8PJU4k+bDYQx4IjAuDf/qmV10VpXJpzhf33h
         FkPbJOuFmJyKm68x3pwT2Tuxrh3suZ9iA4Mvwt6sussUX2zABtPGLZNvDBTy83+Z1YXP
         R49FKFQXIb61HMYcIbA8SO8XtCDDCHejG8QNoiYYjFD2E2NHJ8zTmEzfAI9m6U4blukn
         zlnA==
X-Gm-Message-State: AOAM533q2hmdjyMgxHDEHyqIH/P4t0l0mH5JN9Q4Pa3xIebueghOmX2J
        KIMVhAhSiJehi7+bnF+MNY8oY7fC1ppy94ZBvTkd8gzoFXHrkoClKWKmbiXbc4kkHcUjQg+bixs
        nJOgWiRcrvG8aDtLDqSM4
X-Received: by 2002:a17:906:2b06:: with SMTP id a6mr20501742ejg.283.1605008208402;
        Tue, 10 Nov 2020 03:36:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0T7oj4nyQygzaRngCVKujGhEFLIUzYpC/bDcY/s9IV0O4fegRChPJ3kfISgNtVqUK7ybI+g==
X-Received: by 2002:a17:906:2b06:: with SMTP id a6mr20501730ejg.283.1605008208230;
        Tue, 10 Nov 2020 03:36:48 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id s12sm10225439ejy.25.2020.11.10.03.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 03:36:47 -0800 (PST)
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org
From:   Hans de Goede <hdegoede@redhat.com>
Subject: 5.10 regression, many XHCI swiotlb buffer is full / DMAR: Device
 bounce map failed errors on thunderbolt connected XHCI controller
Message-ID: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
Date:   Tue, 10 Nov 2020 12:36:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

Not sure if this is a XHCI driver problem at all, but I needed to start
somewhere with reporting this so I went with:

scripts/get_maintainer.pl -f drivers/usb/host/xhci-pci.c

And added a Cc: linux-pci@vger.kernel.org as bonus.

I'm seeing the following errors and very slow network performance with
the USB NIC in a Lenovo Thunderbolt gen 2 dock.

Note that the USB NIC is connected to the XHCI controller which is
embedded inside the dock and is connected over thunderbolt!

So the errors are:

[ 1148.744205] swiotlb_tbl_map_single: 6 callbacks suppressed
[ 1148.744210] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
[ 1148.744218] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 16ea@1411c0000 dir 1 --- failed
[ 1148.744226] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
[ 1148.744368] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
[ 1148.744375] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 16ea@10aabc000 dir 1 --- failed
[ 1148.744381] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
[ 1148.745141] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
[ 1148.745148] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 118e@1411c0000 dir 1 --- failed
[ 1148.745155] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
[ 1148.951282] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
[ 1148.951388] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 118e@140988000 dir 1 --- failed
[ 1148.951420] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
[ 1151.013342] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
[ 1151.013357] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 1d2a@1411c0000 dir 1 --- failed
[ 1151.013373] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
[ 1151.018660] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 18 (slots)
[ 1151.018696] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@1411c0000 dir 1 --- failed
[ 1151.018711] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
[ 1151.223022] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
[ 1151.223102] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@10aabc000 dir 1 --- failed
[ 1151.223133] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
[ 1151.228810] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
[ 1151.228870] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@10aabc000 dir 1 --- failed
[ 1151.228898] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
[ 1151.234792] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
[ 1151.234852] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@10aabc000 dir 1 --- failed
[ 1151.234882] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11

etc.

This happens as soon as I generate any serious amount of outgoing network traffic. E.g. rsyncing files
to another machine.

Regards,

Hans

