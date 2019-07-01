Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAEA8364B5
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 21:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfFET3b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 15:29:31 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51990 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfFET3b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 15:29:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id f10so43687wmb.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=D5NcDW+/WmQwqSB+Xi8h1sKYPuuI5ApOFt3kq9BvkTE=;
        b=U4jgD3qb1TiWPeo0I0EQj9YVlGjsjBiUgv3hdUmrYuJZrUIMq1nNLAiutPQCj8EtAU
         YcN2wBjP/xTv7tUdThX93VYX+jHZw5o551/dyZ5nHxveozxZb7mV7AnbhOP3Xm1aNcgb
         zWPwwh4cUFyxAGVJHFgITDfzSo0Fijs3mzurFbu3Dxh9EE16inWaZaO31svsntXTWO+E
         rfQ2q3CIc3i7jCGmbbwjZpRhYeLhJK8BD9iADSXBK+n0GDyNWmK+SIK+418dbmYGmH2y
         bIn0iv+CbWqXWwlNmyM/unKrXJcIfcEAv7F48JcipbDFhbKp/iNFt0eUPUWKtO7DjtrJ
         Jocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=D5NcDW+/WmQwqSB+Xi8h1sKYPuuI5ApOFt3kq9BvkTE=;
        b=p19xREFuRjCXCJ3pQNyN5Be+Im6NkMy9LwXM7D9EA5J5SwAxSZxmPlWVe8iqO3rYjo
         oQNtPJRq1AK3eNygVzgnI8lj4Wra+Fw3WrOv0LhNka3IRdf9KEl2xW7KSx8UlOIEOJlH
         Wuny36/14eCzwj/AuJ/H2v5YcYzZyjsOJlOqhUvPvG/xvMujXd8XzjnuvAvccqXmPCZY
         TwdwdsThJZQHoOk6eWFu32YzIeZVlLxPlrCpmskYjmaJrmeeSZGU7bko3aBr1GyALTxg
         DolUxhmitsLPD+pd9mOGYZD6agd73RbRV0Q7Bvwr/hNz5Zlnsj25ctkvcAi4Uhs+Bx7r
         1/sw==
X-Gm-Message-State: APjAAAXni8OUo7q/UxRbYhLsaB4UV6MT55r9CTvOHZwDrTbqnZ175y7v
        kzhoqqM2BjjfTySU46q9qssNyw==
X-Google-Smtp-Source: APXvYqz8xLqEZUQ1bW9JTYYNxCZRI9YeEhZeMBTkaYKaXpxE3Ij1iNeqP9qVNZUnCX1dMi5d/0Ok/g==
X-Received: by 2002:a1c:ca06:: with SMTP id a6mr23888475wmg.48.1559762968778;
        Wed, 05 Jun 2019 12:29:28 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id w185sm20968659wma.39.2019.06.05.12.29.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 12:29:28 -0700 (PDT)
Date:   Wed, 5 Jun 2019 20:29:26 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the
 SDM845
Message-ID: <20190605192926.GW4797@dell>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-7-lee.jones@linaro.org>
 <20190605070029.GN22737@tuxbook-pro>
 <20190605083454.GO4797@dell>
 <20190605191453.GJ4814@minitux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605191453.GJ4814@minitux>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 05 Jun 2019, Bjorn Andersson wrote:

> On Wed 05 Jun 01:34 PDT 2019, Lee Jones wrote:
> 
> > On Wed, 05 Jun 2019, Bjorn Andersson wrote:
> > 
> > > On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> > > 
> > > > When booting with Device Tree, the current default boot configuration
> > > > table option, the request to boot via 'host mode' comes from the
> > > > "dr_mode" property.
> > > 
> > > This has been the default on the MTP, but this is changing as this is
> > > causing issues when connected downstream from a hub (the typical
> > > development case for the primary USB port of a phone like device) and
> > > more importantly we don't have support for the PMIC blocks that control
> > > VBUS.
> > 
> > My point is not about which mode is currently chosen.  It's more about
> > the capability of choosing which mode is appropriate for a given
> > system via DT.
> > 
> > > Once these issues are resolved the dr_mode would be "otg".
> > 
> > OTG doesn't work on this H/W, so we need to specify "host" mode.
> 
> My objection is that when you say "this H/W" you mean a particular
> product, but you're making this decision for all SDM845 based products
> using ACPI.
> 
> I don't know if there is a Windows phone based on SDM845, but if there
> is then I don't think forcing it to host would be correct.

You mean if someone wanted to boot Linux on a Windows phone?  Not sure
how likely that is, but even if a) there is an SDM845 based Windows
phone and b) someone is crazy enough to run Linux on it, it should be
trivial for them to conduct some device matching and choose a
different property based on the result.

[...]

> > > And this driver is used on a range of different Qualcomm platforms, so I
> > > don't think this is SDM845 specific.
> > 
> > ACPI based platforms?
> > 
> > All the ones I've seen use the XHCI USB driver directly ("PNP0D10").
> 
> MSM8998 (835) has the same controller, so this should affect those
> laptops as well.

This would also be the correct configuration for them too.  OTG
doesn't make much sense for a laptop form factor.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
