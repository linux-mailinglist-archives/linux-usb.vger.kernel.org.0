Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3BF349DFE
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 12:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbfFRKD0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 18 Jun 2019 06:03:26 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:57232 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729377AbfFRKDZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 06:03:25 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-209-HdWLM82YPbu3VvHb29HRmA-1; Tue, 18 Jun 2019 11:03:21 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b::d117) by AcuMS.aculab.com
 (fd9f:af1c:a25b::d117) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue,
 18 Jun 2019 11:03:21 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 18 Jun 2019 11:03:21 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'dmg@turingmachine.org'" <dmg@turingmachine.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a,
 b) in drivers/usb
Thread-Topic: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a,
 b) in drivers/usb
Thread-Index: AQHVJWTbdUFdcly2I0Ko0WKPccxIkKahLgdw
Date:   Tue, 18 Jun 2019 10:03:21 +0000
Message-ID: <472b0de38d704385bcfc712035eff462@AcuMS.aculab.com>
References: <20190617233050.21409-1-dmg@turingmachine.org>
In-Reply-To: <20190617233050.21409-1-dmg@turingmachine.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: HdWLM82YPbu3VvHb29HRmA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: dmg@turingmachine.org
> Sent: 18 June 2019 00:31
> Use min_t to find the minimum of two values instead of using the ?: operator.
> 
> This change does not alter functionality. It is merely cosmetic intended to
> improve the readability of the code.
> 
> Signed-off-by: Daniel M German <dmg@turingmachine.org>
> ---
>  drivers/usb/gadget/function/u_ether.c | 2 +-
>  drivers/usb/misc/adutux.c             | 2 +-
>  drivers/usb/storage/realtek_cr.c      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index 737bd77a575d..f6ba46684ddb 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -1006,7 +1006,7 @@ int gether_get_ifname(struct net_device *net, char *name, int len)
>  	rtnl_lock();
>  	ret = snprintf(name, len, "%s\n", netdev_name(net));
>  	rtnl_unlock();
> -	return ret < len ? ret : len;
> +	return min_t(int, ret, len);
>  }

I'm not sure using min() or min_t() helps readability here.

In any case that code fragment looks broken!
Were buf[] too small the length returned would include a '\0'.
Now it is quite likely that the overflow is actually impossible
(provided buf[] has room for the '\n').

OTOH the 'correct' fix is to replace the snprintf() with scnprintf()
and remove the 'min()' completely.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

