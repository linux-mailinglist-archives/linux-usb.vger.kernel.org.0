Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04EC7740F2E
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jun 2023 12:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjF1KtA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Jun 2023 06:49:00 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:49052 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjF1Kso (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Jun 2023 06:48:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A79B612A3
        for <linux-usb@vger.kernel.org>; Wed, 28 Jun 2023 10:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFDEC433C8;
        Wed, 28 Jun 2023 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687949323;
        bh=1ZYkjEWL6ESDHaqNq88bcsVLlbwNauwHhSw1jdqhUmE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qTKAQ2kf8Y2OPOtKQvgQNJ/mQnrIYUwdizGiZCuV3+quqoPdBLlqUGyPCRSHflez/
         97s0NkeqmeAI1egYMcZ3yqkfCrsqzl4PZybIciffGUdqk8Y/5pSAmLOevGdILeVpYH
         up6/47COEb0hSbO3daZqXs/F+uTXuoT+ujDUHgRQ=
Date:   Wed, 28 Jun 2023 12:48:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jerry Meng <jerry-meng@foxmail.com>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH]     USB: serial: option: support Quectel EM060K_128
Message-ID: <2023062821-scarcity-calculate-6f35@gregkh>
References: <tencent_05185A450C60A1EE8A651E34CC0F60304506@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_05185A450C60A1EE8A651E34CC0F60304506@qq.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 28, 2023 at 05:55:02PM +0800, Jerry Meng wrote:
>     EM060K_128 is EM060K's sub-model, having the same nmae "EM060K-GL"
> 
>     MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> 
>     T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  8 Spd=480  MxCh= 0
>     D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
>     P:  Vendor=2c7c ProdID=0128 Rev= 5.04
>     S:  Manufacturer=Quectel
>     S:  Product=Quectel EM060K-GL
>     S:  SerialNumber=f6fa08b6
>     C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=500mA
>     A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
>     I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
>     E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
>     I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
>     I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
>     E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>     E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>     I:* If#= 2 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
>     E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
>     I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
>     E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>     E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>     I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
>     E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
>     E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>     E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>     I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
>     E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
>     E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>     E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>     I:* If#= 6 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
>     E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>     I:* If#= 7 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
>     E:  Ad=8f(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Why is this, and the subject line, indented?

No need for that, right?

thanks,

greg k-h
