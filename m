Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E086E3CE
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 15:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfD2NcD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 29 Apr 2019 09:32:03 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:32460 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726321AbfD2NcC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 09:32:02 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-123-TJ7bQrmIOqKYmvpv4jPAoA-1; Mon, 29 Apr 2019 14:31:59 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b::d117) by AcuMS.aculab.com
 (fd9f:af1c:a25b::d117) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon,
 29 Apr 2019 14:31:58 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 29 Apr 2019 14:31:58 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Oliver Neukum' <oneukum@suse.com>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] UAS: fix alignment of scatter/gather segments
Thread-Topic: [PATCH] UAS: fix alignment of scatter/gather segments
Thread-Index: AQHU/oX/aPqmHe5MjEO6F2S1cXOj3qZTIbqw
Date:   Mon, 29 Apr 2019 13:31:58 +0000
Message-ID: <f378babbf2f349e59d98a5ab99958d78@AcuMS.aculab.com>
References: <20190429122026.4249-1-oneukum@suse.com>
In-Reply-To: <20190429122026.4249-1-oneukum@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: TJ7bQrmIOqKYmvpv4jPAoA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Oliver Neukum
> Sent: 29 April 2019 13:20
> This is the UAS version of
> 
> 747668dbc061b3e62bc1982767a3a1f9815fcf0e
> usb-storage: Set virt_boundary_mask to avoid SG overflows
> 
> We are not as likely to be vulnerable as storage, as it is unlikelier
> that UAS is run over a controller without native support for SG,
> but the issue exists.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/storage/uas.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 6d71b8fff9df..ec9c1c7bb156 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -789,24 +789,22 @@ static int uas_slave_alloc(struct scsi_device *sdev)
>  {
>  	struct uas_dev_info *devinfo =
>  		(struct uas_dev_info *)sdev->host->hostdata;
> +	int maxp;
> 
>  	sdev->hostdata = devinfo;
> 
>  	/*
> -	 * USB has unusual DMA-alignment requirements: Although the
> -	 * starting address of each scatter-gather element doesn't matter,
> -	 * the length of each element except the last must be divisible
> -	 * by the Bulk maxpacket value.  There's currently no way to
> -	 * express this by block-layer constraints, so we'll cop out
> -	 * and simply require addresses to be aligned at 512-byte
> -	 * boundaries.  This is okay since most block I/O involves
> -	 * hardware sectors that are multiples of 512 bytes in length,
> -	 * and since host controllers up through USB 2.0 have maxpacket
> -	 * values no larger than 512.
> -	 *
> -	 * But it doesn't suffice for Wireless USB, where Bulk maxpacket
> -	 * values can be as large as 2048.  To make that work properly
> -	 * will require changes to the block layer.
> +	 * USB has unusual scatter-gather requirements: the length of each
> +	 * scatterlist element except the last must be divisible by the
> +	 * Bulk maxpacket value.  Fortunately this value is always a
> +	 * power of 2.  Inform the block layer about this requirement.
> +	 */

That isn't the correct restriction for XHCI.
It has its own perverse restrictions.
I think they are all handled within the xhci driver.

	David


> +
> +	maxp = usb_maxpacket(devinfo->udev, devinfo->data_in_pipe, 0);
> +	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
> +
> +	/*
> +	 * This one is for the controllers. We assume 512 is always good.
>  	 */
>  	blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
> 
> --
> 2.16.4

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

