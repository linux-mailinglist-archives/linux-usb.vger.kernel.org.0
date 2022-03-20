Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4244E194D
	for <lists+linux-usb@lfdr.de>; Sun, 20 Mar 2022 02:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241826AbiCTBRI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Mar 2022 21:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbiCTBRH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Mar 2022 21:17:07 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B0C108BDF
        for <linux-usb@vger.kernel.org>; Sat, 19 Mar 2022 18:15:44 -0700 (PDT)
Received: from [192.168.2.3] (ip-78-45-150-87.net.upcbroadband.cz [78.45.150.87])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: janecek)
        by jabberwock.ucw.cz (Postfix) with ESMTPSA id A3B6C1C0B79;
        Sun, 20 Mar 2022 02:15:41 +0100 (CET)
Message-ID: <3f4d1bce-7459-9ea4-be73-9b51f569e526@ucw.cz>
Date:   Sun, 20 Mar 2022 02:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From:   Petr Janecek <janecek@ucw.cz>
To:     alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: Apogee ONEv2 keeps resetting
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
    I'm trying to use Apogee ONEv2.  From usb dumps under
macos or windows it seems like a usb Class Audio 2.0
device, but in linux, it keeps resetting every two seconds
or so.  It keeps resetting even when the snd-usb-audio
driver is disabled, so the problem is probably at a lower
level.

   The messages below are from v5.16.16, but it behaves
the same no matter what I plug it into.

[  253.708616] usb 3-8: new high-speed USB device number 6 using xhci_hcd
[  253.899363] usb 3-8: New USB device found, idVendor=0c60, 
idProduct=0017, bcdDevice= 1.05
[  253.899370] usb 3-8: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[  253.899373] usb 3-8: Product: ONEv2
[  253.899375] usb 3-8: Manufacturer: Apogee
[  253.899377] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
[  253.960901] mc: Linux media interface: v0.10
[  253.980238] usb 3-8: 10:0: cannot get min/max values for control 2 
(id 10)
[  253.980445] usb 3-8: 12:0: cannot get min/max values for control 2 
(id 12)
[  253.980648] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  253.981927] usbcore: registered new interface driver snd-usb-audio
[  254.048280] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  254.050512] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  254.052961] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  254.063566] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  254.654578] usb 3-8: USB disconnect, device number 6
[  255.018600] usb 3-8: new high-speed USB device number 7 using xhci_hcd
[  255.199489] usb 3-8: New USB device found, idVendor=0c60, 
idProduct=0017, bcdDevice= 1.05
[  255.199503] usb 3-8: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[  255.199509] usb 3-8: Product: ONEv2
[  255.199514] usb 3-8: Manufacturer: Apogee
[  255.199518] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
[  255.213096] usb 3-8: 10:0: cannot get min/max values for control 2 
(id 10)
[  255.213338] usb 3-8: 12:0: cannot get min/max values for control 2 
(id 12)
[  255.213573] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  255.311363] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  255.313151] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  255.315387] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  255.326899] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  255.862049] usb 3-8: USB disconnect, device number 7
[  256.308529] usb 3-8: new high-speed USB device number 8 using xhci_hcd
[  256.499431] usb 3-8: New USB device found, idVendor=0c60, 
idProduct=0017, bcdDevice= 1.05
[  256.499444] usb 3-8: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[  256.499450] usb 3-8: Product: ONEv2
[  256.499454] usb 3-8: Manufacturer: Apogee
[  256.499458] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
[  256.506875] usb 3-8: 10:0: cannot get min/max values for control 2 
(id 10)
[  256.507118] usb 3-8: 12:0: cannot get min/max values for control 2 
(id 12)
[  256.507353] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  256.610890] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  256.612738] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  256.614986] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  256.627625] usb 3-8: 14:0: cannot get min/max values for control 2 
(id 14)
[  257.067595] usb 3-8: USB disconnect, device number 8
...

Any ideas?


Thanks,

Petr
