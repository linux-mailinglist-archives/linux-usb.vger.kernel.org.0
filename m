Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0A2A6B918
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 11:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfGQJUL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 05:20:11 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35116 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQJUK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 05:20:10 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so22907803ljh.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2019 02:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hYXI+l8Qu5NweSPrUwfQUJuPuL+qi2u4WVczzUwmQ9U=;
        b=iFCNHiGyubutk/9c683ObfyjOEW5pBz2yRW5I/ZCsneI7y0tI+xy5hIh0p10BjI6yt
         Ku6IGA3UxnHYlQmQMRioOFdeKspbW1qqVl5KGOs56QTNl763ILTe2SPUNHp30VxaPvMM
         EOeM4mAe0/stGZcigFjGfB8OFDhW5cN6Re6j8AQH/NOsJB9kOuFNI5+1pxopF0idTiPU
         Pm/ViHW2HT8iq7XEGJcEc4sVOe7MZ6foeA+p4/FQEu/r4Rc8MWwqUJggJeB7fcKKgcUT
         lhyfWF/skxdeCigqOLunlS4engq+qhOgcG1FhMjyBTmIFYPmETnJk6Azg6D2Xhu0ovlb
         WVeg==
X-Gm-Message-State: APjAAAXm3CDUgqFrlrz3wGGKjZbWcm2IxuQEhV7oh3XkuhbYBMtuHW0h
        PAjY+RjaADmOdt8h2MOZP24gJfLOLy4=
X-Google-Smtp-Source: APXvYqxqVbM0AUpFqGqgMYr6wNIC2vT1M/u+0o4+yRMNZM2cfn4UAjGGVCwZaqdmOYgkdaNGrLTl0w==
X-Received: by 2002:a2e:7a19:: with SMTP id v25mr20396947ljc.39.1563355208329;
        Wed, 17 Jul 2019 02:20:08 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id h3sm4366058lja.93.2019.07.17.02.20.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 02:20:07 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hng6Z-0003nQ-R6; Wed, 17 Jul 2019 11:20:07 +0200
Date:   Wed, 17 Jul 2019 11:20:07 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Rogan Dawes <rogan@dawes.za.net>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v6] USB: serial: option: add D-Link DWM-222 device ID
Message-ID: <20190717092007.GD16694@localhost>
References: <CAOYdKdjBtYt_2CuBxaTYKXCt7En+ESdOKeJ+kEEvvcNhkYs_7w@mail.gmail.com>
 <20190717091134.GA5179@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717091134.GA5179@lisa.dawes.za.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 17, 2019 at 11:11:34AM +0200, Rogan Dawes wrote:
> Add device id for D-Link DWM-222 A2.
> 
> MI_00 D-Link HS-USB Diagnostics
> MI_01 D-Link HS-USB Modem
> MI_02 D-Link HS-USB AT Port
> MI_03 D-Link HS-USB NMEA
> MI_04 D-Link HS-USB WWAN Adapter (qmi_wwan)
> MI_05 USB Mass Storage Device
> 
> Cc: stable@vger.kernel.org
> Signed-Off-By: Rogan Dawes <rogan@dawes.za.net>

Perfect, thanks for sticking with it.

I'll queue this is up after the merge window closes.

Johan
