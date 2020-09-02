Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E589725A855
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 11:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgIBJHz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 05:07:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37203 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726140AbgIBJHz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 05:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599037673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=itfXi5ydKF26DkGVGbr7MeEwPHmVXELnbriTmj/3fRw=;
        b=Eo+uj4SUrCgIlERG8GbVyg8AHCudfy4yVpdqWGMm4LuL2e7k5+/wjyXZPmZf7umLmApRUS
        qaXm71UEGLwhshDj1R6fRgitiZQHiJ/l9su4SbpLMseIUQPC5sN4RCgV7k5XVypROb3w2x
        x8Way52DPFqtaoAxjKtnYdgttqHBD6Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-W05MkEvgP0Ot5NuIjQ-zkw-1; Wed, 02 Sep 2020 05:07:50 -0400
X-MC-Unique: W05MkEvgP0Ot5NuIjQ-zkw-1
Received: by mail-ej1-f70.google.com with SMTP id m24so1840825eje.20
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 02:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:cc:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=itfXi5ydKF26DkGVGbr7MeEwPHmVXELnbriTmj/3fRw=;
        b=kseHqXdyDZ/lzA8m1syu3lgdBgeKOb3cSZ08okQ+67vQYbwg3MQg7gqSo+/QGa0ZBC
         1fCGZDTxrdauarOIzZCHUmQOsitKMRlONte4NR8W5uySoklRWaKmUnpcl+QG9EM/G5IN
         yOxukirgNpZaS2iMC0CF8rroX5HPUi0raa2ztLsklPyWMH3VN29qFylH+w84qOtcxe0u
         fwO2f4ktqySEA17REWN8a8JKpy1fEVXmoHa5rzPzwvJjgltg6yac+mKTlBYYiiEV0Ayg
         y1d2wgzHIoWtXDCa7BLXAWO85vSrnLnEzUs28qG5YmMdGwryhbvgTYllaLLKQ9LYTlmv
         Rt7Q==
X-Gm-Message-State: AOAM5337N9Se69SSQksbWf4vkkMEKaYB4OOX05SA1Cz/+EOhziM8RblD
        3ee1xkmLm0U60cRe3rE7sLKB6QxFmGfXhoxsD1LCGf9/ds8HK9UhVjS2mNgkEdXEJ17618sTybm
        I22neJjnG5hTnO8l9Nas9
X-Received: by 2002:a05:6402:7cf:: with SMTP id u15mr5800720edy.90.1599037668727;
        Wed, 02 Sep 2020 02:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+RMmXWqyoY8IOtjjoHA+1Wt7lW72JwxvR9iHanqFIwl+750sJk2IXQKcaWLU/LmAYIUmEuA==
X-Received: by 2002:a05:6402:7cf:: with SMTP id u15mr5800703edy.90.1599037668485;
        Wed, 02 Sep 2020 02:07:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id nh1sm3853671ejb.21.2020.09.02.02.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 02:07:47 -0700 (PDT)
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
Subject: 5.8 regression: Low-speed interrupt transfers not working on (some?)
 9 Series Chipset xHCI Controllers
Message-ID: <428aa83d-ab2e-d391-3449-770d108bb087@redhat.com>
Date:   Wed, 2 Sep 2020 11:07:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I've been working with 2 Fedora users who both report that there
keyboard and mouse has stopped working after upgrading to
5.7.17 -> 5.8.4 .

After some back and forth I have found the following common pattern:

1. Both reporters have a "9 Series Chipset Family USB xHCI Controller"
2. Both reporters have a lo-speed (1.5M) keyboard and mouse connected to
    that XHCI controller
3. The kbd/mouse gets detected but does not send events.

So there seems to be an issue with lo-speed USB interrupt-transfers
not working on the "9 Series Chipset Family USB xHCI Controller".

One reporter is using a DELL Precicion T5610 laptop, the PCI id
of the XHCI controller there is 8086:8cb1 and both 5.7 and 5.8 dmesg say:

[    3.324639] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000000009810
[    3.324643] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported

The other reporter is using a Gigabyte H97-D3H motherboard. This reporter
reports that plugging the kbd/mouse into the USB ports which are connected
to the H97's EHCI controller works around the problem.

I have tried to reproduce this on some of my own systems, but I do
not have any hardware of this exact generation and I could not reproduce
it on the closest hardware which I do have.

Matthias, if you have some idea which 4.8 change might have caused this
I can build rpms with a test kernel with that change reverted for
the reporters to test.

Regards,

Hans

