Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E1F20A2BE
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 18:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406057AbgFYQSB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 12:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403801AbgFYQSB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 12:18:01 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1374BC08C5C1
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 09:18:01 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id b13so5843611ilq.11
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lPZwFDYPaoqVdY2uf6G+5EQ6VwbUWLzyNDZggNKWQW0=;
        b=H9yFtPab8Ym+yPzMrYphllQ3lGIyfY6HpKqmns27SwU1Bmc3mNucY4hpCTIOEgRAeZ
         RWYBQ5QgPC4nOVtoZrcg/a7Pd/rvGfY3t4WVc1/i4SL1mNloKF72NAAVLDDFNajhxxP/
         /Xzdo1reJjscTCpET71SONPaejZlR4Wd0+TaQltqGIAoP0/2mrNv2/6b02YZ+ahmfaM2
         VdIWn9MSkieLCX/PbxGbSr0ImHzB/CPZK9SaMPt4pWz67zh6mPcUrP1ySiNxMFSrsTd6
         JOMdzy1TK7PmYgi1W3UmGQQ5ghBlDyXO9rn1XEfPaMdtkNGsosvxN2We1mFeBVO1awDP
         nsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lPZwFDYPaoqVdY2uf6G+5EQ6VwbUWLzyNDZggNKWQW0=;
        b=n6eeFhSSpKHx5QpAIg/z+9+bWm7tCwjwsD7V0DJoyzdg07fg8PMRFFCDu5hO4tuGl7
         hMQiaBLtYOfO6geNhKHqnUkI1iaM43mpwOUuOwnZ5U4sUs7YvpOZI8LPsYDSyYiEi0HN
         recnSFvGa+5yV8JZUh+b/eNP573bTh3dAbUvhCIN4NNhuFq8TpmLu+U1N390tJl870OO
         NIn0A43dS4dSbeSSVActoozgiPY9RpxJoG/jFr+mv1ogpQlOXT/8H+AbO3HAnBkuecCT
         t8Vxfnz9kqJzNXcyiOuEKMFuvpdoD+uqt09TR37gkEYGfEpPv/y3rPrn4kLWi2Ad5TmR
         9elA==
X-Gm-Message-State: AOAM532FIj07UEr5eCMLRUXo7D4xfJLdookxceqAP4pSW/t2/fRD4tdz
        oD32bZRQ/ghNYjRbqL3VT/EGd+hvLrm6aCseY2IW6g==
X-Google-Smtp-Source: ABdhPJxhFbLJ7x/V/xZQ/8hzUdoAgx1R8zymdtZDXMS0aBY2nLSRlMUJPUXYK0RGO4UA2G1OBWe82tjsOdHJgG+oyv4=
X-Received: by 2002:a05:6e02:4c8:: with SMTP id f8mr34607003ils.174.1593101880341;
 Thu, 25 Jun 2020 09:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6JJ88avATE3w7HMn94wTti8GY7uncXKT=zLLRbVTz9xbXKVg@mail.gmail.com>
 <37b88453-7346-400f-94d9-36e8854c9f10@www.fastmail.com>
In-Reply-To: <37b88453-7346-400f-94d9-36e8854c9f10@www.fastmail.com>
From:   Mark Deneen <mdeneen@gmail.com>
Date:   Thu, 25 Jun 2020 12:17:49 -0400
Message-ID: <CAP6JJ8_YEAj+kdEaEK_X0Q+7puSLX4odr_HAvS_pX5fOggbT0g@mail.gmail.com>
Subject: Re: crash when cleaning up gadget configfs directory on sama5d2
To:     Sid Spry <sid@aeam.us>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 25, 2020 at 12:13 PM Sid Spry <sid@aeam.us> wrote:
>
> On Thu, Jun 25, 2020, at 9:18 AM, Mark Deneen wrote:
> > Am I doing something incorrectly? What can I do to debug this further?
> >
>
> On my device it's impossible to remove anything from the configuration once
> added. Are you sure it is expected that the gadget can be reconfigured after
> UDC binding and then unbinding? (This is a general question to the list as
> well, I'd like an answer to your original post also.)
>
> My workaround is creating a new gadget and binding the UDC to that instead.
> Or just rebooting.

I was able to remove the gadget configuration on Jetson Nano using
their BSP Kernel (tegra) without an oops, but I have no idea how much
that kernel differs from mainline.

If it is not possible, surely crashing is not the desirable behavior!

What happens on your device if you attempt to remove the configuration?
