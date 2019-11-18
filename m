Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02559100146
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 10:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfKRJ16 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 04:27:58 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35743 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRJ15 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 04:27:57 -0500
Received: by mail-lf1-f65.google.com with SMTP id i26so13225920lfl.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 01:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lXkkLdJ+q0HFhiCMkm3T5pndFEBpgUazkpBlOMpmUNU=;
        b=CyAntb6RHKAWuwL91MaUi+19KvXPOOc3Tv5rZqiiVPnkr4rPeWS24A1WJqebnexbXJ
         cHlKP7ekCiBVwTmi7sQRk3mXG32xumgHriBlhnhmVYCZsTu0K33NWmyye7Uo0MkGQpqL
         HBZUqnuZChtd4W4YwSsie63kI4lBn5y/D1M8hljiTlLFof3grU+vdn1P3q774FduUj4t
         a0/BpbZ3rmR5hAxGzuRfx4r2XyDMRa8LRKkKYVzRtbDaxyaHQ1sjsC4Y3ookHh3o3HpK
         D5KJ6fZA279JEtqZHxnoBlzCa4J71pfwdh5iwqTLlqWGQZrbJqhHEn3RWRzDcWOQQPee
         8/HA==
X-Gm-Message-State: APjAAAW8daaxZuLX9JY90Y/xfB1mNKZl0wFHBjS+TxJh+dxz56qgcg+3
        xImvtcVMaZ49wt3cnxAQKxU=
X-Google-Smtp-Source: APXvYqxf96A79SaP4QjZkeLtkmFkBVOR8qHLzb2eyHi7Xgb1Jc0Fwr+kv1fOJFyCNg7S2zvg2sEksw==
X-Received: by 2002:a05:6512:1c2:: with SMTP id f2mr8683208lfp.142.1574069275664;
        Mon, 18 Nov 2019 01:27:55 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id 11sm3308341lft.23.2019.11.18.01.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 01:27:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iWdK6-00043N-SI; Mon, 18 Nov 2019 10:27:54 +0100
Date:   Mon, 18 Nov 2019 10:27:54 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Joel Jennings <joel.jennings@makeitlabs.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-serial: cp201x: support Mark-10 digital force gauge
Message-ID: <20191118092754.GD1723@localhost>
References: <20191118092119.GA153852@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118092119.GA153852@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 10:21:19AM +0100, Greg Kroah-Hartman wrote:
> Add support for the Mark-10 digital force gauge device to the cp201x
> driver.
> 
> Based on a report and a larger patch from Joel Jennings
> 
> Reported-by: Joel Jennings <joel.jennings@makeitlabs.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: stable <stable@vger.kernel.org>
> ---
> 
> Johan, I can queue this up in my tree directly if you want me to, so as to get
> into the larger 5.5-rc1 merge if that's ok with you.

Please do, thanks.

Acked-by: Johan Hovold <johan@kernel.org>

Johan

> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -125,6 +125,7 @@ static const struct usb_device_id id_table[] = {
>  	{ USB_DEVICE(0x10C4, 0x8341) }, /* Siemens MC35PU GPRS Modem */
>  	{ USB_DEVICE(0x10C4, 0x8382) }, /* Cygnal Integrated Products, Inc. */
>  	{ USB_DEVICE(0x10C4, 0x83A8) }, /* Amber Wireless AMB2560 */
> +	{ USB_DEVICE(0x10C4, 0x83AA) }, /* Mark-10 Digital Force Gauge */
>  	{ USB_DEVICE(0x10C4, 0x83D8) }, /* DekTec DTA Plus VHF/UHF Booster/Attenuator */
>  	{ USB_DEVICE(0x10C4, 0x8411) }, /* Kyocera GPS Module */
>  	{ USB_DEVICE(0x10C4, 0x8418) }, /* IRZ Automation Teleport SG-10 GSM/GPRS Modem */
