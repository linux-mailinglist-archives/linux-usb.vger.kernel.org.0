Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D341D28079A
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 21:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbgJATUK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Oct 2020 15:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729990AbgJATUK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Oct 2020 15:20:10 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF61C0613D0
        for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2020 12:20:09 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id e5so403vkm.2
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2020 12:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=WG94RuUlBntjZLxVnwn8q/cb74DJ+FQ0fkRtJ6qhuDo=;
        b=k24lS10CPZO87nMSlwywydeVxumrGcuPmpH6f4qwNnYbftHiWxy2y8gURMj+ECMgO2
         kAYpVLjEm2rUhpvetOuef9nw8IuDkDDy5/gogyvCeKvEn+xJrnC8aLIaEFAAOnITnp2h
         mZu3eNq98plYcziqj/910CpaAnzo4QUrZ0VW2UOtdtYNQhT64OA5s9iuB7xhWGuFYsY0
         ZXK6QDw/rn/C7JCfm+uNJUr+RHTi2alVaG+VVoCCclrRASd4rr1u0dBZW8YrCFKWna6F
         IcYIZDjhpBWgAwxh2L0xDHJ0bo1gvPdZ+eGnL2Ux5C5OeVxXJxbq8QfIZBGoPDWKbe5j
         NLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=WG94RuUlBntjZLxVnwn8q/cb74DJ+FQ0fkRtJ6qhuDo=;
        b=GwOUfCYnkpcCVqXCejBiQcRmJ4t+54S4PNSJ9HUfRkxsXSCrKFh6a51n08Wg/Puj4m
         CCJCzAN0+Zf/8RrstN3Iet5jQYPQk+FXQoE1ceYsbB7Us1zsOhstDrKOLDqiNU983YTN
         8kObfZ4JWLTCCszDIYN7lZ6iP02sa/fjW2gd7w4svM3dacZ/io41FAhjTjInUgAFs+KN
         Rmu4SEsbK9QSVkdIPDV8i3qHuSCPQ3a0LO3fVH0CEMP4jotrnvBpiCzOj5qPvBC3h4vK
         3u7kC9PpHMkE2YhPMY0u8ko9FkW6Rr0g39CH3zBmZZLBoOi8DoTFMW/0zhYJgBIOodCB
         AaAg==
X-Gm-Message-State: AOAM530VPP1t/dflV4ejBnj2y84DCLsh5npyEfITV8lVyB+CcjgnTQeP
        xq5grE+N4vE8WK+X+sHt6CT5EF+JzuGKBcdoaZE=
X-Google-Smtp-Source: ABdhPJxPvnpTG1e3oaEjPbD2pI6LG4zPnb+46pf1w2gzbnPKYK22pPTa5aCJs2AsKuvtfGIYMjQqetS80sJegN+AgcA=
X-Received: by 2002:a1f:95c4:: with SMTP id x187mr6558689vkd.10.1601580008894;
 Thu, 01 Oct 2020 12:20:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:22c4:0:0:0:0:0 with HTTP; Thu, 1 Oct 2020 12:20:08 -0700 (PDT)
From:   Mychaela Falconia <mychaela.falconia@gmail.com>
Date:   Thu, 1 Oct 2020 11:20:08 -0800
Message-ID: <CA+uuBqbCtc3EB0zPUE1WJ9s_+=Oyc5aHzYqUug7D4GpcsgoJcA@mail.gmail.com>
Subject: [RFC] ftdi_sio driver: use altsetting or cur_altsetting?
To:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello esteemed linux-usb folks,

While I am trying to get a little quirk for my custom hardware device
added to the ftdi_sio driver, I noticed an inconsistency between use
of interface->altsetting vs. interface->cur_altsetting in the existing
driver code.  Specifically:

* ftdi_determine_type() function uses this construct to get the number
  of the interface it is operating on:

  inter = serial->interface->altsetting->desc.bInterfaceNumber;

* ftdi_set_max_packet_size() uses interface->cur_altsetting to get to
  desc.bNumEndpoints and endpoint[i].desc

* The JTAG cleanup patch which Johan just applied uses
  intf->cur_altsetting->desc.bInterfaceNumber

So which is the right one to use, intf->altsetting or intf->cur_altsetting?
The comments in include/linux/usb.h say that the altsetting member
points to an array of struct usb_host_interface stored in no particular
order, so using that pointer in ftdi_determine_type() seems wrong -
but then I am a total novice in this area, hence I am hoping that
someone more knowledgeable could confirm.

The most recent version of my DUART28C quirk adding patch uses
serial->interface->altsetting, copied from ftdi_determine_type() -
should I change my proposed patch to use cur_altsetting instead?
Should I also make a patch to ftdi_determine_type() changing it to use
cur_altsetting as well?

TIA,
Mychaela
she/her/hers
