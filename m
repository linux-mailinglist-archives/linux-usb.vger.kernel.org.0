Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4744323DF90
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 19:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730388AbgHFRt2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 13:49:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48801 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728303AbgHFQeJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 12:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596731641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=iXXBsdFsjG0AvWbozS5TM/6jCyRmSiGnwGpTHsoFV+k=;
        b=YiXxaTkBfEy3fQ5l6B08lgpuiaqBCll8BTHP2mOscfQl4hJh/8grinEJZTIjzCOy9Npuxy
        sCJvz9m4T7oE76z5tO/YFQsBCvaGpZ46UdIm7kccxiKie/U+PmepqenJUIebmv8aOq2Lul
        nlGowjML93Fb9SQZ17eGbf+NI7EKI0g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-QDSbODw9ND2O2gkfovEvgQ-1; Thu, 06 Aug 2020 07:55:58 -0400
X-MC-Unique: QDSbODw9ND2O2gkfovEvgQ-1
Received: by mail-ed1-f69.google.com with SMTP id p26so13001973edt.11
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2020 04:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=iXXBsdFsjG0AvWbozS5TM/6jCyRmSiGnwGpTHsoFV+k=;
        b=RcH8HYE+Bp9E8zYfJcoytnMiLOy4oTAquRhHpAcV33gg5T5riGZ1PIVbcES948TkR3
         vAmQdAodu+NCErAJxlFyOeBePEQfw0qcZAABzzSOfo3YoT9468s92QW8jSYNAYmBCtoH
         Gwqqqqr7Q7+Md5RLSxHPYuppwdyEwisGnlpPGINBlJn8QMD1CiH6RCviMe65/YiMONrm
         bgW5YQDSUdoIgE0kNekWY6RAqZnjPXQIJ9qUc5rwkiaKxvwHQvzTzFi2bLhWUgxBEccD
         01bfAwjxmD7px5r41aTwhDZHubkxhBck6oNBiXBuOFkKt7ofRtPcwXs0YzeyGY8MQsM0
         LQCA==
X-Gm-Message-State: AOAM531Su/Cpf4YnqyTmeSsS+E8tJZ1sGvHoK83wV6ct3yuT9Oz2o1/K
        Xxuhm78nK0hEnuRb3gMrSGZluA7GIgJ0xlfKjgBAa7Jz0b35h1p3ht4/zUv1IlhAKMHpctB+dxA
        ct1yciYoNbMthbpbJtAZD
X-Received: by 2002:a17:906:3655:: with SMTP id r21mr4099931ejb.248.1596714957249;
        Thu, 06 Aug 2020 04:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkc1TbZjRAKp60EvwpPCOeYlnZrMHIZrWTZOXDgsJQ8oSXINKO4Ub2JbAaMIw+YbsZpDKH1w==
X-Received: by 2002:a17:906:3655:: with SMTP id r21mr4099916ejb.248.1596714957037;
        Thu, 06 Aug 2020 04:55:57 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id vr6sm3601089ejb.36.2020.08.06.04.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 04:55:56 -0700 (PDT)
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Christian Kellner <ckellner@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: XHCI-PCI: existing allowlist for enabling auto-suspend/runtime-pm in
 the kernel vs a userspace allowlist ?
Message-ID: <b8b21ba3-0a8a-ff54-5e12-cf8960651086@redhat.com>
Date:   Thu, 6 Aug 2020 13:55:55 +0200
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

ATM the kernel has a allowlist (coded as a big if) for XHCI-PCI controllers on
which to enable auto-suspend. This seems to consist solely of XHCI controllers
embedded inside Intel Thunderbolt controllers:

         if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
             (pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI ||
              pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI ||
              pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_XHCI ||
              pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI ||
              pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI ||
              pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
              pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
              pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI ||
              pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI))
                 xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;

I noticed this because it seems that the product-id for the TB controller
in the Lenovo T14 gen 1 is missing: 8086:15c1

At the same time we also have a more generic allowlist for enabling
auto-suspend/runtime-pm in userspace:

https://github.com/systemd/systemd/blob/master/hwdb.d/60-autosuspend.hwdb

ATM this only contains USB device ids, but there also is a second hwdb
file, auto-generated baed on info from ChromeOS (to avoid having to
duplicate this info):

https://github.com/systemd/systemd/blob/master/tools/make-autosuspend-rules.py
https://github.com/systemd/systemd/blob/master/tools/chromiumos/gen_autosuspend_rules.py

As you can see this second file already contains a whole bunch of
(mostly Intel vendor) PCI vid:pid pairs and udev will enable
runtime-pm on these based on the auto generated hwdb file.

To me it seems better for future XHCI controllers on which we
want to auto-enable runtime-pm, such as the missing 8086:15c1
model in userspace, together with the allowlist for runtime-pm
on other PCI devices in userspace, rather then to add yet another
quirk for this to to xhci-pci.c code.

The downside would be that this is somewhat inconsistent with
how we have done this before, still I believe that it would
be better / easier to maintain this in userspace (hwdb) in the
future.

So I was wondering what other people think about this?

Regards,

Hans





