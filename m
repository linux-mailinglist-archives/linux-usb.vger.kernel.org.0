Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF781E8CEC
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 03:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgE3BtC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 21:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgE3BtC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 21:49:02 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E55C03E969
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:02 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id r10so2580704vsa.12
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ps/ui7RbaSlq+dH0JZTKSem4vGXYKlpIzPPfsAh4mpw=;
        b=gOmIHlk/JRWM6SMxhv6JhNAZzxuMU3rFqGnls4NaTrKLjGGybdkWbwRbKUZbqwr1zc
         rfRMB20pLO5tWQvvFP7j6oororPR2F4BYoQxv6jEk/09POZ7M2K8w5NWNnvzCYOBoOz7
         zx0+BKwuLAgV6cztS9OXO/h5Pld2DGNYZFy6/uzbBDZTumTYbDnvt17dw9GaDZnrMBCi
         J9K7ZwRhuI8xl/EWcaUsBI23kruGLyOQ5l8KmJ2KG151AdytxhJFdvJ2d3JW9qi39PwG
         uqZbez0UnH33Yf5XzBFf+hKAedL+r0eqE7EAqh2Pqrg8g1Xgr39of5pcgzHwU1QQWd+W
         rAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ps/ui7RbaSlq+dH0JZTKSem4vGXYKlpIzPPfsAh4mpw=;
        b=LvuKH0Ao7+sxKNcATgqSxD4LDZ5kF2+4rmRe7qoP5vWRa+u8Fj4PW3vA/0g3BG2yJm
         ll8yQxIB7G0+xGtzGJSWF88bkKJE8p8kzFeIrVKqceHIVyOwNGx+VFJEir0aQoii2kJt
         J8XaW0xq9XT1vFCDiP3ZxBfzb+ZwGs+e6/b7IA/4QCzPTQZzecYbueamgX1kp4jBxiMX
         6hQI8lFD+e/NZ8eN7Z3kDCX7tvxSWvPIzsaAaSCF5Nsim3mm4yTmwZfuI8KbPBqpzuTx
         2wxrq88alr4+srdlCoUNcXsH30lHpjtq1+OPzyZUfI59uYRHvMRGEqhUwOlMr8Gur7Ff
         YmxA==
X-Gm-Message-State: AOAM53398w0jXy55Hy1FNozByY8fGwb8oSqcEKpG1I2ZaUtknkdjiUzd
        /CkLiNe9TuLZFRJy/3NmH44=
X-Google-Smtp-Source: ABdhPJyq+evFiFXqNRL71oew3lpnLelqcJsxLKeK8OU8ND1Mpw2J3Cjr6qMNP42xsF4GPpYwmMSQ9Q==
X-Received: by 2002:a67:7dcd:: with SMTP id y196mr2545893vsc.13.1590803341673;
        Fri, 29 May 2020 18:49:01 -0700 (PDT)
Received: from DESKTOP-2I1VNC3.localdomain (host-128-227-216-118.xlate.ufl.edu. [128.227.216.118])
        by smtp.gmail.com with ESMTPSA id z75sm1507759vkd.5.2020.05.29.18.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 18:49:01 -0700 (PDT)
From:   Changming <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 0/6] USB: sisusbvga: series of changes char to u8
Date:   Fri, 29 May 2020 21:48:14 -0400
Message-Id: <20200530014820.9967-1-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Changming Liu <liu.changm@northeastern.edu>

This patch series changes all appropriate instances 
of signed char arrays or buffer to unsigned char.

For each patch, if changing one variable to u8
involves its callers/callees, then those changes
are included in that patch as well.

Arrays explicitly noted as string are not changed
for the sake of readability. 

Changming Liu (6):
   USB: sisusbvga: change char to u8 for sisusb_copy_memory
   USB: sisusbvga: change sisusb_write_mem_bulk 
   USB: sisusbvga: change sisusb->ibuf,obuf,font_backup
   USB: sisusbvga: change userbuffer for sisusb_recv_bulk_msg to u8 
   USB: sisusbvga: change sisusb_read_mem_bulk
   USB: sisusbvga: change the local char array to u8 array

 drivers/usb/misc/sisusbvga/sisusb.c      | 54 ++++++++++++------------
 drivers/usb/misc/sisusbvga/sisusb.h      |  4 +-
 drivers/usb/misc/sisusbvga/sisusb_con.c  | 10 ++---
 drivers/usb/misc/sisusbvga/sisusb_init.h |  2 +-
 4 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.17.1

