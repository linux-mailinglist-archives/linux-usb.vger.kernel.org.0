Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC6CD5B0521
	for <lists+linux-usb@lfdr.de>; Wed,  7 Sep 2022 15:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiIGNaN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 09:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIGNaL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 09:30:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F27A31EF3;
        Wed,  7 Sep 2022 06:30:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49873B818B5;
        Wed,  7 Sep 2022 13:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2068C433D6;
        Wed,  7 Sep 2022 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662557408;
        bh=ziOgM3UniHg2lBJGhrW2pb8uXEr3P+ZuQesmLJPW9dM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V3p2xm5aPntqYLQ/h/71wkNqnZH27T2GTUPZIUzxMHQk1Ry3zSeorq2xtVrrTcPy6
         O1z2JrfplUQNe0lyUH7Pa3j7WU0dMqH1bGiVLxZ/vsA3A0HF969YtZFD6K30b7biYN
         Ar2N2TThnU+yGhReJZPGmHIyY72/6z6VtYzZHdpk=
Date:   Wed, 7 Sep 2022 15:30:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-usb@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] USB/ARM: Switch S3C2410 UDC to GPIO descriptors
Message-ID: <Yxic3bdyKDV2RV0N@kroah.com>
References: <20220901081649.564348-1-linus.walleij@linaro.org>
 <64e96f32-e3c4-5a9d-c4f0-90986eba597d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64e96f32-e3c4-5a9d-c4f0-90986eba597d@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 05, 2022 at 02:19:34PM +0200, Krzysztof Kozlowski wrote:
> On 01/09/2022 10:16, Linus Walleij wrote:
> > This converts the S3C2410 UDC USB device controller to use
> > GPIO descriptor tables and modern GPIO.
> > 
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Cc: Alim Akhtar <alim.akhtar@samsung.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > If the Samsung S3C maintainers can ACK this I think it's
> > best to take it into the USB tree where the bigger changes
> > are.
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks, I'll take this in my USB tree now.

greg k-h
