Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF9313B239
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 19:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgANSjT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 13:39:19 -0500
Received: from cable.insite.cz ([84.242.75.189]:51021 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgANSjS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 13:39:18 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 6515DA1A40B06;
        Tue, 14 Jan 2020 19:39:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579027155; bh=MgQcwc6tQcuXYKPrdv7P6I9FeI8AcKqrAceGj1WNa4Y=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=nqaSBjcfBMhQ4/wU/36Erfoj4qxc+SYa6X/aIJKJ1Hj7UYYWin4G3A8kXbJPwClll
         99ucjYdnzj4kBbaZCQkFswdUseBKedyArKW2QVa7fb1bue57qHxtDLA+OvF4QGZXgg
         y4tDjG64p1Dcz7GwNm6srzi0+fD6pnDrZ+bF5uTc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vcwZQJhmooKY; Tue, 14 Jan 2020 19:39:09 +0100 (CET)
Received: from [192.168.105.119] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id C5F47A1A40B05;
        Tue, 14 Jan 2020 19:39:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579027149; bh=MgQcwc6tQcuXYKPrdv7P6I9FeI8AcKqrAceGj1WNa4Y=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=CHm0W57AzbHTD3qOnut6o00wRP6Hf5kCsskLR2pkLDZgFk9zWGAb2RGrJvTnP2dH6
         ZSrdBZibCvG5WvV8moA1kut+ZZPhlQjgOv48wLXoX1tjORoY3/+TP+UmxBxAWjlBAV
         IEkWjqYyHH8A8y/EhFX3d5TY+2ky8P6xEHXXxA3g=
Subject: Re: USB:UAC2: Incorrect req->length > maxpacket*mc - cause likely
 found
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
 <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
Message-ID: <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
Date:   Tue, 14 Jan 2020 19:39:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Dne 11. 01. 20 v 10:31 Pavel Hofman napsal(a):
> Hi,
> 
> Dne 10. 01. 20 v 8:29 Pavel Hofman napsal(a):
>> Hi,
>>
>> Together with dwc2 maintainer Minas Harutyunyan we have been
>> troubleshooting various issues of dwc2 on RPi4. We hit a problem where
>> the g_audio in capture (EP OUT, playback from USB host) requests req->
>> length larger than maxpacket*mc.

My question relates to the recent patch 
https://marc.info/?l=linux-usb&m=157901102706577&w=2
> 
> IMO the problem is here 
> https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L675 
> :
> 
> However, a few lines later the agdev->out_ep_maxpsize is set as maximum 
> from these two values 
> https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L700 
> :
> 
> agdev->out_ep_maxpsize = max_t(u16, 
> le16_to_cpu(fs_epout_desc.wMaxPacketSize), 
> le16_to_cpu(hs_epout_desc.wMaxPacketSize));
> 
> 
> Unfortunately I do not know the reason for selection of the maximum 
> value from FS and HS, I cannot create a patch. Very likely there is more 
> hidden know-how which I do not know.
> 

Please can we solve this issue so that the gadget can work for any 
bInterval value?

Thanks a lot,

Pavel.
