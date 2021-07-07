Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51CE13BE3A1
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 09:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhGGHhY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 03:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbhGGHhV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jul 2021 03:37:21 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F97FC06175F
        for <linux-usb@vger.kernel.org>; Wed,  7 Jul 2021 00:34:42 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id g3so1369408ilq.10
        for <linux-usb@vger.kernel.org>; Wed, 07 Jul 2021 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=cUBHpK4dPdFwmOCTay6nol97uvUmFvxjVxg2/LGiyS4=;
        b=pYfsQZTzbn7V0k5a28weiTXpPzJ2et01zp77vyyFdD+CtnCn6RdZDq0Wgkahjoqr+U
         PKN/vDzGPHwENQD/h6dWRgULiDQXRk/Ghgqk9ulfuxuETsYMBjsLLK2g5Z3JnjjRBDF5
         f4qyUcdyhfZn1q6Ef7DhBbR6O0y4DdBh3FyoqwdzOh+Y+HpQdy7HvSxIYSTqDXb3eBIm
         ZXGWDVhD+1vsc9f62cuAGjEO9gJ8RX/vGBwksKM6LoW3TsCzzg0410CaYfBpGzAfNGOX
         tPJ/2yIsb5mf6IYeULhBNbp/ie6SiizCfabUX+ITlmVVsa78dbaMw3da1A5lnGCDOyDV
         Jp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=cUBHpK4dPdFwmOCTay6nol97uvUmFvxjVxg2/LGiyS4=;
        b=Q0+bQgoeFPqfo32IHd00dXgXdeS38QT6Jxf2gU7DC444bm6rWyyUXsYByo6zCD2vql
         7wbiHRCZ4mgHGKW6e4X43yBG0y41fSuKHmZ4XXMZvr21Os66o455lbXFvdE4W70bJ23K
         7raw6bDJD1467kxBBynq6PsZrd6M1uMw5I0wSA39D5umhmQKpTDn4D2SuwZGZlv4HL30
         ya0ovMBUgkvfICM5+BnZtO1MGc6wd1DizfArWZF2uFGZiVi48Jraj85t5SjxfRs5T04O
         6pDQflgBZhacu9PkJzvJnOgDifXNZzJ50Ol/OB34L+JWDY/xbjiRRuAGyCqnRnmyEJTV
         fM7A==
X-Gm-Message-State: AOAM531z7uLNhm6pbj4mEs08JmPSfU0EuLEDMp92oVN2saYt932JD1C0
        vHZogZH6MG0s5cjZRItJMHPQZAT2JSozIaJsBOkjI4O8XDY=
X-Google-Smtp-Source: ABdhPJyX6VqxcDdPr7BBg2jHI6rybMvGuuxuTPsKf/bKEIqqrXR94qFQnpoi0ihIHUgLUwFz1W1g9njigXFxEijis6g=
X-Received: by 2002:a05:6e02:1041:: with SMTP id p1mr17759271ilj.238.1625643281541;
 Wed, 07 Jul 2021 00:34:41 -0700 (PDT)
MIME-Version: 1.0
Reply-To: noloader@gmail.com
From:   Jeffrey Walton <noloader@gmail.com>
Date:   Wed, 7 Jul 2021 03:33:52 -0400
Message-ID: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
Subject: CH341 driver and the 5.4 kernel
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Everyone,

I'm trying to track down the cause of some garbage in a response when
using an ELM327 (https://www.elmelectronics.com/ic/elm327/) with a
CH341 serial controller.

I see there's been a fair amount of activity with the CH341
(https://github.com/torvalds/linux/commits/master/drivers/usb/serial/ch341.c),
but I can't tell if its been backported to the 5.4 kernel.
Specifically, the 5.4.0-77 kernel supplied with Ubuntu 18.04 and Mint
20.1.

Does anyone know if the fixes and improvements for the CH341 have made
their way into the 5.4 kernel?

Thanks in advance.

Jeff
