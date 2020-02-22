Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEB2168E19
	for <lists+linux-usb@lfdr.de>; Sat, 22 Feb 2020 10:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgBVJu4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Feb 2020 04:50:56 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38835 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgBVJuz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Feb 2020 04:50:55 -0500
Received: by mail-lj1-f194.google.com with SMTP id w1so4828887ljh.5
        for <linux-usb@vger.kernel.org>; Sat, 22 Feb 2020 01:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZVAz8tsmnaaGDm8d9x4IkaPdOmiSKX5km1NUX8CVrrc=;
        b=hrOJcGvQSBrNVeppwHZ9k51LXKmidO6GDVdQE4Ex+1LDpkTV+0u4T8nTEKqGrdnwxU
         4YG+xGc6b84JEByGNy9lkV7g93nThCmjO1rdPdS+U7r8S1NXwZ6HCSuVv3+JhVAfyzT6
         RV1Y2UqBf47SR+nj3mY+6B47Q3wtayo/OMRHVPZR7DP4O3BK7qcxqdlSUNg87NzZL7aB
         eQyz6aHWZZYwOXfc031Wjt1YYuDmCPkfj8Irkzwo8UzEl5TD8XBrfNp+Mtp1aJCX3Bnw
         QpJrnfPyWrfahNuZ4IEtUwtbr4Q/wZnlxTNTLR9nUaye+3uaqAJwwnU0dRfLFmbrfxY3
         oU/g==
X-Gm-Message-State: APjAAAWIQJQ0+U6UKKPFBJfynCQB7vdHockiU/mz/6CV32Mu7Xwoad0P
        FzSQM39+YjWlQ4k+RZFwIp0=
X-Google-Smtp-Source: APXvYqzj6vyW0ryCVDROB825aUTr+ALzXYNmtDt1FmYBDeJFsTbaS/rgMZO6zgooBzRjPEaSZV+xUw==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr25014577ljg.144.1582365053892;
        Sat, 22 Feb 2020 01:50:53 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id s10sm1404709ljp.35.2020.02.22.01.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2020 01:50:52 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j5RQt-0001o9-Sv; Sat, 22 Feb 2020 10:50:47 +0100
Date:   Sat, 22 Feb 2020 10:50:47 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ch341: Replace memory allocations with stack storage
Message-ID: <20200222095047.GJ32540@localhost>
References: <bdf7db0e0e133f55ac81d39ce9564653e0b5d9ed.1582312740.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdf7db0e0e133f55ac81d39ce9564653e0b5d9ed.1582312740.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 21, 2020 at 07:23:41PM +0000, Michael Hanselmann wrote:
> Storing a memory pointer consumes 4 or 8 bytes, depending on the
> architecture. The replaced buffers are 2 bytes, so this change not only
> avoids the overhead of memory allocation, but it also saves a small
> amount of stack storage.
> 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
>  drivers/usb/serial/ch341.c | 32 ++++++++------------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index c5ecdcd51ffc..6875da6e746c 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -255,16 +255,11 @@ static int ch341_set_handshake(struct usb_device *dev, u8 control)
>  
>  static int ch341_get_status(struct usb_device *dev, struct ch341_private *priv)
>  {
> -	const unsigned int size = 2;
> -	char *buffer;
> +	char buffer[2];
>  	int r;
>  	unsigned long flags;
>  
> -	buffer = kmalloc(size, GFP_KERNEL);
> -	if (!buffer)
> -		return -ENOMEM;
> -
> -	r = ch341_control_in(dev, CH341_REQ_READ_REG, 0x0706, 0, buffer, size);
> +	r = ch341_control_in(dev, CH341_REQ_READ_REG, 0x0706, 0, buffer, sizeof(buffer));

These buffers cannot be stack allocated as they need to be DMA-able on
all platforms.

Johan
