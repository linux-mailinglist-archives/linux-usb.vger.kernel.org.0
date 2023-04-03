Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 537E26D4468
	for <lists+linux-usb@lfdr.de>; Mon,  3 Apr 2023 14:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbjDCMbk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Apr 2023 08:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbjDCMbj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Apr 2023 08:31:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6326E30CF;
        Mon,  3 Apr 2023 05:31:38 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C79866015EC;
        Mon,  3 Apr 2023 13:31:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680525096;
        bh=/rD9SAGPy66J6vfoFhFaVN4WJbqvWHJM6qbPGrEgfek=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Ih2nysv0vMZHXiRAuIl/l7UkUx5AnzQDMZuQF8qPUo6H15HuGNVGGeDXy7vxdEg/Z
         gE7xGtEPcQOPj6i3iBsj3XXjCVEYih3EJC4hOnhPVUL/w97e3F6oWg89j8y71onM0I
         MWmX0CGJZpRwsfXFPTw64goi7H+XNfC1/oZjriYDgKotL0153TjxN6WSjxE+jO48UC
         RhKYfsiaT9PX+OkieLLJYxFcK/CFg68iJlTMQvbzJ8s28LeDMtoAz3b1wlWmzZXNDl
         7mXHekHJVhLBvX/ZtyYRUfBWITijznfn/vOoaTjC6+AT+AdWqabKvgxycM1mevHL7j
         JGiLw8OA9Kf/A==
Message-ID: <4268fd53-9c1b-4b29-437f-5f792292e48d@collabora.com>
Date:   Mon, 3 Apr 2023 14:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/7] usb: mtu3: unlock @mtu->lock just before giving back
 request
Content-Language: en-US
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
        Tianping Fang <tianping.fang@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
 <20230403025230.25035-4-chunfeng.yun@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230403025230.25035-4-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il 03/04/23 04:52, Chunfeng Yun ha scritto:
> No need unlock @mtu->lock when unmap request, unlock it just before
> giving back request, due to we do not lock this spinlock when map
> the request.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

