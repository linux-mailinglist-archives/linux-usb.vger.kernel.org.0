Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF3C460A32
	for <lists+linux-usb@lfdr.de>; Sun, 28 Nov 2021 22:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358713AbhK1VQD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Nov 2021 16:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358940AbhK1VOD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Nov 2021 16:14:03 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CB4C061748
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:10:46 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id t26so39216815lfk.9
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=s4rAUXO3TemE6KOXz8OM8lJk208SqDaUUDj4tcQMfJI=;
        b=EZrIc3tqjGNMetK+XtuPBXUTIZNgBG47s8473bXlwg9aohmYR8GAOKksGHG/WzWTUt
         GSC1sHfrANuP+ZOej2Nn7uwf/NZ5Zk9zVpN9SqokVfSiWTcxM8n/Bpi8402Eg/kSpFWN
         Dd/CtY2fp3nKXP5qc+UKTayBTzoxOhlg4qj6UnVBV6zkMcXaZIC1aUm1d9e+9AdwKTAi
         hResrrthNKThxYyAJLHTLPociFOPPQIMRPeIS3duQcVWfg+WGotJJyI96u5ZRTMCtHXp
         1h+dUShwlDlsYZXxaNBzInOpUc97FWZGmAZ+ELalkum9jMWAKFjDG/WvussGU4qrrVbX
         GrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=s4rAUXO3TemE6KOXz8OM8lJk208SqDaUUDj4tcQMfJI=;
        b=Xc3Zfwr/I9pE4AgLn5sy/kSPsKF0ImrpHpx3Xno/8BEFBQfZDSIAE9503AClzZWPVe
         6ARRi5hsyIvtEuGsokWYdSZtwAx1zFIr4nzLjvPWYJnXON9ZH/CmK0NhXtVEEPo9yttX
         vjUtO5eiYnHZ8HoEYfdOe7kTZEQ95iGq72j9wOu6uu/NTpdNU+wRsgPYM6nf1QY6ffi7
         DPeK0emng1RYLX/d2RANkJTjbdCYwbGJzsdxCYpdzjgHNoYUAtA1WLtJmUIYgiTZEgAa
         4vZ5IX+wpN0mdVhGoQVGyGZQxICtNpXJ1Z8YNNWlvga1I8Dm4uwmdJel01EmGyw1ktwK
         MhkQ==
X-Gm-Message-State: AOAM533EB1webNy2emSCAR0WjWk2XNZn7hcrVU832AhAlFxpWQkSO3yn
        RHYggMvvYbM0SqXxCnMZZwcdW9+CP5w=
X-Google-Smtp-Source: ABdhPJzH8ZFlaz70TtKw+BuUY237QqbJVa7fNSTXXX+T4wyKXXKJ0qEGqakW8qYO6WIn82ag4nUiUA==
X-Received: by 2002:a05:6512:308b:: with SMTP id z11mr41240163lfd.177.1638133844804;
        Sun, 28 Nov 2021 13:10:44 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id f10sm1103607lfg.211.2021.11.28.13.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:10:44 -0800 (PST)
Date:   Sun, 28 Nov 2021 22:10:42 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v5 0/5] tools/usbip: Patch set summary
Message-ID: <20211128211042.GA36878@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To forward a remote usb device over usbip the following steps is required:

1. Execute "usbip bind" on remote end.
2. Execute "usbip attach" on local end.

These steps must be perfomed in above order and after usb device is plugged in.
If the usb device is unplugged on the remote end the steps above needs to be
performed again to establish the connection. This patch set implements a feature
to persistently forward devices on a given bus. When using flag "-p|--persistent"
on remot end, the USB device becomes exported when plugged in. When using flag
"-p|--persistent" on local end, the USB device becomes imported when available
on remote end. Thus it is only required to run the usbip command once on each
end, in any order, to persistently forward usb devices on a given bus.

This is sent in five separate patches:
  tools/usbip: update documentation
  tools/usbip: update manual pages
  tools/usbip: add usb event monitor into libusbip
  tools/usbip: export USB devices on a given bus persistently
  tools/usbip: import USB devices on a given bus persistently
