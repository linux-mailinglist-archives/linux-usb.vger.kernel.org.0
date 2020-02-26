Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8ED16F90C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2020 09:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbgBZIJG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 03:09:06 -0500
Received: from mail1.skidata.com ([91.230.2.99]:14138 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727327AbgBZIJG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Feb 2020 03:09:06 -0500
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Feb 2020 03:09:05 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1582704545; x=1614240545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6eI/ybzVZ4epEctIQPYNnPkc75le6yiCVTcoKTSPr3s=;
  b=telGlvB5uFgz1Dn5YOMs5zO8Yiuy81ehr3C+nRuLn7hsA60w7ADBzA9B
   O2PwntDMkJladsTWAfzyIv+Iwm9zdDEgfT0mNpwT3NtNDtvj7QNYRD1uN
   bkqNKH8a/5POpGT7RvGf+L4n8QFAYWqwu64x2tmCpZ4WcOJxYlSa/0XDh
   orDkQ1KjKR/JF4brPjhGKme/B9/3nwunpiJUMOADjZJgJc+wQeQmxAh1s
   HCLIkOQFDAaEw+p7uH/BXCXrOngMVl6jaMRgd2Wk8M9tLPeYVnee38nb5
   pznemHoOYY3+YkVGy8IEBDJFqYtqnnZTcq9Q+QglMbwuX9xcUzmeR2n2K
   A==;
IronPort-SDR: t6LmMyki9YvxqOLF/GVjfCDL6wt7z76G9NRHYsp7EhicSbyS4H5z4FBsou1eY+Icik6Zi6nA4V
 cwLrHk7ue6LRFxM7T33gUk7alq9e5tjZxJdtlhJM5NIgpAc38gV0B+iFPRe6iTF70NWf4VbF7M
 /Rl8H7RRX1zDcd3GwbXINpC7Bq9ihFKzQLWNx42+dpkllWQATepcHhrPPLSb43ZQsxXfxZLV+V
 J+zdna6WnnVsL7jz0aJHtWZKZN0Xr4S77ZKNapdqL+bBaQTUwChtPP+vQ8CcXgE7TK9n91Qb/c
 9SA=
X-IronPort-AV: E=Sophos;i="5.70,487,1574118000"; 
   d="scan'208";a="22884501"
Date:   Wed, 26 Feb 2020 09:01:53 +0100
From:   Richard Leitner <richard.leitner@skidata.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
CC:     <fancer.lancer@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: usb251xb: fix regulator probe and error handling
Message-ID: <20200226080153.GA673633@pcleri>
References: <20200226072644.18490-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200226072644.18490-1-m.felsch@pengutronix.de>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 26, 2020 at 08:26:44AM +0100, Marco Felsch wrote:
> Commit 4d7201cda226 ("usb: usb251xb: add vdd supply support") didn't
> covered the non-DT use-case and so the regualtor_enable() call during
> probe will fail on those platforms. Also the commit didn't handled the
> error case correctly.
> 
> Move devm_regulator_get() out of usb251xb_get_ofdata() to address the
> 1st issue. This can be done without worries because devm_regulator_get()
> handles the non-DT use-case too. Add devm_add_action_or_reset() to
> address the 2nd bug.
> 
> Fixes: 4d7201cda226 ("usb: usb251xb: add vdd supply support")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---

Looks fine to me.

Acked-by: Richard Leitner <richard.leitner@skidata.com>

> Hi,
> 
> unfortunately I didn't covered the non-DT use case during the devel of
> commit 4d7201cda226 and I was a bit to optimistic so I also missed the
> error handling.
> 
> Regards,
>   Marco
> 
>  drivers/usb/misc/usb251xb.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)

regards;rl
