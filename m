Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67715737E43
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 11:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjFUIrx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 04:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjFUIrv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 04:47:51 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B191195
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 01:47:49 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b45c289615so74740121fa.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687337268; x=1689929268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi9FY7yTNLZ2LWCoeubAI1DxAOJSkJrjlcsXSzr8YtI=;
        b=jeb9mjfjbvfMDdroVQrragjo6YMMA4jZ0gY9m88djYjyTe4AMbWJ6zq8V9YpceBofe
         RfVnJSeeNEyWKwy5hnV792XwW8ueRNX/8fMQOEInSlmz8bVdPcQbSwvUUTdmSygv3Q5L
         Cilqdm8qN5AzjoZdhXNszwEHiTR7NAmT6dVJtyGUXmECxmnA+cZU8B3nwWsuSDoxxFuc
         +BLpBYQ6dIc2UiU8h8sJOJNWtW1jcBs2CPNaxUdjuxsghOuBjJtwqg95oDvc5+fGBS8w
         HDS5e/3BjmIS4h+B2/BXoQ0/o80+ss5uc0JdgFqWhFErhUWrdG5zLNxdPS3vsRlM7Fdv
         GPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687337268; x=1689929268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi9FY7yTNLZ2LWCoeubAI1DxAOJSkJrjlcsXSzr8YtI=;
        b=CdUaexVYbuzJDJV2dfFV4VEo6UuM5dI/uwV3C0wkuUR8pLKXScUAqOWmAcq9wdxXI4
         cEyTL6fLJ72Z18BywfNCS+xWG6DmqKq3bjB33CCHhqq6IkvMcDXGA0Ix/Ck5cG8ZhaSb
         MWPqEyNORguX0eOFl/IJTuxNxTywlQiGbRuxxKg5U9riYHBWEdJGM4Oi26PCEq6vEqZL
         y4PN/zPQ2DenlkIkJjKOyUCqwZQtSo0dEks60G2XHHzzzop4oLHff4fA4yPwicdeXnSJ
         cGZTGqz/znHkKtKpbxsDXLEtvDdGzuhBZg6DaQZpvLzmqrDz8oyfK53F/Ps/q3MbYaaO
         nBYg==
X-Gm-Message-State: AC+VfDxW+2NXCDMiNCzaZcr6nczBEEL70RnN8yeZiYK+FU+HwcOokn8D
        vah7gK14kAdWYVcVJFOADE4=
X-Google-Smtp-Source: ACHHUZ7K6Ernmteag/8Zsivlai0F+ZonGjCSLA80HzJh9Sk5eplSyP/LM6ORFubn5n2wWbYHge2mtg==
X-Received: by 2002:a2e:3a19:0:b0:2b4:73bc:da89 with SMTP id h25-20020a2e3a19000000b002b473bcda89mr6275684lja.12.1687337267580;
        Wed, 21 Jun 2023 01:47:47 -0700 (PDT)
Received: from testvm.ubxad.u-blox.com (mob-5-90-143-93.net.vodafone.it. [5.90.143.93])
        by smtp.googlemail.com with ESMTPSA id n20-20020a1c7214000000b003f8d85b481esm15389393wmc.21.2023.06.21.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 01:47:47 -0700 (PDT)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     davide.tronchin.94@gmail.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: Re: [PATCH] USB: serial: option: add u-blox LARA-R6 01B modem
Date:   Wed, 21 Jun 2023 10:47:30 +0200
Message-Id: <20230621084730.6993-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZJFFhPSo50zG1yYD@hovoldconsulting.com>
References: <ZJFFhPSo50zG1yYD@hovoldconsulting.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Can you please also include the output of usb-devices for these
> configurations?

The first 4 interfaces of all the 3 configurations (default, RMNET, ECM)
are the same.
Here below you can find debug/usb/devices file of the LARA-R6 01B module
in all the USB configurations.

Default:
T:  Bus=01 Lev=02 Prnt=02 Port=02 Cnt=02 Dev#=  4 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1546 ProdID=1311 Rev= 0.00
S:  Manufacturer=u-blox
S:  Product=u-blox Modem
S:  SerialNumber=1478200b
C:* #Ifs= 4 Cfg#= 1 Atr=e0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

RMNET:
T:  Bus=01 Lev=02 Prnt=02 Port=02 Cnt=02 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1546 ProdID=1312 Rev= 0.00
S:  Manufacturer=u-blox
S:  Product=u-blox Modem
S:  SerialNumber=1478200b
C:* #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

ECM:
T:  Bus=01 Lev=02 Prnt=02 Port=02 Cnt=02 Dev#=  9 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1546 ProdID=1313 Rev= 0.00
S:  Manufacturer=u-blox
S:  Product=u-blox Modem
S:  SerialNumber=1478200b
C:* #Ifs= 6 Cfg#= 1 Atr=e0 MxPwr=500mA
A:  FirstIf#= 4 IfCount= 2 Cls=02(comm.) Sub=00 Prot=00
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=06 Prot=00 Driver=cdc_ether
E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
I:  If#= 5 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
I:* If#= 5 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

> These should all go above the 0x1341 PID.

Thank you for your indication. In patch V2 i will provide this change.

> I see that we used RSVD() also for the CDC interface for LARA-L6, but
> shouldn't it be possible to use a more exact match instead? The
> usb-devices output should tell.

Probably USB_DEVICE_AND_INTERFACE_INFO would not match LARA-R6 01B
serial composition since R6 01B has:
- Diagnostic
    Cls=ff(vend.) Sub=ff Prot=30
- all the other serial interfaces
    Cls=ff(vend.) Sub=ff Prot=ff
Could you kindly offer any recommendations?
Maybe USB_DEVICE_INTERFACE_CLASS ca be used instead of
USB_DEVICE_AND_INTERFACE_INFO.


