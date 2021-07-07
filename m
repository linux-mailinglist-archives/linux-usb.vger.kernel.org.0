Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501C93BF19C
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 23:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbhGGVwW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 17:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbhGGVwV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jul 2021 17:52:21 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FB2C061574
        for <linux-usb@vger.kernel.org>; Wed,  7 Jul 2021 14:49:40 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id a11so4526005ilf.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Jul 2021 14:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to;
        bh=P7WVE3Kn9bKFxqlGB4nhjd8Rv1kIuhxeXdAtAUOYODA=;
        b=ufieIpZx3zu0niHUsLfz8ANw4nCZTvtknngW+o6oDv/TZfdHufFjDwQelrvERV8yWh
         DFDWKek9W8K56QjrcGGjRrMvfaJzR8JCqJUvlK4pmo4fbjzdrIOB1bt1MZeNqwYtSv8q
         yIQaweQX451kp3y8ePyC9hx9FwTTX7hGnZElGpfuCeRTdfhpw1tx5OaOOTGAg8iZwShx
         6PQ5fcnrGbdzHWs+xnkf4Emf/53OaWmmAe1cYTjAqV8SsW46bQT/nuylzQRE4XRzWBYs
         g2oYPtPcOl24hsKHHFROebt1eOOUjNQP3X4w/DzJmAg29v4WlJtuin7KoUgKKk3WbiXm
         RDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to;
        bh=P7WVE3Kn9bKFxqlGB4nhjd8Rv1kIuhxeXdAtAUOYODA=;
        b=GyF3AiFnfPUFYHAz6hVRk7yaQtyHNofAVCl/ng0WfwK+NrxGPZifRvLMABGho7p3nH
         9DkwG0URMxZt3zuU8lNIzBGJqi8j8RJ5HRrnnDNIYKBp0yGY5iH1eS3tk+IHiLVr/G6o
         508lUjhtqkuVu3U0BpwRB8J4L0sr1thNyfA6eu6k02rrxVRYOJ6P83Ceu8C8mSNysBah
         Gf0fjQxIagrWub9M4i6He+k/rMVdnhf+GY69WZBdoa9v2GGyzATETB4bwr1PjBOr53Xp
         PtGYzyzhACsN2PG9F60MP7/ZTNXkBavfxCsNfXdJ+ezoeS8vJeANAILqqwzGcbO7QrZB
         xZ4A==
X-Gm-Message-State: AOAM531Mzf5du/KBt+JIgTkHrfcGmQ5dzgG47K8pV9NiHnP35YjUkRiz
        oBBN5SnoGZtZ5wK9h+3+aaqPeze5tcPKXbaKSNApJwSYF4U=
X-Google-Smtp-Source: ABdhPJz03GxwrjRKmccprUjtUC3TFsGxb4BpppVNQ6n2l/eSZiLxtEpXeUxX3lQP9L/O6si6DQcrspY2dOUdAjsUlxc=
X-Received: by 2002:a05:6e02:1082:: with SMTP id r2mr19359161ilj.41.1625694579683;
 Wed, 07 Jul 2021 14:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
In-Reply-To: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
Reply-To: noloader@gmail.com
From:   Jeffrey Walton <noloader@gmail.com>
Date:   Wed, 7 Jul 2021 17:48:48 -0400
Message-ID: <CAH8yC8nqqwcn0xXgKpzum-4YHkaX+YAMdVfaL_2yHyuNteU1BA@mail.gmail.com>
Subject: Re: CH341 driver and the 5.4 kernel
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> I'm trying to track down the cause of some garbage in a response when
> using an ELM327 (https://www.elmelectronics.com/ic/elm327/) with a
> CH341 serial controller.

To follow up on this...

Here's the device I am working with: OBD2 Scanner Adapter OBD2 ELM327
USB Cable Car Code Reader Diagnostic Scan Tool v1.5,
https://www.amazon.com/gp/product/B0897G6BMZ. It has a controller for
interfacing with a vehicle's OBD II, and a CH340 for USB
communications.

I contacted ELM Electronics Support [1] about the garbage I was
seeing. I thought I may have the serial port misconfigured in a subtle
way. Support wrote back that they did not make the OBD controller in a
v1.5. They make, among others, v1.4b and v2.0 [2]. It appears the OBD
chip is a knockoff.

I also think I tracked down the vendor for the CH340. It is a company
called WCH. It looks like they provide a GPL'd driver for Linux [3]
and name the driver ch34x. The driver is a lot different than the one
provided by the Linux kernel [4].

What I don't know is, if the WCH serial controller is another
knock-off. If it is an ill-performing knock-off, then that may explain
the problems using the existing Linux driver. Using the WCH driver
probably explains why things work under Windows. The WCH driver may
fix the problems I am seeing under Linux.

Jeff

[1] https://www.elmelectronics.com/ic/elm327/
[2] https://www.elmelectronics.com/wp-content/uploads/2020/05/AT_Command_Table.pdf
[3] http://wch-ic.com/downloads/CH341SER_LINUX_ZIP.html
[4] https://github.com/torvalds/linux/blob/master/drivers/usb/serial/ch341.c
