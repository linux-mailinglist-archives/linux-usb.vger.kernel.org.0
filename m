Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7CD94E417D
	for <lists+linux-usb@lfdr.de>; Tue, 22 Mar 2022 15:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237087AbiCVOjN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Mar 2022 10:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbiCVOjN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Mar 2022 10:39:13 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id ACD4C6AA52
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 07:37:45 -0700 (PDT)
Received: (qmail 126093 invoked by uid 1000); 22 Mar 2022 10:37:44 -0400
Date:   Tue, 22 Mar 2022 10:37:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jun Li <lijun.kernel@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH 1/4] USB: gadget: Rename usb_gadget_probe_driver()
Message-ID: <YjnfOFFSjIlDhZUq@rowland.harvard.edu>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YjeEwspj0V3JaV1L@rowland.harvard.edu>
 <CAKgpwJUMXiPoLNNXzk2d=532fhfdWK0awopd0PPPg87kBi3=jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKgpwJUMXiPoLNNXzk2d=532fhfdWK0awopd0PPPg87kBi3=jg@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 22, 2022 at 08:57:04PM +0800, Jun Li wrote:
> Alan Stern <stern@rowland.harvard.edu> 于2022年3月22日周二 06:57写道：
> >
> > In preparation for adding a "gadget" bus, this patch renames
> > usb_gadget_probe_driver() to usb_gadget_register_driver().  The new
> > name will be more accurate, since gadget drivers will be registered on
> > the gadget bus and the probing will be done by the driver core, not
> > the UDC core.
> >
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Missed one rename change:
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 1fb837d9271e..4141206bb0ed 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -284,7 +284,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct
> config_item *item,
>                         goto err;
>                 }
>                 gi->composite.gadget_driver.udc_name = name;
> -               ret = usb_gadget_probe_driver(&gi->composite.gadget_driver);
> +               ret = usb_gadget_register_driver(&gi->composite.gadget_driver);
>                 if (ret) {
>                         gi->composite.gadget_driver.udc_name = NULL;
>                         goto err;
> Li Jun

Ah, yes indeed; how careless of me.  Thanks for pointing this out.

Alan Stern
