Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1702C9DD5
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 10:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387428AbgLAJ2J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 04:28:09 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40173 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388486AbgLAJBK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 04:01:10 -0500
Received: by mail-lj1-f196.google.com with SMTP id y10so1629009ljc.7
        for <linux-usb@vger.kernel.org>; Tue, 01 Dec 2020 01:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3FAzLAzbTqnDyPheEy8JH3X2tG5szlEVlz/oM+HlaVk=;
        b=sIaC1ULscSRQmu3UlkJAG54DvD+7nf9FeIIKGx8GEa2Oq3JiN1QUk+CtlTapB4TVsv
         Bq4y4FMXOY3yfy25yTtVt7YYxvzMtkw7AuY6WIYjnJ4cc3s81X32CnGp5SUEX6h2dLyu
         iYwPpTX+pIpMK9V4AQQGBNTzCQc1bs3V43sQOD7DX1Hjr0WWPlZ8v/D0VzG1lDlApaCK
         U7O84MyIOPVeJQz5sQObw+16+v1ijyv9RGERR4pxU7PMc+pl7a9DsG70mFzSMzn5gLf/
         G6lWDXI7EDwj7VAOV3pn+M3mlQ6M8NLSKk+6TwJS9GowQaRKaC3o+04OP6ISiFiiTYWw
         kljA==
X-Gm-Message-State: AOAM5322TQeTGZApkzZh5a1au0FG/myKHbJ4qmtbd5mILyq+wCqF4EHu
        G4ZX7WcaSzdlJPgAo6HfFP8=
X-Google-Smtp-Source: ABdhPJzA31eo/gDXCV+MQixIrs2aGUatNx1gAw8nspCyE5ZQlSZTaJNaGuPaXR7ORt56OL/DBvH0ZA==
X-Received: by 2002:a2e:9a98:: with SMTP id p24mr796270lji.418.1606813228669;
        Tue, 01 Dec 2020 01:00:28 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 14sm130683lfq.221.2020.12.01.01.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 01:00:27 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kk1Wq-0003LV-Sc; Tue, 01 Dec 2020 10:00:57 +0100
Date:   Tue, 1 Dec 2020 10:00:56 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Mychaela Falconia <mychaela.falconia@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio
 quirks
Message-ID: <X8YGSJWzOlIFfHjx@localhost>
References: <20200916015621.EFCDA374023F@freecalypso.org>
 <20200929101330.GQ24441@localhost>
 <CA+uuBqY83q+UiRsYxBckXvbtYf4sRxqB_8eXXPgEKAOqTwD=vg@mail.gmail.com>
 <20201005105722.GN5141@localhost>
 <CA+uuBqZ6JhCq1ydU-9A+en3QO=9zX9LuEJ8+P0YvEzUE+9sYoA@mail.gmail.com>
 <X8UMJ9a051tT1rbz@localhost>
 <CA+uuBqaUqkVQ0JCS-_OMT3tApxswHDFCpXjrPFzftn2VEGAjVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+uuBqaUqkVQ0JCS-_OMT3tApxswHDFCpXjrPFzftn2VEGAjVg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 30, 2020 at 12:15:51PM -0800, Mychaela Falconia wrote:

> > I'm adding a new tty port flag that can be used to suppress the
> > assertion of DTR/RTS to signal DTE readiness on open named NORDY.
> > Eventually we can expose it through termios to match HUPCL that controls
> > the behaviour on final close. For now I'm only adding a sysfs interface
> > but that also allows control over these signals on first open.
> 
> I don't see how exposing this new flag via termios would be of any use
> (it's a chicken and egg problem: one needs to open the tty device in
> order to do termios ioctls on it, and if that initial open triggers
> DTR/RTS hardware actions, then the end user is still screwed), but
> making this flag accessible for setting and clearing via sysfs is a
> good idea.

Yeah, as I mentioned in the other thread a termios flag would not be
sufficient for your use case, but there could be other applications that
are more tolerant but still want control after first open.

I believe this is also the way Win32, which you referred to earlier,
works.

Johan
