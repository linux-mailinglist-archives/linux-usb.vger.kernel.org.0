Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF084FF5CC
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 13:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbiDMLkB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 07:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiDMLkA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 07:40:00 -0400
X-Greylist: delayed 433 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Apr 2022 04:37:38 PDT
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27B858822
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 04:37:38 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id CCC7EA1A3D402;
        Wed, 13 Apr 2022 13:30:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1649849422; bh=5TxTZuuOqvG9Vr2VUljnQJ2UfPtJ8iNy0rdzom4YkkA=;
        h=Date:To:From:Subject:From;
        b=IWu4i9m8NfR8aIUFKX+KD5A+UcFsiZYNjbu4yHwLbgy7n5/uxsD1uYAiUXFvXThTU
         VgCj6u4SSn9m+BDuopAVN7tVv250N6kN+eVNTdu82QqWIvI1RcDIRpcAj5Q1kRsxS9
         RhOY7ADbhT6Rvb5poP1LUtol3xz/hNWLVT8yBdnE=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nWjygIzqQTt8; Wed, 13 Apr 2022 13:30:17 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 590D8A1A3D400;
        Wed, 13 Apr 2022 13:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1649849417; bh=5TxTZuuOqvG9Vr2VUljnQJ2UfPtJ8iNy0rdzom4YkkA=;
        h=Date:To:From:Subject:From;
        b=JIE7Sm4Ziq2oXPFud0myAVcKPiXUE7FIAxgjFSLo6xM1Kj+zoJWpEa2z7tHBE7CSk
         SAUyvdoQzebw/2bEY3TDFOjzN3bzQo1SeP6Re4QPxm4RObBhfm67UtGA+4kCMR4C1Z
         0Cn3u+6C0cFEvU7/qb2Z6Fq/4jKRjSQaqYLoyUU4=
Message-ID: <bcd1a2a7-c8cc-948a-a6dd-5fdf2b9bb79c@ivitera.com>
Date:   Wed, 13 Apr 2022 13:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb:dwc2: '-EPROBE_DEFER: supplier soc:power not ready' in RPi4
 5.18-rc2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

In 5.18 RC2 module dwc2 (gadget mode) quits when being probed on RPi4 
with message

-EPROBE_DEFER: supplier soc:power not ready

5.17 works fine, with identical .config setup.

I am testing on RPi-patched repo 
https://github.com/raspberrypi/linux/tree/rpi-5.18.y. RPi devs say they 
have pushed all their platform-specific patches to their 5.18 tree 
already 
https://github.com/raspberrypi/linux/issues/4992#issuecomment-1097896392

Perhaps some newly-added DTS node missing, being required by the new 
dwc2 version?

Thanks a lot for any help.

Best regards,

Pavel.

