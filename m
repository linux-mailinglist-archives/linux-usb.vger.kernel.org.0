Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C12F45E5A1F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 06:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbiIVETh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 00:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbiIVET2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 00:19:28 -0400
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D925FABF13;
        Wed, 21 Sep 2022 21:19:22 -0700 (PDT)
X-Sender-Id: dreamhost|x-authsender|karl.os@veroson.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 26AD13C09D9;
        Thu, 22 Sep 2022 04:19:22 +0000 (UTC)
Received: from pdx1-sub0-mail-a258.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 319973C1403;
        Thu, 22 Sep 2022 04:19:21 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1663820361; a=rsa-sha256;
        cv=none;
        b=TYw2cYGifTDPWrgyFyfgt313iKNm4d/WLn1nR/Kup7mMUGBIUlflillh/0TCYUONW60VlE
        fdxgbb8lGZU+bZA1seDJzjSHIBbIYwWzrUOvEK5muUEDvvPyXfliN1dyKwg+02dHeuFqOH
        7palR6BAFKUEHlccofZdV6gjmz249tvzgp2/7zBhaZpk92EowrVPbZ3vS8jj25Hjkdcdsp
        A5Vowl6tJWQxsVC204rN+F3u7kG6eWEJ4xMnA5AdVYvfE8p8UQs8pAuXuEiTnUzgzdA9f0
        bWGB1Euk3ihOIEip7rBsB8ExV4/1lgASwuzTU8Ugk/A62oGj8x35pU/xRetLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1663820361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references:dkim-signature;
        bh=vT6bv/WisUBq8m8o70j6fGYTfeF1p35BvwzYIUgbun4=;
        b=z3OeJSoJ3J+TeIuk+PoXhldFdDomO4OHY6hwsYK9aVJd+ZOJOhbW/XJM/De/gdrthmOF/X
        TdZ8MozweuHAYOBtDRdUc2dKdQVHVceT/yqsalpHUwxpO9XJFjZep6HKzDYGgzcKB/Z14D
        F8m7/7NhcqCEu4reoIHA0o1j5NbW5u2kbZfedfQ7/3GGH3tB26veTiapOIKZCTyAt13KCP
        ujf7LbHowTrh2WSck1+kCniHVgpvGlTqk1nVG8raxIjDnQ6ul5WerDfMrfOATLR+trausN
        ODS0vEALWEJ1hY+y9bIQ5f+E4TLCmqTzZH4kRBCS0+3NTRhJl2DrMd11H+3wMg==
ARC-Authentication-Results: i=1;
        rspamd-f776c45b8-2q8n5;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=karl.os@veroson.com
X-Sender-Id: dreamhost|x-authsender|karl.os@veroson.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|karl.os@veroson.com
X-MailChannels-Auth-Id: dreamhost
X-Slimy-Tart: 59bdc4d919ef7503_1663820361943_1131412379
X-MC-Loop-Signature: 1663820361943:2608944700
X-MC-Ingress-Time: 1663820361943
Received: from pdx1-sub0-mail-a258.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.97.77.208 (trex/6.7.1);
        Thu, 22 Sep 2022 04:19:21 +0000
Received: from localhost (unknown [38.15.43.255])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: karl.os@veroson.com)
        by pdx1-sub0-mail-a258.dreamhost.com (Postfix) with ESMTPSA id 4MY29J35Bvz3K;
        Wed, 21 Sep 2022 21:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veroson.com;
        s=dreamhost; t=1663820360;
        bh=vT6bv/WisUBq8m8o70j6fGYTfeF1p35BvwzYIUgbun4=;
        h=Date:From:To:Cc:Subject:Content-Type;
        b=PlopfdrLhjlzM3ToPlwPsbjqQc0IEzTTD5Us58EDWXQtNvflNlL0OVp4K6Vh+UcNn
         6wYs5hWW7kew6OXbeeoiDkXtvsJFPal7HZ2VnFKMbg7vFV5NeRB0q9Bi7BYMmWZ410
         pXKaGjr1LtHC9iHblQxeICDrn9NLqIb75CDRcOjSxF/hSQokzKE9xBjVK/HQXljzZ6
         PeAiwR+5EeU/4UNM4mGUySaWw+fC2kzo4QwKxzq7peTt5mz6nRcWOsNySYzr/XylqS
         1ddL8Qa4SVP+OUCTv5rPRy2hlK8mBm7EeW1FVTvs4n97OfLv+Swrf3mdK0XsdYHpHK
         QmhdZ5JAlMpJw==
Date:   Wed, 21 Sep 2022 22:19:14 -0600
From:   Karl Kurbjun <karl.os@veroson.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 0/7] arm64: sunxi: h616: Add USB support
Message-ID: <YyviQkLXUX9FuLED@localhost>
References: <20220911235945.6635-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911235945.6635-1-andre.przywara@arm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/12, Andre Przywara wrote:
<snip>
> Please have a look and test on your hardware, especically on all ports
> exposed on header pins of the OrangePi Zero2 board.

I tested this patch set on an OrangePi Zero 2 with each of the USB ports:

Port 0: I tested this with a UART gadget to make sure I could access a console over the port.
Ports 1-3: I tested these with a USB memory stick - I was able to see the device and mount a partition.

As would be expected: for ports 2-3 I had to enable the ohci and ehci entries in the target dts file to test them.

Tested-By: Karl Kurbjun <karl.os@veroson.com>

Karl
