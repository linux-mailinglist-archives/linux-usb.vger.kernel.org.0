Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA06B2513DF
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 10:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbgHYIMM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 25 Aug 2020 04:12:12 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:34767 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725947AbgHYIML (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 04:12:11 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-223-8bUeqZBEMYG5yIzjTAMYbw-1; Tue, 25 Aug 2020 09:12:06 +0100
X-MC-Unique: 8bUeqZBEMYG5yIzjTAMYbw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 25 Aug 2020 09:12:05 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 25 Aug 2020 09:12:05 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Alex Dewar' <alex.dewar90@gmail.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "accessrunner-general@lists.sourceforge.net" 
        <accessrunner-general@lists.sourceforge.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Thread-Topic: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Thread-Index: AQHWemUzoPleWxCDKky1KLXQzyLa5alIeCYw
Date:   Tue, 25 Aug 2020 08:12:05 +0000
Message-ID: <3e882693bb344424af37d4d35f3db605@AcuMS.aculab.com>
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
In-Reply-To: <20200824222322.22962-1-alex.dewar90@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alex Dewar
> Sent: 24 August 2020 23:23
> kernel/cpu.c: don't use snprintf() for sysfs attrs
> 
> As per the documentation (Documentation/filesystems/sysfs.rst),
> snprintf() should not be used for formatting values returned by sysfs.
> 
> In all of these cases, sprintf() suffices as we know that the formatted
> strings will be less than PAGE_SIZE in length.

Hmmmm....
I much prefer to see bounded string ops.
sysfs really ought to be passing through the buffer length.
The buffer size should probably be SYSFS_BUF_LEN not PAGE_SIZE
(even it happens to typically be the same).
If PAGE_SIZE is big (or small) passing a 4k buffer may be
more appropriate than a PAGE_SIZE one.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

