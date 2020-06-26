Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0259B20B957
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 21:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgFZTem (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 15:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFZTem (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jun 2020 15:34:42 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AECC03E979
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:42 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id o38so8342720qtf.6
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+7XsrqC1DVM/YOBNNVJQ7QuVkwVDWcTP9U7trT74AdE=;
        b=Py8kjvubHaLa0pTwVtbB9I7aNb7M8Fp5g1lF/fOYNRbXrJwL5aJYSLY+fqoa5Q+atW
         LEZBqW0MWW9GToMLhI2A1J3pfsyEFkeqyw9ycosbIouBW+A+GKZLrLFOtAz+Y3wG/wv1
         f2QvZa3U59lBR9SS0nORzoc7MyBpfTjgR0qi4inHLe5VvkciyQp3xs9LodaoEM3Z9tRg
         50rsCfVYu0fxQUUYlTw5pCc8iE+bMmF2be61E1kMqJHLf3AuAokx1Pz0ftp2EdXKwjvH
         JQhE1aEl3CZ1xwTGz3//QOYdsd+K5J8J39u0z1QMB02fakvNilzweGSMKfa4c0TjOLZ5
         J2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+7XsrqC1DVM/YOBNNVJQ7QuVkwVDWcTP9U7trT74AdE=;
        b=E+b0N3ROkIaUkHkMN3ZDxqbV+CgPUiF41QIKxHdyeTnTLOv2Dr/+bacluOWclmCBJ5
         iGt++ddSgmJx2lJFuq3T2jD1T8zZO/hzyCIjhvhgIZxjiDgaPAhIYzjfldsDedkhg0i/
         l6p5FLzFEhSqTy8JYmv/7Ve91jGziMKIG9KHPwQogJuCUuyW0qU3GXWofyCsSV5V5rvo
         cSgycuf9qgYlykgm7eYLgeE/v6pYxuUdXxH1p9iHjJDbDilJURiEiwUI9VDysjvgDoTK
         MePMl3cI9soHlNqlXuLKF3d/7DDZ//zWLyZdhyaDp6D5ttFlzbG9auI2uuWWy0kPSnbA
         6ULw==
X-Gm-Message-State: AOAM530Ltf1TV0j/ibmtXCdXD5j6RpZt0eFYDfxIG+KJYQ4qEFK5yopQ
        XX5ILEp/O8vJbxl1IjPnL9k=
X-Google-Smtp-Source: ABdhPJxMD2I7H023cLgNgcB6X9vPnoIaIaxBPgVA/Z0N12sR6tSPoJEaF20efe4wNfcCtZO3n2dStg==
X-Received: by 2002:aed:2684:: with SMTP id q4mr4379096qtd.208.1593200081643;
        Fri, 26 Jun 2020 12:34:41 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id u124sm1089990qkf.83.2020.06.26.12.34.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 12:34:41 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <charley.ashbringer@gmail.com>
Subject: [PATCH 0/4] USB: sisusbvga: cleaning up char buffers to u8 buffer
Date:   Fri, 26 Jun 2020 15:34:13 -0400
Message-Id: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The purpose of this patch series is to prevent
undefined behavior caused by arithemetic operations on
the content of the char buffer.This is achieved through
converting all char buffers to u8 when there is 
no need for the content to be negative value(which is the 
case for all touched buffer in this patch series).

Converting these char buffers to u8 buffers will make 
certain types of UB from producing undefined result to 
well-defined intended (modular) result, and will not 
introduce any unintended side effect.

As an example, changing the local char buf[4] in sisusb_write_mem_bulk
to u8 fixes an UB: since buf is filled with data from user space,
thus can be negative. Left-shifting this negative value produces
undefined result, this can be fixed by changing it from char 
to u8.

This however doesn't apply to ioctl interfaces functions, since the 
types for buffer of ioctl-like functions need to be 
char* instead of u8* for compatibility reason.
In these cases, the buffer declared as char* will be force cast
to u8* when being used.


Changming Liu (4):
  USB: sisusbvga: change sisusb_write_mem_bulk
  USB: sisusbvga: change the buffers of sisusb from char to u8
  USB: sisusbvga: change userbuffer for sisusb_recv_bulk_msg to u8
  USB: sisusbvga: change sisusb_read_mem_bulk

 drivers/usb/misc/sisusbvga/sisusb.c | 34 +++++++++++++++++-----------------
 drivers/usb/misc/sisusbvga/sisusb.h |  4 ++--
 2 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.7.4

