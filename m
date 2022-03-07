Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099634D0136
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 15:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239410AbiCGOaF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 09:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbiCGOaE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 09:30:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4CA24BCE
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 06:29:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A27F1B81173
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 14:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E526C340E9;
        Mon,  7 Mar 2022 14:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646663347;
        bh=lmiqlJdBwyGzsvAskHB//yRDsWtmwXOTjRPFxHW88iI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FmdNY1zxFMqmvO5bRnfOi5KnPwLRE+JPixlpz49Gw/LOmCvfyLBg9Il8lr7vEqo9V
         PcwmRY7yzKz4MuZJfOfAB21yyNS1sMqt3RLwhgDEzZG0KjKK9lUokjYduEyctGqrgY
         XwzPyzOpUiDA8xiizzpLep5e97Hk8SDoByIHSQrVPJeTi+RDtiNTp0Wz0R8yjaSdu5
         KdX8iB5Ar/KASdHT9zxNcXprBOvcGQI9zamS9MQKxWlAFst2sJx9FmUo5QbQpzjSTQ
         JYhTt8LgHWPKBEPrjj9gQskamkciCOXawGOXL02SbA9q5UfLC9BXtMN8fSNn00ehcZ
         8meah30Oim6sg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nREMA-0005En-FE; Mon, 07 Mar 2022 15:29:02 +0100
Date:   Mon, 7 Mar 2022 15:29:02 +0100
From:   Johan Hovold <johan@kernel.org>
To:     =?utf-8?B?TWF0ecOhxaE=?= Kroupa <kroupa.matyas@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Another PL2303
Message-ID: <YiYWrhe4w5iC/Hm0@hovoldconsulting.com>
References: <165de6a0-43e9-092c-2916-66b115c7fbf4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <165de6a0-43e9-092c-2916-66b115c7fbf4@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 06, 2022 at 05:52:58PM +0100, Matyáš Kroupa wrote:
> Hi,
> 
> I recently bought a serial console adapter with PL2303. After a quick 
> search I discovered that there have been problems with different 
> versions of this chip so I include some info about mine.

Thanks for the report and for including all the necessary details.

> dmesg:
> 
> [172076.820388] usb 3-2.2: new full-speed USB device number 11 using 
> xhci_hcd
> [172076.960358] usb 3-2.2: New USB device found, idVendor=067b, 
> idProduct=23f3, bcdDevice= 6.05

Based on the (default) product id this should be a PL2303GS. Are you
able to confirm that by looking at markings on the chip too?

Either way, I just posted a patch that adds this bcdDevice to the
driver.

Johan
