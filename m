Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E68043F28
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 17:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387673AbfFMPzS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 11:55:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53029 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731549AbfFMIwK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jun 2019 04:52:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so9278758wms.2
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2019 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WVZ+rcl5b/TJbfPdwJog0AuENCxf5fDzdWtd1QjNORs=;
        b=KhRHPOT+eeCOo3Rd17kUr4gESsUUD6oB/H9FuZEkVh5X07Q3459tvOQUJY/t2LgvNt
         Y6UyMSWniCeuvWdTLwzXcrwj8Ag2k85/UAKnJIhY5spD8wVOGOY6Y8zvi4mW2VfDWbXe
         vd8pGQ9f8dOsk6c2/n+PJ2/q8VFeGZ26/hoUpLv4E1XmnO0ExHLiiDk+i00pEEkL7uic
         pxH9oKrv2e5eXF7YXI8BST1o0KYCgCjFx7reqdsSEcPxLCBbJ8GkRCoqCc4CNS9k83Gf
         TBo2kDnqQIhU+z+sB42tEAztWO1cS9IGrfz6leTNKEN3uIj4+cngS7qju+ylhNPkEs5g
         md5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WVZ+rcl5b/TJbfPdwJog0AuENCxf5fDzdWtd1QjNORs=;
        b=D4CSefx99/EpUahyUZZzm1uHU7fG4T+/X3SV/FsYlDBYvKQKKhcloony8C2r0XXiB8
         7/v0iXDwWZcjH7S9rE6vnrxcsLSUDGUF5+0hQKNFuk41JZWYHeo+pnf6q8K5LlN0UyMt
         RVDcrpmGA7pYzS8ZYydb+Fmt0BkP7b6SdglwT+gPbqp7w2HIQTuk3RsP1bouoGw1M5L8
         eC/C2DAK1DtgQwHY/gQ8BmR2RVDFGoKl8YuegAwwY5SBgIfqsdfDOEl7H4xqaX1xnuHN
         Te6B/u5wNXCus2htwHsseNnQDWLj6BZnqbqjJb8vCTdOX4j/I6thOQqeAPN5tvoxLvz1
         eO1A==
X-Gm-Message-State: APjAAAVqg8ZP0LwFUmUo4HpYbth8SboGcvj8D3iHHhPeiuRN/JIGsA+p
        RcrDPZsdxUoYadvyW4rTvz13DQ==
X-Google-Smtp-Source: APXvYqwMM9q5lwGeSSVSnEBxvQ/pJDmMKfQGsGMfurbu78aCJ/K2e5YVPjas2AvJJWv2rHYYLvuXTw==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr2931036wme.51.1560415927490;
        Thu, 13 Jun 2019 01:52:07 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id s7sm4929762wmc.2.2019.06.13.01.52.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 01:52:06 -0700 (PDT)
Date:   Thu, 13 Jun 2019 09:52:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] i2c: i2c-qcom-geni: Provide support for ACPI
Message-ID: <20190613085204.GF4660@dell>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190612103453.ccet2pneairnlpcc@ninjato>
 <20190612104011.GA4660@dell>
 <20190612104459.gvji3qxym5s4odfq@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190612104459.gvji3qxym5s4odfq@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 12 Jun 2019, Wolfram Sang wrote:

> 
> > There are no cross-subsystem build dependencies on any of these
> > patches.  The only reason they are bundled together in the same
> > patch-set is for cross-subsystem visibility and understanding.
> > 
> > There is wide interest in these devices.
> 
> I see. That would have been a great cover-letter, Lee ;) Thanks for the
> heads up!

:)

> > > Also, the current maintainer entry for this driver looks like:
> > > 
> > > drivers/i2c/busses/i2c-qcom-geni.c:
> > >         Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> > >         David Brown <david.brown@linaro.org> (maintainer:ARM/QUALCOMM SUPPORT)
> > >         Alok Chauhan <alokc@codeaurora.org> (supporter:QUALCOMM GENERIC INTERFACE I2C DRIVER)
> > > 
> > > I didn't hear from those people yet, would be great to have their acks.
> > 
> > I will see if I can rouse them from their slumber.
> 
> Please do. If they are not to reach, we probably need to update the
> entry...

I contacted both of them.

 Andy doesn't touch anything that isn't QUP based (8994 and older).

 David doesn't deal with MSM platforms if Andy is available. 

So I guess the decision is yours.  Seeing at this patch is pretty
trivial and has our ACPI expert's Ack, the decision shouldn't be a
difficult one.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
