Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E5F2846AE
	for <lists+linux-usb@lfdr.de>; Tue,  6 Oct 2020 09:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgJFHA2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Oct 2020 03:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbgJFHAY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Oct 2020 03:00:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCCEC0613DD
        for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2020 00:00:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id n18so4327850wrs.5
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2020 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Oe7zU6gzISKBUmakEze1jPjt4AoCrxJWUb32hirWtf4=;
        b=duVae73qGXrIWn0dA9Y2ba0eTvLVJldQbfNGMJhbCGq9paoehFS47xcK9OLpCkH4WF
         NqBrFaENJwbrU/th8XmIkh1VS1vd2oH1s1pXzDf2b99Cb/bAZ5mIsHV6ptmyF1OBtQBy
         GT9rg4w2n4Isj8jXnTNnLi+Aw/L7SFWFx72v0bNTNomBvhPxjgr+pR8su7g3MDB9LEtn
         /vLB/qwXlI19SAUsjJySvCczuoNdnCBTeLhRqUeV/ScZadUIhYWFwLaiDoYkjoSe+gXj
         C3HqfoAXjTKslZ5dKtYyztKJYZ9eX7NM47nSfo4FbYcgGC7bh2R2dMJAzlKCSNaNoWRF
         iUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Oe7zU6gzISKBUmakEze1jPjt4AoCrxJWUb32hirWtf4=;
        b=Zwx8D/J0z52FflzxyqJuRgGeXZjKvs+dRVqnagIKiY2YBh907gDh+xxmMuE0FSkW3h
         sfw6uKsQ8cch6L2emwEmHCUhJVkCMMRoPXahJP9sWRIVWNgnZyC2c8OMHfAzZxSUvWF8
         hGNFkFv38w6lc1A2ZftfXwXiyU4ymq6UNHAUwevGmKzEDh3e7cCSzEqpX7xDU7CLEsNV
         wVgAhHY90Ywh4IjSjyRbXKkmdoObsdWKqFyFkFoTSjiOc2ZvgZx6aMNUKoJvXgkE0FWp
         HMgLjRwIHTq3HT3wlyXFN3C+5SZQjPubxjE7OWaccKXHytBo3h01lRfvNqlnc1KczKqH
         Oltw==
X-Gm-Message-State: AOAM532J7ZMbMrwXDPWqj/QsmqAPlx/k0ZdI9d02KTjFcpneprXfdurb
        UbdLyafsJu2Lf9UR5Rt0z6jYNw==
X-Google-Smtp-Source: ABdhPJzRpE6n88xNVq3Fk+xQSff8QQNC8n1c0b7ajSoy19OwpevLFHK5HQwgX5M07UqJkIIa/Io0cQ==
X-Received: by 2002:adf:bb43:: with SMTP id x3mr3174885wrg.250.1601967621811;
        Tue, 06 Oct 2020 00:00:21 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id o186sm2537036wmb.12.2020.10.06.00.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 00:00:21 -0700 (PDT)
Date:   Tue, 6 Oct 2020 08:00:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Another round of adding missing
 'additionalProperties'
Message-ID: <20201006070013.GA6148@dell>
References: <20201002234143.3570746-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201002234143.3570746-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 02 Oct 2020, Rob Herring wrote:

> Another round of wack-a-mole. The json-schema default is additional
> unknown properties are allowed, but for DT all properties should be
> defined.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
