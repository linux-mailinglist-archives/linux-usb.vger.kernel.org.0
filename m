Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2383B0F17
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jun 2021 23:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhFVVCo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Jun 2021 17:02:44 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:40698 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhFVVCo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Jun 2021 17:02:44 -0400
Received: by mail-lj1-f180.google.com with SMTP id d25so42582lji.7
        for <linux-usb@vger.kernel.org>; Tue, 22 Jun 2021 14:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:to:cc:in-reply-to
         :references;
        bh=BUjvtf72w4Yiw9fUZso/Co2w3LxaQ/+ehSg1BeZe1Bo=;
        b=ZBbpiLj3Y2bLdv2hwyS4hvvEv6/ZKsPJgTF3im89YYNJC0BSIAqLdyI8x3v38BAave
         DUoH3Lb6JUqCEwuqWMCHSP+jQGSIoT1oZOnEcv+GcipvE3kVLDPM9zcOfjo2w7DsTOu9
         FBsab8KqarX5ADzTsnEoQY/P7r3hfnS9Ui9xEwDIhK41cBIsP+9522Ra4LF1PFasYHjN
         Ll1wT2QTbW0oHETgAQUDnLjUuvCT4n6hjvDaS+HtR5k1CSm2hFOg8uf0RNLydVGyUJqI
         ky5h7L9XyqkxrFbuevhm/NZcrea32okyQsinTqAvn5dblH8j/dao2RfA9IA7Qw7FudAN
         ifDg==
X-Gm-Message-State: AOAM533/tsvKAjs6igzMLNhWxBrH9q98oc/plOwPuzOybDCFAV3EpYDR
        mQ6/3dJ01uFuMfxuMjYDe0M=
X-Google-Smtp-Source: ABdhPJw0GmqNijdQtQczvQEzvjZ19XE7VEQIl+OyoVBp/zLRPcDEjxUGC10z4T8lGufZZd+l2Uv7ew==
X-Received: by 2002:a2e:9b58:: with SMTP id o24mr4917732ljj.129.1624395625998;
        Tue, 22 Jun 2021 14:00:25 -0700 (PDT)
Received: from localhost (88-112-11-80.elisa-laajakaista.fi. [88.112.11.80])
        by smtp.gmail.com with ESMTPSA id f3sm230782lfu.262.2021.06.22.14.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 14:00:25 -0700 (PDT)
Message-ID: <60d24f69.1c69fb81.fcc6c.14d6@mx.google.com>
Date:   Wed, 23 Jun 2021 00:00:24 +0300
From:   Hannu Hartikainen <hannu@hrtk.in>
Subject: Re: [PATCH] USB: cdc-acm: blacklist Heimann USB Appset device
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
In-Reply-To: <YNI/9/gbehhaNC1t@kroah.com>
References: <20210622141454.337948-1-hannu@hrtk.in>
        <YNI/9/gbehhaNC1t@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 22 Jun 2021 21:54:31 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> If it's blacklisted here, what driver does control this device?

On my machine, no other device driver takes control. The `usbcore`
driver loads the `cdc-acm` driver because the descriptors match but
after cdc-acm returns without claiming the interfaces, no other driver
is probed AFAICT.

I've written an incomplete driver myself; I'll see if I can publish it
later. But the traffic is just USB bulk messages and should be doable in
userspace without a driver. Sadly the devices are not very common and
the USB traffic is undocumented.

Best,
Hannu
