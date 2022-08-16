Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A97159528C
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 08:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiHPGbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 02:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiHPGbQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 02:31:16 -0400
X-Greylist: delayed 961 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 15 Aug 2022 17:47:29 PDT
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC66195800
        for <linux-usb@vger.kernel.org>; Mon, 15 Aug 2022 17:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl;
        s=tartarus; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=DS/5gMmmv7BMmxt/BwBMcFkadZ8ACS3eMLOBmbS+Chw=; b=Yjq2FshkGU0EhI5ois5PlClyXT
        PCmvTOzsxynh7Dw5KA2tw+6dll6e/OkA8tbyzOStI/0eZTv40w0/6Do6MB1Uq14BFRYKw8apd6IaI
        tXVbbshI4ECR/876kMxuTPhGZl1WSSLa956GbS59masJ38XTO/MFfawEthYwMOavGU9U=;
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
        (envelope-from <kilobyte@angband.pl>)
        id 1oNkU7-00AL27-Mn; Tue, 16 Aug 2022 02:31:07 +0200
Date:   Tue, 16 Aug 2022 02:31:07 +0200
From:   Adam Borowski <kilobyte@angband.pl>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: build failure due to drivers/usb/dwc3/dwc3-qcom.c
Message-ID: <YvrlS9ear/Ku1bKt@angband.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!
With CONFIG_USB=n CONFIG_USB_GADGET=y I get the following fail:

ld: drivers/usb/dwc3/dwc3-qcom.o: in function `dwc3_qcom_suspend':
dwc3-qcom.c:(.text+0x3d4): undefined reference to `usb_hub_find_child'

I tried writing a patch but I don't know how much code applies to host
mode only -- and whether the device supports gadget at all.  Thus, I'm
just reporting instead.

Broken in 6895ea55c385c9afdd2aec1eef27ec24917a112f.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁
⢿⡄⠘⠷⠚⠋⠀ You're alive.  But that's just a phase.
⠈⠳⣄⠀⠀⠀⠀
