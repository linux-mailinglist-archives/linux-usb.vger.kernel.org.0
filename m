Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E32A16FEF4
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 13:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729995AbfGVLtT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 07:49:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728929AbfGVLtT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 07:49:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FCA32184E;
        Mon, 22 Jul 2019 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563796158;
        bh=lfCsJto9RujbowCe09F/3388kpRaij+nFMO9+8CcYSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oYOcVUTx5ataZt6ry78DD/qh6hiSk+JEEayS9GoSUcHP8EL5tZtnwTWIZ7IYvadoS
         hVw7qKAY4taSUGTuqorqgYB9aMoexAgwCZFFNrAl/YTVvsCtsxHz/SpFimDP3/r1p6
         Y+V8Fvn1BdDDBCeByBv3mLVmVCcm1v9/23E8bVmY=
Date:   Mon, 22 Jul 2019 13:49:15 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     Joe Perches <joe@perches.com>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jbergsagel@ti.com" <jbergsagel@ti.com>,
        "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Jayshri Dajiram Pawar <jpawar@cadence.com>,
        Rahul Kumar <kurahul@cadence.com>,
        Anil Joy Varughese <aniljoy@cadence.com>
Subject: Re: [PATCH v10 2/6] usb:common Separated decoding functions from
 dwc3 driver.
Message-ID: <20190722114915.GB10515@kroah.com>
References: <1563733939-21214-1-git-send-email-pawell@cadence.com>
 <1563733939-21214-3-git-send-email-pawell@cadence.com>
 <4d4a8a02e4ec7fad9213302d17a6acd17851d8da.camel@perches.com>
 <BYAPR07MB4709115020BE99B5EB34D232DDC40@BYAPR07MB4709.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR07MB4709115020BE99B5EB34D232DDC40@BYAPR07MB4709.namprd07.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 22, 2019 at 10:06:38AM +0000, Pawel Laszczak wrote:
> Hi,
> 
> >
> >On Sun, 2019-07-21 at 19:32 +0100, Pawel Laszczak wrote:
> >> Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
> >> to driver/usb/common/debug.c file. These moved functions include:
> >[]
> >> diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
> >[]
> >> +static void usb_decode_set_clear_feature(__u8 bRequestType, __u8 bRequest,
> >> +					 __u16 wValue, __u16 wIndex,
> >> +					 char *str, size_t size)
> >
> >It's probably not necessary to use Hungarian
> >when moving these functions into generic code.
> 
> In my opinion it's ok in this place. It's consistence with USB specification ch9 and with
> https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/usb/ch9.h. (look at usb_ctrlrequest). 

Yes, this is fine, the USB subsystem has this everywhere, and we all
know exactly what it means when we see it.

thanks,

greg k-h
