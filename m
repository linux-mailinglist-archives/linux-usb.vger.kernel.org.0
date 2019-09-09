Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABFBFADBC2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2019 17:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfIIPHa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Sep 2019 11:07:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38019 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbfIIPHa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Sep 2019 11:07:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id o184so15110837wme.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Sep 2019 08:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:mime-version:message-id:in-reply-to
         :references:user-agent:content-transfer-encoding;
        bh=8lNJiD/cdGLfa+TOe5mXLdKF5J81dh2AlIfmRLL9vdo=;
        b=aflVrGESjQUPFYiNO/GjC2PhcA+9Eh8MycvxVNAE01cTyYPHsZ5PSiRChlyoXn8Ypi
         Gl45yarFuOqiWBCqKXncrGvtng1bbUy2eJjsd9ncsau4e+OI6442hEY7qgWCcjF0Nq9V
         0HKitL/Gt4/H4RhkbDEaEkbhn8zAfzM4DhMAelCPpI5D7RearOHHAk/T3cUuh6rqpBly
         n0rpz7zsl9ADlwzu0eEojhjBRwl0TVbxlYNlw0gBsncKAUj6qhOgrGq1/jkNRMTAQ56H
         jcPF7lYk+LtHCDtvF5Qxhom+5Lb35VWOE67LPs1LdHoh6uDspbNHyXZ/sZkb8zw+P5tQ
         3u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:mime-version:message-id
         :in-reply-to:references:user-agent:content-transfer-encoding;
        bh=8lNJiD/cdGLfa+TOe5mXLdKF5J81dh2AlIfmRLL9vdo=;
        b=nbCEoXgB8K1Bp687DOCugy3tBL0kGU+q01890lgn4hTdXPWHr0Qzg0BGCkecbcVazY
         x504kVcPyJf7BQJN3nw9StWu8U0xTGVigZxQhrXEEpoIufVrgKSQ28COI9lsqOhISciz
         ++4lcGpi3NSi5zKhPVbrxqJ9Swl1KypI8TOKIFy2WN5ygppjT+BabMYuJo8g6VSPa8wu
         8Ofp6HfGuZLtp5dvN5RmNzZ+pGkpI763yAsYfQV2gRfQ2HndsrdYynUbjuAGtnw/tTn+
         mMStZWB7xpqGKiuyJ+xi0LCXTzAGzqE0xFJIk0iEjN6noyYm0318PCxZF144eFLgI07G
         5jbQ==
X-Gm-Message-State: APjAAAUEgRPz2PEkEJELHknUP6KpxeH3nOZXEL+aN3NTbDjAKP0f5LLH
        TGcFsATO88uBj5rvsnksxf4=
X-Google-Smtp-Source: APXvYqzguRfbA18FewBNkcyW0CglXP4Km8nbjPwt7Ka17MXn0mq+V8NmdOZlWGOhktcTK/CGaJSRcQ==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr18942744wmg.25.1568041646877;
        Mon, 09 Sep 2019 08:07:26 -0700 (PDT)
Received: from localhost ([92.59.185.54])
        by smtp.gmail.com with ESMTPSA id b194sm31472703wmg.46.2019.09.09.08.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 08:07:25 -0700 (PDT)
From:   Vicente Bergas <vicencb@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        MarcZyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] usb: dwc3: Add shutdown to =?iso-8859-1?Q?platform=5Fdriver?=
Date:   Mon, 09 Sep 2019 17:07:24 +0200
MIME-Version: 1.0
Message-ID: <0edb55d4-3bad-47ac-9d29-8d994d182e67@gmail.com>
In-Reply-To: <645526b8-bfed-4cc6-9500-1843c5fe0da9@gmail.com>
References: <4d18d4f7-a00e-bd60-6361-51054eba3bca@arm.com>
 <20190817174140.6394-1-vicencb@gmail.com>
 <8d48017a-64c5-4b25-8d85-113ffcf502c9@gmail.com> <87v9uix1sv.fsf@gmail.com>
 <645526b8-bfed-4cc6-9500-1843c5fe0da9@gmail.com>
User-Agent: Trojita
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tuesday, August 27, 2019 2:16:20 PM CEST, Vicente Bergas wrote:
> On Tuesday, August 27, 2019 1:53:04 PM CEST, Felipe Balbi wrote:
>> Hi,
>>=20
>> Vicente Bergas <vicencb@gmail.com> writes:
>>> On Saturday, August 17, 2019 7:41:40 PM CEST, Vicente Bergas wrote:
>>>> Otherwise the device keeps writing to memory after kexec and disturbs
>>>> the next kernel.
> ...
>>=20
>> why don't you just have shutdown use the same exact function as remove?
>> Frankly, though, I still don't fully understand what's going wrong
>> here. Why is the device still alive during kexec?
>>=20
>> cheers
>
> Hi Felipe,
> the remove and shutdown functions have different prototypes, so
> shutdown is wrapping remove.
> Would it be preferable to cast remove as shutdown?
>
> The issue with kexec is that the device is being used during the livetime
> of the first kernel. When the first kernel executes kexec it calls the
> shutdown function of drivers (instead of remove). Because of this the dwc3
> device keeps doing things like DMA.
> While the second kernel is taking over, it gets its memory corrupted with
> such DMA accesses from the device. When the second kernel reaches the point=

> of taking over the dwc3 device, re-initializes it, but it is already too
> late. Still worse, if the second kernel did not have the dwc3 driver, it
> would get endless memory corruptions.
> All in all, devices that can do DMA need to stop doing it on shutdown.
>
> Regards,
>  Vicen=C3=A7.

Hi,
please, can you provide some feedback on this?

Regards,
 Vicen=C3=A7.
