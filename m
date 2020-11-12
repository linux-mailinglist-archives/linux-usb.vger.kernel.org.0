Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864322B0347
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 12:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgKLLCC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 06:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727611AbgKLLAe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 06:00:34 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E150EC0617A6
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 03:00:28 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id o25so5917266oie.5
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=h4onEJdwh0UB0UIoQ3aO6sC3hYYulCy9/DmepheK50Q=;
        b=Vg0+EQX1DV4yvZ5XnrlO5tg33koDysnOjLtTz0JKZxi9oyQmFoULGyUdMg67lJCZw5
         simEiamh/EgvURX9QfhYsCQn7z4gWLbLX9PqrkinVHV3Z1QI10K2yzQ/8SKQDt7b6giW
         hRgcqnK2KP8txrxGT8Di9xdRydSGnnWkhdkPPCvxZ2TrpeiiTkMXLM0XQjm46C3DbmNb
         qjUArppIbx2Ku53t/CefaioMqfGIYmgz6Z3qpI+RPGpcoboeM/JwMXxLqzZJHdfDJR4Y
         wo7vuDza9Na/TB8TF8f30WN/5Oromhqnq00qlZqCADBRUYkrYFw6Co/vo3KEZXaJ1KTT
         qjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=h4onEJdwh0UB0UIoQ3aO6sC3hYYulCy9/DmepheK50Q=;
        b=bjo+2OlnnZ5dll2H5UltIz+DtvJmelzvDdxbKGlb+QMqYlYkJC9NyZ7eYOMWmTql5C
         9EYusJp4lNBezRPQ77aQOlYVneWvsBnzid9LI3nbXGSKqpJCy44D1gJx7LrehF+7X5gM
         MOmMrxSsaT9r4StnPg8KtIgJIx7LCX87YzYWNFmNJrJeo3MejmvC3w2toVzmv/JieAez
         ymRAVgu3MilO0RI3MRsX608LxgN5lSQsuJ0lH1eigrQsRzuIgsA/lsMjFNR85MEF2OmG
         WnzQahbLnbj6coH/CVkQO8C6bGIXlNReehA5AuOCgRTXU7LFfP/KJrAhz8sxeOe/P9Dx
         1QFQ==
X-Gm-Message-State: AOAM532maTmas8aRme3kbHjbxQxJvumEPPhH7QGNTL6Xq1/vpF7yzE4h
        MmjL6HiNX6J87ARrBrDTN1Z0sV3oQaMvZiEca8uEYoouHwpm0Q==
X-Google-Smtp-Source: ABdhPJwT03uXfc/KcV6gWH5LBv0FQVMmAPor5TEMRo6tl5mbpCglaqi/zYY1nkyXwasxj8xdwuv4AMscF7aMNTl82fA=
X-Received: by 2002:aca:59c3:: with SMTP id n186mr4902442oib.149.1605178828138;
 Thu, 12 Nov 2020 03:00:28 -0800 (PST)
MIME-Version: 1.0
From:   John Boero <boeroboy@gmail.com>
Date:   Thu, 12 Nov 2020 11:00:16 +0000
Message-ID: <CAO5W59jPcJej6srJiQ4yzwtNbvdK9RGJ=_KK5KeckkYeThrX6A@mail.gmail.com>
Subject: Kernel null dereference race condition fix.
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi for months Linux users have been reporting random USB crashes with
certain webcams.  It happens randomly and mostly with Logitech webcams
(which claim no Linux support).  I'm pretty sure I've tracked it down
to a simple pointer check before dereference but it completely crashes
USB subsystems until reboot and is really frustrating.

PR and explanation can be found here.  Please have a look.  It won't
fix any race condition but at least it won't Oops the kernel.
https://github.com/torvalds/linux/commit/a40519014549f60969c8e67a2fd91426db05fe04

Thank you!
John Boero
