Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B697228446
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 17:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgGUPyr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 11:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgGUPyq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 11:54:46 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E64C061794
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 08:54:46 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id a24so10924631pfc.10
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=cWmiRVt9OP0cDzT8KrrhB9BgbTVxd4XxsTqHKDLwJrs=;
        b=RjLmoBahnFY2RMO9NnqvAF/ncJxKfJsRoF4DVRAyNB1D0wl2Iepph3a4Yh7OnjikAy
         N3bxu+chFLisbeWP2DNT/W60jCBRO4yMIkT0cdDTCDKwK+LfvgF/yilv/gWsIpad0A/8
         AcJe+sfs/B+Ydlw1LoMon/tZvyc5gmsYvfmp2gcuRyKu9hPw/DRwvPvHj405CbY8q3kM
         R0qHcDGiGZIeONwU9ac5iMz08SwSwcf4V1XXLDfVRzkGlBm5UY2NyfMJXJ9lksMwkt8L
         QTPAxnzZmIxjBaBBBM+P4tFGozmFuQsyRLJr0Inuy4RMkJtBeaWdGyqIYct9AShrL90X
         mj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=cWmiRVt9OP0cDzT8KrrhB9BgbTVxd4XxsTqHKDLwJrs=;
        b=qDwl/pd0um2x/GJ/MWokWj/9YOdKNQ17mtP0ka8m5vxRwLNQI7BmcoEiD3GX6umaPm
         ABQVr/Ku18QBPSP5dUqSZQPRRyQkLufQW6Sae4rfhEXdSDlonFB2ogJJvG6bWkOBvzUe
         rY6Zm2GbSOOYu6hqeclW1+j/2QO7nHYwOnM8KIm85j3nzhKoy01Jsf/lSbZ9b9wLxxY8
         Mwl+lli/YfjF2w7BJ83gqJneh7fxpysn2Xnq6ESonHxBrISlfPuslWJJAVdQJnOYZDvU
         MFq1rOm0w3cw/ptuuyGE0wMmytusrJ95dyfWAPzZsXLC4wLLcS8E+RPS1SLhYBYFKvM3
         pWcA==
X-Gm-Message-State: AOAM533bz5dnSUzUM5xR92bZHT8RdrMgY/OqU6YlfnStaZ0LSp08XDNb
        Iyko80z9VoFygkj5TGGMcGc=
X-Google-Smtp-Source: ABdhPJwNpr9wqohBG4nM2I01RkB/4ids7jdSoutCrlc3qpJylVUcKAxNNfKKyS8z+q22GWmLlSLEcQ==
X-Received: by 2002:a65:5c43:: with SMTP id v3mr22678277pgr.214.1595346885777;
        Tue, 21 Jul 2020 08:54:45 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id a26sm17795722pgm.20.2020.07.21.08.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 08:54:45 -0700 (PDT)
Date:   Tue, 21 Jul 2020 21:23:14 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Bjorn Helgaas <bjorn@helgaas.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <helgaas@kernel.org>, linux-usb@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: generic power management for USB subsystem similar to PCI one?
Message-ID: <20200721155314.GA395319@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
Currently I am working on removing legacy power management .suspend() and
.resume() callbacks from PCI subsystem. The updates aim to give power management
control to PCI core and let drivers do the only device-specific jobs without
using any PCI helper functions.

I was wondering if similar changes can be applied to the USB subsystem?
I explored and found that .suspend() in USB drivers also accept the pm_message_t
type argument.
Also, .suspend() and .resume() in usb drivers, accept "struct usb_interface *"
type argument which seems similar to PCI legacy drivers accepting
"struct pci_dev*" type.

Moreover, "struct usb_device_driver" seems analogous to "struct pci_driver" as
it also has .suspend() and .resume() callback. Also, it has a bitfield
"generic_subclass:1" which is described as, " @generic_subclass: if set to 1,
the generic USB driver's probe, disconnect, resume and suspend functions will be
called in addition to the driver's own, so this part of the setup does not need
to be replicated. "

So the generic PM, talked about in USB drivers, is similar to PCI one? The
non-generic PM in USB is similar to legacy PM in PCI?

A similar update for the USB subsystem is possible?

--Vaibhav Gupta
