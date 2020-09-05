Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3446125E74E
	for <lists+linux-usb@lfdr.de>; Sat,  5 Sep 2020 13:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbgIELiH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Sep 2020 07:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26100 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726491AbgIELhp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Sep 2020 07:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599305863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=jRq3l1S3Um+HFP1g6fJUj42uWgf4/EuFvqkzKR8X4MQ=;
        b=UxjZi9j3E7HLuRPF2GYyu7KdZovFuSJ3pRz/nh/HPTYZ6CZ+gOTGH/8MaH5PoxPjq3sEoe
        BOcbcwI4uhIKTbrwY3kl8NnO2u+abUcTTxIFu59kcJIIGj+UynXfI08ZZrOaLqNrm4GsId
        kg42MWx/bWCHE9bYl1CMmywfXBd6oQA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-sPmumLPhNXq6FtB_ofK-iA-1; Sat, 05 Sep 2020 07:37:41 -0400
X-MC-Unique: sPmumLPhNXq6FtB_ofK-iA-1
Received: by mail-ed1-f71.google.com with SMTP id z19so3579781edr.10
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2020 04:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=jRq3l1S3Um+HFP1g6fJUj42uWgf4/EuFvqkzKR8X4MQ=;
        b=aiZSFzaae+aOZTSWIQwCntMjU2WVQXmecs0SfoNrGrHkAuNhjugHKj/wB7P3Up5qdz
         Ulb50LzGnXT6vtgUr1iqVXz8yYJ20OzEq1hDA4TcjC0UE78LyRFs79YCLKt3jJVBL0QF
         w5pNbl+AsPXm00oXcJOGlUPatiDIiCXbOGnXq/A6ABAR6YWGGhpBlSDJfmCnlXiH7uKH
         muxZLJUokHlu147Bx8DVx5/9Cmss3VDPIAHlrRrF37SCYzqmOQIQthH/7EcGnSIiRUEj
         I4DxVKY1ai8h5A2mlyRhpzIDFzZMxVG+uzF9L1YM8DD8UnZJkyBtsf5E3/aJG2SMcZqz
         otng==
X-Gm-Message-State: AOAM531T9BWx5qQJMSpqHwNgIO48sb3Boz+3dpFlDA8L95nGIE9DLPDn
        ce43wf5/c3vvCrkDC76HznbLCCCsg38Zyvseluvv+GKeSkBs9+qLjE9dBiaOzcHHISvQFwGdYx0
        INDT4ZDfmCs87Z/x9TyY5
X-Received: by 2002:a50:8e58:: with SMTP id 24mr13408198edx.226.1599305860305;
        Sat, 05 Sep 2020 04:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnbGJFPfPFE90TE3p7hkkla6EHfvOuspZBWBtmpa4ZsWlAlx+GmChuRKUauy2CkE7FOLdM1w==
X-Received: by 2002:a50:8e58:: with SMTP id 24mr13408182edx.226.1599305860091;
        Sat, 05 Sep 2020 04:37:40 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v5sm8962212ejv.114.2020.09.05.04.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 04:37:39 -0700 (PDT)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
From:   Hans de Goede <hdegoede@redhat.com>
Subject: How to set USB_PORT_QUIRK_OLD_SCHEME on an usb-port ?
Message-ID: <2f2dd720-3ab4-ba0a-16bf-8b899aafa26d@redhat.com>
Date:   Sat, 5 Sep 2020 13:37:38 +0200
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

Hi All,

I have been debugging an issue with a 2-in-1 which
consists of a tablet + a kbd-dock, where the device
turns into a clamshell when docked into the kbd-dock.

The kbd dock is connected via pogo-pins. This works
fine when docked at boot. But there is an enumeration
issue when hot-docked (and the keyboard looses power
when the lid is closedm so this also triggers after
a suspend/resume):

[ 3498.924190] usb 1-3: new full-speed USB device number 5 using xhci_hcd
[ 3499.041725] usb 1-3: device descriptor read/64, error -71
[ 3515.215890] usb 1-3: device descriptor read/64, error -110
[ 3515.440369] usb 1-3: new full-speed USB device number 6 using xhci_hcd
[ 3515.603544] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
[ 3515.603574] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 3515.603596] usb 1-3: Product: ITE Device(8910)
[ 3515.603614] usb 1-3: Manufacturer: ITE Tech. Inc.

Note there is about 6 seconds before the keyboard becomes
usable, which is quite long when trying to unlock the
laptop after opening the lid.

If I set the USB_PORT_QUIRK_OLD_SCHEME on the port used by the kbd-dock:

echo 1 >  /sys/devices/pci0000\:00/0000\:00\:14.0/usb1/1-0\:1.0/usb1-port3/quirks

Then this changes to:

[ 4467.875008] usb 1-3: new full-speed USB device number 7 using xhci_hcd
[ 4467.878483] usb 1-3: Device not responding to setup address.
[ 4468.082476] usb 1-3: Device not responding to setup address.
[ 4468.289990] usb 1-3: device not accepting address 7, error -71
[ 4468.614928] usb 1-3: new full-speed USB device number 8 using xhci_hcd
[ 4468.662392] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
[ 4468.662423] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 4468.662444] usb 1-3: Product: ITE Device(8910)
[ 4468.662461] usb 1-3: Manufacturer: ITE Tech. Inc.

Which is a lot better wrt making the keyboard available for
use in a timely manner.

So now I'm looking into a way to automatically do this. I would
prefer to keep the handling of this out of the kernel, so I looked into
udev, but it seems that the usb_port_device_type device-s registered by
usb_hub_create_port_device() are not visible to udev?

At least I'm not seeing them, in the output of "udevadm info -e"


Note another option would be to set the global old_scheme_first kernel
cmdline parameter on this 2-in-1. That can be done with a simple
dmi_system_id table on which to do this, but adding such a table
seems undesirable.


A third option I guess would be to try and improve the probe time
of the kbd-dock under the new scheme.


Any input on this would be much appreciated.

Regards,

Hans


