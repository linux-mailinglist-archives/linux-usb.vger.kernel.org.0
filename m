Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E92422B89B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 23:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgGWV1r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 17:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgGWV1r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 17:27:47 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41046C0619D3
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2020 14:27:47 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id h18so3257029qvl.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2020 14:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=XiCjkR09sKAEMofGP9deaD2zxVAtX12ktYZe2NOY5SA=;
        b=PE2dFBg9X8QiqJt+7BqdUVIGQYd1tPqX2idZkMu8xX1xPeEXenllCTADGA/4BmIe0E
         j8d6pyK8iZ/NR+jHhpbv4gPKk7Gl8NDlXnjh0zkLPBorwIAzFF3+sVAR5S6oHHYAy5UR
         39SO+mS0aJYwBlW82ZOVD88WsCJSJEj6W6Jl4tA1YkeQb9NV4k91nydo5LVyE41NDGpH
         LoC9p1ml1xfuzosab/C0u75mPcZ6E3v9sVRSnnES27qqm8IB7289haPm0b3YsOyvs1QB
         HxFSWfuEG/hf4E/St3djMCesdSXWaegKsaPfojMXsHu9rCIGsbyAG6mofIXuYjt3ZW1+
         sh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=XiCjkR09sKAEMofGP9deaD2zxVAtX12ktYZe2NOY5SA=;
        b=VbfLcvK1A6ieDURKOTjbtA0qpM4tfA01jqF5JM9EZfQNunb+QOvD+66ZynutqQjcFJ
         f37gOfIQiApptWDa9wzTqOqtzu1yeXOCy5/dSl40tlH/K9AuQhV8O9MsVwLFSqVwDtxt
         fbQPDDpbo/1LAVfGjOPKauXfUvJwJv/z/JoaXzv+rmEhgp5j8vCq0pt7A0H3AQ5LPeT1
         HYTMFyBtnSxnFl7DaXk81bj+2ZsH43P+rDLICCjyhW0JVQA05BfzeO+zNhL3GRXBBW69
         z7cxHmzsArL02VF+IC5XDhKNCf/U/cPPNbaJ2Ol6Ry5YRn5jPJ57QoJVoSLus/bnCMJi
         XMGA==
X-Gm-Message-State: AOAM533g0+sIuSBXICPH5mH9LL2k+19tlD95kddPjw3hIxcGnQ0AjSKo
        ygwD9om+oOrgWutgh0OmsYctj6sSxdk=
X-Google-Smtp-Source: ABdhPJwYJ3h/bWMDOKeV+A/f2DvejuzN6PZPaD6505NZdxD5lVfoTXkOB5eufPRA/mIeR/fmt+MNVQ==
X-Received: by 2002:ad4:4869:: with SMTP id u9mr6707342qvy.98.1595539666436;
        Thu, 23 Jul 2020 14:27:46 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id c22sm4000386qke.2.2020.07.23.14.27.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2020 14:27:45 -0700 (PDT)
Date:   Thu, 23 Jul 2020 17:27:43 -0400
From:   Trevor Woerner <twoerner@gmail.com>
To:     alexandre.belloni@bootlin.com, jamesg@zaltys.org
Cc:     linux-usb@vger.kernel.org
Subject: lpc32xx and stotg04
Message-ID: <20200723212743.GA11107@linux-uys3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alexandre and James,

I too am working with a board that uses the lpc32xx SoC (the lpc3240, to be
specific) and has a stotg04 for the USB transceiver instead of the isp1301.

I can't get the USB to work.

My guess is that I don't have the device tree correct.

I could embarrass myself by showing you what combinations I've tried but I
thought maybe I'd ask and see if either of you could provide a DT snippet
describing how to hook up the stotg04 to the i2cusb. Admittedly I'm quite
fuzzy when it comes to device trees.

I'm also a bit fuzzy on USB. I want to plug usb sticks into my device (which,
by my understanding, is the opposite of OTG). So additionally I want to enable
ohci and not usbd?

In one DT incantation (the one showing the most promise so far) on startup
'lsusb' shows two usb devices. The moment I plug a USB drive into my device I
get:

	[  433.268009] usb-ohci 31020000.ohci: controller won't resume
	[  433.273603] usb-ohci 31020000.ohci: HC died; cleaning up
	[  433.280566] usb 1-1: USB disconnect, device number 2

And afterwards only one device is listed by 'lsusb'.

Currently I'm using a 5.0 kernel and a 5.4 kernel, but I could use any kernel
(upstream, ideally). In either case, it doesn't seem possible to deselect the
isp1301 from the kernel config? It gets selected automatically. If I'm using
the stotg04 instead of the isp1301, do I need a way to turn off the isp1301?

Best regards,
	Trevor
