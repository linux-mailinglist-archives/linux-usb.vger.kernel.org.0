Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37AFD240082
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 02:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgHJAVb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 20:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgHJAVa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Aug 2020 20:21:30 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C6EC061756
        for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2020 17:21:30 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id d19so3958042pgl.10
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2020 17:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kDRpQ/+11p0LRqjyRSrYG08deltrmaasQ6bx3EEny6w=;
        b=gdxsUJ7hkxb6Fup+4qcmE8mnrMguUbMx5kXtOsFcXhZjTfC5nXo/bNXhe/Fhzj2zCY
         KE153TomYp+/eGlzszHkO/QW+2PBrSV+k+/G/DrjJnKCz4yfq0PTglFNzgYuhMt2Hk+d
         ILFp32f76Bvflorzp13E9vK5OTscvyrQ/XSlGHmgJcHBLZ6Uh+i5Ch8q8t4vySVt6u3j
         +soOy5++KjhAEMWCiToHDq/eTYvjttruDpDNKaWgIsCvQ9phabvJG+6ZS32ocKbs8W9n
         TYZlnLnvdruEBVcS+M8cpZPfL6jp6GuUCFieiNbZdxEqKHmlXzCgbVdS0n35tm6q+6Bx
         TaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDRpQ/+11p0LRqjyRSrYG08deltrmaasQ6bx3EEny6w=;
        b=ToIS8R3ek02xazavcaJN/4Ke7XGEu3HvM05jhulHooYELRUy1sxokeTY75qAnkrp7b
         Dp1oy6vw5Gd3Y0Jbgr2PRVDq3uv7QqQeGC76UL4UOb52rklTM7xIleIeLU8sZ5hJNVXB
         Gmk9Wcdm3WuXZWQIpksWEiX0q0rU+MQY+vlTA7mnr5RV61UjYaTIhWMmdCKtSkUPlqXv
         5sBmlvz+VekxXxN34Vv2jT5Za7SXCRPjpGLZuOk35xrCpn0KTvnzqM10Tfjxe+TRzDnS
         LR0vkzFEAcUxRWKygCw4CIGiK0ZFl9jdfgJmnF2R3856OL6d1o4EtJafJRfjA81ceIXE
         qwug==
X-Gm-Message-State: AOAM5339qHdLvqOS8xPBJp4+beWT7WU7e8h4VKTEIPkBKoMjwj26Z8f4
        knCr7fTKtXDQfuG45lfqFK5NJhZe7pO11w==
X-Google-Smtp-Source: ABdhPJw2d7f66l65wLL/2xdiRJ/NHlyBxLC5VrheMgiXlz4C3Squ282tc3n23ap99XTClE2myOl3AQ==
X-Received: by 2002:a62:1b81:: with SMTP id b123mr22849225pfb.149.1597018889589;
        Sun, 09 Aug 2020 17:21:29 -0700 (PDT)
Received: from lemmy.tees.ne.jp (153-125-65-70.catv.tees.ne.jp. [153.125.65.70])
        by smtp.googlemail.com with ESMTPSA id a17sm16483021pgw.60.2020.08.09.17.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 17:21:29 -0700 (PDT)
From:   Yasushi Asano <yazzep@gmail.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com, jim_baxter@mentor.com,
        wnatsume@jp.adit-jv.com, nnishiguchi@jp.adit-jv.com,
        yasano@jp.adit-jv.com
Subject: [PATCH v2] [RFC] USB: hub.c: decrease the number of attempts of enumeration
Date:   Mon, 10 Aug 2020 09:19:34 +0900
Message-Id: <20200810001935.4489-1-yazzep@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200808151648.GC256751@rowland.harvard.edu>
References: <20200808151648.GC256751@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yasushi Asano <yasano@jp.adit-jv.com>

Hello Alan,
Thank you for the feedback. I added the information in the commit.
I reconsidered the reduction place in the number of attempts.
Since I don't want to miss 2nd reset[1] or do not change the timing of power cycling the port[2],
I changed to reduce attempts from the nearest enclosing loop.
I'm sorry to trouble you, please confirm it again.

[1]
 /*
  * Some devices time out if they are powered on
  * when already connected. They need a second
  * reset. But only on the first attempt,
  * lest we get into a time out/reset loop
  */
 if (r == 0 || (r == -ETIMEDOUT &&
                 retries == 0 &&
                 udev->speed > USB_SPEED_FULL))
         break;

[2]
 /* When halfway through our retry count, power-cycle the port */
 if (i == (SET_CONFIG_TRIES / 2) - 1) {

Yasushi Asano (1):
  [RFC] USB: hub.c: decrease the number of attempts of enumeration
    scheme

 drivers/usb/core/hub.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

-- 
2.7.4

