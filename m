Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA54381B1D
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 22:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbhEOUxm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 16:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234955AbhEOUxk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 May 2021 16:53:40 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDA4C061573
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 13:52:26 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id h20so1177169plr.4
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=97EDKjjzVEoZezos4HeoOg4ySj+rsLjABbKn+kDU81s=;
        b=I4yQYjjIYU0sZ9tt1s5lu9+vacYQOqx2KBWQr9XStUgkannC26yYys8QJlWf1DMfL7
         RKDLxkewNgOxxjwdGfnrybIGGbrQSbUKbgn6uv+mb6saXvnd7fgYYermNAssySkKlDgv
         21gGIYverPMu0JLbyAUTslee6vJ7u1ELQ7EbTb0VxUjBTFZbUejeCnI4BRBnzCMWIDcL
         TrLMab7HWOmWzMKZOhwrMY1pttHROQ24hftwWWi/a5vHsBRo33WI1jGvUHksUwhOic7C
         E5rmX3y6NynFJOa/zb+8+qxKK7ixrz+L4ibpC6hoZUNcbT1G4boYgd0r7O7mut4jlhFD
         FodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=97EDKjjzVEoZezos4HeoOg4ySj+rsLjABbKn+kDU81s=;
        b=TmrEs0961t/H2Ni6aoo/pUtLKOzQd30koMlDcIgEEnT52eo/7xDuhbThpkzu+2j89R
         VS8gNpoIOPw/iNjF43supMqgajSoU1W5S7pFwXMFvq1V6EUszIn9PH7szX3nVhZG9lge
         tL9HGgIXPxgXbuJHiEhLy2zO10597KQJlj/PKniRIbAcbdehXEOWfbEKEFfx2pzQMSf/
         LXM9fVjT3shEiRdN+DIG8m/YfmRQ/uCa6466qQxpRa3lR/vAqDzmzaMiFr3ugrshCGkt
         cv3WCFmcvvzylLv+JZ/6qrtruRdp2+mvuoVBv5GFPXXzWd4EFe1fbp7WlC5Q5LvTmQAn
         F49w==
X-Gm-Message-State: AOAM5336E4eXygcgZrOU22izbLTVXe3vVD+OKWY/btzSBV2timx/YAvV
        JRiFJ26lMpS/nZP7qVMeNFIojecAPN3xWcb2
X-Google-Smtp-Source: ABdhPJzuFgbIKcXJzWmFN1mYjBnTjsT5TOZRjJlK30Q4eV0u+KDK6aJr87drsBVJxyKhZ+bkmp9wWA==
X-Received: by 2002:a17:90a:5a82:: with SMTP id n2mr18339589pji.10.1621111945883;
        Sat, 15 May 2021 13:52:25 -0700 (PDT)
Received: from Journey.localdomain ([223.226.180.251])
        by smtp.gmail.com with ESMTPSA id k186sm6762274pgk.82.2021.05.15.13.52.24
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 13:52:25 -0700 (PDT)
Date:   Sun, 16 May 2021 02:22:22 +0530
From:   Hritik Vijay <hritikxx8@gmail.com>
To:     linux-usb@vger.kernel.org
Subject: Order in which kernel decides binding device driver
Message-ID: <YKA0hphGFeqM+BZG@Journey.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello

I've experimented with two device drivers targeting a single device,
both hot-pluggable. When the device plugs in, both the modules are loaded.
This is expected behavior of udev. After being loaded, only one of the
drivers offered by them is chosen to be bound to the device
i.e. only one module gets to execute their `probe` function.

I tried looking through the source to find out which module would get
the preference but I would really like some clarification on the
topic. 
In what order will the kernel decide to give opportunities to device 
drivers to bind to a device ?

Hrtk
