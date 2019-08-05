Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD98824EB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 20:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbfHESdg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 14:33:36 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40490 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728885AbfHESdg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 14:33:36 -0400
Received: by mail-ed1-f67.google.com with SMTP id k8so79761211eds.7
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 11:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc;
        bh=dlE7lO9a1MepExIFIue+rXBDoBiAvRzRXyLBQLi4ODA=;
        b=Y7GfFLWLsEc9PV+HZCH9AWF470sj29ZfdXZYbErqnPVPo4W/NdMSC3Fsv3OH73o6m0
         Xk5JyOfZGoKnas51VmSuQu2qBBkypfSNTiJ1mK60HhGGbW4mSBxwXuY6WSJDyGYr4Gsq
         1hEVDMXlfTuip8Kfyy8RUGUDgnyrDLPbCI7Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc;
        bh=dlE7lO9a1MepExIFIue+rXBDoBiAvRzRXyLBQLi4ODA=;
        b=S3+sHihriw4f26IBogtC4ZVfFH3/stGVVHp6//8cyFC1TDjVgg4aDFKFHwexiaIUXo
         bFt1F2N4OzWHOSrpDGDSy9BALtFLujP7x/IDNhovk+D6ubOH7c/Vu2ZKk0FOiRF76RCO
         xEsad9j162vcmikWTzLTmOGf+Rv3PS+Om2n309eVmRVB9Ed+NOGF04lNPb9N1p2D4/cv
         SIq9fTSazs+47KRRHrGTGPWAdgCLCFyG1EDaI4slNKa/vNgogAzKFCu2cgKFI6cUV7iW
         r9k+AgClaYWJWZYibY179+iywGtuSgamjxQhGVd7MDZPo83CaavCF0EOyyr46ndlAq9g
         0xDA==
X-Gm-Message-State: APjAAAX5P10hfByJuWceVPG/vWro3L8qvb0WkdC4YjKNWEJCbz7qh/H8
        jUBNkikxCwcCevyivaoBNqDKe/eYc3I=
X-Google-Smtp-Source: APXvYqzlmSq6xencvwITW1+adGC5E2hkNFVYQfbzfhzmlejtawXMUAYRl1a8qxjjnpCkWloeq1MS4Q==
X-Received: by 2002:a50:b48f:: with SMTP id w15mr137187138edd.260.1565030014145;
        Mon, 05 Aug 2019 11:33:34 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id p3sm20041102eda.43.2019.08.05.11.33.32
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 11:33:33 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id d4so79837066edr.13
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 11:33:32 -0700 (PDT)
X-Received: by 2002:a17:906:f85:: with SMTP id q5mr121166616ejj.192.1565030012560;
 Mon, 05 Aug 2019 11:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190801220134.3295-1-gavinli@thegavinli.com> <95109056461d4721bc2d2742b18b97ee@AcuMS.aculab.com>
In-Reply-To: <95109056461d4721bc2d2742b18b97ee@AcuMS.aculab.com>
From:   Gavin Li <gavinli@thegavinli.com>
Date:   Mon, 5 Aug 2019 11:33:21 -0700
X-Gmail-Original-Message-ID: <CA+GxvY4jXRH3i2q+bVxEOSCVrZmnJy-MKXMASagkEZG=YOWutw@mail.gmail.com>
Message-ID: <CA+GxvY4jXRH3i2q+bVxEOSCVrZmnJy-MKXMASagkEZG=YOWutw@mail.gmail.com>
Subject: Re: [PATCH] usb: devio: fix mmap() on non-coherent DMA architectures
To:     David Laight <David.Laight@aculab.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Gavin Li <git@thegavinli.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The purpose of this section of code is to map that memory into
userspace, and the code before this patch would incorrectly calculate
the pfn required to do so. This patch simply changes it to use the
correct function to do so rather than doing it from scratch.

On Mon, Aug 5, 2019 at 4:37 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: gavinli@thegavinli.com
> > Sent: 01 August 2019 23:02
> >
> > On architectures that are not (or are optionally) DMA coherent,
> > dma_alloc_coherent() returns an address into the vmalloc space,
> > and calling virt_to_phys() on this address returns an unusable
> > physical address.
>
> So? what is the code trying to use the return value of virt_to_phys() for?
>
> The 'cpu physical address' isn't (usually) a very interesting number.
> The value you normally want is the address the hardware should use
> in order to access the memory - this isn't (in general) the same value.
> (It might be different for different devices.)
>
> ISTR that dma_alloc_coherent() returns this value to the caller.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>
