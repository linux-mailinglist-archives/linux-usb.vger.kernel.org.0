Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C90E261428F
	for <lists+linux-usb@lfdr.de>; Tue,  1 Nov 2022 02:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiKABDa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 21:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiKABD2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 21:03:28 -0400
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74248DFE5;
        Mon, 31 Oct 2022 18:03:27 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id y67so14553556oiy.1;
        Mon, 31 Oct 2022 18:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkcBrIA7oBQ5mjHwd2UEcYrTi2K7pE4sTmK8J9yJ3xk=;
        b=Mq2MCGy1T+z8KLT7oleVOs/Tzw1HdSIUIxdT/SzNTos3RyY/MC6cRtZ1T+nbWqLeNG
         Aw40g51YC4CmKG9AjtaiZcHj44REHFFugnyD2HY2Z3dtedw3CisyG7CbdEBKN214YVkL
         kKLjTgfiHHFK1Xht9i2KMh8/9J20rdYnTPbnHiK/3yPTXH1qPLEPvb+gQ2rsOS+8FvsE
         JBnTY/piYCB/vq9yLHfpHGl83CHkwpY5xPYL5W39qaY8bVtrrXoUn9eDp0vcYKHJ9ph6
         ItABvTn8l4PcLng55G6Pai3XKZmv4BbEBP0PeHlQgwh3UKjTZCjKg0s7EWEei2Tiyvly
         OLEA==
X-Gm-Message-State: ACrzQf3b8EhHzBmytm+hBCGdTtjY3RRqNw4pT+u6fjGTtd7wJTGdFEga
        pf1tOerplPfPmYmBVB5jmA==
X-Google-Smtp-Source: AMsMyM5Hm6wz1VL2aBS7VdPj2bSUEvAruPZvs7foxPpmncN/mwOsDpLRKL8oEo1akGDpohnZxJPP6w==
X-Received: by 2002:a05:6808:8d2:b0:354:7fd4:f17b with SMTP id k18-20020a05680808d200b003547fd4f17bmr27480oij.221.1667264606700;
        Mon, 31 Oct 2022 18:03:26 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g12-20020a056870a70c00b0010d7242b623sm3825007oam.21.2022.10.31.18.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 18:03:26 -0700 (PDT)
Received: (nullmailer pid 4030032 invoked by uid 1000);
        Tue, 01 Nov 2022 01:03:27 -0000
Date:   Mon, 31 Oct 2022 20:03:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>,
        linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Karl Kurbjun <karl.os@veroson.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <uwu@icenowy.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-sunxi@lists.linux.dev,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: Add special clock for Allwinner
 H616 PHY
Message-ID: <166726460732.4029973.16304467789451504367.robh@kernel.org>
References: <20221031111358.3387297-1-andre.przywara@arm.com>
 <20221031111358.3387297-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031111358.3387297-3-andre.przywara@arm.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Mon, 31 Oct 2022 11:13:53 +0000, Andre Przywara wrote:
> The USB PHY IP in the Allwinner H616 SoC requires a quirk that involves
> some resources from port 2's PHY and HCI IP. In particular the PMU clock
> for port 2 must be surely ungated before accessing the REG_HCI_PHY_CTL
> register of port 2. To allow each USB port to be controlled
> independently of port 2, we need a handle to that particular PMU clock
> in the *PHY* node, as the HCI and PHY part might be handled by separate
> drivers.
> 
> Add that clock to the requirements of the H616 PHY binding, so that a
> PHY driver can apply the quirk in isolation, without requiring help from
> port 2's HCI driver.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../phy/allwinner,sun8i-h3-usb-phy.yaml       | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
