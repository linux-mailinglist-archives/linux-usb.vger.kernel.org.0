Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42F2E18BDD8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 18:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgCSRUv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 13:20:51 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46913 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgCSRUv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 13:20:51 -0400
Received: by mail-ed1-f67.google.com with SMTP id ca19so3637831edb.13
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mGnzjLPuiF5jh+YmVcnbPs/rygoBzTtr0yQpmvu1C/U=;
        b=ho5WkQIp7FBmmWnNEs8qarjlXHQ/bMpYIjVlz5diN+cFqHjIA9Cfpaie2yvrq56MzY
         6TnA04IH3cBRxYREMcsiPUpLCig/QPzuawQ7+ZDABjg2D7iZ5uNSWio6VnyJC48k22lp
         9sUOw53EsymdqqmachpMBK4cZKv94z+KiqobI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mGnzjLPuiF5jh+YmVcnbPs/rygoBzTtr0yQpmvu1C/U=;
        b=hYBnliOJmJpv8YnnMVTNEEAkFgGoHiWoU50zctC7sk8cA/CGgVbD0oBlCTVN2tyCPs
         wY4xErE0Blfyhtbgqom20HOpCYxlCFs8lA+1hspC6ZOvE+ae7qjlIPMFuStKA0/67kXo
         Quo97ULIiPn3UhTPWPwxr+tF42Nu9isaslSxR1P8rcFLLk33ewIRqJSh18cwVytmjx6e
         zCfRoIm4qEyfGMNcDjYf+Y9JwUw+xsoL6xjy3B7SNB87xxBzVUK6sSDybqvkiWUyaaCi
         wnN0yH4rmavtxXq9gZl5gT/R34pEe3D4FAmtrvfgBSHzj1FxkpeONpv2172wODq7pPnx
         aqfQ==
X-Gm-Message-State: ANhLgQ0IQ0oDNHC0KxV//RjS0D1O0wCKkUEvJ5QlKVtsZ4RdfB16HxKM
        W69IwXbKm2RrEQmKJGdG73la8hbuZ4k=
X-Google-Smtp-Source: ADFU+vtLQFbIdA27uyzrQMjR6lXydO4G9yCF+gI49DP/4zqt4MuMB/gnmxcZFelbTrDVeFNFA2v3Vg==
X-Received: by 2002:aa7:da5a:: with SMTP id w26mr3947024eds.274.1584638449461;
        Thu, 19 Mar 2020 10:20:49 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id m4sm194192edq.23.2020.03.19.10.20.49
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2020 10:20:49 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id n25so2741346eds.10
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 10:20:49 -0700 (PDT)
X-Received: by 2002:a19:c7:: with SMTP id 190mr2779646lfa.30.1584637965843;
 Thu, 19 Mar 2020 10:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200318204302.693307984@linutronix.de> <20200318204408.521507446@linutronix.de>
In-Reply-To: <20200318204408.521507446@linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 19 Mar 2020 10:12:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3bwUD9=y4Wd6=Dh1Xwib+N3nYuKA=hd3-y+0OUeLcOQ@mail.gmail.com>
Message-ID: <CAHk-=wj3bwUD9=y4Wd6=Dh1Xwib+N3nYuKA=hd3-y+0OUeLcOQ@mail.gmail.com>
Subject: Re: [patch V2 11/15] completion: Use simple wait queues
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-wireless@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 18, 2020 at 1:47 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> There is no semantical or functional change:

Ack, with just the explanation, I'm no longer objecting to this.

Plus you fixed and cleaned up the odd usb gadget code separately
(well, most of it).

              Linus
