Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E445E6367
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 15:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiIVNRS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 09:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiIVNRL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 09:17:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6A1ECCE0;
        Thu, 22 Sep 2022 06:17:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1704563391;
        Thu, 22 Sep 2022 13:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C356BC433D6;
        Thu, 22 Sep 2022 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663852629;
        bh=F/4iIwXSU4vqrMwYdoVZfyoIm5ZzZVxgA6NsuygfDEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KmLDsHjOtfearKEtNh/J+XJyymWR4zlefseUurVC62tiMVfgJzabLhIbAChLUjYgZ
         bhP68r5YK4zv9oF/qdh9tqkpQEiILhYDBtn3xiNkN+zvqW5O/2A3zFDCD7Mw8NTZCy
         GOSGFBa3ptr+lEgYfmOyBWQMNCUosuBnLMO7LAKc=
Date:   Thu, 22 Sep 2022 15:17:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] arm64: dts: tqma8mpql: add support for 2nd USB
 (host) interface
Message-ID: <YyxgUtT1gtyMIHeY@kroah.com>
References: <20220915062855.751881-1-alexander.stein@ew.tq-group.com>
 <20220915062855.751881-5-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915062855.751881-5-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 15, 2022 at 08:28:55AM +0200, Alexander Stein wrote:
> The on-board USB hub has a single reset line which needs to be enabled.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)

This patch failed to apply, please rebase and resend.

thanks,

greg k-h
