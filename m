Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB6D629526
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 11:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbiKOKBk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 05:01:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbiKOKBg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 05:01:36 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08C224091
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 02:01:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 80B15B81889
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 10:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21204C433D7;
        Tue, 15 Nov 2022 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668506493;
        bh=EiJhr7iB/s2u56U3w5gPxws4VE1vxUfjvy2FnUiNLKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ibHS6TeOz4DOz4wvErmln9TyHW8YyPshEse1d11vcvOTo6ItH4XAkkLLmt2uExxHY
         lL9kzLCnBeODP0F7u4L1w4bapgLl7Y2iWomTlR9ZmPteQYr8mqyRsvdHUmsQo3Uhtz
         OAoSXHSbTo5Ol7iSTBqqs6tN9MVZtb4BiYV6arkux+K3pknuxjPSaoQ9FzK6DxO/5U
         6vxPS+rqisphRdjzZReIBmDwJ5D091opT0J6ONaX/JQO0qVVHOBI9rGgzPI1z0qWBs
         +ZrgJLV/RbhPaMbFBXw862HWgzQcCaDPm4N/4yUmmqqiEZ5ettiUR2r1mnf+BsVK/0
         V549rX4FX1JOg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ouskY-0005oH-VG; Tue, 15 Nov 2022 11:01:03 +0100
Date:   Tue, 15 Nov 2022 11:01:02 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Reinhard Speyerer <rspmn@arcor.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Fibocom FM160 0x0111 composition
Message-ID: <Y3NjXoD+hhsrsBR3@hovoldconsulting.com>
References: <Y2waf9O37lJiF8z1@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2waf9O37lJiF8z1@arcor.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 09, 2022 at 10:24:15PM +0100, Reinhard Speyerer wrote:
> Add support for the following Fibocom FM160 composition:
> 
> 0x0111: MBIM + MODEM + DIAG + AT
> 
> T:  Bus=01 Lev=02 Prnt=125 Port=01 Cnt=02 Dev#= 93 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2cb7 ProdID=0111 Rev= 5.04
> S:  Manufacturer=Fibocom
> S:  Product=Fibocom FM160 Modem_SN:12345678
> S:  SerialNumber=12345678
> C:* #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>

Now applied, thanks!

Johan
