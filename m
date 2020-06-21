Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6222029D7
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 11:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729626AbgFUJjk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jun 2020 05:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFUJjk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jun 2020 05:39:40 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B53C061794
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2020 02:39:39 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id q19so16087070lji.2
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2020 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=C5bI6BadwEG4F91VxXf6a9mhksTwdAZCArE0TuvJz/0=;
        b=c9E+vrFwQBgugOOclNk/Cqneke3HXKwIEHPNfSFsBd6SETE+nmPyCYM9EJ7RFFVliI
         HCLHGclA1s5Y1mr4jMV/TAr85rK5gi5uvbeQO2JLzGSjg6B/ETvjPOin4cTJg9pjOgZc
         1e3X1glLylDwirIU7DdzgWe0TA0NcNTEUeYUJ2FdJLTwpIqJ0C/jQmjp/Y96Sv9dpKdu
         SKYS7NCRHUUASFKnbAspoSLWT/W8+YqCaP1QG0dhxMoWZ/zN58t1Juk+hl/T6tSajvJC
         wv4uhJPFe2OpupmlTkLOY2XhelpVKHaIPwr35ufltImsCQcye2K2/TSsu/0OueYxwmv+
         2+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=C5bI6BadwEG4F91VxXf6a9mhksTwdAZCArE0TuvJz/0=;
        b=VCJIspVkUjflkuuuT89wxw+8KfbQDihc0QxSNZNFLxkXc4fxZmXCBXOYf7ZH6j9tiJ
         btKycoXbIeROD9ELEbm32TpuiIaZEfe/IxtpzlKfFbiNkONnz36RVjFszhheE2pHo0jp
         /0a6EQ3tn11uSh8h5N39OWlA9+EYqGgN3xv7eop2IyHXiCrNZ+Q1UnGAIm1qzhaYnPUK
         Neu1RTqUcQazj5D6JPXjyjNW9slxI89yG9OFgnKuw9Ye1wrI2SVMz54GMnElR2Pef96e
         gnsIEntxDXhZVgLlo2BX2WNbD97E9T79n/kTeD453x9Z345whT9pNtpuzDi3kqYTF/gx
         kViw==
X-Gm-Message-State: AOAM533wof21f13EhY0c9ImhKxcMYlUEiYzcGXIOga5GHfmHCBkw1Pp9
        uYwMTTXN1aCqVhPGFhOu20c+Z8ZzSvLxj6CxO9+D3SiqGjA=
X-Google-Smtp-Source: ABdhPJye+NAa2Hs/8HSWE3iwJc0pzkq0znXE7ovpjawQUte1ypkRIlOo8kxkxHn2CzEMS2UgqinRg/xAjKXP3gpDbSo=
X-Received: by 2002:a05:651c:1181:: with SMTP id w1mr5614810ljo.432.1592732378167;
 Sun, 21 Jun 2020 02:39:38 -0700 (PDT)
MIME-Version: 1.0
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sun, 21 Jun 2020 11:39:27 +0200
Message-ID: <CACtzdJ2Yu_sHtJpWQ8UtF-yVEp5ON_vTWzaL72TJxW96MydVdQ@mail.gmail.com>
Subject: kernel driver for USB liquid cooler controls
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello USB mailing list,

There are all-in-one liquid coolers for your CPU (like the corsair
h100i), these are populair among gamers and high-end desktop
enthusiasts for cooling their CPU. Under windows these have
proprietary software that control the fan speed, pump speed and most
importantly (for gamers) the RGB led controls.
Under linux there is software that manages to control these devices by
talking to the device via USB. But this doesn't allow for the fans to
be controlled via generic fan control under linux.
As a hobby project I started to implement some of the features from
one of these user-space drivers as a kernel module.
Some features would have to be device specific like RGB controls, but
fan and pump speed could be controlled just like system fans.
I was wondering if there would be any interest in having a driver for
these all-in-one usb controlled coolers in the linux kernel itself?

Thanks

Jaap Aarts
