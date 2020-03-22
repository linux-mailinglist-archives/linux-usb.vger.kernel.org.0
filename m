Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F0418E5D4
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2020 02:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbgCVBg2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Mar 2020 21:36:28 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33658 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728274AbgCVBg2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Mar 2020 21:36:28 -0400
Received: by mail-qk1-f196.google.com with SMTP id v7so1979123qkc.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2020 18:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ubq/qZnX/ujKaYfjOueGLD6Nqh5QSMEUH2vduTkKjHA=;
        b=PL1RyTyq/WRZKZrEHqL4R/7W0dJU38ey6RtLKNXSwKxSkIN9TA8rk+1XHkXSB34Z3U
         +hT8qUXMqZjtKTftKJLwunclFMXbCFua88wGTvXHtsD23zMsiUUWyiPeyIJ6vgtbThHW
         gFwhM+xyJWfZ3VhmNgEQUPD4gXknbn5mHpUV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ubq/qZnX/ujKaYfjOueGLD6Nqh5QSMEUH2vduTkKjHA=;
        b=kANUVRV2+Z+LUsDMO9zS2S2qebYmCq1LM88IqkgjPAfb3ioLj8lFlq/tOfdvLv29hE
         9YPICXoA2qZ3xusxF5FNSeFw7fKjtJ02v+nxwm/STCPY7WPygK2rWfKuIcEcEm2N7t8D
         H2lxju2bf2O6hscC7RQSGblnn0Eps0wk5UNXLSGm/4aG7d4z8kmjPLO1d99zI/54XxIo
         xRVUSos3+6IFGZ4u1Xuecci3i6ol6UD/BWnjiFzXXbN5u5/RE1p0NWkttU2qlquqezHr
         tXtAogl9xcytJ3ueko+6iS0B/CvG4Qo/Yo/o7goyPikmX0SLtlY3WUb4Y8Kv9dJMDh3n
         bHPA==
X-Gm-Message-State: ANhLgQ1+U8LL58q6jZZfijTpDyQrkjlvOHI/M5nuEtaPxkipS6fOLC9e
        HA/u0mrKb8eougMDPN5/WJI4JA==
X-Google-Smtp-Source: ADFU+vu+Jf1CVw4GQOx5dNoxGTymqpn5p1dmtyWCTiwwU99STlnO5FKSrpzUOQTz2PYCKmBpD/vEgA==
X-Received: by 2002:a37:db0a:: with SMTP id e10mr2637693qki.273.1584840985412;
        Sat, 21 Mar 2020 18:36:25 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id w18sm7979664qkw.130.2020.03.21.18.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 18:36:24 -0700 (PDT)
Date:   Sat, 21 Mar 2020 21:36:24 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        Oleg Nesterov <oleg@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [patch V2 08/15] Documentation: Add lock ordering and nesting
 documentation
Message-ID: <20200322013624.GA161885@google.com>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.211530902@linutronix.de>
 <20200321212144.GA6475@google.com>
 <874kuhqsz3.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874kuhqsz3.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 21, 2020 at 10:49:04PM +0100, Thomas Gleixner wrote:
[...] 
> >> +rwsems have grown interfaces which allow non owner release for special
> >> +purposes. This usage is problematic on PREEMPT_RT because PREEMPT_RT
> >> +substitutes all locking primitives except semaphores with RT-mutex based
> >> +implementations to provide priority inheritance for all lock types except
> >> +the truly spinning ones. Priority inheritance on ownerless locks is
> >> +obviously impossible.
> >> +
> >> +For now the rwsem non-owner release excludes code which utilizes it from
> >> +being used on PREEMPT_RT enabled kernels.
> >
> > I could not parse the last sentence here, but I think you meant "For now,
> > PREEMPT_RT enabled kernels disable code that perform a non-owner release of
> > an rwsem". Correct me if I'm wrong.
> 
> Right, that's what I wanted to say :)
> 
> Care to send a delta patch?

Absolutely, doing that now. :-)

thanks,

 - Joel

