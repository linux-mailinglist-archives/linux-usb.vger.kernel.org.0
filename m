Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C6CEAD37
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2019 11:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbfJaKLu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 06:11:50 -0400
Received: from cable.insite.cz ([84.242.75.189]:60082 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbfJaKLt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 31 Oct 2019 06:11:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id CA56AA1A40B04;
        Thu, 31 Oct 2019 11:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1572516706; bh=8u5wswBwAm0FBV9O8UNwqsHca1lvqdBkAkcJgNo746M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mQkCc1cPmSuuwV6/48U1w0qOb129dVyGgQOB6pfTxoFFFDm6/Y9doISYO/VDBnkfH
         i9xy1F/NWpGWmGx5dxeA7IfQT/tOlkkXThJyXGSuI3B8NWTiYQ5EEflS2216IYxjsC
         VHp1vu3m+WfYzRBk6PnweO7SdG05vWqhwoV4Fung=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ae51_tAcYkIn; Thu, 31 Oct 2019 11:11:46 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id A4F98A1A40B02;
        Thu, 31 Oct 2019 11:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1572516706; bh=8u5wswBwAm0FBV9O8UNwqsHca1lvqdBkAkcJgNo746M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mQkCc1cPmSuuwV6/48U1w0qOb129dVyGgQOB6pfTxoFFFDm6/Y9doISYO/VDBnkfH
         i9xy1F/NWpGWmGx5dxeA7IfQT/tOlkkXThJyXGSuI3B8NWTiYQ5EEflS2216IYxjsC
         VHp1vu3m+WfYzRBk6PnweO7SdG05vWqhwoV4Fung=
Subject: Re: [PATCH] usb: dwc3: gadget: fix race when disabling ep with
 cancelled xfers
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Linux USB <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@ti.com>
References: <20191031090713.1452818-1-felipe.balbi@linux.intel.com>
 <3cd8a46e-8c1a-84c1-eb82-27713cf16a87@ivitera.com> <87k18le0a9.fsf@gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <aa8001ac-bdb7-d1ff-78a4-56cbedba6791@ivitera.com>
Date:   Thu, 31 Oct 2019 11:11:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87k18le0a9.fsf@gmail.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 31. 10. 19 v 10:23 Felipe Balbi napsal(a):
> 
>>>
>>
>> Please is this problem (and its solution) also applicable to dwc2 (i.e.
>> e.g. RPi4)?
> 
> different driver, so no.

Yes the driver is different, but I was wondering if such situation can 
occur in dwc2 too and (if so) whether it is already taken care of. 
Disconnecting the USB device is a standard operation.

Thanks a lot. Regards,

Pavel.
