Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D42D6AE1F
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 20:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfGPSFO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 14:05:14 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36662 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbfGPSFO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 14:05:14 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so14423318lfc.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 11:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BcjCr4RxG3EDz8qAoUTb1m5f4EDou8BjelqyJdnYueU=;
        b=f+vxR/2UrUs7/Kvbj4eG3Ob+6dnjm50rhjUYx2BvEgNEEf2D6agwMd6oN+YdBMKYsP
         Z1b8MWVqLb9q7ki5wbdcZGLOdtKXFRRV0aHE+Nk3golYDdBK0i95e/va0aB6ua8ZORLG
         mKD1P1Wzn+JyXYv0Aks5DsvTcScZQlDUZ3hacuLvDGpzeDQ/pJJe6+W+mdU0W0eNLyk9
         nEm8jvrmcgUkeX6B1gCSZz/0yYA7RbRNM5A1RSu6Ws487GuVsjuzjb3zWOApLeLIkJDK
         pqG/pMf72pKig9XiVYrs2+2uC382VTpyGqgitG09mYTAyAzGFPMBvJ+TtjSx1hjgXETF
         APdg==
X-Gm-Message-State: APjAAAUlG58lecioMCH1ojKwq0tLAofIiIGGqRx8tkH68CJtSKtAu2go
        Nl/KVZaZazg8WXQoYmb5wavyzUwuSyg=
X-Google-Smtp-Source: APXvYqxiyS6lLYvIRNxjMc88+LL4stJUW5pLxQld1uhktNa8WgcegaDX2gK3KYnedECcT90PdHJ9wA==
X-Received: by 2002:a19:f819:: with SMTP id a25mr16096516lff.183.1563300311930;
        Tue, 16 Jul 2019 11:05:11 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id t67sm3902986lje.19.2019.07.16.11.05.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 11:05:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hnRp8-00025Z-Al; Tue, 16 Jul 2019 20:05:10 +0200
Date:   Tue, 16 Jul 2019 20:05:10 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Lars Melin <larsm17@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, Rogan Dawes <rogan@dawes.za.net>,
        linux-usb@vger.kernel.org, Dan Williams <dcbw@redhat.com>
Subject: Re: [PATCH] USB: serial: option: add D-Link DWM-222 device ID
 [version 2]
Message-ID: <20190716180510.GO3522@localhost>
References: <20190711094012.GA16316@lisa.dawes.za.net>
 <20190711103457.GA17414@lisa.dawes.za.net>
 <20190716091122.GB3522@localhost>
 <CAOYdKdiEUsk9O=ytis=u2yD-69LoKNSE8=ivwer8K3sMNCd8Dw@mail.gmail.com>
 <20190716111711.GD3522@localhost>
 <1eda7a85-f71d-950b-8efd-d3258ffeeab5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eda7a85-f71d-950b-8efd-d3258ffeeab5@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 16, 2019 at 09:34:56PM +0700, Lars Melin wrote:
> On 7/16/2019 18:17, Johan Hovold wrote:
> 
> snip
> 
> > Ok, thanks. Do you have any idea what all those vendor interface are
> > for? Some of the other D-Link entries blacklist a speech and debug port
> > for example.
> > 
> > We can always do that later if we need to, but perhaps you or someone
> > already know (also adding Lars and Dan on CC).
> > 
> > Johan
> > 
> 
> This is the interface composition:
> 
> MI_00 D-Link HS-USB Diagnostics
> MI_01 D-Link HS-USB Modem
> MI_02 D-Link HS-USB AT Port
> MI_03 D-Link HS-USB NMEA
> MI_04 D-Link HS-USB WWAN Adapter (qmi_wwan)
> MI_05 USB Mass Storage Device

Thanks, Lars.

Then interface 0 and 4 should be blacklisted, right?

Rogan, would you mind doing that in a v3? You can include above
composition details in the commit message as well.

Thanks,
Johan
