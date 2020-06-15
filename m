Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695C41F9FD0
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 20:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731407AbgFOS6b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 14:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731388AbgFOS60 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Jun 2020 14:58:26 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED079C08C5C6
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2020 11:58:24 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id c12so16750304qkk.13
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2020 11:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ogzWVexVKpi+yf06GApbiQKLooA3A6vya/Qu53dz5sI=;
        b=B79KaIJ0c/ww8HMtAlyFH2XjxV7yynKBJIWwJHZ+zW3YLHuCCz9Bbiwsd2WzFuQLPj
         AFf5Hg0Lqd/XvxHRpc9Uh/4vnlvXaITDgihFpq8wunarv4UVftdSwWHlY7Zs6O9gurGh
         IE5GaopbWKe7DlaPUx/EPeh0He+mTIL/wqUz367myp2ljsairUj+5vVlWMjYvyLYdFxp
         yylSrzx5rdvX7s5Lrdyjcy+vzWB+YunSNoTcuzE3AgfFM4I5Skeao2I26rxVl1af8CRx
         y19r67M7mx7zcJG+Kyz2nHe2SegGgVU7ADSwtl1Rh91OJTnONTAEuipSUQQypIEpgb9A
         T36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ogzWVexVKpi+yf06GApbiQKLooA3A6vya/Qu53dz5sI=;
        b=nFVDsk2AAP0e/ostoyRue9ln3AZG0mHlAv9jQkxzSoXIeyfaPvJY5OvM7ULH1EfxBl
         WLtoYGZnIMce/akLTyAYaXJNTbUPG+QLbk8R9F4bXSx9pXKJsEe9Z5fBMx3oXsPXS1WO
         DymCEEJaUrvNJESvgVcMFpq931xPQWL9uSPXP47RoAd5rBxrXr7dRJNFZ4gknCCQpynN
         V9zluYtzVLtdhUXkftxMb5m3cIgPINChqPmdpKz5lmh5Xq7nAZWzg21AvvsViEnXIPU3
         nDiMDrNqi9daveZyzoM0U1hP9C8Z9rwtA7KG5DxiZbaCN+UoboJCKlOiwat3NP6dKQQO
         FsFA==
X-Gm-Message-State: AOAM532mNGI8aLdBsxtR33wj6rQZ0Wo7g474RVqyAvJ+Wd9qixJP03ZZ
        DeENsGWv7irJr/iCkwwQSZl8Eg==
X-Google-Smtp-Source: ABdhPJygSobk4Dm93WtmDBaO2t3cPn7PZD+tDnBnapk86ninzx0O9WOhG6qnekVgX9A+5fj3vrdD7Q==
X-Received: by 2002:a37:812:: with SMTP id 18mr17402635qki.296.1592247503264;
        Mon, 15 Jun 2020 11:58:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id m13sm13228785qta.90.2020.06.15.11.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 11:58:22 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93)
        (envelope-from <jgg@ziepe.ca>)
        id 1jkuJK-008kGo-AN; Mon, 15 Jun 2020 15:58:22 -0300
Date:   Mon, 15 Jun 2020 15:58:22 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-input@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux-mm@kvack.org
Subject: Re: [PATCH 00/17] spelling.txt: /decriptors/descriptors/
Message-ID: <20200615185822.GA2084429@ziepe.ca>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 09, 2020 at 01:45:53PM +0100, Kieran Bingham wrote:
> I wouldn't normally go through spelling fixes, but I caught sight of
> this typo twice, and then foolishly grepped the tree for it, and saw how
> pervasive it was.
> 
> so here I am ... fixing a typo globally... but with an addition in
> scripts/spelling.txt so it shouldn't re-appear ;-)
> 
> Cc: linux-arm-kernel@lists.infradead.org (moderated list:TI DAVINCI MACHINE SUPPORT)
> Cc: linux-kernel@vger.kernel.org (open list)
> Cc: linux-pm@vger.kernel.org (open list:DEVICE FREQUENCY EVENT (DEVFREQ-EVENT))
> Cc: linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM)
> Cc: dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
> Cc: linux-rdma@vger.kernel.org (open list:HFI1 DRIVER)
> Cc: linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...)
> Cc: linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
> Cc: netdev@vger.kernel.org (open list:NETWORKING DRIVERS)
> Cc: ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER)
> Cc: linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS))
> Cc: linux-scsi@vger.kernel.org (open list:IBM Power Virtual FC Device Drivers)
> Cc: linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT))
> Cc: linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
> Cc: virtualization@lists.linux-foundation.org (open list:VIRTIO CORE AND NET DRIVERS)
> Cc: linux-mm@kvack.org (open list:MEMORY MANAGEMENT)
> 
> 
> Kieran Bingham (17):
>   arch: arm: mach-davinci: Fix trivial spelling
>   drivers: infiniband: Fix trivial spelling
>   drivers: infiniband: Fix trivial spelling

I took these two RDMA patches and merged them, thanks

Jason
