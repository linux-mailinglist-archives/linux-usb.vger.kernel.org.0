Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6855D36396
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 20:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbfFESuj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 14:50:39 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43438 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfFESuj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 14:50:39 -0400
Received: by mail-wr1-f67.google.com with SMTP id r18so11542239wrm.10
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 11:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8vNfSakOSIaeYkNSrJu0oYtoS/2sVqhVE+XWuJ5wXUA=;
        b=y1tiV2V5sXR3finGbj6PBB105VryHTKBqz6Fi26P7OokmguArILT6hR/brsN28qt7i
         2YxLaKNSfPqK9Jgn9/mMlkG4G+VOFZMqs+hA+U8FgWjwjngGWP4rNePL/0vsUE434Dgn
         /Bn7FXIBYtkEalGH5AJa0lDnpJPu1hXWV49rQm3uniXffz5UuCgRVRv3rpp95FBovRuc
         TrtRVDgL0i/GhVFoakUZgwUjlM2oFg4FSVYnXAoBj1vvd9IBL5ntUsaPF+P6e0Brnn1p
         nRB62Fr54pp9/t8HlVU+70QokwHFqnp1HnCFL1MeIYtD/oVdHuObfQXi5WNbGN/zqzEx
         gArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8vNfSakOSIaeYkNSrJu0oYtoS/2sVqhVE+XWuJ5wXUA=;
        b=CF2tE1WLj0E4utM9qjo5j6HsQi0QJHCHImsJiwt9QsQ1LWxHq8/k5pCKWcx8sjKQcu
         IDgqDNwSz5/6t8yNEjbvoL4eQyrsILi9MpNViJVv4Yolfe7Eaf05H8eom8AjeDpQq9X9
         /vHEOUuwjQm2AnfMqVtWyrpKxaD5tZxvuhFZmBDQByA9m45em86DPzwc4DbEUSnezpEA
         QO9HaIA/ckSDbDxOlttb+ipj89Lkp/W3djBfLwlMcIfEVIVbyGfcn77kJLYUO6RUt0yu
         +DD6FaDySIdlKJ6LToIveHdK3pDOA9Woh5Tkhx6NOkDWfm+kjbP5Yks8wswa/xmCDw1A
         f7dA==
X-Gm-Message-State: APjAAAUP7Q4pUPAevutYHcbPVzxZuP77t4EhdTo+RJfVdRjOUDkOHGnU
        GqWuCkxUK246m0g/QTgOVbCjRw==
X-Google-Smtp-Source: APXvYqwL7qctviv4Xofr/RuLW7YnI4XPLqzlKOFo+Pb0C7oxaQ8vKyl1fZALCZuFEXSz4BRXAxnX/g==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr11577692wrj.47.1559760637352;
        Wed, 05 Jun 2019 11:50:37 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id v15sm13443547wrt.25.2019.06.05.11.50.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 11:50:36 -0700 (PDT)
Date:   Wed, 5 Jun 2019 19:50:35 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.brown@linaro.org,
        alokc@codeaurora.org, kramasub@codeaurora.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the
 SDM845
Message-ID: <20190605185035.GV4797@dell>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-7-lee.jones@linaro.org>
 <20190605070029.GN22737@tuxbook-pro>
 <20190605083454.GO4797@dell>
 <d9ba98e6-3caf-62fc-45ca-944cb718b7e4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9ba98e6-3caf-62fc-45ca-944cb718b7e4@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 05 Jun 2019, Jeffrey Hugo wrote:

> On 6/5/2019 2:34 AM, Lee Jones wrote:
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
> How have you made that determination?

I enabled OTG and plugged in all of the things.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
