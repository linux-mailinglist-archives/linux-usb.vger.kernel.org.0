Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F088F2C627F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 11:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgK0KFg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 05:05:36 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46674 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbgK0KFf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Nov 2020 05:05:35 -0500
Received: by mail-lj1-f193.google.com with SMTP id f24so5276802ljk.13
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2020 02:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OdwtOJRn2IUqyWPSW4vxCiuFOeYaizpMoO1kqgrIRqE=;
        b=CSwBuE2BL2YKbG4IDmUftSgplziJQuKnr1a5Dwd/A0yuswfvqQDxg2gkwE/zOvRRdn
         k8To2PYC3x208WeYqcvp05HNTMat91T1HoYuKo4qld8/Z48q1U4LElJSMXIJU9/XV+f7
         Nb2mKOl+U5JLBKygKi88itAX8StG8NijoYG+2L47ddVS+oiOaWE6rsDUmWmwATSfNwVX
         81UkXWvVa7Xy+GDV5lTqzZYZtRs9/xqsmSOqWsTkaiG+835tKo9RsL3QEIpFpXgPgARj
         xEeioOfsjfvA1NxqFGBoL8gtokVLj89wmoC/t3zqc7iMh8xcnuIch0Lh4iJLn2+trShK
         WnzQ==
X-Gm-Message-State: AOAM530Q+U9hTHNfPAxoV/sKzXr4TZtgOz00oVzxCCeF2HbnzZ3ZPjuA
        Hqc21PJw4uKOwrGLpEaIeW0=
X-Google-Smtp-Source: ABdhPJxfoitGHr7LZC/qZf0rh6UiOubYMhgLyELAuanuSrWArE7q3lH2ZUqimX+OVvdk3PKWvmEpXA==
X-Received: by 2002:a05:651c:1214:: with SMTP id i20mr2881016lja.324.1606471533601;
        Fri, 27 Nov 2020 02:05:33 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a11sm904357ljp.21.2020.11.27.02.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 02:05:32 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kiadV-0006KA-Hm; Fri, 27 Nov 2020 11:05:53 +0100
Date:   Fri, 27 Nov 2020 11:05:53 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Giacinto Cifelli <gciofono@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] USB: serial: option: add support for Thales Cinterion
 EXS82 option port
Message-ID: <X8DPgRn3wN+aRlED@localhost>
References: <20201125145304.10385-1-gciofono@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125145304.10385-1-gciofono@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 25, 2020 at 03:53:04PM +0100, Giacinto Cifelli wrote:
> There is a single option port in this modem, and it is used as debug port
> 
> lsusb -v for this device:

> Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>
> ---
> 
> Notes:
>     changelog:
>     v2: removed extra .driver_info, unneeded for this patch:
>             .driver_info = RSVD(1) | RSVD(2) | RSVD(3)
>         renamed the device in the commit name
>     v3: renamed the commit to follow current conventions
>         included a short changelog and patch versioning
>         new device define re-ordered by PID
>         new device entry re-ordered alphabetically

Thanks, now applied for 5.10 with a stable tag.

Johan
