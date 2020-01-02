Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C7512E436
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 10:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgABJIr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 2 Jan 2020 04:08:47 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:42184 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727842AbgABJIr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 04:08:47 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-1-pIIvPwufNpOpNDvQYajY9g-1;
 Thu, 02 Jan 2020 09:08:43 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 2 Jan 2020 09:08:43 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 2 Jan 2020 09:08:43 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Tejas Joglekar' <Tejas.Joglekar@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: RE: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Topic: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Index: AQHVtzrjB/1wrvW8bUqvSt/jrU3hbqfXKWiw
Date:   Thu, 2 Jan 2020 09:08:42 +0000
Message-ID: <2c11ec9e579f4ead946d759aa4d7ed3e@AcuMS.aculab.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
 <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
In-Reply-To: <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: pIIvPwufNpOpNDvQYajY9g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tejas Joglekar
> Sent: 20 December 2019 13:39
>
> The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
> each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
> for HS. The controller loads and updates the TRB cache from the transfer
> ring in system memory whenever the driver issues a start transfer or
> update transfer command.
> 
> For chained TRBs, the Synopsys xHC requires that the total amount of
> bytes for all TRBs loaded in the TRB cache be greater than or equal to 1
> MPS. Or the chain ends within the TRB cache (with a last TRB).
> 
> If this requirement is not met, the controller will not be able to send
> or receive a packet and it will hang causing a driver timeout and error.

This ought to be raised with Synopsys and they should be remake their
silicon to meet the XHCI standard and then offer to fix all the
boards that contain their broken version :-)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

