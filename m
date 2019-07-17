Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC1ED6B685
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 08:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbfGQGTG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 02:19:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44920 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfGQGTG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 02:19:06 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so10633452lfm.11
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 23:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aH/SAwaqv5TSu6OPBnP/osFLGwYtmZuKApxjHM0xiTU=;
        b=SCFCm8DVv1xsIO43YAqcj6nYKPZzEFnDoGQneQJNgflGNFIaB33Xwz4qZhlm+ck1Fo
         9h36IqtC8fU3YAagVMKJO+ox7M9Gf49cy2jfxougXF/eU342gUyPqy7rh1X9ETv+OtuB
         PXS/YuHiU4vgfge9mu6XlPidQWnVR3uSAOE73Ud+NvVdbJ4YdKtq/dYxKMAPTEDjJbcB
         qOAA0oyD3I/SqHDlS2IuQZb/LHoKrfvQwUgJG+BbY0ZIgfnHVLMNqDnJdgW1L9pRSpSF
         6hlXpSSQo9rMjadcpfCc6Ynj1Nnnsv7188qQJfwsjZ7evfvGZh21oqalYQcyixMEoCZm
         /J4w==
X-Gm-Message-State: APjAAAWw6Rti9QdLIYq5htRPZao8bX1h4AOvMCjoNeOphsyFjGhlLpD3
        P75U2kf/pEMSPACrgKcucfU=
X-Google-Smtp-Source: APXvYqz+2jF0g72dOVyDvZ/GLxQJdv1nA0kmxLNFiSc1cZ+YtjxJEWPX0b6N8H7FloGKvhzvPhWdLQ==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr15941509lfm.54.1563344344162;
        Tue, 16 Jul 2019 23:19:04 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id b6sm3536901lfa.54.2019.07.16.23.19.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 23:19:03 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hndHK-0004Ol-VX; Wed, 17 Jul 2019 08:19:03 +0200
Date:   Wed, 17 Jul 2019 08:19:02 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dan Williams <dcbw@redhat.com>
Cc:     Rogan Dawes <rogan@dawes.za.net>, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>, Lars Melin <larsm17@gmail.com>
Subject: Re: [PATCH v5] USB: serial/qmi_wwan: add D-Link DWM-222 device ID
Message-ID: <20190717061902.GA16694@localhost>
References: <20190716191205.GA27426@lisa.dawes.za.net>
 <c80b2d08453ba94d3762021d6a184acfd6b1762e.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c80b2d08453ba94d3762021d6a184acfd6b1762e.camel@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 16, 2019 at 08:43:52PM -0500, Dan Williams wrote:
> On Tue, 2019-07-16 at 21:12 +0200, Rogan Dawes wrote:
> > Add device id for D-Link DWM-222.

> > @@ -1951,6 +1951,8 @@ static const struct usb_device_id option_ids[] = {
> >  	  .driver_info = RSVD(4) },
> >  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e35, 0xff),			/* D-Link DWM-222 */
> >  	  .driver_info = RSVD(4) },
> > +	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e3d, 0xff),			/* D-Link DWM-222 A2 */
> > +	  .driver_info = RSVD(0) | RSVD(4) },
> 
> I don't think we actually do need to blacklist interface 0, since
> that's likely a QCDM/DIAG interface and that does need a serial driver
> like option or qcserial.
> 
> Johan, any reason why you thought we should blacklist 0?

It was just me being confused about the Qualcomm protocols and how the
diag port was accessed from user space. Thanks, Dan.

Rogan, let's keep interface 0 and only blacklist interface 4 as you did
originally. Sorry about the confusion.

Johan
