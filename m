Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03A524F97C
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 11:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbgHXImY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 04:42:24 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33476 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728933AbgHXImT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 04:42:19 -0400
Received: by mail-lj1-f193.google.com with SMTP id v4so8696243ljd.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 01:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xF4+I7yz/q93sE1EkWzLpydwJ/6ThImcWnlbA6qH6yk=;
        b=HX3jTj5sQP5kCKzd+ypy1i2Muc8pBpSE2p7MirT2TSOCm0idzGNCiEcy+/oZL7QuaW
         hPckDRUxFiYbEHbbUbuczehG0qwjVp25Z/G2vX9FnCE49twaIjSiIe7h0sjQQPgkxhAQ
         8LU67GYUJY7JcECdYgDIGh3mFoJDC1b1r1G89xz+Tx0lUO6IQZXHHPLZEAw4hP0Fj4Px
         My+3Fpohq47Qp0IjolZwK/1FKbtDBw51VGSTR6hMI23fRWGgxefD/+NDX1e4D6f+VE70
         AJeL+D3uoLuTiLSBGraAkYiT7Qett7N45XfmgkfdS0i/KApzgIdjEV9Kz65FVgTXhtyJ
         2fOA==
X-Gm-Message-State: AOAM533wjTOM8oRsU72HTKaxxOBTjzSpa7IOChyFfOOXWgwKnmGX5HmE
        8IoKStFHMkOeRmgRKTvrV5Ureo5NAw+OFA==
X-Google-Smtp-Source: ABdhPJyUtjFA9Goy36H6Su4s5VvgZNa8tw3JHVerT2P+7OxU2FnbhFqt6V6iGROvLooMCiC97oQxPg==
X-Received: by 2002:a2e:b306:: with SMTP id o6mr1955840lja.361.1598258536073;
        Mon, 24 Aug 2020 01:42:16 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 80sm2058675ljf.38.2020.08.24.01.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 01:42:15 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kA83S-0006kV-N0; Mon, 24 Aug 2020 10:42:14 +0200
Date:   Mon, 24 Aug 2020 10:42:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208959] New: USB-serial (mct_u232): bit7=1 when tty is set
 to cs7?
Message-ID: <20200824084214.GA21288@localhost>
References: <bug-208959-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208959-208809@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 02:52:47AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208959
> 
>             Bug ID: 208959
>            Summary: USB-serial (mct_u232): bit7=1 when tty is set to cs7?
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.7.0
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: low
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: mslade@epic-code.com.au
>         Regression: No
> 
> I'm not 100% certain this is a bug, please let me know if this is expected
> behavior.
> 
> I have hooked an old serial mouse up to a USB serial device, USB ID 0711:0230
> (part of an circa 2000 Targus port replicator)
> 
> when I configure it with the appropriate 1200 baud and 7 bit char width, the
> bytes that come through /dev/ttyUSB0 all have bit7 set to 1.
> 
> This behavior is in contrast to an old serial port on a box running a 2.4.19
> kernel.
> 
> Is there a standard for the value that non-data bits should be set to?

This sounds like a configuration issue. If the mouse is indeed using
7n1 and the converter is expecting 8n1 you could end up with bit 7
always set on input.

Can you verify that the converter is configured correctly, for example,
by reading out the termios settings, enabling debugging and/or
connecting it to another serial port configured for 7n1?

Johan
