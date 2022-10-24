Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEB1D609E2C
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 11:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiJXJls (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Oct 2022 05:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJXJlr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Oct 2022 05:41:47 -0400
X-Greylist: delayed 81 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Oct 2022 02:41:46 PDT
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C58635FA
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 02:41:46 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <043d2572-afb3-0e41-c284-5cf0229867aa@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1666604504;
        bh=TNSgsgA8Ev/imkhyyzBHw6C3mnPIhJz3J9QZ/75EzgQ=;
        h=From:Subject:To:Cc;
        b=Svg0usZDgJ/sRaqMA1QGtoOzVfMOb6qXTKxVxegfbjPtJN+sg3I3ZIZM46vXun7Rk
         bznCTulyuKrY0LhvJT1ThXQtnJlQJ4SYRSIbldPreJ3vnpJKU17JOhsi39oxRIuyEM
         +/JBSTFWanB2zLrshZybqe/WbUlwYz/12mG2rZvq6idRPrrj4t1C/tHC2Iup9wT6Yr
         nWax6j+wZmtSA/zqFdjgt2lba8WCj/i7eKEQgpvudE5jcQaic/gY40gmDIUGuoTInZ
         8kUtRr4InEloGaUjWF/pA8zgP2EnsIqpisrH03FIoLiYM6uF8hM2RUIxtz7J0Fbmrx
         oAqRNbwZKAkww==
Date:   Mon, 24 Oct 2022 11:41:44 +0200
Mime-Version: 1.0
From:   Sven Schwermer <sven@svenschwermer.de>
Subject: How do disable VBUS
To:     linux-usb@vger.kernel.org
Cc:     Peter.Chen@nxp.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have an embedded system built around an NXP i.MX6ULL SoC. Within that 
system, there is a USB device that's hooked up to USBOTG2 (chipidea 
driver) of the SoC. This USB OTG peripheral is statically set to host 
mode in the device tree. The USB device is powered by a separate supply 
in addition to the VBUS supply. Now I want to make sure that VBUS is 
switched off whenever I switch off the main power supply. I have started 
to write a little platform driver which will do the sequencing. However, 
I'm struggling to find a way to switch off the VBUS supply given a 
struct device* handle which I have managed to get. Is there an API that 
I can use? I have confirmed that unbinding the driver via sysfs does 
achieve this, however, how do I do this programmatically from kernel 
code, perhaps without unbinding the entire device?

Best regards,
Sven
