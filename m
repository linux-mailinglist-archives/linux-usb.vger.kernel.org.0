Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E8A1287A
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 09:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbfECHLU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 03:11:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34519 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfECHLU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 03:11:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id s7so4405009ljh.1
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2019 00:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=an9LwTm/mCbxF5uZXSG/ahglTllrhTSitjuyMM/AZ+U=;
        b=E9Gha+Kmt00tyBa5UezofvYed3RpHMv3HE7aNxKgET8+VOeYaWo2LaFICKPpSHdGxN
         TCzbjwQYmDAChjlcVYsN663sH+wtwxs6LMAvCTxmpnzqWIVJtpslxSFUR/tn2TNupbSv
         Ytknjd43zBo/Pv7d+lg6WOvn0QtpybIV9fbc43N8TL+rkDW7T81ddwrBvim8qpR1gk+/
         vdwo8QoU8g9EpXuiZxgkSsNRbizkjaddfwoZuD6zbu3Ok8B2OtQqPqlnJM9V53p4PPHP
         fXgJnMBOEEwy2ni2StSDsdwBAB/c96/Cv2BLtMQ8ArDZ4akmP8ACMf71PtrE0huZYxS9
         9/4g==
X-Gm-Message-State: APjAAAVq1vcGDevWC15PbGF+sDYnDNZvHCxSFXhEj8c+KxIsmV07CcdM
        dFEmnJ5WdWYHlKXUns/ZjexRO5ED
X-Google-Smtp-Source: APXvYqzlR0h9qy1g1FmxUHDUbnNgToARcrxmjMXSgrqL1yQ69NEVGAzm2Z+nP+33pQPKvrnWOmH/Fw==
X-Received: by 2002:a2e:9283:: with SMTP id d3mr4264035ljh.8.1556867477880;
        Fri, 03 May 2019 00:11:17 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id w19sm263712lfk.56.2019.05.03.00.11.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 00:11:16 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hMSLw-0004gL-Uf; Fri, 03 May 2019 09:11:29 +0200
Date:   Fri, 3 May 2019 09:11:28 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw
Subject: Re: [PATCH] [PATCH v2] USB:serial:pl2303:Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190503071128.GB26546@localhost>
References: <20190429121237.13136-1-charlesyeh522@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429121237.13136-1-charlesyeh522@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 29, 2019 at 08:12:37PM +0800, Charles Yeh wrote:
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
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---

What changed in v2? You forgot to add a changelog here.

Looks like this one is not based on the current driver code (e.g. my
usb-next branch as we discussed), and also does not address some of the
issues raised so far (e.g. you're overwriting the entire flow control
register on updates).

I didn't have time to finish the prep work I promised to do, but don't
worry, I haven't forgotten.

Johan
