Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7624C27A15C
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 16:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgI0OOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 10:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgI0OOw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 10:14:52 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53A6C0613CE
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 07:14:51 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id y6so1962629plt.9
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=iuh9XaK9/401tqBgf0N/B0toq11uZ4nl4T4WKndc3a0=;
        b=C9zHUnE/cFmqqjGwgBOAOrg4vFMrXKumNVEL7x3afA6ce9Ia51MCd5Z3qqODBNvRdF
         U+EJNAVLIUolQivLBTYiK/rP+w3UxcYWFyYd095wk48v0NiOEhf48xXJjLb+5rJCh3r4
         ZRxLFJ4Og7TcIw10SkvRL9dGgfY6C9JnjTaPbgV+J7XktOEFatwPtOHAWEnc7iucQgaz
         RJxs1aY5ydwCeMKVYwVKDHmoEVtllHlGz4bn44wiNc9kzTGd2URwQGP+XLjsnagPFchI
         FXgDtB8KMCS3yygH945IS1Is7jt5cCfuS7l6oUzZwgOA/av9kfc6v7J40eoIo9nMdvHZ
         ALog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=iuh9XaK9/401tqBgf0N/B0toq11uZ4nl4T4WKndc3a0=;
        b=QA8gSomu6hHoH/wlnqx+abKmi4aGwKhBYmDycqm6lHves3FLAq9Q54h7M0F4Ir2vcF
         uiputMIKm1tBLhWwItcBIuz9dvqbW835kk96K0iFUU1beNfuQnyyTiF3RyQKrZJr7xCm
         9dBx+DRJ8FVuYpJfM8ru3HEF6hjo6ghfRKwA0otysxmugYC9r3+O4k78PBBS6Wpjk9pH
         ibe14BbqBKiLZNjt1HcyanWpOTtqDerUW8Su5OkTsSoID7wXkHx6jjepdGf2L6EdN2oz
         cKZBobV4FQCTFPk3E8W2Pe2rLnVPRjfHlx6NAjGhYWKC5J/i0CVaywiykglvH5J+92f3
         xKwA==
X-Gm-Message-State: AOAM530ND9cLRL0n5jbMdArDb5BrsH7uGQ68RCiOxvvmuHviHNGXRY0/
        z5iPRLrGB68icCQWx+J3N5QU2qPL/cbkK6QALFVlK2hrhsM=
X-Google-Smtp-Source: ABdhPJy/OLtezbDTSLyisCkVwfYqrLDiPZ09Gy2TpKFFvYrZBLrSLsHHkz+0eqHiw2wOjl29Ti6hePWjtAImGlbn8JU=
X-Received: by 2002:a17:902:784d:b029:d1:e7cf:83e6 with SMTP id
 e13-20020a170902784db02900d1e7cf83e6mr7248033pln.63.1601216090832; Sun, 27
 Sep 2020 07:14:50 -0700 (PDT)
MIME-Version: 1.0
From:   Kiran <kiranmkota@gmail.com>
Date:   Sun, 27 Sep 2020 07:14:39 -0700
Message-ID: <CAAn0qaXmysJ9vx3ZEMkViv_B19ju-_ExN8Yn_uSefxpjS6g4Lw@mail.gmail.com>
Subject: /net/usb/ipheth.c incompatibility with Apple iOS 14
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Effect on end user: when a linux machine is connected via USB to an
iPhone that has been updated to iOS 14 and has personal hotspot mode
turned on, the user cannot connect to the internet.

Troubleshooting: DNS works, the linux machine can ping the iPhone
gateway, pinging google.com hangs. It appears that there is a change
to the USB packets that iOS expects.

Here is a link to what I think is the most relevant part of a Github
issue discussion with more specific details:

https://github.com/libimobiledevice/libimobiledevice/issues/1038#issuecomment-699630379

This is my first linux bug report and I'm not familiar with kernel
development. The other people in the Github post will be better to
talk to regarding a fix. But if I can provide more info, just let me
know.

Thanks,

Kiran
