Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085D51D287E
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 09:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgENHGn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 03:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgENHGn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 03:06:43 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202D4C061A0C
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 00:06:43 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v12so2389177wrp.12
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 00:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=L05mAm31ZcxAvElKHc83C4Aoq1Kuwp/snWFI4H5GBOo=;
        b=BsRXFiH5yG6nmOjUcFKNvCpyGlQOL12dA7yKt6lnaH+KnfFz8Mo98iFPBtghVFAYiz
         fR0ckku5wtnAbxE6U+vEp6ww8uXJV7AQYqBlGC5m6F0iJj8bZ9ulaKTyZIMoxNA8ioup
         HNeSdOzDgDCAIP0t/GevGNetkzENYbmay4MVe6zS+wkh4wibqfXvbfhptMW/gNYLqTBU
         l3+qg10tekW3ywwBQbmOAklka79+bbCkxgpj/W3UmN/Kp/CO1GGolBeS6L/POqyvH6BR
         ZHXFmg7zwegR4Hj+wmNOV2vez4SvxikUtGNyx/vYbS9CaT9bvsYxi5R38wgNhwsl66SL
         s/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=L05mAm31ZcxAvElKHc83C4Aoq1Kuwp/snWFI4H5GBOo=;
        b=haRegi+CS+f+f8/K7zXYfjsSfpsMusrX++h5T5RBQA6wEeblROaPohO+AzeL9DlkuX
         AAMOkCA+tQhkoJoSawr3ZsozD8qgaabsSV6LNg2jvhX0Aimyd3gQw8HGekNErCiLGuEQ
         zRG/6saJ+fmDySPExrKuU63k+nj1BkwZ4a9wGlUiFJPG62Ztk33r1Q+z9NzvAzX6sYAv
         w+f4+ypdvZ7vHfOZAiF9Tf8ndreBLw6/9uBCzRP6kPoDxdkD2yYcN4vtOYw+rGFgqC1C
         TMmgt9ER0phU5eGoTrrYbEcyHDbjrOsLgB7A2+1UhCmEO3j/SFsTbwxFnaS2mW5kvSuc
         26eA==
X-Gm-Message-State: AOAM532ppA0XaR4kmK4dHJI7gBYF7gkesQ+HOWPnreo9s/cn7H9k7Qn+
        8/0KLopDSQ1M4iEylIT46hEWNknU
X-Google-Smtp-Source: ABdhPJzfuoollfUJBQodkdem8+zaZgFNp9Sjvwo/mwnxLWctN7kgefn2tMZLqCKPaR0J23sc1NR56Q==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr3616853wrv.242.1589440001554;
        Thu, 14 May 2020 00:06:41 -0700 (PDT)
Received: from [192.168.1.41] (2-108-107-206-static.dk.customer.tdc.net. [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id n9sm16957206wmj.5.2020.05.14.00.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 00:06:40 -0700 (PDT)
Message-ID: <d34fd178852f136db29560b3cfbaddf67d1a85a1.camel@gmail.com>
Subject: Re: Options for forcing dwc3 gadget to only accept superspeed
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     Sid Spry <sid@aeam.us>, Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Thu, 14 May 2020 09:06:39 +0200
In-Reply-To: <ba5a11fe-90a6-48c2-8da1-66076e52c6b4@www.fastmail.com>
References: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com>
         <20200512195231.GA26080@rowland.harvard.edu>
         <6d19d49dcfe7467556b0462b16e76677c1999875.camel@gmail.com>
         <e89456b5-20db-48c1-814b-075e84ca8b8b@www.fastmail.com>
         <ba5a11fe-90a6-48c2-8da1-66076e52c6b4@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On tir, 2020-05-12 at 23:47 -0500, Sid Spry wrote:
> Hello again, I'm terribly sorry for the double post. Claus, you might
> try detecting the speed of the connection and re-enumerating if
> necessary. It would avoid noncompliance with the spec and is probably
> the easiest option.
> 
> Unsure of how this would be done with a C manifestation of functionfs
> code but echoing "" to the UDC pseudofile under
> /sys/kernel/config/usb_gadget/${your_gadget} will allow you to set
> everything up again and reenumerate.
> 
> On Tue, May 12, 2020, at 11:43 PM, Sid Spry wrote:
> > Have you tried only providing a SS configuration? If that fails for
> > some reason I suspect the next course of action would be to see
> > why, and patch the driver so it does not.
> > 
> > Out of curiosity, which SoC are you using?
> > 

Hi Sid.

Thanks for both your replies. Will answer the last question first. It
is the Xilinx Zynq UltraScale+ MPSoC, also just known as ZynqMP.

I remember vaguely testing only SS configuration for an older kernel,
where it got a fault because somewhere the configurations was indexed
by [0], e.g. just indexing the full-speed descriptor directly. This
might changed by now.

Regarding just enumerating. I have thought about it, and it might be
what I end up implementing no matter what. The not so nice part is if
the host side is Windows, my impression from doing it like this, would
be that you get the "device appeared" / "device not safely removed"
style of messages. Can't remember the exact wording.

Just as a background in why I am looking into doing it like this. For
10 years ago I worked on some USB 3 devices. Here the USB2 part was a
hard-block, and the USB3 part was a soft-core in FPGA logic. I
encountered a number of, should we call it implementation differences,
in the USB 3 hosts. E.g. issues like when the device and host did not
agree on link training (Ux exit) etc.
As the link control of switching between the hard-block and the soft-
core was done in firmware, it was pretty easy for me to make an option
for being non-compliment and making the link retry Super-Speed, and by
that hide the "differences" for the end-user, and just have working
system.


Thanks
/Claus

