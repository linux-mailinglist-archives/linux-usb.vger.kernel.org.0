Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95740581676
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 17:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238795AbiGZPcp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 11:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234104AbiGZPcn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 11:32:43 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323E41B78B
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 08:32:43 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id h132so13439552pgc.10
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QvgqOJsJaRfwh288RK8fy30Wkh0J6u/9f1tN/TUOFVA=;
        b=NrQhRCOMUDC3mXJXosstgVwIDMYkidDR0/Q8Vw6uHokuZZDKRNeVGoywXSjWMLsSAi
         BqPLLK53Unp4zoisknrJ5o424bakXSL2cC8jAQsP2Der1v23+fwmcypMhH9PEbm7r3Wz
         wZUq758ylpkk1JsIjod8XkkgxvaCtL8hlO5xY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QvgqOJsJaRfwh288RK8fy30Wkh0J6u/9f1tN/TUOFVA=;
        b=fL+T+78S7ikzqTttB6t3wgVkw4TkcRdHjBb5faLCB2IXdlThyLp3FFonEqipH3Yvol
         gnfVX1Zc6fTEQX6PN2eeSNxOqcRWjim98pX84yJABbeLMExwTEAgjikt+KWr+APLQ2Rg
         p5+ou1Qxu5dIE1pF91IZbFSwGufnw/UoHn6CBpJvxGP/gRTc8JFAUDfxVNYiIZQLotWc
         oAU8KcEWRzdAMQPaM5JbE3EeEBtT0+WG2NNWbK0ppctJU/ucjHFyzHAmTkb1i+O3H1h5
         HMFPBstY+fxTaLYEjozpE4Rmpys5ikIWt5RtZLfaQD0XYk58wSfbP1spMHLOYP8z03XS
         HPLA==
X-Gm-Message-State: AJIora/qbcYkk4rXybK2Tw3XxBGGFzejmJn/8VG4u6JsHTjrH0hIWZrT
        pz/A0R42zvalOTBk81nHFJYODw==
X-Google-Smtp-Source: AGRyM1s00puXzuack0g772HA7Y+ZUTEclrQEjeyTAfQzTXf+aMs/JSmo14i4PletDJvEYqkYsRojGQ==
X-Received: by 2002:a65:6e96:0:b0:415:5973:b4f4 with SMTP id bm22-20020a656e96000000b004155973b4f4mr14939446pgb.568.1658849562682;
        Tue, 26 Jul 2022 08:32:42 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e9b1:f865:ec5d:495e])
        by smtp.gmail.com with UTF8SMTPSA id ne16-20020a17090b375000b001f3009a5ccfsm564197pjb.54.2022.07.26.08.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 08:32:42 -0700 (PDT)
Date:   Tue, 26 Jul 2022 08:32:40 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        alexandre.torgue@foss.st.com, krzysztof.kozlowski+dt@linaro.org,
        arnd@arndb.de, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, amelie.delaunay@foss.st.com
Subject: Re: [PATCH v2 2/4] usb: misc: onboard-hub: add support for Microchip
 USB2514B USB 2.0 hub
Message-ID: <YuAJGBmX3Bf5Y1qf@google.com>
References: <20220726080708.162547-1-fabrice.gasnier@foss.st.com>
 <20220726080708.162547-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220726080708.162547-3-fabrice.gasnier@foss.st.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 26, 2022 at 10:07:06AM +0200, Fabrice Gasnier wrote:
> Add support for Microchip USB2514B USB 2.0 hub to the onboard usb hub
> driver. Adopt the generic usb-device compatible ("usbVID,PID").
> Some STM32MP1 boards have this hub on-board, with a supply that needs to
> be enabled for proper operation.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
