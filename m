Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA335482037
	for <lists+linux-usb@lfdr.de>; Thu, 30 Dec 2021 21:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240912AbhL3UR3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 15:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240610AbhL3UR3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Dec 2021 15:17:29 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83C2C061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 12:17:28 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id s15so22165285pfk.6
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 12:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=d1luYh8oV8U9gtPnKSgUx3W3sB5nYcV3i4BXIdLwMks=;
        b=G5MBbA2uFaYCxq2v62QTZ5r2llDeVLWWlI1J0HmEm2LYEg3ZwFLgKHihlSToz/kZAf
         o5CKV21w5XAnQy5qgwZlxhOrtn26rqcTVsTHOu3yuBSlwfzSzWWL5ulxX8K5m8LnwTPr
         2BrOLcTZnN8YSTDz6j/mzPCeO/lHucgHTVHog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d1luYh8oV8U9gtPnKSgUx3W3sB5nYcV3i4BXIdLwMks=;
        b=vLJwrN6FPonC3WDJh0KVRGEhGCS5kb4wxmmYLZOI6LUg+4HYEowEM6hRfpXoIC6LCS
         fpXvG3MQFa6qnFtDEnWoqpYaioq+oTR5CS/PXe63XvTpJHLDWKrmYP3JAEp2+YGzRKjw
         2mzE/mLcCS1R04fm4UzyrHqdejPsAJLxxxYFlL15bYtLlBH2RsV12r2EboDgvbgVEW7/
         ej2Cnx9L8leB/NOPd5knUD5mVyVDjYmRW7fibcp21Sx3a8vF5v348IyP8WBMLnw0AAId
         jf0mB/eKrz9VnMGotYkypxPObtmGDdMi/MW1bcjQPp4PHAyiVANBO+QaTLci3hRBreDO
         tOcQ==
X-Gm-Message-State: AOAM5327rMvYun9/rRkLkisJjiLUSRK9x4kD7Zgva9AODFZ/2fY7XvnA
        W0HFSMggtXezQnOsXIVcCaIVxQ==
X-Google-Smtp-Source: ABdhPJwywWqiz65dsvMg8lmhWfMkY/9zDIJxnInTBrT6uCsb/VzPYhqS8G6HyrVvGWrNXQY0NlBQpg==
X-Received: by 2002:a63:9312:: with SMTP id b18mr22402500pge.185.1640895448447;
        Thu, 30 Dec 2021 12:17:28 -0800 (PST)
Received: from localhost ([2620:15c:202:201:b477:d18e:ed55:21c6])
        by smtp.gmail.com with UTF8SMTPSA id i4sm11982494pjj.30.2021.12.30.12.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 12:17:28 -0800 (PST)
Date:   Thu, 30 Dec 2021 12:17:26 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH v17 1/7] usb: misc: Add onboard_usb_hub driver
Message-ID: <Yc4T1qSkcRF2iBVg@google.com>
References: <20211116200739.924401-1-mka@chromium.org>
 <20211116120642.v17.1.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <07781322-3632-7d63-0da8-a651a438a3ff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07781322-3632-7d63-0da8-a651a438a3ff@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 11:05:28PM +0300, Dmitry Osipenko wrote:
> 16.11.2021 23:07, Matthias Kaehlcke пишет:
> > +static const struct usb_device_id onboard_hub_id_table[] = {
> > +	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS0411 USB 3.0 */
> > +	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.0 */
> > +	{},
> > +};
> 
> RTS5411 two times in the comments?

One time, the other is RTS0511

> Internet suggests that RTS5411 is USB 3.0

Correct, however the chip internally has two hubs, one for USB2 and one for
USB3:

  Bus 002 Device 002: ID 0bda:0411 Realtek Semiconductor Corp. 4-Port USB 3.1 Hub
  Bus 001 Device 002: ID 0bda:5411 Realtek Semiconductor Corp. 4-Port USB 2.1 Hub

> Are these hubs expected to be powered-on only when upstream port is
> enabled? Shouldn't runtime PM be used for that somehow?

In the general case I would expect that a onboard hub is connected to a port
that is enabled. For now I think it's fine to power the hub always when the
system is running (which is also the current situation with using always-on
regulators). If someone has an actual use case where the upstream port can
be disabled they can add support for that later.
