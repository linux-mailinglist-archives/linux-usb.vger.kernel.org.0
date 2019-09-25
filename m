Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF5BDBDB34
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 11:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfIYJir (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 05:38:47 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38987 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbfIYJiq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 05:38:46 -0400
Received: by mail-lf1-f67.google.com with SMTP id 72so3692573lfh.6
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2019 02:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AcQcjeO1hlRTdanBOWXkWvcyHxEO7tbMyjMXrFcHW2I=;
        b=Hb3Nw2JQveC6tlKnu0FiU1BSUlJsc5Wlz5/mCBojz9b6O1L4cBDnGuCJGLhcHIa1xR
         3n8Z6YSYIiyFiVfOLdDe+oujUaMf28jjcm+LLJIZnuYgWIL7O6lbHIV29SZqaIAjP2Ku
         ciPeTZWRi7BzwMG6P7t2KZ1+0HxXEpvJKfDCP0s4NRohn7FnD36z1v1lIXVqYrLuUyXG
         BtPNGvbrUkAyq3NpwVgHwo2ynBOP+sKU7gD2fOGBruHvipwAOFP88Rmn82AUrbJpHag1
         PAo82xxIliT7GrSOIt91aUd7OjIOj990xoxk57/QFoAi/856G6mprf2Uf8yt2j009uUv
         DYQg==
X-Gm-Message-State: APjAAAUWIPfjGsCvwh1pHtI2KguZyQs3TE+Mc1pTelNzJz8RlMwWW7FY
        9FIr+e++54WU6m7LSPVYHEA=
X-Google-Smtp-Source: APXvYqzwxCQlRa3KNsrQ6w8XngfTqJXhhA03qwRKKyxbDti9HUkBspQX19Rg7yXiP0+iomWdzTyVGw==
X-Received: by 2002:a19:ec02:: with SMTP id b2mr2406865lfa.163.1569404322692;
        Wed, 25 Sep 2019 02:38:42 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id e21sm1034641lfj.10.2019.09.25.02.38.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 02:38:41 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iD3l2-0002OL-4Q; Wed, 25 Sep 2019 11:38:48 +0200
Date:   Wed, 25 Sep 2019 11:38:48 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190925093848.GE14159@localhost>
References: <20190716084907.GB10939@localhost>
 <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
 <20190920075602.GI30545@localhost>
 <CAAZvQQ6613eO6G0Gm-Sv3yWqTG_rRrynF=xVSLgz2uakXU2=ZQ@mail.gmail.com>
 <20190923102440.GA30545@localhost>
 <CAAZvQQ6MPrsfTcsnyD4DbKDVJf1WyLoxqW7q07k2RO1Cs5yd5Q@mail.gmail.com>
 <20190923130804.GC30545@localhost>
 <CAAZvQQ51rCF6PqZWU22fkwfgUimsnyCMtC0mb3YRSikm0z=W7A@mail.gmail.com>
 <20190925080654.GC14159@localhost>
 <CAAZvQQ5gJr_pTgA+XGyMfcf8Fakvg4zO3hcOcwufr7HOPn4DPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAZvQQ5gJr_pTgA+XGyMfcf8Fakvg4zO3hcOcwufr7HOPn4DPQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 25, 2019 at 05:36:23PM +0800, Charles Yeh wrote:
> Johan Hovold <johan@kernel.org> 於 2019年9月25日 週三 下午4:06寫道：
> > Meanwhile you can double check that you've considered all
> > review-feedback you've gotten so far.
> >
> > I don't think you ever replied to my last comment about the reset
> > register and why I thought using plain write (not read, mask, write) was
> > the right thing to do.
> >
> > Does the register always read back as 0, or does it read back as the
> > last value written?
> 
> Charles Ans:
> I just asked my colleague, who is RD of design PL2303 hardware,
> His answer is to read 0 forever.
> 
> Does the register always read back as 0, or does it read back as the
> last value written?
> Ans: Yes, the register"#define PL2303_HXN_RESET_REG 0x07" always
> read back as 0.
> 
> I hope the above content has an answer to your question:
> If there are other questions, please try to raise it.. thanks

It does, thanks for confirming.

Johan
