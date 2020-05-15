Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD9C1D5B38
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 23:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgEOVKl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 17:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgEOVKk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 17:10:40 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856E2C061A0C
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 14:10:40 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u6so3723284ljl.6
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=gNsI3kkvnZIE5UOi9tNZk4SYwm9WtTwV6xlGot6pw7A=;
        b=auWMIwyWZPEYo4K4DbjAKwShCk6c6YLdrCGb8SSuqBWIVr9DYCmpy4kKQDhwTQXrB9
         F613Xyv1LHyG6NRL5QgAO3kdtRNpHwPgM2d3DZEjfMm0OQ0j/k8yQvzupVnpb8+1MTue
         zDW1SuwHMXXaRMfSQGHze5ALx4wJvbBV3krXCP3HB/qJdsLQ3XMWcZl+M7jajosqx0N4
         fFBgEFWpjy/8m+V2FC/qun2Evk2MO61TAW5I1Y4JoQBL5+NYqpoUWrO9DRHuAnAdgDIw
         K/bNIuzbUP97ovihWx1NFyEdzCEcSaKttacA26LHLmUSVdfeQEZKXaTsQKjcbFuzhUN6
         iAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=gNsI3kkvnZIE5UOi9tNZk4SYwm9WtTwV6xlGot6pw7A=;
        b=AhVtQKKO5dt0MFMy9g/+ejOkzh9KUsDaaK5zOPCcetkz6e5u56iBfrQmrd+1Euv0Px
         8EuBqaVMc5aTKFCXgfW7F95bV8XIXA8IVwwUqxH2iKn1EDOMtfsIpIwwUkFB3E7RBKwH
         cDDhTFwui+z1cylMNzZMP49hZewSWjY7RX998k0BkOiClRaWacIN97s+7hdfoqtT8usl
         ds4h8EgkcWMYDPdbywbI/60R3n4mazxAcjC2C91K1gSv2ZbD2UNGYzLl/SvZCvwfynat
         1+OxaTWpQtX8CX2U9jxou4Vm033G0ObkjkvbJRetxDq/VQWVd2MFBaz2U1YZJT2/erUR
         30zg==
X-Gm-Message-State: AOAM5320ZMk20BiiSf9Of2AS0VuZwAQ24QDd/X9gZdE6d/BQRLlWxXfh
        opGfXD85smgHZue0z3pkLsUgJgWbyHk4Kqgv9N0=
X-Google-Smtp-Source: ABdhPJz6Sw9tif5y2n+kQWj7kr4LllGDjpR76WvrsJlpQi3mHssRr/+v9Xspty+a6N8S9JP2MBMOuhPSgc5EWxtZ/M8=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr3377605ljg.269.1589577038930;
 Fri, 15 May 2020 14:10:38 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 15 May 2020 18:11:54 -0300
Message-ID: <CAOMZO5C1jm4Nr4uTvn14sRqe3mb1Li-iTJ4EhZSBju-x1pzyXg@mail.gmail.com>
Subject: usbmisc_imx: charger detection errors
To:     Li Jun <jun.li@nxp.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Li Jun,

Since commit 746f316b753a ("usb: chipidea: introduce imx7d USB charger
detection") in linux-next, the following error log is seen on a
imx7s-warp board:

[    4.919845] usbmisc_imx 30b10200.usbmisc: vbus is error
[    4.925173] usbmisc_imx 30b10200.usbmisc: Error occurs during detection: -22

What is the proper way to address this?

Thanks,

Fabio Estevam
