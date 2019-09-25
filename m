Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09622BD980
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 10:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405731AbfIYIGw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 04:06:52 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39094 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404849AbfIYIGv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 04:06:51 -0400
Received: by mail-lj1-f193.google.com with SMTP id y3so4626590ljj.6
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2019 01:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=tkuY8ncEO85ojbwLeZKZIIcu93CM2pHc6dchLHrkx54=;
        b=IN0yTzV/DaVeYV7gtrHTUqC6PVSMwNeArm6PceJ1kedxmgAjSt3CXDK+qpV8wCurnH
         bC/0hqR9j34YQejfOqmpx9jRFyLEaGeb311KYPXPF0OxAzvQO/ks0l7SKfGtoPkxB0+M
         ubgUYwar3ZkZlgQ0pD4OXyl7puZXv6n5ZpjLPyRimmmW5R0Br7D20RfDmBF31VCqNVCe
         IW1BR9w0cOncmwsYg0Cj0QWHeOQH4/EMVt3ylVhPRu1c43ibTVN5MGvPaAHLiWoH7IPM
         AbjgTk3BvaaXVcTfU4mg+2JPgEojZr7ps0UkBCNlBZLF6Wo1M+9pBv0fh5Hr4//HeO7Y
         Q/mw==
X-Gm-Message-State: APjAAAWwDbPncJb+ubJq79+Kvm1fV0gbINpr7+EzP9uWGfr4Mh+KKeuk
        Qtyr/D3217jlTvoq8GOFIQo=
X-Google-Smtp-Source: APXvYqyQFnq7/cJo2ZkeON0XfTngoJpmW2DiFDNkq5+kBuk0HNMaBUlszxYHZI1M9Nxf/w+ojn+eOg==
X-Received: by 2002:a2e:9693:: with SMTP id q19mr4986660lji.12.1569398809649;
        Wed, 25 Sep 2019 01:06:49 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id q14sm1021599ljc.7.2019.09.25.01.06.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 01:06:48 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iD2K6-0003uI-I5; Wed, 25 Sep 2019 10:06:54 +0200
Date:   Wed, 25 Sep 2019 10:06:54 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190925080654.GC14159@localhost>
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <20190716084907.GB10939@localhost>
 <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
 <20190920075602.GI30545@localhost>
 <CAAZvQQ6613eO6G0Gm-Sv3yWqTG_rRrynF=xVSLgz2uakXU2=ZQ@mail.gmail.com>
 <20190923102440.GA30545@localhost>
 <CAAZvQQ6MPrsfTcsnyD4DbKDVJf1WyLoxqW7q07k2RO1Cs5yd5Q@mail.gmail.com>
 <20190923130804.GC30545@localhost>
 <CAAZvQQ51rCF6PqZWU22fkwfgUimsnyCMtC0mb3YRSikm0z=W7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAZvQQ51rCF6PqZWU22fkwfgUimsnyCMtC0mb3YRSikm0z=W7A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 25, 2019 at 09:20:07AM +0800, Charles Yeh wrote:
> Johan Hovold <johan@kernel.org> 於 2019年9月23日 週一 下午9:08寫道：
> >
> > Yes, the above looks good.
> >
> 
> Thank you for your reply
> 
> I have already written a new patch[v8] file,
> if you have free time. Please check as soon as possible...thanks!

I'll start processing patches for 5.4 next week when the merge window
closes.

Meanwhile you can double check that you've considered all
review-feedback you've gotten so far.

I don't think you ever replied to my last comment about the reset
register and why I thought using plain write (not read, mask, write) was
the right thing to do.

Does the register always read back as 0, or does it read back as the
last value written?

Johan
