Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1393F985F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 13:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235295AbhH0LQc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 07:16:32 -0400
Received: from foss.arm.com ([217.140.110.172]:39620 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233116AbhH0LQc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Aug 2021 07:16:32 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1F47106F;
        Fri, 27 Aug 2021 04:15:42 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57E853F766;
        Fri, 27 Aug 2021 04:15:42 -0700 (PDT)
Subject: Re: [PATCH 0/5] usb: isp1760: arm tc2 board isp1761 fixes
To:     Rui Miguel Silva <rui.silva@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20210827082112.4061086-1-rui.silva@linaro.org>
From:   Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <f9f1ceb6-6db5-8ef1-944d-381bdf65599a@arm.com>
Date:   Fri, 27 Aug 2021 13:15:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827082112.4061086-1-rui.silva@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

- deggeman@gmx.de
+ dietmar.eggemann@arm.com

On 27/08/2021 10:21, Rui Miguel Silva wrote:
> Hi,
> Dietmar complained that the latest changes to this driver
> broke booting his Arm TC2 board [0]. I did not have one of
> that boards but Dietmar provided out of band help trying to
> debug the issue, many thanks for that.
> 
> Meanwhile, yesterday I could get access (remotely) to one of
> TC2 board and manage to fix the issues that were breaking
> this to work on that system.
> 
> This is rebased on top of the latest (this evening)
> usb-testing/(this morning) usb-next. If, and I am sure it is
> too late to include in to 5.14, it should go to the first
> 5.14.y stable with this tag:
> 
> Fixes: 1da9e1c06873 ("usb: isp1760: move to regmap for register access")
> 
> Thanks again Dietmar for reporting and your help.
> 
> Cheers,
>   Rui
> 
> [0]: https://lore.kernel.org/linux-usb/11ed5458-4b88-ad72-4497-89ff9346a40b@gmx.de/
> 
> Rui Miguel Silva (5):
>   usb: isp1760: fix memory pool initialization
>   usb: isp1760: fix qtd fill length
>   usb: isp1760: write to status and address register
>   usb: isp1760: use the right irq status bit
>   usb: isp1760: otg control register access
> 
>  drivers/usb/isp1760/isp1760-core.c | 50 ++++++++++++++++--------------
>  drivers/usb/isp1760/isp1760-hcd.c  | 33 ++++++++++----------
>  drivers/usb/isp1760/isp1760-regs.h | 16 ++++++++++
>  drivers/usb/isp1760/isp1760-udc.c  | 12 +++----
>  4 files changed, 65 insertions(+), 46 deletions(-)

Works fine on my TC2 too. Thanks!

Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>

Maybe you can change as well to:

Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>

I used the wrong email address last week.
