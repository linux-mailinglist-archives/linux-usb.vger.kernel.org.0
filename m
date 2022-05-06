Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682AB51E04F
	for <lists+linux-usb@lfdr.de>; Fri,  6 May 2022 22:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443694AbiEFUxV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 May 2022 16:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443630AbiEFUxT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 May 2022 16:53:19 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB616D3B0
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 13:49:34 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id z18so9354248iob.5
        for <linux-usb@vger.kernel.org>; Fri, 06 May 2022 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i5UQSzJb8UwAh3CW7OsDcAz2qHiyzDfNd6Nodt6XzGQ=;
        b=nIEoXiEcuK0JQ1ZGg9gcfBRNA3jbEynNIgUxeckZdl0+FiFzqujVAhGWz2mVgoVjjG
         EXR2ddqA4KDA33O7rYY3aYE+P+4KbfAwR3lVLA0IMl5Fsh7saG6Xdpf4s+SiFAbaBJx0
         bxbnsa6V3hKXdC6z4O2xXefZCbAlVwMGP49EJabRe6bZooiGNiu7pK5inilFajGtl0So
         454UfHGxHRQZhUxP+2Dhv6gDXrJ0qEi4d+Fwbyi+3qOQTcwMjlvnXe8drTq1+ZdkL3rr
         FJob5pV8oLQ35246o2OSpkBlGEuJ6+9UbOx8PM3YB50KTAFuhI3SNNE7VS5dueZq4Ir8
         O/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i5UQSzJb8UwAh3CW7OsDcAz2qHiyzDfNd6Nodt6XzGQ=;
        b=jbhKnrZnzp6U6C3zxVsUFtYNzM2o4a+OQrWsMt3qvckhSrngN8+85rINWu9f+PaBFs
         +kL+frAlM6tvluwU8lOjApbov1OOjsESRXWgpHCSV5pbQb9oJl5bL41do72HMPokIkJG
         YPy62ztuG+W771bLKjZHVrWAGsoL1uobw9Ir7PeGgjOIG1JpcF0SP3E7Xb0iNeAi6eP1
         tMyxGtwfjXtSXtcC0IPQ0tGUvsCQn2IVhKuGdybOf2cu+IOc44UHcEg9vPjR5Kb7sJLV
         rN45cXJ1I7pQ2iODiHNjXmOuvzVaGRa9p5cEQlq6najY2t0nnZVZ3uLhouaCrGI9l/Yt
         7vTw==
X-Gm-Message-State: AOAM532LpCYBRcZDZ/DFrjGh1d00XoPhgMy0w6OELWUBQgtDhyuHknDQ
        Qe4cY39zxda7nXzlDV6CJMiLh60EEnSerPWTjkLpJ3M+
X-Google-Smtp-Source: ABdhPJylETGrZCAuM6RZeJ82Nb4NXPf0ex02y767+74h0obDGrhQQqnC/LXhkUfi9jyQuVa5O9zScYpqlN7/ZnW1hx8=
X-Received: by 2002:a05:6638:40a7:b0:32b:8f56:d126 with SMTP id
 m39-20020a05663840a700b0032b8f56d126mr2212000jam.107.1651870174342; Fri, 06
 May 2022 13:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMvbhGURWPbHUw5gOirJer7-+VwWFL4tTtiSYSJW=3y1G92mw@mail.gmail.com>
 <YnPcWuhpFrqjeIIs@rowland.harvard.edu> <CAAMvbhHsUL6gQ365wZW4J8RCbnhwEt0RDUc5NA4=RSS2bjnK_A@mail.gmail.com>
 <YnUyHu7o7OPawXZG@rowland.harvard.edu>
In-Reply-To: <YnUyHu7o7OPawXZG@rowland.harvard.edu>
From:   James Dutton <james.dutton@gmail.com>
Date:   Fri, 6 May 2022 21:48:58 +0100
Message-ID: <CAAMvbhGqKF3gVE=MNJ6AXeJCe2F0u13_6W2akuJcP0bx_PSwWw@mail.gmail.com>
Subject: Re: usb disk drive disconnect making readonly
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 6 May 2022 at 15:35, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > Hi Alan,
> >
> > Here are some log messages. I suspect the storage device is going into
> > some sort of sleep mode, and the kernel does not seem to be able to
> > wake it up again.
> > The device is a USB to NVME adapter. Using the chip: Realtek RTL9210
> > The log is perfectly normal up until the 2nd line below onwards:
> ...
>
> That log isn't sufficient.
>
> It would be a big help if instead of sending your kernel log file, you send
> the output of the "dmesg" program.  And don't send just the part
> starting where the problem begins; we need to see what happened before
> that as well.
>
> In addition, it would help if you enable USB debugging before the
> problem occurs:
>
>         echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>

Hi,

I will try to get some more logs the next time it happens.
dmesg is not available. As the disk has essentially failed at that
point, nothing works (no keyboard input), so the only way I have got
any useful output has been with rsyslog over the network, and then
show the syslog output on that remote machine.

Kind Regards

James
