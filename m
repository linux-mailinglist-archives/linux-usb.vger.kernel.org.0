Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50B2151E15E
	for <lists+linux-usb@lfdr.de>; Fri,  6 May 2022 23:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444577AbiEFVw5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 May 2022 17:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344136AbiEFVw4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 May 2022 17:52:56 -0400
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2300B637D
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 14:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com;
        s=Selector; t=1651873751; i=@motorola.com;
        bh=jQKLjU/fOePuh6eJw6WV6aqRmcV99GWsM2H3CyiipNk=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=ecWkBFeUCgFfuz0yW3RFwvjgPCjLz8tZcmcsAbRqJb8hHahlkbkJsuYmayjBcls9o
         WXJUbmJL6BR09fx3pp1FmRk+PIOSILa2SIiP/qvKT+VB+sQbfBLr785dFpNg/+8yVC
         Hd8sEcmq2q8tKvy3U+dGl8MH+/2lgqOHE28NsJAQY+ItsusrsQn1eI2NyTy63WrJxz
         Z/7SkIrLs6xC5AlhhkxQeBbMesJFBO2cawa9jQnkcBM5qV2PgbP3oyUiWcIhPa3m5s
         Kf8IlcGS4FBSbCaZ7o6vVry3QGx8vshj0xAkeFKT2EjbDLDD9YqWRQj6Qc4nqHSqPt
         wZzLIwjH82b+g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsWS8eKJuO616aV
  JBrd+y1oca3vCbrFq6k4Wi22nf7NadE5cwm6xaFkrs8WJybEWn07tZLb48aeP2YHDY3bHTFaP
  Tas62Tw2v+hm9uj/a+DxeZNcAGsUa2ZeUn5FAmvG+jULmQu2s1W8/vuZvYFxMmsXIyeHkMAMJ
  olZr6u7GLmA7MVMEo82L2EDSbAIqEhsvH+EGcRmE1CTWPB6FZgtIqAlcezLV3aQBmaBy4wSMz
  duZQRJCAv4SjzZuxnM5hVQlrjY85MFYuoEJomrNxayQyQEJU7OfMICYjMDTbrx7yVTFyMHkC0
  tsfwfB0iYU8BY4n/vUvYJjLyzkHTMQtIxC6FjASPzKkarpKLM9IyS3MTMHF1DAwNdQ0MTXTMT
  XWMDvcQq3US90mLd1MTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwBBPKXKQ28G4bdVPvUOMk
  hxMSqK8LTalSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeP9PBsoJFqWmp1akZeYA4w0mLcHBoy
  TC2zcRKM1bXJCYW5yZDpE6xagoJc5rMw0oIQCSyCjNg2uDxfglRlkpYV5GBgYGIZ6C1KLczBJ
  U+VeM4hyMSsK8YiBTeDLzSuCmvwJazAS0+GMA2OKSRISUVAOTeffxqHAPgbSj0/jsfh+tO3Sc
  4WV/S2CRO8MavcXs373vThLQ1+RU5T5SlfJbYT3PV+30jdrGv5QW7f0jXv06YK7ihY9+P00f/
  HTZXadhxRNvLch38rZg642VJqL8mfHVaxhcti9coFDX8qUrqvhj0Qqhd6eZnpjILe67vEqk4Z
  nF6sbZS8t5+a8JKD+/0dthca057ZzYJ803DfERvffUeS9vSJTKPPm1VL75adKL9QGfT9mr9J3
  N2nsx4bg1q/OPx+kOGxQls1o9o2YUfEnwzutxVIo4z7LSWWpbDNM7FpEOLely9es/dr0tf3xP
  XkEmxk38aB5T4CvFko9OoQoxvDaTPNKcJk6VSlorq8RSnJFoqMVcVJwIANurn/hsAwAA
X-Env-Sender: w36195@motorola.com
X-Msg-Ref: server-13.tower-715.messagelabs.com!1651873750!32244!1
X-Originating-IP: [104.232.228.23]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18964 invoked from network); 6 May 2022 21:49:10 -0000
Received: from unknown (HELO va32lpfpp03.lenovo.com) (104.232.228.23)
  by server-13.tower-715.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 May 2022 21:49:10 -0000
Received: from va32lmmrp01.lenovo.com (va32lmmrp01.mot.com [10.62.177.113])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by va32lpfpp03.lenovo.com (Postfix) with ESMTPS id 4Kw42t0ydBz50WfL;
        Fri,  6 May 2022 21:49:10 +0000 (UTC)
Received: from p1g3 (unknown [10.45.4.252])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: w36195)
        by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4Kw42s5r35zf6f0;
        Fri,  6 May 2022 21:49:09 +0000 (UTC)
Date:   Fri, 6 May 2022 16:49:01 -0500
From:   Dan Vacura <w36195@motorola.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 3/5] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <YnWXzZdEXrED6bMW@p1g3>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-4-m.grzeschik@pengutronix.de>
 <Yl8fwdOuxYDVrujW@pendragon.ideasonboard.com>
 <YmwzxIV5/a+ZNLXI@p1g3>
 <20220429200137.GE7671@pengutronix.de>
 <20220502090003.GH7671@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502090003.GH7671@pengutronix.de>
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

On Mon, May 02, 2022 at 11:00:03AM +0200, Michael Grzeschik wrote:
> Hi Dan,
> 
> On Fri, Apr 29, 2022 at 10:01:37PM +0200, Michael Grzeschik wrote:
> > On Fri, Apr 29, 2022 at 01:51:48PM -0500, Dan Vacura wrote:
> > > Thanks for this change it improves the performance with the DWC3
> > > controller on QCOM chips in an Android 5.10 kernel. I haven't tested the
> > > scatter/gather path, so memcpy was used here via
> > > uvc_video_encode_isoc(). I was able to get around 30% improvement (fps
> > > on host side). I did modify the alloc to only set the WQ_HIGHPRI flag.
> 
> I missed to ask you to try the WQ_CPU_INTENSIVE flag. It would be
> interesting if you can see further improvement.

I had some time to test this flag and I couldn't find any discernible
difference with it set or not.

Regards,

Dan
