Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11DFC3C89F6
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 19:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239864AbhGNRp4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 13:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239860AbhGNRp4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 13:45:56 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929E8C061760
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 10:43:03 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id r135so4591105ybc.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DJe/kKhBsVmdZ3tnIgCvmQhcMHHB8aDgbnkg5/uDir8=;
        b=lwtqIMCjrrHmpR3jF7vPPuvT8Cd2dBjVFhiMrToo2WR/MrxPiMyGwA3L0SDe1Lj7MG
         z2vo9shdL6aN1GPY08Y9fX0jaYatGRoZ4F1RTJnZY7D3U6jjZRqeEF1OAyaH7eIIZ5oG
         jw/+7pCASD+mHFzCGUyt5h46sGXAwC9dOCxqEnCo12ClKRPX0yT2HVey8o/xDUzwOXU2
         Uo3xKcHjhIKgqAxoQbQEi3cJBlHckhqo5RqQhPSLbtLb0Sto4bNzmznHTLlm9XhaWFRY
         MOpG/fvNZZIzHX+DTVvf6NgWcUA0N2g5i2YEEsVzk88sElEVF1nLrX60InqjYJSub7Ub
         RGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJe/kKhBsVmdZ3tnIgCvmQhcMHHB8aDgbnkg5/uDir8=;
        b=nAv9yimV5hRZUsawLYqtvlFyTaJUbmBJeaF99F8NE28D4pVRSH71ULTp7cYrr545UG
         Ra3watfEEfQHt8ZG1KAyxCNmRCo62ixcFNg8/BHoePoT2iZJjNi4PlyNt1xXVN6k+Uei
         b7efBDY6ZYelhC/avTAvPNWSAKCthWwc/JtOJPr09NPG7qTY6VaGSZ6i6rZ2AmXapaHX
         Z2BeVCb+JL4ScNcTkyCmFponFkgADJGXL+y4mq4BIad+VTPIOgy6iCu+sG+ck11z5Ybb
         ZoO3tVDGYPHdbgJFYzAI2DiuZvfzEaKNy35j8fI644tW9J8xYiX45nLsXzNLgFwHeNgn
         Ae2w==
X-Gm-Message-State: AOAM531narTlbX/bxK9BRib70NIMs2neBbFZoRJGngMhmmUAXoMoVsYd
        MO/5LBhOn8szT2whGd7oWay45m4lKJeu7g5XlDo=
X-Google-Smtp-Source: ABdhPJxwiWJzXxJ3rb+1XLGo1v5b/62umFt6hEprlJCZAiW1L17uFPPAZf7Kdg7lfhU07w9QHm2l8vm8DW1G5vQTay8=
X-Received: by 2002:a25:7316:: with SMTP id o22mr14776390ybc.349.1626284582871;
 Wed, 14 Jul 2021 10:43:02 -0700 (PDT)
MIME-Version: 1.0
References: CABUoX8uUhW4bdUZ6Roo=jEn=3UwUq2QVAMPcnyg8rbLzua09=w@mail.gmail.com <20210714174004.3CC94C06175F@lindbergh.monkeyblade.net>
In-Reply-To: <20210714174004.3CC94C06175F@lindbergh.monkeyblade.net>
From:   Hylke Hellinga <hylke.hellinga@gmail.com>
Date:   Wed, 14 Jul 2021 19:42:52 +0200
Message-ID: <CABUoX8vULggf8kRMMwo9+gSCEy27nJ6ZdNj_HQb0Z4CtfQ3sWw@mail.gmail.com>
Subject: Re: Undelivered Mail Returned to Sender
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes, I did.

I've connected both the mouse, keyboard and headset to the pc and it
would function normally. I know it has to do with the switch itself.
But I have no idea how to fix it.

The switch works fine under windows and macos, and it is even
advertised to work under linux. But you never know with amazon
products whether that is actually the case.

I don't have a different usb switch I can test. I've tried different
input usb cables as well. The usb cable coming from the switch going
into my computer is pretty long.
