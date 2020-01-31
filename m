Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE3E114ECAA
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 13:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbgAaMrc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 07:47:32 -0500
Received: from cable.insite.cz ([84.242.75.189]:37801 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728556AbgAaMrc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jan 2020 07:47:32 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id BF363A1A40B08;
        Fri, 31 Jan 2020 13:47:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1580474849; bh=WRKeCGdqnGjguEe6y6BP7+4MWB9Ha99WVfTn7xAgqGM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TiqIzuJaKfL1N+lP/iSn3w57WYWWo03LG5LgmOQLx5ON+8yFQP8m08LPrmMMAjkhw
         7g5Ne8BN8fiNycZJdCtA1nEoh57G1qnfISbwLXCVhaVNiUKYKjJ4WaXgsD4Svy1a7M
         4GBlQFcUgZ4uHNJ+C5IKWalUmkBdljVkasm/vQ2o=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jXCNefNCi_v3; Fri, 31 Jan 2020 13:47:29 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 924AEA1A40B07;
        Fri, 31 Jan 2020 13:47:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1580474849; bh=WRKeCGdqnGjguEe6y6BP7+4MWB9Ha99WVfTn7xAgqGM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TiqIzuJaKfL1N+lP/iSn3w57WYWWo03LG5LgmOQLx5ON+8yFQP8m08LPrmMMAjkhw
         7g5Ne8BN8fiNycZJdCtA1nEoh57G1qnfISbwLXCVhaVNiUKYKjJ4WaXgsD4Svy1a7M
         4GBlQFcUgZ4uHNJ+C5IKWalUmkBdljVkasm/vQ2o=
Subject: Re: [PATCH] usb: gadget: u_audio: Fix high-speed max packet size
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
 <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
 <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
 <20200114200450.064cd521.john@metanate.com>
 <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com>
 <20200117104022.5bb769f2.john@metanate.com>
 <495ccd06-9059-2249-ce70-aa9647609319@ivitera.com>
 <9607a759-c08c-97bd-a0a7-f506ca64435f@ivitera.com>
 <4588dcf7-7e2a-8bdd-48e5-e835f3503f5a@ivitera.com>
 <20200131112733.758ab77c.john@metanate.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <2dfd0136-ebfd-102c-e944-0a04b405968e@ivitera.com>
Date:   Fri, 31 Jan 2020 13:47:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200131112733.758ab77c.john@metanate.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

>> I apologize for a basic question - please which official repository to
>> check status of a gadget patch after being accepted? Thanks a lot for
>> the information.
> 
> If you have a kernel tree, you can ask the MAINTAINERS file:
> 
> 	./scripts/get_maintainer.pl --scm -f drivers/usb/gadget/function/u_audio.c
> 
> I'd expect this to appear in Felipe's tree first at:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
> 
> but I don't see it yet.  I guess it won't be picked up until after the
> merge window.
> 

Thanks a lot for you info. How does the maintainer pick a patch from the 
flood of messages? Some extra headers (Tested:by, Acked-by:) are sent 
separately by different people, does the maintainer have to keep track 
of all of that manually?

Thanks for your enlightenment.

Pavel.
