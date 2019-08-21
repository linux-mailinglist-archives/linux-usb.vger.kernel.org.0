Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86A9C9845D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 21:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbfHUT12 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 15:27:28 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:54220 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729467AbfHUT12 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 15:27:28 -0400
Received: (qmail 7979 invoked by uid 2102); 21 Aug 2019 15:27:27 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Aug 2019 15:27:27 -0400
Date:   Wed, 21 Aug 2019 15:27:27 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>,
        Henk van der Laan <opensource@henkvdlaan.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb-storage: Add new JMS567 revision to unusual_devs
In-Reply-To: <20190816200847.21366-1-opensource@henkvdlaan.com>
Message-ID: <Pine.LNX.4.44L0.1908211527060.1816-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 16 Aug 2019, Henk van der Laan wrote:

> Revision 0x0117 suffers from an identical issue to earlier revisions,
> therefore it should be added to the quirks list.
> 
> Signed-off-by: Henk van der Laan <opensource@henkvdlaan.com>
> ---
>  drivers/usb/storage/unusual_devs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index ea0d27a94afe..1cd9b6305b06 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -2100,7 +2100,7 @@ UNUSUAL_DEV(  0x14cd, 0x6600, 0x0201, 0x0201,
>  		US_FL_IGNORE_RESIDUE ),
>  
>  /* Reported by Michael Büsch <m@bues.ch> */
> -UNUSUAL_DEV(  0x152d, 0x0567, 0x0114, 0x0116,
> +UNUSUAL_DEV(  0x152d, 0x0567, 0x0114, 0x0117,
>  		"JMicron",
>  		"USB to ATA/ATAPI Bridge",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,

Acked-by: Alan Stern <stern@rowland.harvard.edu>

