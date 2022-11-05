Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67F661D890
	for <lists+linux-usb@lfdr.de>; Sat,  5 Nov 2022 08:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiKEHqU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Nov 2022 03:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiKEHqT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Nov 2022 03:46:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018B510043;
        Sat,  5 Nov 2022 00:46:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 90AFD60AB2;
        Sat,  5 Nov 2022 07:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FC6C433C1;
        Sat,  5 Nov 2022 07:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667634376;
        bh=wgFcLvc3zqe3w819SqLtTNrlQTT04YKIOY22045Euso=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uP9Ca6Mw3C8panymsWSY/f/60Ejzi/O5W0D7lwxIrSGD5hCODpG9sZ0D+WyBZY9f6
         a1lBvoLFY9ezPA5GvinGrJduF4+JGbt5P2DP+I6ac0QGOX6Kx87lMdYwa90MCdpecv
         WEHNjySWbW/vJjvBHv83v0tOdrXMvgz7d5MlF3Rq+0XZoE3H9fOBLoCOrlmZIuLgjA
         PEKR+mvwVGooV+mByLo2MBpj/hi3Vaphxt3WhRPqhm00aACXDv0tqCwWZ5V6J9j9cg
         pqx/5TD4rqX5OKAg6OMO1h0jH/e2gCni4dL/4ymqJFHBTYWQGpXJ+7/9hQtzZLToye
         XbTnxsxxU8mTw==
Date:   Sat, 5 Nov 2022 13:16:12 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 4/7] phy: sun4i-usb: Add support for the H616 USB PHY
Message-ID: <Y2YUxIYa2QAGxX3K@matsya>
References: <20221031111358.3387297-1-andre.przywara@arm.com>
 <20221031111358.3387297-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031111358.3387297-5-andre.przywara@arm.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31-10-22, 11:13, Andre Przywara wrote:
> The USB PHY used in the Allwinner H616 SoC inherits some traits from its
> various predecessors: it has four full PHYs like the H3, needs some
> extra bits to be set like the H6, and puts SIDDQ on a different bit like
> the A100. Plus it needs this weird PHY2 quirk.
> 
> Name all those properties in a new config struct and assign a new
> compatible name to it.

Applied, thanks

-- 
~Vinod
