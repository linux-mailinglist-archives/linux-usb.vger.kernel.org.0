Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95EF3D46FD
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 11:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbhGXJOT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Jul 2021 05:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbhGXJOP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Jul 2021 05:14:15 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C19C061575
        for <linux-usb@vger.kernel.org>; Sat, 24 Jul 2021 02:54:46 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id j2so3911549edp.11
        for <linux-usb@vger.kernel.org>; Sat, 24 Jul 2021 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:reply-to:mime-version
         :content-disposition;
        bh=5SF6ffPVXWlWzAbzEEF2HWw7XmcOlkCzKsKc5tkDpcg=;
        b=cs6/RuSJvFo/wqLosire+b5yxVOGnpbjzE5r0wvsOIGxerDjaFda2l6PcbEbcdfBUn
         X3WsD0q27Kk4RXnmTc6Qon/v5svtCRx+hovAl9rHYINOu961DEUGeM1/u37Kl0ezLvRG
         hVcG9Hoz+hLFv3XjGCQCzDOxQ1PpaqpniqDObvYgJv6YoM++aGGvlg3zO1LML7iCV1Dz
         UafqdotDwRZ+wnHBDDGmDkqb1as53A4B7y18lj+kkM3asRPWO+MfCAzieq+4JL4JgdME
         rCq3to82Mz1KYdRb+PEdODDeMyz0W1n9vPt5BT43RSUkeUkRNpjFr5SBRoYTMC4fSuSX
         ZpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:reply-to
         :mime-version:content-disposition;
        bh=5SF6ffPVXWlWzAbzEEF2HWw7XmcOlkCzKsKc5tkDpcg=;
        b=HLWcvhCD3XedAi9CCXzdvkni5WjS+G9VxTK/cNEEyIK5BwuRcjEQl3KEUsFNNRSYEs
         vxiEsq8uKkGCfoSHTXjcN0fmkvZRmoOeKo71xvI5DJwtLH0FAZQaDTrMV53us2o5l2IB
         O9S8Lv6STyZdL8gFrpRJLbaYM93Oat+10vXWA+LdjgfFUaxiRSiiasBj7b1G0tIBPN64
         68d9ASKqBRsLMm5vnGCgx819+/k6BpVbgToaXC6uPEn0NPUQ+rHKBSgm0rw2VEk5p8hL
         wpVEpkIESEKOJX95+TR4n1dJx06vLH4rjymNkUIePAgXW3EIocT5No8KNAdXYveyXzs1
         mfAQ==
X-Gm-Message-State: AOAM533t5kVCt1WlKwcnSLnMoPxAra3lAFlcSPCzgxllSc/gLceqkm2n
        dmp3LuM5q+lXLQ2XVf/vO33h+mhT6tHp+A==
X-Google-Smtp-Source: ABdhPJw9MQgFTHeYRpVsZfodQoUa44zqixOut3zmi6YoD1tF+ZKrmFXYB0flrDBcrHiwhGtzmIi+sA==
X-Received: by 2002:aa7:cd49:: with SMTP id v9mr7558173edw.185.1627120483929;
        Sat, 24 Jul 2021 02:54:43 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id q8sm12314677edv.95.2021.07.24.02.54.43
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 02:54:43 -0700 (PDT)
Date:   Sat, 24 Jul 2021 11:54:40 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-usb@vger.kernel.org
Subject: Mainlining Linux Sunxi SoC AW USB
Message-ID: <YPvjYIsu0G0HSu5I@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'd like to cleanup and mainline Linux Sunxi SoC AW USB host driver [1].

What are the most ugly parts which should be replaced? Loading module does not
complain about anything?
[267044.912155] awusb: loading out-of-tree module taints kernel.
[267044.912257] awusb: module verification failed: signature and/or required key missing - tainting kernel
[267044.913399] usbcore: registered new interface driver allwinner
[267044.913401] awusb: v0.5:AW USB driver

BTW should it go to the host/Kconfig or misc/Kconfig or elsewhere?

Thanks for info.

Kind regards,
Petr

[1] https://github.com/linux-sunxi/sunxi-livesuite/blob/master/awusb/awusb.c
