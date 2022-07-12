Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE82157288B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 23:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiGLVZG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 17:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiGLVZF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 17:25:05 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEBCC48ED
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:25:03 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y9so8520752pff.12
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y4UyLrACxlenLlhH0mDXEAxElGbIQd50zgnqB+nPHFw=;
        b=GmANklKAqlYga+Up5mAaU9+fI6zf3sB//UrPU0s2zl+KVDKC0txFhJMrPSjbRtmVTy
         vx5ecmLjUOydAneb9e/9/ULVEfBJsxSoFel3u7mGEbLqxvRw6IfWf+/IhFALTSnX6xVC
         A5yfUoFJFRrJTlHEROTlRSkrpObqa65sR3rfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y4UyLrACxlenLlhH0mDXEAxElGbIQd50zgnqB+nPHFw=;
        b=PQj9D8/+CGYkufB2zdyoKrOTXaBDFlWvRm/OQVHQRkthEMQBjLs8zyCRcwpbmEWUlv
         1bnIKtL8yiDfuRfXSJbrA+Z+jsec6bD4TQ1awhmx9Tg4KQ2A2cPUz0Dr2iLmbIRNJHyv
         +BpBFbpV20kbe/I3G/WIFPNFj0IFA0oyAUO+3SNtf0IBUNfjuBt7XVaweAWj3Y6MPVeh
         IF7Cb7p+Dy4AcCGyHlw/dUqT/6m7FLz0oBFuj4keH9jlXkIKcix0X726/9bqHPkQ/N+/
         5F0PsZbYqPuab9OlPw2d3lb/LjfoVoj0DNe8A9JWOlPakwmOvXj0rxFMnGZAyMjNBBfe
         90ow==
X-Gm-Message-State: AJIora+7dcBX6beTkCxkaHBSr0lTO1855kvyYIIGCdOlv+hUf7RTrMZl
        lPCI5c28Bk+a3s4vVXx3NOnr/2owpqGTtA==
X-Google-Smtp-Source: AGRyM1uN2kL6DXJZ5Sw8PvGJUBvehogbzgcBO1icN//Q5p9KLYMdEMvwpffnJSXd4umWZtlRNNYERw==
X-Received: by 2002:a62:15cd:0:b0:528:bf80:37c1 with SMTP id 196-20020a6215cd000000b00528bf8037c1mr154760pfv.22.1657661102575;
        Tue, 12 Jul 2022 14:25:02 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e036:8c0d:9cf:7a45])
        by smtp.gmail.com with UTF8SMTPSA id w1-20020a1709026f0100b0016bd8fb1fafsm7220728plk.307.2022.07.12.14.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 14:25:02 -0700 (PDT)
Date:   Tue, 12 Jul 2022 14:25:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Message-ID: <Ys3mrAukkXXDHopg@google.com>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
 <Ys2uiei+ZOVYaOMy@google.com>
 <34e2a75a-b6dc-d5ae-4820-58cee2b0dd29@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34e2a75a-b6dc-d5ae-4820-58cee2b0dd29@linaro.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 12, 2022 at 11:12:06PM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2022 19:25, Matthias Kaehlcke wrote:
> > Hi Alexander,
> > 
> > On Tue, Jul 12, 2022 at 05:06:25PM +0200, Alexander Stein wrote:
> >> The TI USB8041 is a USB 3.0 hub controller with 4 ports.
> >>
> >> This initial version of the binding only describes USB related aspects
> >> of the USB8041, it does not cover the option of connecting the controller
> >> as an i2c slave.
> >>
> >> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> ---
> >> Well, this is essentially a ripoff of
> >> Documentation/devicetree/bindings/usb/realtek,rts5411.yaml with USB IDs
> >> replaced, reset-gpio added and example adjusted.
> >> IMHO this should be merged together with realtek,rts5411.yaml. Is it ok
> >> to rename bindings files? I guess a common onboard-usb-hub.yaml matching
> >> the driver seens reasonable. Any recommendations how to proceed?
> > 
> > It's a tradeoff between keeping the individual bindings simple and avoid
> > unnecessary duplication. The current RTS5411 and TI USB8041 bindings are
> > very similar, which suggests combining them. However over time hubs with
> > diverging features could be added (e.g. with multiple regulators, a link
> > to an I2C/SPI bus, a clock, ...). With that a common binding might become
> > too messy.
> > 
> > From a quick look through Documentation/devicetree/bindings it doesn't
> > seem common to have generic bindings that cover components from multiple
> > vendors. In that sense I'm leaning towards separate bindings.
> > 
> > Rob, do you have any particular preference or suggestion?
> 
> Not Rob, but my suggestion is not to merge bindings of unrelated
> devices, even if they are the same class. By unrelated I mean, made by
> different companies, designed differently and having nothing in common
> by design. Bindings can be still similar, but should not be merged just
> because they are similar.

Thanks for your advice, let's keep separate bindings then.
