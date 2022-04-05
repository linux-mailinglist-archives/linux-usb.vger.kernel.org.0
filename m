Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72D5C4F4BC3
	for <lists+linux-usb@lfdr.de>; Wed,  6 Apr 2022 03:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347586AbiDEXFG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Apr 2022 19:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1453691AbiDEP5M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Apr 2022 11:57:12 -0400
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010CFD1125
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com;
        s=Selector; t=1649170904; i=@motorola.com;
        bh=XuimDw4+iVhi9gEj1se5IBFh/YWO1jnu2M7n1+SW2uE=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=YR89p1j1ZF1Rzk3uPdUgiL4ncC3Xd+8s5A6rvRL3aOXHamL2P1Gll/SA6SczawBIh
         S3Mds2cZo/UPnAq6d6ZebYD1CHOYZ528ioMFgWtWEuM1XIZc11tQanOIJFkyeSeLth
         UAItQj3wr2QqEKB5wVKh94P/y7QiejKBs9YB6YhPFLAe9yEqCKZDJUWReXpIvS5Lfn
         Se4VGwoo+Pli4biGoM+zEf8iDiQj8lBqj6CvGJ7b7+y5Y7ofofHReW7Qd6ShBNFn39
         l6mwG4W5jnX/Tl+dYy7/j5UjkuXPBExHfwplqkDog5oacVySmcgQOVPLHEnDZ3z/qG
         rqVeW36fwT9LA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsWS8eKJmO71SJ8
  kg017VC2OtT1ht1g1dSeLxbbTv1ktOicuYbdYtKyV2WJL2xUmi0+ndjJb/PjTB+S2/GVy4PSY
  3TGT1WPTqk42j80vupk9dty28ej/a+DxeZNcAFsUa2ZeUn5FAmvG/H0PmQp2s1e8XdDL2MDYy
  9bFyMUhJDCDSeLalCksEM4iJom3N6+wdjFycrAIqEg82DyHCcRmE1CTWPB6FTOILSIQIXH91g
  cwm1ngAKPE7BZpEFtYwEviwIE5jCA2r4CyxNUzF9khhi5nlPiz8BwrREJQ4uTMJywQzVoSN/6
  9BFrAAWRLSyz/xwES5hSwkjh/ZSr7BEbeWUg6ZiHpmIXQsYCReRWjdVJRZnpGSW5iZo6uoYGB
  rqGhia6ZCZBpoZdYpZuoV1qsm5pYXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERj4KUUOOTsYv
  6z8qXeIUZKDSUmUt83DJ0mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG9jCFBOsCg1PbUiLTMHGI
  UwaQkOHiUR3g1hQGne4oLE3OLMdIjUKUZFKXHel+FACQGQREZpHlwbLPIvMcpKCfMyMjAwCPE
  UpBblZpagyr9iFOdgVBLmTYgAmsKTmVcCN/0V0GImoMXvzniCLC5JREhJNTA1zpTXdF768Y/H
  xSKJYMWwZ4Yee3btnHd7zXumY/06a48qCAf3/ttjnnxE+9gSH8WnG2RWOjVeeLMvLmK/0tygH
  d3J1XaOdz5685xZspibwdqtkklRtWF/VEeG6AMlJ95p0qcLZsR8ntfZELrmlvOeM/OOm9lbuU
  /dcGFP/H6l3EKp67vnLP+qt/jF1dM6rSpXQ65cctwpVhrxgYn/WePPXcwlj0+655Z/qFlz/bv
  ujWk7NXuiEhVm7n1zoju5ZE+irlIy44vHPQcCVk0z+flu6XfVq+tiZ04KERW7Y3UrtzinsjBj
  59pGf4/JPy5Ki8aJ3Qv59tFm/aKTpuccXrlPmMgsM7vx2WKx/BvKzmeeKLEUZyQaajEXFScCA
  DKltZ13AwAA
X-Env-Sender: w36195@motorola.com
X-Msg-Ref: server-8.tower-635.messagelabs.com!1649170903!12437!1
X-Originating-IP: [104.232.228.22]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22166 invoked from network); 5 Apr 2022 15:01:43 -0000
Received: from unknown (HELO va32lpfpp02.lenovo.com) (104.232.228.22)
  by server-8.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Apr 2022 15:01:43 -0000
Received: from va32lmmrp01.lenovo.com (va32lmmrp01.mot.com [10.62.177.113])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by va32lpfpp02.lenovo.com (Postfix) with ESMTPS id 4KXrT31b9Nz50GGy;
        Tue,  5 Apr 2022 15:01:43 +0000 (UTC)
Received: from p1g3 (unknown [10.45.5.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: w36195)
        by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4KXrT25w5Czf6f0;
        Tue,  5 Apr 2022 15:01:42 +0000 (UTC)
Date:   Tue, 5 Apr 2022 10:01:34 -0500
From:   Dan Vacura <w36195@motorola.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/5] usb: gadget: uvc: reset bytesused on queue cancel
Message-ID: <YkxZzvbazHEX2EAg@p1g3>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-2-m.grzeschik@pengutronix.de>
 <3a6bb767-a114-1d60-3600-52cef493ed58@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a6bb767-a114-1d60-3600-52cef493ed58@omp.ru>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Looks like we found the same issue, I submitted the same change the
other week here:
https://lore.kernel.org/all/20220331184024.23918-1-w36195@motorola.com/

One difference is you had the reset outside of the queue lock. I figured
to keep it within the lock since we can get a cancel while the pump
worker is running and this can negate the reset. Do you agree?

Thanks,

Dan

On Tue, Apr 05, 2022 at 11:43:16AM +0300, Sergey Shtylyov wrote:
> Hello!
> 
> On 4/3/22 2:39 AM, Michael Grzeschik wrote:
> 
> > On uvcg_queue_cancel the buf_used counter has to be reset. Since the
> > encode function uses the variable to decide if the encoded data has
> > reached the end of frame. Intermediate calls of uvcg_queue_cancel can
> > therefor lead to miscalculations in the encode functions, if buf_used
> 
>    Therefore?
> 
> > was not properly reset.
> > 
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> [...]
> 
> MBR, Sergey
