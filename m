Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E70C46E385
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 08:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhLIH5S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 02:57:18 -0500
Received: from cable.insite.cz ([84.242.75.189]:51811 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232321AbhLIH5R (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Dec 2021 02:57:17 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 0FF3AA1A3D401
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 08:53:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639036423; bh=npEIk1j9V1lC8PH5RLAz09HHt/JUMkFIr710wdkGLEI=;
        h=From:Subject:To:Date:From;
        b=VM5IJnYRlDELJn+++CraoVj05HnDRhgZK2DqJj7DSKD9I8mWhs7Z1x0b7oAg3xa0o
         oFwT6wx0cNWLZ3N8KPTmFpdH/rqpxPbeTAHCdE0osyYp9PD1wZ3rBsX3uftNHGflkL
         6nJTLmvIl2RF5DXeQjebO6oEN4hby1b23NzdEkwA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iRTUKmk17Tt8 for <linux-usb@vger.kernel.org>;
        Thu,  9 Dec 2021 08:53:37 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 8F93CA1A3D400
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 08:53:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639036417; bh=npEIk1j9V1lC8PH5RLAz09HHt/JUMkFIr710wdkGLEI=;
        h=From:Subject:To:Date:From;
        b=qtPnAVuDaKEFWZw3n3NxhO+ohUOJAD2ziWkOH59LfLaEejxdG8JdFwnrUg4ngWUCe
         LitmT06hzbbzxVrOOikx6zsRWnSGXN91A2uaa6Z0Ilp4KYarhoVdbT9B1evOspQYpv
         0urUE6M64XRZWElecAJkel/Uj0ElsSunZj8Fa+P4=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb:core: possible bug in wMaxPacketSize validation in config.c?
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Message-ID: <ce5ed936-4325-95a1-cd1c-eece35c4b613@ivitera.com>
Date:   Thu, 9 Dec 2021 08:53:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

in 
https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/config.c#L409 
the initial value of maxp is obtained using function usb_endpoint_maxp.

maxp = usb_endpoint_maxp(&endpoint->desc);

This function 
https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/usb/ch9.h#L647 
returns only the bits 0 - 10 of the wMaxPacketSize field, i.e. dropping 
the high-bandwidth bits 11 and 12. Yet the subsequent code extracts 
these bits from maxp into variable i 
https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/config.c#L427 
, clears them in maxp, and re-sets back in one of the further checks 
https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/config.c#L445

IMO that means the code requires that initial value of maxp contains the 
additional-transactions bits. IMO the code should be fixed with this 
trivial patch (tested on my build):


===================================================================
diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
--- a/drivers/usb/core/config.c	(revision 
018dd9dd80ab5f3bd988911b1f10255029ffa52d)
+++ b/drivers/usb/core/config.c	(date 1638972286064)
@@ -406,7 +406,7 @@
  	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
  	 * (see the end of section 5.6.3), so don't warn about them.
  	 */
-	maxp = usb_endpoint_maxp(&endpoint->desc);
+	maxp = endpoint->desc.wMaxPacketSize;
  	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
  		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X 
has invalid wMaxPacketSize 0\n",
  		    cfgno, inum, asnum, d->bEndpointAddress);


=========================

I can send a proper patch should the change be approved.

Thanks a lot,

Pavel.
