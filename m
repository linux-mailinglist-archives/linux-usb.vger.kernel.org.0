Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7F039AD0
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2019 06:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbfFHEKt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jun 2019 00:10:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42300 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfFHEKs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jun 2019 00:10:48 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so2233142pff.9
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2019 21:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=crP/L6ZX28vkkYT7tQbRmMKy/ZkhEnI0JhfxmVeFjC0=;
        b=TxsNOhcUk2dUhjgJIcbkyLXBtKqvJpHTaNc+xRSs9moW2ndwxj0wvHpb7UdzZ8GIHB
         kLyvVG7zidxP9IwSJaymt3F8UL/RjVnz25slMDWhjSipyy7NK5DrrZByM4hqIzNMUSwe
         ps+y0MD8eWL3A3X5z+GVpgopfFtTJLERmnFQgsMBKRMuDXgI16xf4cX5zcQqBZ0JbZdv
         UFvzSVX0RPSdSceNL453+7PL2y9nE2pm1Vr6heypDuiZ0SQFVNO8xElhZJO5HQFMq4N8
         EQ3h/DKqO7j8gM2LNhNJd3H3U9/qGXBzsfz16WMsfUUgYOqNRTcZIB6THFxBwhxXZGjN
         8Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=crP/L6ZX28vkkYT7tQbRmMKy/ZkhEnI0JhfxmVeFjC0=;
        b=Ug634ko04trNdiifNcNvNNoVNtjUTGDu8SzXOR1na88vXBZg5kLVS2b+a8g/fI2zlK
         PeWYU1dCjtLFu6wz0vCprADvozFqb2DOq8xxez3BzhMjbVfEvPElcbCviPH5ipOxl4U3
         qub1VT9o1MJGOafEgCdkYmB5h8OdZObirDh/PHh6U20ItADCioszDPs4NxtCseEKrPFQ
         gqgH7BXoBWtmYaf9A4BXgi/KTz85ToLd1Dtr2SLjZLM3y0XFLaJL5idpOVgf4CVFl/va
         njIT73Hc9LDKErQEvlEn6KR/SDrqBwHWb1V+TeGIWue+fZgAXH2i/LCbPYiyz4bWinax
         qspA==
X-Gm-Message-State: APjAAAVol+iKP+GisnEtlkm5aKXiuXn6Q9hCtYF91DcAAkekxg1/Trxc
        6TraGhjqK3MoEN5HL1bcdL8Eym1WQbc=
X-Google-Smtp-Source: APXvYqyqDR2r/6Uj2YzgTATzPBXHYoPMxcYRP/mHWDNK1dDw68dJRtVmbbW/lRrBdRydM7vET5JDPA==
X-Received: by 2002:a63:ee0a:: with SMTP id e10mr5868676pgi.28.1559967047717;
        Fri, 07 Jun 2019 21:10:47 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b35sm3516670pjc.15.2019.06.07.21.10.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 21:10:46 -0700 (PDT)
Date:   Fri, 7 Jun 2019 21:10:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, alokc@codeaurora.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/8] pinctrl: msm: Add ability for drivers to supply a
 reserved GPIO list
Message-ID: <20190608041044.GK24059@builder>
References: <20190605114302.22509-1-lee.jones@linaro.org>
 <20190605114302.22509-3-lee.jones@linaro.org>
 <CACRpkdaEe3uKAsSuhbToevXH1cMsuMUvwaopLPuD+JkDTnuEnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaEe3uKAsSuhbToevXH1cMsuMUvwaopLPuD+JkDTnuEnQ@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri 07 Jun 16:02 PDT 2019, Linus Walleij wrote:

> On Wed, Jun 5, 2019 at 1:43 PM Lee Jones <lee.jones@linaro.org> wrote:
> 
> > When booting MSM based platforms with Device Tree or some ACPI
> > implementations, it is possible to provide a list of reserved pins
> > via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
> > However some ACPI tables are not populated with this information,
> > thus it has to come from a knowledgable device driver instead.
> >
> > Here we provide the MSM common driver with additional support to
> > parse this informtion and correctly populate the widely used
> > 'valid_mask'.
> >
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Exactly how we should use of the API, so if Bj�rn can supply an
> ACK to patches 3 and 4 I'm happy to apply them.
> 
> Bj�rn?
> 

I'm waiting for a version that does not specify the reserved_gpios for
struct msm_pinctrl_soc_data sdm845_pinctrl {}, as this would override
the ability of getting these from DT.

I haven't seen such revision yet, will review it once I find it.

Regards,
Bjorn
