Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701BA4D714B
	for <lists+linux-usb@lfdr.de>; Sat, 12 Mar 2022 23:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbiCLWfC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 12 Mar 2022 17:35:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbiCLWfC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Mar 2022 17:35:02 -0500
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8CC2727B3B
        for <linux-usb@vger.kernel.org>; Sat, 12 Mar 2022 14:33:55 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-50-Oay4UdBDNN-RWAMM_7Nt7A-1; Sat, 12 Mar 2022 22:33:52 +0000
X-MC-Unique: Oay4UdBDNN-RWAMM_7Nt7A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sat, 12 Mar 2022 22:33:50 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sat, 12 Mar 2022 22:33:50 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Sergey Shtylyov' <s.shtylyov@omp.ru>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 1/2] usb: host: uhci-debug: use scnprintf() instead of
 sprintf()
Thread-Topic: [PATCH 1/2] usb: host: uhci-debug: use scnprintf() instead of
 sprintf()
Thread-Index: AQHYNk/KE2mDNR+0LESF7+DQSnLzGay8U+bg
Date:   Sat, 12 Mar 2022 22:33:50 +0000
Message-ID: <5e5c26cde6814a56a00019d81d23f386@AcuMS.aculab.com>
References: <20220312202834.11700-1-s.shtylyov@omp.ru>
 <20220312202834.11700-2-s.shtylyov@omp.ru>
In-Reply-To: <20220312202834.11700-2-s.shtylyov@omp.ru>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sergey Shtylyov
> Sent: 12 March 2022 20:29
> 
> The UHCI driver's debugging code uses a lot of sprintf() calls with the
> large buffers, leaving some space at the end of the buffers to handle the
> buffer overflow. Using scnprntf() instead eliminates the very possibility
> of the buffer overflow, while simplifying the code at the expense of not
> printing an ellipsis when the end of buffer is actually reached...

Hmmm...

The old code seems to so:

> -	out += sprintf(out, "(buf=%08x)\n", hc32_to_cpu(uhci, td->buffer));
> 
> -	if (out - buf > len)
> -		out += sprintf(out, " ...\n");

Which is going to overflow the output buffer unless there
is enough 'tailroom' after buf[len] for all the sprintf()
before any length check and the ellipsis.

The new code won't overrun buf[len] but also fails to
'\n' terminate long lines.
So you probably do need a check for:
	if (out == len - 1 && buf[out - 1] != '\n')
		strcpy(buf + len - 5, "...\n");

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

