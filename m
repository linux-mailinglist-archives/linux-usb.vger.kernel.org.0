Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F1A737E5C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 11:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjFUJHI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 05:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjFUJHG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 05:07:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6121B1B4
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 02:07:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E976D614AE
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 09:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAB1C433C9;
        Wed, 21 Jun 2023 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687338423;
        bh=r2NJz4KiL3rXNsKRK4wb079MqUBeQTLNUU+IGxfIYtc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KWnOB6XA9N/mzdw7aW/kqvG18xNij2W4d5e/BW1vAIrj4rKms6n8TsNFbn/OnMvRb
         N3+dZkhRfvujkeIyvGChFpTMpwiHqej+yER3eLmzCKNmnPgw/UH6AHsqFcRViFLsVU
         nwgQXcc8CkN2kIgB2NJlokCtwElOzVYmEZGRDd4zQaie7kceLpVRepPN2AY+kguALn
         b3yVk7Vg5QPGCG688Ixu953RwODlySgOSdvZq34MQIeW+UlC6dY+yqatspdAYn4Pqq
         2G3oTiqW4pukmrWzAfMdZLX0mHqcmYzKHSlSsOaj+4wV/tfwy3dQrb2D/tbdXneKUC
         SWo+bVLcRGhsg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1qBtnu-0000jZ-4W; Wed, 21 Jun 2023 11:07:06 +0200
Date:   Wed, 21 Jun 2023 11:07:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net
Subject: Re: [PATCH] USB: serial: option: add u-blox LARA-R6 01B modem
Message-ID: <ZJK9us5skqZHmawa@hovoldconsulting.com>
References: <ZJFFhPSo50zG1yYD@hovoldconsulting.com>
 <20230621084730.6993-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621084730.6993-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 10:47:30AM +0200, Davide Tronchin wrote:
> > Can you please also include the output of usb-devices for these
> > configurations?
> 
> The first 4 interfaces of all the 3 configurations (default, RMNET, ECM)
> are the same.
> Here below you can find debug/usb/devices file of the LARA-R6 01B module
> in all the USB configurations.

Thanks, can you include this in the commit message for v2 as well?

> ECM:
> T:  Bus=01 Lev=02 Prnt=02 Port=02 Cnt=02 Dev#=  9 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=1546 ProdID=1313 Rev= 0.00
> S:  Manufacturer=u-blox
> S:  Product=u-blox Modem
> S:  SerialNumber=1478200b
> C:* #Ifs= 6 Cfg#= 1 Atr=e0 MxPwr=500mA
> A:  FirstIf#= 4 IfCount= 2 Cls=02(comm.) Sub=00 Prot=00
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=06 Prot=00 Driver=cdc_ether
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
> I:  If#= 5 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
> I:* If#= 5 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
> E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

> > I see that we used RSVD() also for the CDC interface for LARA-L6, but
> > shouldn't it be possible to use a more exact match instead? The
> > usb-devices output should tell.
> 
> Probably USB_DEVICE_AND_INTERFACE_INFO would not match LARA-R6 01B
> serial composition since R6 01B has:
> - Diagnostic
>     Cls=ff(vend.) Sub=ff Prot=30
> - all the other serial interfaces
>     Cls=ff(vend.) Sub=ff Prot=ff
> Could you kindly offer any recommendations?
> Maybe USB_DEVICE_INTERFACE_CLASS ca be used instead of
> USB_DEVICE_AND_INTERFACE_INFO.

Right, I had USB_DEVICE_INTERFACE_CLASS() in mind for the ECM
configuration. That should avoid the need for RSVD().

Johan
