Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95B0B7FFEA
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 19:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406461AbfHBR5P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 13:57:15 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39754 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405953AbfHBR5O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Aug 2019 13:57:14 -0400
Received: by mail-ed1-f67.google.com with SMTP id m10so73190480edv.6
        for <linux-usb@vger.kernel.org>; Fri, 02 Aug 2019 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc;
        bh=IwMEZu4ZADd2eNh2oK81AED7DB6IuQ9aavP3PW0ESk4=;
        b=O+pl/6RN5zIx0WlSkPa3bgDioy23NYdRNsE3cAcuD7/XxShGgsd4o2IEerMJofl3Hr
         0Iii6/6ohdPAjGA8zqlnXMQzuqBALCnES26DbtffhQR83wNV6SiL38zMu0NaWr0kKuqe
         fyT9k9fc7SOtnE+fSj52wQw25gmL3HCVjscnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc;
        bh=IwMEZu4ZADd2eNh2oK81AED7DB6IuQ9aavP3PW0ESk4=;
        b=pAxF3vk+vHOvWeCZLbwDpdronRmHMZf9AhzU/SECldNor1PxHMBW2SO76So7gsd30a
         2wrZzhLaJTV5MVyoZwpGgxFhoGkRDVwX/iSgGINRltDl9GejUjcu7GHVwSziNgNzlban
         QYQ47/w9hjV7StnLVqiv5thi1C2NoAtIjW8lK99VHsZ54OcYsIFD0UxOYs8iAvduOeZr
         /q6jkGCFbELQqq39Q1mzeqamLLBsDyeWkZUbgT+cq9309sQhSm+oYZYOezi7sBd+Ci2Z
         U98vd1VifNwfnmjfcIZUqeCG6w6cWX7jO3WXwCOZuWXJxo0oQ39NVXA4/J2Cmxip3+PT
         BoFg==
X-Gm-Message-State: APjAAAXe3+evxcjaqxGIzgCyqk2+KjvAL5X3KZP6Wfh4hE9ORFqCL2Pv
        sJ+uxFtCMMJO1DLp2JG2ySWj42XOU80=
X-Google-Smtp-Source: APXvYqw0bZFCeO5lk/WZBIyyP7AoGI6DZ7CgcRuS05n3cQv5MBkEkJhBIdy2K6J8jWWXTnhpDL+GKg==
X-Received: by 2002:aa7:ca41:: with SMTP id j1mr123070490edt.149.1564768632882;
        Fri, 02 Aug 2019 10:57:12 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id m32sm18312368edc.89.2019.08.02.10.57.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 10:57:11 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id p15so73159036eds.8
        for <linux-usb@vger.kernel.org>; Fri, 02 Aug 2019 10:57:11 -0700 (PDT)
X-Received: by 2002:a17:906:f85:: with SMTP id q5mr108361833ejj.192.1564768631171;
 Fri, 02 Aug 2019 10:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190801220436.3871-1-gavinli@thegavinli.com> <20190802121416.GA20689@kroah.com>
In-Reply-To: <20190802121416.GA20689@kroah.com>
From:   Gavin Li <gavinli@thegavinli.com>
Date:   Fri, 2 Aug 2019 10:57:00 -0700
X-Gmail-Original-Message-ID: <CA+GxvY7LswVFZvk0mLRLgUqdo=Gb0pQ1KMsgmWbiFEPvMvquXQ@mail.gmail.com>
Message-ID: <CA+GxvY7LswVFZvk0mLRLgUqdo=Gb0pQ1KMsgmWbiFEPvMvquXQ@mail.gmail.com>
Subject: Re: [PATCH] usb: devio: fix mmap() on non-coherent DMA architectures
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Gavin Li <git@thegavinli.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usbfs mmap() looks like it was introduced for 4.6 in commit
f7d34b445abc, so it should probably be backported to 4.9 and onwards.
This issue has been present since the introduction of the feature.

One sidenote: this patch will cause the following warning on x86 due
to dmap_mmap_coherent() trying to map normal memory in as uncached:

x86/PAT: ... map pfn RAM range req uncached-minus for [mem
0x77b000000-0x77b210fff], got write-back

This warning is harmless, as x86 is DMA coherent and the memory gets
correctly mapped in as write-back. I will submit a patch to the DMA
mapping team to eliminate this warning.

Best,
Gavin

On Fri, Aug 2, 2019 at 5:14 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 01, 2019 at 03:04:36PM -0700, gavinli@thegavinli.com wrote:
> > From: Gavin Li <git@thegavinli.com>
> >
> > On architectures that are not (or are optionally) DMA coherent,
> > dma_alloc_coherent() returns an address into the vmalloc space,
> > and calling virt_to_phys() on this address returns an unusable
> > physical address.
> >
> > This patch replaces the raw remap_pfn_range() call with a call to
> > dmap_mmap_coherent(), which takes care of the differences between
> > coherent and non-coherent code paths.
> >
> > Tested on an arm64 rk3399 board.
> >
> > Signed-off-by: Gavin Li <git@thegavinli.com>
> > ---
> >  drivers/usb/core/devio.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
>
> Should this be backported to the stable kernel trees to fix the issue on
> those platforms?  If so, how far back?  What commit caused this problem
> to occur?
>
> thanks,
>
> greg k-h
