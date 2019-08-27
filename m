Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8024D9E7AB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2019 14:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfH0MQZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Aug 2019 08:16:25 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53556 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfH0MQZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Aug 2019 08:16:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id 10so2845177wmp.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 05:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:mime-version:message-id:in-reply-to
         :references:user-agent:content-transfer-encoding;
        bh=pU0lXL5v2+TfEcbDBaFqBB4HEseMI0PfB9qV53kie2U=;
        b=LmAsZv/mq0KHO3X+ry/5ysAZwONa3RGEyT694iXRSw0CGvdySAdY4GH5kkNPD7HS7k
         TEYfa/jK6hCZrE3b6816WgGV6fuPkZzqD4nh17/BwjsStTctQffjujy4nfdsf/kfd44w
         CMFX7ZVACIi29XdllRrXnRXQFlNhfUKyVvdN7qK1l5OH++LM2iAGRT0YTtgy+DFzRS4j
         dIZJsoY61Sw79NBRi4bWj4EtuPH/98XzUq1c5i1KRFQiTAFBkYIkMx6IUj8xbZrRHPIo
         IrsyIceEz4hrqHAq3MXspIN9Ct9/e19Vlh4yXtOrWvFlojh8+KdI0oWSGdbNykIVqCKW
         00sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:mime-version:message-id
         :in-reply-to:references:user-agent:content-transfer-encoding;
        bh=pU0lXL5v2+TfEcbDBaFqBB4HEseMI0PfB9qV53kie2U=;
        b=I5ImMu6e/k8edLSX82Tijt+v9SvPBcZ7WFgRHqeyvywxSwnZi5FMejdFaUHbT4rLKC
         SkfZmTxwnXxaZZTrPQiYPMeYUjjfVKec6CHC1ox7MflE8z7DayVZgSNOsRbAVr+ILUIz
         x5sTgUb0b6Nnt5sk6zncRhxPyoD0Ana5qHY2Jbxi922AX/8pezmtm/hWVVK1SUMlqiOn
         lKyxON4VZM12IsHeAqrMYmY3G/CMyXzJO6fiC1kqmMnBHGz9WXzWn3a6TsJdKQiIVKaB
         g8QJ1JZkRf6xpel3lJY201TURyGBvVN0xrrHNssyLgphPUjh1mljkJqAWbRzRrMP0+VJ
         gDbA==
X-Gm-Message-State: APjAAAU/bTUbjnAfZf3OlwUo+DWtcY1CVvelT14Tt+MktwW01JqN3x2K
        N09ncPbOZCJ/2YCj0M6N9X5w9msvvYA=
X-Google-Smtp-Source: APXvYqwqrwEIaF4GWhDndW+OvoIvxiahrwYyryDBG/0B/AEPySBTSKs1IX5f0yXf9wv+KitoR9I30A==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr27357429wmi.106.1566908183390;
        Tue, 27 Aug 2019 05:16:23 -0700 (PDT)
Received: from localhost ([92.59.185.54])
        by smtp.gmail.com with ESMTPSA id o25sm1993846wmc.36.2019.08.27.05.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 05:16:22 -0700 (PDT)
From:   Vicente Bergas <vicencb@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        MarcZyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] usb: dwc3: Add shutdown to =?iso-8859-1?Q?platform=5Fdriver?=
Date:   Tue, 27 Aug 2019 14:16:20 +0200
MIME-Version: 1.0
Message-ID: <645526b8-bfed-4cc6-9500-1843c5fe0da9@gmail.com>
In-Reply-To: <87v9uix1sv.fsf@gmail.com>
References: <4d18d4f7-a00e-bd60-6361-51054eba3bca@arm.com>
 <20190817174140.6394-1-vicencb@gmail.com>
 <8d48017a-64c5-4b25-8d85-113ffcf502c9@gmail.com> <87v9uix1sv.fsf@gmail.com>
User-Agent: Trojita
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tuesday, August 27, 2019 1:53:04 PM CEST, Felipe Balbi wrote:
> Hi,
>
> Vicente Bergas <vicencb@gmail.com> writes:
>> On Saturday, August 17, 2019 7:41:40 PM CEST, Vicente Bergas wrote:
>>> Otherwise the device keeps writing to memory after kexec and disturbs
>>> the next kernel.
...
>
> why don't you just have shutdown use the same exact function as remove?
> Frankly, though, I still don't fully understand what's going wrong
> here. Why is the device still alive during kexec?
>
> cheers

Hi Felipe,
the remove and shutdown functions have different prototypes, so
shutdown is wrapping remove.
Would it be preferable to cast remove as shutdown?

The issue with kexec is that the device is being used during the livetime
of the first kernel. When the first kernel executes kexec it calls the
shutdown function of drivers (instead of remove). Because of this the dwc3
device keeps doing things like DMA.
While the second kernel is taking over, it gets its memory corrupted with
such DMA accesses from the device. When the second kernel reaches the point
of taking over the dwc3 device, re-initializes it, but it is already too
late. Still worse, if the second kernel did not have the dwc3 driver, it
would get endless memory corruptions.
All in all, devices that can do DMA need to stop doing it on shutdown.

Regards,
  Vicen=C3=A7.

