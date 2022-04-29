Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2740C5153FF
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 20:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359160AbiD2SzR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 14:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356733AbiD2SzQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 14:55:16 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7FEC3E0E
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com;
        s=Selector; t=1651258317; i=@motorola.com;
        bh=353u44s4GB1PlfP/MspD2JdzoFUrHg9PkClsot04B0I=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=eigeOU9u6HguWvySyA4jswCWgAW+vwwXsG+6ub+NnXKQq58lV9by7+GMHO3EXiBdh
         tGcocNYbrVUlETWiiNjt8nK6iM6FgpjmK9c2X+3TNSXE49qjB1sGQm5DNrSV82hut5
         C4QX6XoucXjnuAkdbFucDJibomU82fS7CEym4qGDRlw2ECB0UfbZ/Is5/iCefRJD+d
         XlkeHMUhDHe15ykV9euOwiGmT+cfXBW0alXsGJJxn2ohdze46NOiGYCTzsFidg8Qzu
         mKPAwuWvmK2PPfqsTQeU0OT2ypKQXthuaulNGG1mHgJbydWtKKbUkZrSznZXfNC2bs
         /7qhNxp8oXcJA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsWS8eKJqO4Z45w
  kg7+9bBbH2p6wW6yaupPFYtvp36wWnROXsFssWtbKbLGl7QqTxadTO5ktfvzpY3bg8JjdMZPV
  Y9OqTjaPzS+6mT36/xp4fN4kF8AaxZqZl5RfkcCa8W3pBPaCP1wVF9/PZW1g/MfRxcjJISQwl
  Umi8WVQFyMXkL2ISWLl+4lsIAkWAVWJq6umsILYbAJqEgter2IGsUUELCR6F01nBGlgFjjLKN
  F9bj1Yg7CAr8STvZsZQWxeAWWJnye62CCmLmeU+Lz9FBtEQlDi5MwnLCA2s4CWxI1/L5m6GDm
  AbGmJ5RAXcQpYSfzr28AygZF3FpKOWUg6ZiF0LGBkXsVomVSUmZ5RkpuYmaNraGCga2hoogsk
  LfQSq3QT9UqLdVMTi0t0DfUSy4v1UouL9Yorc5NzUvTyUks2MQJDPKWIQWgH49Gen3qHGCU5m
  JREeXdp5iQJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDdagiUEyxKTU+tSMvMAcYbTFqCg0dJhN
  dUGyjNW1yQmFucmQ6ROsWoy3Hp0JW9zEIsefl5qVLivGeNgIoEQIoySvPgRsBi/xKjrJQwLyM
  DA4MQT0FqUW5mCar8K0ZxDkYlYd7vIFN4MvNK4Da9AjqCCeiIlUWZIEeUJCKkpBqY1MTDN+Uy
  N7p8K5/IJ9l8hftUflM/67zJ63yTT/9P3Vlu5aQxwea6Xu6Mswu/sVUe++P/u/p4kPvxkOlPZ
  kt4d2QlrbppP2PjljsbI6Y43tx46fiM97P1/Lv2+byy+hUl/C5/m+vh+7PO/sr8+3pDSwxTzu
  8ppVe5pt58p3Op65d/432tNUp9effWPxZ/Ob/2ZOE9LV3ff217xP/676o+rWD00C7c4OuPW0k
  t67PMNBy0gi4YZz67JtTxIlDYsfcG74/J2T0uxVudc1llCsSPMHNlpAYm/P6zMzyteYMny1/2
  GSJt9avW6P64/4VxRle2dI+qru2mrcvVGH873BHecnQbk1D2Us1wB7tzP5xnKrEUZyQaajEXF
  ScCAL2OHn94AwAA
X-Env-Sender: w36195@motorola.com
X-Msg-Ref: server-17.tower-686.messagelabs.com!1651258315!10985!1
X-Originating-IP: [104.232.228.21]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12364 invoked from network); 29 Apr 2022 18:51:56 -0000
Received: from unknown (HELO va32lpfpp01.lenovo.com) (104.232.228.21)
  by server-17.tower-686.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2022 18:51:56 -0000
Received: from ilclmmrp01.lenovo.com (ilclmmrp01.mot.com [100.65.83.165])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by va32lpfpp01.lenovo.com (Postfix) with ESMTPS id 4KqhRb5r3SzgQ3G;
        Fri, 29 Apr 2022 18:51:55 +0000 (UTC)
Received: from p1g3 (unknown [10.45.4.153])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: w36195)
        by ilclmmrp01.lenovo.com (Postfix) with ESMTPSA id 4KqhRb3RbZzbvDd;
        Fri, 29 Apr 2022 18:51:55 +0000 (UTC)
Date:   Fri, 29 Apr 2022 13:51:48 -0500
From:   Dan Vacura <w36195@motorola.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 3/5] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <YmwzxIV5/a+ZNLXI@p1g3>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-4-m.grzeschik@pengutronix.de>
 <Yl8fwdOuxYDVrujW@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yl8fwdOuxYDVrujW@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thanks for this change it improves the performance with the DWC3
controller on QCOM chips in an Android 5.10 kernel. I haven't tested the
scatter/gather path, so memcpy was used here via
uvc_video_encode_isoc(). I was able to get around 30% improvement (fps
on host side). I did modify the alloc to only set the WQ_HIGHPRI flag.

On Tue, Apr 19, 2022 at 11:46:57PM +0300, Laurent Pinchart wrote:
> Hi Michael,
> 
> Thank you for the patch.
> 
> On Sun, Apr 03, 2022 at 01:39:12AM +0200, Michael Grzeschik wrote:
> > Likewise to the uvcvideo hostside driver, this patch is changing the
> > simple workqueue to an async_wq with higher priority. This ensures that
> > the worker will not be scheduled away while the video stream is handled.
> > 
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > +	video->async_wq = alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPRI, 0);
> 
> Unless I'm mistaken, an unbound work queue means that multiple CPUs will
> handle tasks in parallel. Is that safe ?

I found that with the WQ_UNBOUND flag I didn't see any performance
improvement to the baseline, perhaps related to cpu caching or
scheduling delays. I didn't notice any stability problems or concurrent
execution. Do you see any benefit to keeping the WQ_UNBOUND flag?

> 
> > +	if (!video->async_wq)
> > +		return -EINVAL;
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks,

Dan
