Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7D0156F2F
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 07:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgBJGDg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 01:03:36 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]:43144 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbgBJGDf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 01:03:35 -0500
Received: by mail-qk1-f180.google.com with SMTP id p7so462110qkh.10
        for <linux-usb@vger.kernel.org>; Sun, 09 Feb 2020 22:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=t9yfLP9Tij9w0uWmcbRCMNsznnHNuGXXAKDf4gHtixw=;
        b=XgFA273I0gBeTp6+gUnkfNStRnh9b+x+S973dPsFpfQJkDTdCkV1/DOkVv8RxJsPOB
         C4jHVHyivshlInr73H7KTfP4rqRvwrDAKqOPQJmTyvQm79I8SixqR9a+hYiJBuHNs2F1
         0Z6xefBlc0YYUChO5eEi0Y0qon512DTIe3uz7feDok7TgGoeU11z24UTNnhfdZIncaB5
         8m9kzb5oORh6rFJpGnKEpbieJ5+rkSLZf6CtMScSsSsYJjlj88shIXvAfP6w3MXskfDB
         8RosPcXOTO35ImBeUw6DEPeo1R1jRv3Cy2RJ1HqE5tHv127pVjWCEgLS639hbD9hWo4O
         EuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=t9yfLP9Tij9w0uWmcbRCMNsznnHNuGXXAKDf4gHtixw=;
        b=k/Iy9qyL+oDouBR8FlfYajnTpP5A1gGOqL5iMfJFpIBEG5jKpC0f4Saib/b7R5W7DO
         b2n1kYmoeAen52eWXGw+jC2DuvWjfUaFnCcHzfai3aSsYVCG99rhK33o3dJVU0N9dXsb
         dZpI8F7e88nzcBc3iPt/+amRQHg3V5vY6tqHMIFyL3QAHTePxYepGuidlDue0tVBBp6o
         /IVHGnkMt22x92JKLI2BCvsqJ8M+R6QKAnmWpBu5gGZRZCzDS9bIEsygAul66ezEINyQ
         JI3jCtu+NLfb/ce1nJZMsN9r2pW55LVGeLC0xG5LNRMfWOBa4O2eDnlzO4LFuAdv4q85
         zBlg==
X-Gm-Message-State: APjAAAXZShwOFrM7x10/yeqYsc/+1MKmB9ehPaC4GCy5dZbkBepOSkvv
        TM19EgPynl6Aruf82uYkZqwrXr0XXdNCzE6v9FTZbUbDLfY=
X-Google-Smtp-Source: APXvYqxK2eRYVVIB6/Sxh20AgQFGymq79R/uM/Txocr9C9c0R3c8YBb4wE/pQfvV9XF3bWq16pjV0fpo5snc38aXHL4=
X-Received: by 2002:a37:4a16:: with SMTP id x22mr6271648qka.88.1581314614199;
 Sun, 09 Feb 2020 22:03:34 -0800 (PST)
MIME-Version: 1.0
From:   Sam Lewis <sam.vr.lewis@gmail.com>
Date:   Mon, 10 Feb 2020 17:03:23 +1100
Message-ID: <CA+ZLECurtq1X-4XtMSqsdSfaw=RrNyY94cz+8CZ06HJ8Pw28Ng@mail.gmail.com>
Subject: USB hub driver over-current behavior
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have a LAN9514 (rebranded SMSC9514) USB hub which has per port
over-current protection.

I'm using this hub within my embedded device, and I would like the hub
to continue working if any single port experiences an over-current or
short condition.

In testing this behavior by shorting out a port, I've noticed that the
Linux USB driver continually fights against the protection in the hub
and attempts to repower the shorted port.

Looking through the hub driver and tracing the execution flow, as far
as I can tell, this is the list of events that seem to be occurring:

1. I short out a single port
2. The hub (through a power switch) detects the short and disables the port
3. The hub sends an over-current event to the driver
4. The driver gets the event in the `port_event` function
5. The driver then sleeps for 100ms (for 'cool down'?) before powering
the port back on
6. Repeat from top, until the short is removed

I've tested this on Kernel versions 4.14 and 5.3.0 and the behavior is
the same. There doesn't appear to be any differences in logical flow
in the very latest kernel version, either, so I believe the behavior
would be the same there too.

Is this 'repeated re-enable' the intended behavior of the driver? Or
is my hub operating in some way that's confusing the driver? I
appreciate that this might not be true in the general case, but in my
product it would be nice if the offending port was shut off until it
was manually re-enabled (maybe through userspace?).

The repeated re-enabling of the faulty port seems to be causing other
issues on my board, communications to the hub eventually timeout while
a port is shorted out and the driver is trying to power it. This makes
me completely lose all devices connected to the hub. This might be an
issue with the hardware design of the board or perhaps it could be an
issue with the driver but it does seem to be induced by the repeated
re-enabling from the driver. I've tried manually patching the hub
driver to not re-enable power to the port (basically by removing the
`hub_power_on` call in the `port_event` function) and this seems to
improve the situation a lot.

If the 'repeated re-enabling' behavior is what is intended, would
there be any interest in adding configuration to not re-enable a
faulty port? Or trying a set amount of times before giving up and
raising an issue to the user? From what I've seen, I believe the
latter is how Windows deals with over-current conditions on a port.
