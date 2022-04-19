Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22735079A6
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 21:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348017AbiDSTDX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 15:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357479AbiDSTDP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 15:03:15 -0400
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0EF3F314
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 12:00:29 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E3421A1A3D401;
        Tue, 19 Apr 2022 21:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1650394825; bh=ei80KLhS8JeXI2KkC74qhfKf32RChLstTSR7djluLLQ=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=PIhvRff7IS5hQ5QO1agZspI1pPcafOI6SbOje2htr4BXbksyUyvDcR+umMdOZ2TfX
         ZMvLmNj3vI3G63q1QMCFIJPrO6yXWA4gm4gBa0j/mmCrpb7zmTPeWNVhVtkedphTXh
         0e51YdcXlTjWbP9pQb2dA0IUCBljx1CIt3yrr9kE=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FV0sb8zprIDO; Tue, 19 Apr 2022 21:00:20 +0200 (CEST)
Received: from [192.168.105.156] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 17D85A1A3D400;
        Tue, 19 Apr 2022 21:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1650394820; bh=ei80KLhS8JeXI2KkC74qhfKf32RChLstTSR7djluLLQ=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=T6S4pXv/BMYEn+ykYmETdvSa4jTiYGrnOYoRZba/h1AMOjj+jgYakqlxluPszLSJY
         43JfzGJLKE2CV6HYJoBdXVRgIRGOZO3Kkoo9k8ntqCU27h0/GAdY3M/RgsWsfHl3Vk
         Q6XoLuWp3MEnkAGmnapqFt6hBB3SUJd0Z0Ze/+pA=
Subject: Re: usb:dwc2: '-EPROBE_DEFER: supplier soc:power not ready' in RPi4
 5.18-rc2
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
References: <bcd1a2a7-c8cc-948a-a6dd-5fdf2b9bb79c@ivitera.com>
Message-ID: <36ff21cb-c1ec-bbf5-6a43-9f21684a5084@ivitera.com>
Date:   Tue, 19 Apr 2022 21:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bcd1a2a7-c8cc-948a-a6dd-5fdf2b9bb79c@ivitera.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 13. 04. 22 v 13:30 Pavel Hofman napsal(a):
> Hi,
> 
> In 5.18 RC2 module dwc2 (gadget mode) quits when being probed on RPi4 
> with message
> 
> -EPROBE_DEFER: supplier soc:power not ready
> 
> 5.17 works fine, with identical .config setup.
> 
> I am testing on RPi-patched repo 
> https://github.com/raspberrypi/linux/tree/rpi-5.18.y. RPi devs say they 
> have pushed all their platform-specific patches to their 5.18 tree 
> already 
> https://github.com/raspberrypi/linux/issues/4992#issuecomment-1097896392
> 
> Perhaps some newly-added DTS node missing, being required by the new 
> dwc2 version?
> 

The problem turned out to be missing config CONFIG_RASPBERRYPI_POWER=y 
in some of the defconfig files pushed by RPi devs to their 5.18 tree 
https://github.com/raspberrypi/linux/issues/4992#issuecomment-1100070149. 
No mainline issue then, good.

Best regards,

Pavel.
