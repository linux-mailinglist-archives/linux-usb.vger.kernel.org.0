Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DEB761E36
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jul 2023 18:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbjGYQQC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jul 2023 12:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbjGYQP7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 12:15:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4B22720
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 09:15:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FFA061777
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 16:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EE4C433C8;
        Tue, 25 Jul 2023 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690301717;
        bh=xqlw2iIuNZ8RmRxmld2WCrbbgaZVmEpoe/5HMRU1b80=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jlPXAGQ7eqaIMub5FpN8nIArRxufNeMkt6r/ZdB6OPS53Ts5dB1eCEDYCU81gk6oJ
         kBgCtnAN46CI+AjaBC2/p0qxPAElD+L+VIU3rAHfz0hxmReoxgO4lNDOOTepeUYD05
         sYt9ZdS8ZnXxqt6CoQg1AFXKi+yt7bSeCCm+iYD8=
Date:   Tue, 25 Jul 2023 18:15:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: mtu3: Convert to platform remove callback returning
 void
Message-ID: <2023072550-blot-moonlit-0b91@gregkh>
References: <20230709163335.3458886-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230709163335.3458886-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 09, 2023 at 06:33:35PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> The function mtu3_remove() can only return a non-zero value if
> ssusb->dr_mode is neiter USB_DR_MODE_PERIPHERAL nor USB_DR_MODE_HOST nor
> USB_DR_MODE_OTG. In this case however the probe callback doesn't succeed
> and so the remove callback isn't called at all. So the code branch
> resulting in this error path can just be dropped and then mtu3_remove()
> be converted to return void trivially.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/usb/mtu3/mtu3_plat.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

This patch causes the following build error:

drivers/usb/mtu3/mtu3_plat.c: In function ‘mtu3_remove’:
drivers/usb/mtu3/mtu3_plat.c:460:9: error: enumeration value ‘USB_DR_MODE_UNKNOWN’ not handled in switch [-Werror=switch]
  460 |         switch (ssusb->dr_mode) {
      |         ^~~~~~
cc1: all warnings being treated as errors
