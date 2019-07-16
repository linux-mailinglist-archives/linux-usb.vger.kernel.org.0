Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71D686B00A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 21:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfGPToN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 15:44:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42873 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGPToN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 15:44:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id t28so21148736lje.9
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 12:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1+0VNCVHZqhO1uG67Uu8Kx87UamIcw879woFYT6vOC0=;
        b=g9hre17A8wPStyi3AW3es6JDEWMvAtinUIPcoCTsXXri9ahdaXGHBwMJrtUnTz3hmF
         D5INCZkGkdKZeC1+3p7VZou2MkS7aiMlJZhCaWKsZXqPCmK0UGcAhvjBlxcNnmft2hQR
         Zpm/0WCex4D7pg0Gugi4VgFo/wHdI6z11ZxSGZDPlu24JkEe5oapj9OeXv0+0dQZ6/c3
         QPgBmONKSwgtVfu1RF64nVBXR2oZvtXpe/XQ1xrSJ4b4vbYyfvrksUsX+wwgh3IxDOqR
         bWv/0g0GK0IVHvrFqGSFNFO8S9hRje4I364LiWqFMsqAVzYu2/5140hr5v9b/3tstjlL
         uCxw==
X-Gm-Message-State: APjAAAXwGyYE+XgIyH5zNfYno8bE/BedOUpwzEWHpZ3aG8Q5NLUmsItN
        mZOOyPhG/FWkn877bjgEAr0=
X-Google-Smtp-Source: APXvYqy8GpV3WIegsceEcy5Uj0kRNar8h+RyBeVHDwBdegn9CgRN9HnLNh3DiBEDurt1nDDqDCZnsg==
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr18232786ljh.79.1563306251330;
        Tue, 16 Jul 2019 12:44:11 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id 63sm3980771ljs.84.2019.07.16.12.44.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 12:44:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hnTMx-0006E0-6Z; Tue, 16 Jul 2019 21:44:11 +0200
Date:   Tue, 16 Jul 2019 21:44:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Rogan Dawes <rogan@dawes.za.net>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Lars Melin <larsm17@gmail.com>, Dan Williams <dcbw@redhat.com>
Subject: Re: [PATCH v5] USB: serial/qmi_wwan: add D-Link DWM-222 device ID
Message-ID: <20190716194411.GV3522@localhost>
References: <20190716190210.GA27056@lisa.dawes.za.net>
 <20190716191205.GA27426@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716191205.GA27426@lisa.dawes.za.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 16, 2019 at 09:12:05PM +0200, Rogan Dawes wrote:
> Add device id for D-Link DWM-222.
> 
> Cc: stable@vger.kernel.org
> ---
> Also add the qmi_wwan entry, since it was blacklisted already in option
> 
> Apologies for the spam!

No worries, you're getting there. :)

>  drivers/net/usb/qmi_wwan.c  | 1 +
>  drivers/usb/serial/option.c | 2 ++
>  2 files changed, 3 insertions(+)

But please split this up in two patches and run get_maintainer.pl on
each. The qmi_wwan one will go through the network tree.

Also include the interface layout that Lars provided in the USB serial
commit message.

And don't forget the SoB line as Greg pointed out.

Thanks,
Johan
