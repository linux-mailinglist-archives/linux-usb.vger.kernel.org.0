Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3759A88CC1
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2019 20:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfHJSXV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Aug 2019 14:23:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34216 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfHJSXV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Aug 2019 14:23:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id b13so47707951pfo.1
        for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2019 11:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1wMbnmcvYThr8v75tXw+NLJxxgTL8aTm8bPoijuWeXk=;
        b=CfXBw9LLS2F5CcDSorlej7BcL3a8HeAP9pALu5KvwWwkMSPiuKBuVIY9XQmieFUYCE
         lFxYg0yhxmEmzZCTXKoFTjfqBxXQsPTI1k2u20Amu4jFI6EvtZeKX7o+G7ygYkeu9GJf
         w/8ZmCDP/svUHzPv4FGiys1oJaPjVepGIg1vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1wMbnmcvYThr8v75tXw+NLJxxgTL8aTm8bPoijuWeXk=;
        b=UzQwnLtR4exgGTAYUf6ue2kXrZ7O7oyhwMgvKdzxGpNnVUiuP3JNO1nMY/RleOmqVh
         JKpqEBnq7WJZjD9L+mMVG+RlGqsRQxuxxNvA5B16+2KkF6hV44vuCkdb1KOJFw0kPaPW
         /4F+78vxaY9rEy1YgXlF3Wx6kevMuYRnXTKY7ETiTDvtZv+UJu+UzuijgBMQVukrGTIh
         sUeIEIFQOmZD9SO91xM+aLJ1Ji4ffMgtnyx4HRtcRgRugKN+EMU1hXMPoAvtgfRuvKwg
         luxldgERjYdy12o/3aOeAi5htGVqDqbEQyv7GgXltf37jt7O8kTIidOOL5J6fPmQQ+l6
         orOg==
X-Gm-Message-State: APjAAAWJLnaRJ4dUOO/BK87VTeTQVTfBueF9255d1FLnoQA0/jb7OiUU
        LmrMrXUdXewR2OA84zxpBB7tDg==
X-Google-Smtp-Source: APXvYqwv9kKazhsFHfQH/poO6zFrpDEO8Q9vVz6A2xAvqR+Dr3CXy+nbi3/t+heCuUrDlMSmH7frYw==
X-Received: by 2002:a17:90a:bf03:: with SMTP id c3mr14911536pjs.112.1565461400408;
        Sat, 10 Aug 2019 11:23:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a1sm72180032pgh.61.2019.08.10.11.23.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Aug 2019 11:23:19 -0700 (PDT)
Date:   Sat, 10 Aug 2019 11:23:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        syzbot <syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com>,
        Michael Hund <mhund@ld-didactic.de>, akpm@linux-foundation.org,
        andreyknvl@google.com, cai@lca.pw, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Subject: Re: BUG: bad usercopy in ld_usb_read
Message-ID: <201908101120.BE5034521A@keescook>
References: <20190809085545.GB21320@kroah.com>
 <Pine.LNX.4.44L0.1908091100580.1630-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1908091100580.1630-100000@iolanthe.rowland.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 09, 2019 at 11:13:00AM -0400, Alan Stern wrote:
> In fact, I don't see why any of the computations here should overflow
> or wrap around, or even give rise to a negative value.  If syzbot had a
> reproducer we could get more debugging output -- but it doesn't.

Yeah, this is odd. The only thing I could see here with more study was
that ring_tail is used/updated outside of the rbsl lock in
ld_usb_read(). I couldn't convince myself there wasn't a race against
the interrupt, but I also couldn't think of a way it could break...

-- 
Kees Cook
