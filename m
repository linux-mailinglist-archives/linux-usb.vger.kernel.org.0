Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501C7F3502
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 17:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730299AbfKGQwL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 11:52:11 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45719 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729451AbfKGQwL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 11:52:11 -0500
Received: by mail-lj1-f193.google.com with SMTP id n21so3035246ljg.12
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QmbLva0bcejWfZ5vroXCCCNjtDh9+KzeuzRfAkUcNVw=;
        b=RC+2jxnet1c9HEhXNBxtTTpEfLinckdbFJn5Bmrik3m/W7Num2OjpLxTQS23AoRNRr
         Aj4dYDnclnksK9me7oG5iyDsfchGPA4TwVOyMbOGN2PJFpJroPg+VNW7luk63nWV0aoz
         X/nFl5ue/aQhw5K+6Ogz8TNi8yWG86H2/HKz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QmbLva0bcejWfZ5vroXCCCNjtDh9+KzeuzRfAkUcNVw=;
        b=SDHVrf5iucx+0Dei1EhS2kDsOWxiXSGl8B3+11amBkuBVPHJ/60a8vfULIDlA+XiIe
         hlQdRATEBShAGXEOAt3Zcz3b+0PlTJ9MtPESj4gT0YeEamCxud7DyHQJnATzGtDw/aPj
         am7ZgXcPaJziazyNR16oCKF5NvFyUq7z79+ZJDl0PIzPFqqCTrg5u4TxAOakHTN4ds+6
         8tXQZ/Pnbq07NhKo1UFIxj7mEYEjmGdRrDGRIHh0zyc0/z6TnxP9J2wR3pC3I70vKf1P
         ft2VKvAX0lFelYr4YhZd4GKWCuOP4I9WAPrOdINKL1nkXgJMzD9w6z3+7nto49aX2nsr
         DY0g==
X-Gm-Message-State: APjAAAVYcpAkR2F0oel41ZHCubWI2cmklaKiuyCuSEVCVgicgLsSscTF
        B4vQHXTGh6P4uswRgi3rHU4qCUEHGQQ=
X-Google-Smtp-Source: APXvYqzcDLu/V7Cqfw/SP0hDyLeG4ymHhFCNFigSUISrKJ2biohMnEDBuPJDyE4F0wwyt32CyTnudA==
X-Received: by 2002:a2e:3311:: with SMTP id d17mr3227214ljc.237.1573145528646;
        Thu, 07 Nov 2019 08:52:08 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id u12sm1223636lji.50.2019.11.07.08.52.06
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2019 08:52:07 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id d6so1751585lfc.0
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 08:52:06 -0800 (PST)
X-Received: by 2002:ac2:5bca:: with SMTP id u10mr3159115lfn.134.1573145526683;
 Thu, 07 Nov 2019 08:52:06 -0800 (PST)
MIME-Version: 1.0
References: <157262967752.13142.696874122947836210.stgit@warthog.procyon.org.uk>
 <20191107090306.GV29418@shao2-debian>
In-Reply-To: <20191107090306.GV29418@shao2-debian>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 7 Nov 2019 08:51:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiJ+jaT5Ev-wCg7iGNNO_JFUyMDcat0KDdA2b_+n_cZCQ@mail.gmail.com>
Message-ID: <CAHk-=wiJ+jaT5Ev-wCg7iGNNO_JFUyMDcat0KDdA2b_+n_cZCQ@mail.gmail.com>
Subject: Re: [pipe] d60337eff1: phoronix-test-suite.noise-level.0.activity_level
 144.0% improvement
To:     lkp report check <rong.a.chen@intel.com>
Cc:     David Howells <dhowells@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        lkp@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 7, 2019 at 1:03 AM lkp report check <rong.a.chen@intel.com> wrote:
>
> FYI, we noticed a 144.0% improvement of phoronix-test-suite.noise-level.0.activity_level due to commit:
>
> commit: d60337eff18a3c587832ab8053a567f1da9710d2 ("[RFC PATCH 04/11] pipe: Use head and tail pointers for the ring, not cursor and length [ver #3]")

That sounds nice, but is odd. That commit really shouldn't change
anything noticeable. David, any idea?

               Linus
