Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF036272FC
	for <lists+linux-usb@lfdr.de>; Sun, 13 Nov 2022 23:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235508AbiKMWe7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Nov 2022 17:34:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbiKMWe6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Nov 2022 17:34:58 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C52DF9F;
        Sun, 13 Nov 2022 14:34:57 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 4A9EC5C0053;
        Sun, 13 Nov 2022 17:34:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 13 Nov 2022 17:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1668378897; x=
        1668465297; bh=aa9u7KFGnoEFdEcyyA3MaXZLY+Tt4imQzrHCuo0hs98=; b=i
        J8aP5U5Zd8RlTG1fVlAkw9sWUEdy9PxZhXAOVXYvNNtffCC28Jrkm9T0xKmafyS1
        jPw49jdB/gGethgYwHPv2k84lzcF4FuHTGHz4BRQPEnA4/bVh2zcZGpqOtkIQSW2
        BdFcQnmnQXQMBkNc1hptHFUPFoQ3xTUyX9Ylc11UTLo9vDOCMx32EAZ7mj1L6CGm
        IV9O0Tmz8guRNcBBpxP41Lttaxx77YrZYJ3I7hvAZ72rZizlHpenwaAYZIhJY22x
        SBZ8usYeKFRTUmwJDbRr55BXJSxUfBybCc1NDYaKcUvA9pPzQ7wIB7V59vReloLQ
        1ZzSmduxpLNDDa+1sUxHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668378897; x=
        1668465297; bh=aa9u7KFGnoEFdEcyyA3MaXZLY+Tt4imQzrHCuo0hs98=; b=B
        SXMT9/5cb/oMyC8+OrCV6wZIilF4Zj86+aooYhewjhhfIx+hRl+ZfI/XKn6PqL9f
        YoKyeoKgp0kFMJ50ljmxhmEO6bH7PUxUZQr3Zt1MByw+dS6baqrwCmWYk58ygj9f
        pqz10ySGpFJz1SDNCY5xwZ7OIVyBhWYCzAM+XFddfcpc1ANu3EZgJ9/WoRE9OVps
        HtNNroJELcmbpUNn3ShKoUI9ZObErqXnO91dvikx8sRRl5afc//g4b16Lf4fH41p
        tRN+FkAefrmvYdNrlgcCH24UY9IeqrbX8Gjbqj3cGBRAYSlEDotOzC6tvKWF3LSB
        DYUpvNH9tsVIJjSInQ5gA==
X-ME-Sender: <xms:EHFxY5jbCMk1gAPoCIG6uRJbVNZwoBKgKgMD4zvgV4xFx2VhTLqBvQ>
    <xme:EHFxY-ArJhY_XHDeRQ9NtUVdauZCnaZdbOLKud9vkutPmbpSEP3PNOkAUp0LQf1Xx
    TxiJKyeKeO3Amjenw>
X-ME-Received: <xmr:EHFxY5FGjGMFU2_jd2rEc5FyP_hq68AhfxZ-Y-neOrDVh0deD7f94FH_ctBKSREOEFx-ytist9zs7Im3a-keToVA9W9S7g-M7JQhb_SAhLzVf0WgyIFvq3E7ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedtgdduieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:EHFxY-S9r3oo8m6pThj8rC60dwCF4fVjDtG6BKs35zVXYfWUjGiUCw>
    <xmx:EHFxY2x24iMN-daquE6-nAjO6HsIZkQB2P3R3_-BeJJLKRtYxkSaQQ>
    <xmx:EHFxY04QSBJab15tHZxLmWgEybHXUPKFuwxJjAksqWbuawLG7v6slg>
    <xmx:EXFxYxq-iUWWshp9tpTRUVZlZa7DwsBhHA9CRBEUOdFgstB_ywqGQA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 17:34:56 -0500 (EST)
Message-ID: <e1ab922c-36d5-d5d9-93ea-b8a257c9c633@sholland.org>
Date:   Sun, 13 Nov 2022 16:34:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 02/11] dt-bindings: usb: sunxi-musb: add F1C100s MUSB
 compatible string
Content-Language: en-US
To:     Andre Przywara <andre.przywara@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-3-andre.przywara@arm.com>
From:   Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221106154826.6687-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/6/22 09:48, Andre Przywara wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Allwinner F1C100s has a hybrid MUSB controller between the A10 one and
> the A33 one.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> index 8992eff6ce38..9ae634280bf4 100644
> --- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> +++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> @@ -17,6 +17,7 @@ properties:
>        - const: allwinner,sun6i-a31-musb
>        - const: allwinner,sun8i-a33-musb
>        - const: allwinner,sun8i-h3-musb
> +      - const: allwinner,suniv-f1c100s-musb

This would be a good place to use an enum. Either way:

Reviewed-by: Samuel Holland <samuel@sholland.org>

>        - items:
>            - enum:
>                - allwinner,sun8i-a83t-musb

