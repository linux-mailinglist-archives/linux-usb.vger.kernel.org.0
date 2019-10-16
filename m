Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C43F5D8792
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 06:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390891AbfJPEil (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 00:38:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41519 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390882AbfJPEik (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 00:38:40 -0400
Received: by mail-pf1-f194.google.com with SMTP id q7so13861293pfh.8
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 21:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TEmJUIlH2jD2Hlgn91LBPB5qmK2vw4hwdIx8gmW9FXQ=;
        b=i2zZ0VNrG8oXnila6h283esb1Vy+6KGN6/f4HAOzNF1SBfLeXZdvOnbtY+SmIUYpPT
         m1w/KSNyuXzQA4Ti1Rcj1Gj6sCVjS3K+qJTgNcbD6ALYcSnQUS8/bQSA4uU6QNafL+8B
         TiIBNy/bD2rcWyEIKHzENBFD0icIYzW3A8NKA0G5R/nOq1DtUS9rv7Or/CXJ/hiuazsP
         QlC7IAuS/h81CTjesyikx95BJVwlO1s3E9ZPIsn8Zjx935RNugHwtQoOT51xHlVRayih
         ZUR6RlIuVxfNSB6PqjY2ERWIbCIP1F7XWdAvwvCuUHRKvgY+LFKpULFiEjGTCubwMp7q
         XWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TEmJUIlH2jD2Hlgn91LBPB5qmK2vw4hwdIx8gmW9FXQ=;
        b=lLkSHiMJKBRl9C0phOW44+zAITB4yMOq75n7YZ6b8gQKzVGQjtuC9nD6loEsaPzq6f
         RpLR1/anTjUbUmzxzGDwHAa4CFbKnwileW1XPIjIq9HzyfVkAkOEfrx2O1rvIiSq1x1l
         ANm2wmNZEW9nk7Jh6KYMQcWqQtaznYbJJxHJvfITW3hxrAh2nYT2n+2v7RuCTciWwJCW
         60AP/ARrrLZ4O2dOZqzuIFn7+8tibMa+5zT2nQWd3qcYm0wN3QuluCJBDN4uwoSjpZmd
         0sPC1QUv6dihu+ZIDXB97wvnuz3CjvpbRnjUopzkY6m++RFEZV2niqWj/yScFwMuS8A3
         B2EA==
X-Gm-Message-State: APjAAAVLirlllIPdrh8M0bLUKO4OTY61Xy9GTFgOseC+fOlOWc10umBq
        G6x4JKFYqskG8atwqJcL/sc=
X-Google-Smtp-Source: APXvYqwPzqrDXrHVPoLEE+SE/6u10VSGYCQPsf3VF7biKoZaLOJ1ZiLYC6epdqOL94fT8tnajW2WbQ==
X-Received: by 2002:a63:c411:: with SMTP id h17mr42035273pgd.360.1571200719347;
        Tue, 15 Oct 2019 21:38:39 -0700 (PDT)
Received: from localhost ([175.223.45.21])
        by smtp.gmail.com with ESMTPSA id r28sm32253697pfg.62.2019.10.15.21.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 21:38:38 -0700 (PDT)
Date:   Wed, 16 Oct 2019 13:38:25 +0900
From:   GwanYeong Kim <gy741.kim@gmail.com>
To:     shuah <shuah@kernel.org>
Cc:     valentina.manea.m@gmail.com, gregkh@linuxfoundation.org,
        allison@lohutok.net, opensource@jilayne.com,
        changcheng.liu@intel.com, tglx@linutronix.de,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbip: tools: Fix read_usb_vudc_device() error path
 handling
Message-ID: <20191016133825.00006e29@gmail.com>
In-Reply-To: <bb2bef23-336a-2f28-8faa-00e4adbb76d9@kernel.org>
References: <20191015131437.525-1-gy741.kim@gmail.com>
        <bb2bef23-336a-2f28-8faa-00e4adbb76d9@kernel.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 15 Oct 2019 17:14:32 -0600
shuah <shuah@kernel.org> wrote:

> On 10/15/19 7:14 AM, GwanYeong Kim wrote:
> > cannot be less than 0 - fread() returns 0 on error.
> > 
> > Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
> > ---
> >   tools/usb/usbip/libsrc/usbip_device_driver.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c
> > b/tools/usb/usbip/libsrc/usbip_device_driver.c index
> > 051d7d3f443b..49760b98aabc 100644 ---
> > a/tools/usb/usbip/libsrc/usbip_device_driver.c +++
> > b/tools/usb/usbip/libsrc/usbip_device_driver.c @@ -79,7 +79,7 @@
> > int read_usb_vudc_device(struct udev_device *sdev, struct
> > usbip_usb_device *dev) if (!fd) return -1;
> >   	ret = fread((char *) &descr, sizeof(descr), 1, fd);
> > -	if (ret < 0) > +	if (ret != sizeof(descr))
> 
> Are you sure this check is correct? fread() returns the number
> of elements read, # elements = 1  in this case.

Thank you for pointing this out.
Sorry for my mistake.

> fread() returns 0 when size or # of elements is 0 and in other
> error cases it will return < # of elements. I would think you
> want to check ret != 1 here.

You're right.
This should be changed to "ret != 1".

Should I send a new patch?

Regards,
GwanYeong Kim
