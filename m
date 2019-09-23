Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3782BB230
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 12:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbfIWKYj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 06:24:39 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33055 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfIWKYj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 06:24:39 -0400
Received: by mail-lf1-f67.google.com with SMTP id y127so9697627lfc.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2019 03:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=t5YZVn3xQR526vCEfZS1IP+d5wDROTuEm2ajYD12gZM=;
        b=S+lVnQy8FiZGbHLidGar8esemaqvAE7RHNZYJyFFQ5AZpizryzgFwsh2kDF2LpGOeT
         MuA2GE7PAkGXZgXsE5Iw5Qi07BfRRCzoM1XDvC733WEtkNr7UvGR8ZRqIVagyw2grYo8
         2FnM8H7bM8EH+h5KKVo9GmlBb9yfJ7uqYFb24N7MCq4WxQ6+pdXvS1f3STqpundsxAsG
         eprJDH9Q8DPSETzgF3WJ1OW2EiT/0s1q67LpFo8rerstJO9SisXuMAbXE6zHLLvelPR/
         1MdHb/vj2U382EIPLnn5lkz2oBV7wicCQtcvAz04Y4wbgGiGhFj6gXKUlSFkJER7mS9J
         salQ==
X-Gm-Message-State: APjAAAUwmZR/c421EKn3mFiOcyog9QiITt9l/4mmnOi266fzeFlQuYPn
        SqeSpjx8bM7SrPrDgsdyp3r8m9RC
X-Google-Smtp-Source: APXvYqwpYQvU4ZvRbaCo6TUFY5vCHnMHwdTmufvR4fGWaKEUr0/3VBi1r15R5pHgM06RAAFUPk65LQ==
X-Received: by 2002:a19:22cd:: with SMTP id i196mr15929780lfi.160.1569234277416;
        Mon, 23 Sep 2019 03:24:37 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id w16sm2182394lji.42.2019.09.23.03.24.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 03:24:36 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iCLWK-0007EZ-34; Mon, 23 Sep 2019 12:24:40 +0200
Date:   Mon, 23 Sep 2019 12:24:40 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190923102440.GA30545@localhost>
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <20190716084907.GB10939@localhost>
 <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
 <20190920075602.GI30545@localhost>
 <CAAZvQQ6613eO6G0Gm-Sv3yWqTG_rRrynF=xVSLgz2uakXU2=ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAZvQQ6613eO6G0Gm-Sv3yWqTG_rRrynF=xVSLgz2uakXU2=ZQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23, 2019 at 05:53:34PM +0800, Charles Yeh wrote:
> Johan Hovold <johan@kernel.org> 於 2019年9月20日 週五 下午3:56寫道：
> > Yes, that's better, but you're mixing register addresses, bit values and
> > masks above. Perhaps things would be more clear if you but a _REG suffix
> > on the register defines and order things as follows:
> >
> >         #define PL2303_HXN_<name1>_REG                  0xX1
> >         #define PL2303_HXN_<name1>_<field>_MASK         0xY1
> >         #define PL2303_HXN_<name1>_<field>_<value>      0xZ1
> >
> >         #define PL2303_HXN_<name2>_REG                  0xX2
> >         #define PL2303_HXN_<name2>_<field>_MASK         0xY2
> >         #define PL2303_HXN_<name2>_<field>_<value>      0xZ2
> >
> > The idea is simply to keep related defines together and not mix
> > register address, masks and value defines.
> >
> > Keep registers sorted by address, and bit masks and values by bit order
> > (e.g. MSB first).
> 
> Thank you for your reply
> 
> Charles Ans:
> The new define is follows
> 
> #define PL2303_READ_TYPE_HX_STATUS    0x8080
> 
> #define PL2303_HXN_FLOWCTRL_REG        0x0A
> #define PL2303_HXN_FLOWCTRL_MASK    0x1C
> #define PL2303_HXN_FLOWCTRL_NONE        0x1C
> #define PL2303_HXN_FLOWCTRL_RTS_CTS        0x18
> #define PL2303_HXN_FLOWCTRL_XON_XOFF    0x0C
> 
> #define PL2303_HXN_RESET_REG    0x07
> #define PL2303_HXN_RESET_UPSTREAM_PIPE    0x02
> #define PL2303_HXN_RESET_DOWNSTREAM_PIPE    0x01

That looks much better. But please move the reset defines above the
flow control ones to keep the registers sorted by address (0x7 < 0xa).

> > Yes, but that doesn't imply that you need to read back the old value.
> >
> > I'm assuming it would either always read back as 0, or you would read
> > back the previous value written, which means you could end up resetting
> > something you did not intend.
> >
> > Either way, you should not read back the current value when resetting
> > the data pipes.
> >
> 
> Thank you for your reply
> 
> Charles Ans:
> The new code is follows
> 
>     pl2303_vendor_write(serial,
>                 PL2303_HXN_RESET_REG,
>                 PL2303_HXN_RESET_UPSTREAM_PIPE |
> PL2303_HXN_RESET_DOWNSTREAM_PIPE);
> 
> 
> Please confirm the above new define & code..
> If there is no problem.. I will write a new Patch file.

Also looks good, thanks. Just move the reset define block as mentioned
above.

Johan
