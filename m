Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069A9D420E
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 16:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbfJKODx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 10:03:53 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41590 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfJKODx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 10:03:53 -0400
Received: by mail-lj1-f196.google.com with SMTP id f5so9956377ljg.8;
        Fri, 11 Oct 2019 07:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+f6O8XEfL+cvBwzG3ePBU9PQPGfPsgpf7I3nap3KYTo=;
        b=gAUBzxHkuIEucihWYkceeatTBcf825TU4yOo1Tbz5qPtRxrhf1+9pQTguNNwmKJY0y
         c0Nf7XyWO7KuPujLeHkECjxRo1UlS5737w/lwfojC2A9LM0+G1MAHTLkNdFkizyZVkY1
         eIISamFkUmhmxKEqBpCR4zk8RbkSAl1WmjUsBbWDCWorFc5hFZn9rKi9HunuliB97Efd
         KwCgiVHoyPKXa9RX8DbBFSCqzhJjUbPxUTseBEXoIcd/PoOYcW+toi7u1fhCr0B/JuMm
         ZfRGfieCIJehRRPZo5HRA0lM29R7by9Ozs6pi7K4xnflG1iAoMRnI3d+QT5c9sx8ou5D
         s4pw==
X-Gm-Message-State: APjAAAW/rqv5ATMqTDe0JicCHL7x3Iwp9mETFMh6umZetIzyi32AoUES
        X3XJ5/8LCGEyfWYu02FbDto=
X-Google-Smtp-Source: APXvYqya0GotkqBXqg5+0cvpGT8UF/jzJH6rF37I+CBdEvNXZslx8nK2ztl68GAXZMURfJmxO1mHow==
X-Received: by 2002:a2e:9cc9:: with SMTP id g9mr9629278ljj.160.1570802630421;
        Fri, 11 Oct 2019 07:03:50 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id w30sm2004615lfn.82.2019.10.11.07.03.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 07:03:49 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iIvWS-0000uy-Go; Fri, 11 Oct 2019 16:04:01 +0200
Date:   Fri, 11 Oct 2019 16:04:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: legousbtower: fix a signedness bug in tower_probe()
Message-ID: <20191011140400.GI13531@localhost>
References: <20191011133525.GB22905@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011133525.GB22905@mwanda>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 04:35:25PM +0300, Dan Carpenter wrote:
> The problem is that sizeof() is unsigned long so negative error codes
> are type promoted to high positive values and the condition becomes
> false.
> 
> Fixes: 1d427be4a39d ("USB: legousbtower: fix slab info leak at probe")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/misc/legousbtower.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
> index 9d4c52a7ebe0..835908fe1e65 100644
> --- a/drivers/usb/misc/legousbtower.c
> +++ b/drivers/usb/misc/legousbtower.c
> @@ -881,7 +881,7 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
>  				  get_version_reply,
>  				  sizeof(*get_version_reply),
>  				  1000);
> -	if (result < sizeof(*get_version_reply)) {
> +	if (result < 0 || result < sizeof(*get_version_reply)) {
>  		if (result >= 0)
>  			result = -EIO;
>  		dev_err(idev, "get version request failed: %d\n", result);

Bah, I should have noticed.

Thanks for fixing this!

Acked-by: Johan Hovold <johan@kernel.org>

Johan
