Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF10E14D4
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 10:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390410AbfJWI4o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 04:56:44 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33234 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390358AbfJWI4o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 04:56:44 -0400
Received: by mail-lf1-f65.google.com with SMTP id y127so15419925lfc.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 01:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4uENUzOt/liWgXC5Xy/eJGbzZSd9cV32wLR2c1sWJFE=;
        b=g1St2QrKKRIBl2aY2Hbr7wWsiNWKLWn0tvJ4kI5VcwulL+VxscpvMiwEGzyHcvIMTk
         Qph9v8pfYb5HAEZVHQYjvkI4Io0if82El2xWILXgi0RH0R4Fr8fkJtHletbgsPiqDWqS
         EtU7e8uzuL5qKtSKGPe4pFSgeb3S2cwtYMX6UOBg6F4YoobSKoUWkDQ4Q4Aw63P2X6By
         Ki1tjMWnUiKbJnYEzMVtr2C+7JWQouNFd8xoh6GtGt/2Jrb+C1lSFmu2/7oyOPaObrUU
         1LUjDLKNrz3GsT5odZF+QrPGWE/ihlirwy46sXOgrgxApoNsheoi09ZAjBvCSbbLsolB
         3riA==
X-Gm-Message-State: APjAAAU653UrnI1FTwPGZxEdpi0kNzOqAzLiErV5tB5vcJv/+cKUMR04
        dk6OIQHDoGQKB4O30reZzJA=
X-Google-Smtp-Source: APXvYqzUoYj7U2TZOwXmLAbrR0dS/V1w+8ljIJmD6ImgfYC5lWm15pP60NHYerNPs7eJLy9iRgXQxw==
X-Received: by 2002:a19:9144:: with SMTP id y4mr16336244lfj.168.1571821001747;
        Wed, 23 Oct 2019 01:56:41 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id p86sm10604198lja.100.2019.10.23.01.56.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 01:56:41 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iNCRt-0006OI-Lg; Wed, 23 Oct 2019 10:56:57 +0200
Date:   Wed, 23 Oct 2019 10:56:57 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw
Subject: Re: [PATCH] [PATCH v8] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20191023085657.GP24768@localhost>
References: <20190924121400.1497-1-charlesyeh522@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924121400.1497-1-charlesyeh522@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 24, 2019 at 08:14:00PM +0800, Charles Yeh wrote:
> Prolific has developed a new USB to UART chip: PL2303HXN
> PL2303HXN : PL2303GC/PL2303GS/PL2303GT/PL2303GL/PL2303GE/PL2303GB
> The Vendor request used by the PL2303HXN (TYPE_HXN) is different from
> the existing PL2303 series (TYPE_HX & TYPE_01).
> Therefore, different Vendor requests are used to issue related commands.
> 
> 1. Added a new TYPE_HXN type in pl2303_type_data, and then executes
>    new Vendor request,new flow control and other related instructions
>    if TYPE_HXN is recognized.
> 
> 2. Because the new PL2303HXN only accept the new Vendor request,
>    the old Vendor request cannot be accepted (the error message
>    will be returned)
>    So first determine the TYPE_HX or TYPE_HXN through
>    PL2303_READ_TYPE_HX_STATUS in pl2303_startup.
> 
>   2.1 If the return message is "1", then the PL2303 is the existing
>       TYPE_HX/ TYPE_01 series.
>       The other settings in pl2303_startup are to continue execution.
>   2.2 If the return message is "not 1", then the PL2303 is the new
>       TYPE_HXN series.
>       The other settings in pl2303_startup are ignored.
>       (PL2303HXN will directly use the default value in the hardware,
>        no need to add additional settings through the software)
> 
> 3. In pl2303_open: Because TYPE_HXN is different from the instruction of reset
>    down/up stream used by TYPE_HX.
>    Therefore, we will also execute different instructions here.
> 
> 4. In pl2303_set_termios: The UART flow control instructions used by
>    TYPE_HXN/TYPE_HX/TYPE_01 are different.
>    Therefore, we will also execute different instructions here.
> 
> 5. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_HXN is different
>    from the vendor request instruction used by TYPE_HX/TYPE_01,
>    it will also execute different instructions here.
> 
> 6. In pl2303_update_reg: TYPE_HXN used different register for flow control.
>    Therefore, we will also execute different instructions here.
> 
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>

Now applied, thanks.

Johan
