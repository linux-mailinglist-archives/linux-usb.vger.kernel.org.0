Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F621544CB
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 14:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbgBFNWy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 08:22:54 -0500
Received: from cable.insite.cz ([84.242.75.189]:60433 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgBFNWx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Feb 2020 08:22:53 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 3D101A1A40B02
        for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2020 14:22:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1580995368; bh=alaKCe8vqS2xl19wSsV7bRQiFGJGcHp/fPL4xmr0Zz4=;
        h=To:From:Subject:Date:From;
        b=bvdGfYTWjjDf6Mc6cYFp2LIg3uWp9/pkFyrwgBWoGPhPDcvA5ucYkIh8Dfw3UbLK9
         TwvaKcMSQPuetDhHgROCThQ0Zbz7WSSoK5tVe0CcJWXc59TVu2QhRZvDfBL6IwqZkD
         wdFllkiGLicrzxaG1XADgPEvUzS7ZA51BRzq0RCA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VqlOVMZS15QP for <linux-usb@vger.kernel.org>;
        Thu,  6 Feb 2020 14:22:48 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 142CEA1A40B01
        for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2020 14:22:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1580995368; bh=alaKCe8vqS2xl19wSsV7bRQiFGJGcHp/fPL4xmr0Zz4=;
        h=To:From:Subject:Date:From;
        b=bvdGfYTWjjDf6Mc6cYFp2LIg3uWp9/pkFyrwgBWoGPhPDcvA5ucYkIh8Dfw3UbLK9
         TwvaKcMSQPuetDhHgROCThQ0Zbz7WSSoK5tVe0CcJWXc59TVu2QhRZvDfBL6IwqZkD
         wdFllkiGLicrzxaG1XADgPEvUzS7ZA51BRzq0RCA=
To:     linux-usb@vger.kernel.org
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb:gadget:f_uac2: EP OUT is adaptive instead of async
Message-ID: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
Date:   Thu, 6 Feb 2020 14:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The existing UAC2 implementation presents itself as asynchronous 
USB_ENDPOINT_SYNC_ASYNC 
https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L276 
+ 
https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L285 
.

However:
1) The function does not define any feedback endpoint

2) IMO in reality it is adaptive - the g_audio capture device accepts 
any data passed by the USB host, the USB host is the one which defines 
the data pace.

While Linux and reportedly OSX accept the async EP OUT without explicit 
feedback EP IN, Windows does not.

Simply changing USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE 
for the FS and HS output endpoints fixes the windows problem and IMO 
corrects the config to reflect real function.

There are multiple projects underway adding the async feedback EP, but 
in the meantime I think the .bmAttributes information should be changed 
as above, making the device usable in Windows for everyone.

Thanks a lot for considering.

Best regards,

Pavel.
