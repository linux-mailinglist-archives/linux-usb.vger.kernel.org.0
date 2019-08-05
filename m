Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1604A81845
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 13:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfHELh1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 5 Aug 2019 07:37:27 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:38822 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727989AbfHELh0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 07:37:26 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-184-cuFDZAwxM2qp3yMrQEPfSQ-1; Mon, 05 Aug 2019 12:37:23 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 5 Aug 2019 12:37:23 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 5 Aug 2019 12:37:23 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'gavinli@thegavinli.com'" <gavinli@thegavinli.com>,
        "gregkh@linuxfoundation.o" <gregkh@linuxfoundation.o>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Gavin Li <git@thegavinli.com>
Subject: RE: [PATCH] usb: devio: fix mmap() on non-coherent DMA architectures
Thread-Topic: [PATCH] usb: devio: fix mmap() on non-coherent DMA architectures
Thread-Index: AQHVSLS2ECcVwrHAe0C9/bkZ53HVZqbscVFQ
Date:   Mon, 5 Aug 2019 11:37:22 +0000
Message-ID: <95109056461d4721bc2d2742b18b97ee@AcuMS.aculab.com>
References: <20190801220134.3295-1-gavinli@thegavinli.com>
In-Reply-To: <20190801220134.3295-1-gavinli@thegavinli.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: cuFDZAwxM2qp3yMrQEPfSQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: gavinli@thegavinli.com
> Sent: 01 August 2019 23:02
>
> On architectures that are not (or are optionally) DMA coherent,
> dma_alloc_coherent() returns an address into the vmalloc space,
> and calling virt_to_phys() on this address returns an unusable
> physical address.

So? what is the code trying to use the return value of virt_to_phys() for?

The 'cpu physical address' isn't (usually) a very interesting number.
The value you normally want is the address the hardware should use
in order to access the memory - this isn't (in general) the same value.
(It might be different for different devices.)

ISTR that dma_alloc_coherent() returns this value to the caller.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

