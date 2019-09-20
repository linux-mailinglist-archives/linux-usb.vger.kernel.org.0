Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C26D2B8C19
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 09:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404989AbfITH4F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 03:56:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41046 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404904AbfITH4F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 03:56:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id f5so6139251ljg.8
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 00:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zC3qnS4WfNarkTq+YlTn0wS1+kQkRGzEx/YsOZMMIIs=;
        b=fQcgA64jnpWuG5D0mofziyHj18012LUd7ABgSU6Z5rsdAl5ojGQO18H1J2B1QGUKP8
         oF7ZGXhLOHVq1+d1z1mU1ucaERCUrQgagRe4NFsrrAIJcrGAd3wR6NHbdPVcrDlUiN2f
         OK4R/AtLojcOZiev3bPu5rRUpMaSC4Ywyll0eVjL/J3zs5MCgvjr+XD/dmCD1HZvhPyy
         I3biKtdIIlwiw20eX9x/NIwPAXFGAlkZvMsevJRsRHaWE85mDvywMFti+k+7pGGVz46X
         f05hLBOgN6A37++DEDtr0p0Zkk2aC4nrvaaHB46hRi5DrVAF2SLwalDYDY/wgnNY4PRp
         bhGA==
X-Gm-Message-State: APjAAAVWKlVYw7KToMpgdg8wgsY3VKwXBQoAWNuB0AUSUtb7KHchUJxA
        +JmSPAk9rSWRsXSTu5JuaYrdVb2p
X-Google-Smtp-Source: APXvYqylIHaUQGnHjHmwlaofpxX13FRqMtUst1F//KfHNsY+yb5YjdATOJkIXxHsLUGz6JkEXQn2vg==
X-Received: by 2002:a2e:9f52:: with SMTP id v18mr8529683ljk.166.1568966162678;
        Fri, 20 Sep 2019 00:56:02 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id y22sm313910lfb.75.2019.09.20.00.56.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 00:56:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iBDlq-0000y1-5L; Fri, 20 Sep 2019 09:56:02 +0200
Date:   Fri, 20 Sep 2019 09:56:02 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190920075602.GI30545@localhost>
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <20190716084907.GB10939@localhost>
 <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 27, 2019 at 04:40:39PM +0800, Charles Yeh wrote:
> Johan Hovold <johan@kernel.org> 於 2019年7月16日 週二 下午4:49寫道：
> > >  #define PL2303_FLOWCTRL_MASK         0xf0
> > > +#define PL2303_HXN_FLOWCTRL_MASK     0x1C
> > > +#define PL2303_HXN_FLOWCTRL          0x0A
> >
> > I asked you to keep related defines together (and to move the mask where
> > the register define was, not the other way round). Please move these to
> > the other HXN defines below, and keep the register address defines
> > before the corresponding bit defines.
> 
> Charles Ans:

[ You don't need to prefix your replies like this, I can tell from the
  number of > signs. ]

> I am not 100% sure what you mean, please see if it is defined below
> 
> #define PL2303_FLOWCTRL_MASK        0xf0
> 
> #define PL2303_READ_TYPE_HX_STATUS    0x8080
> 
> #define PL2303_HXN_CTRL_XON_XOFF    0x0C
> #define PL2303_HXN_CTRL_RTS_CTS        0x18
> #define PL2303_HXN_CTRL_NONE        0x1C
> #define PL2303_HXN_FLOWCTRL_MASK    0x1C
> #define PL2303_HXN_FLOWCTRL        0x0A

Yes, that's better, but you're mixing register addresses, bit values and
masks above. Perhaps things would be more clear if you but a _REG suffix
on the register defines and order things as follows:

	#define PL2303_HXN_<name1>_REG			0xX1
	#define PL2303_HXN_<name1>_<field>_MASK		0xY1
	#define PL2303_HXN_<name1>_<field>_<value>	0xZ1

	#define PL2303_HXN_<name2>_REG			0xX2
	#define PL2303_HXN_<name2>_<field>_MASK		0xY2
	#define PL2303_HXN_<name2>_<field>_<value>	0xZ2

The idea is simply to keep related defines together and not mix
register address, masks and value defines.

Keep registers sorted by address, and bit masks and values by bit order
(e.g. MSB first).

> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE    0x03
> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE_MASK    0x03
> #define PL2303_HXN_RESET_CONTROL    0x07
> 
> > > +
> > > +#define PL2303_HXN_RESET_CONTROL_MASK        0x03
> > This makes no sense. The whole register is used for reset. If you want a
> > define that can be used for resetting both pipes then add two separate
> > defines for up and down respectively, and add a third define for
> > resetting both buffer as a bitwise OR of the two.
> 
> Charles Ans:
> Yes,The whole register is used for reset.
> Bit 0 and bit 1 are used for up & downstream data pipe,
> Bit 2 for interface reset
> Bit 4 for chip reset.
> 
> But I only reset bit 0 & bit 1.

Yes, but you need to reflect that in how you name your defines. Add two
separate defines for up and downstream data pipe reset. If you want you
add a third as the bitwise-OR of the two as well (perhaps with a _BOTH
suffix in the name).

> > Also move this one after the corresponding register address define
> > below.
> >
> > > +#define PL2303_HXN_RESET_CONTROL     0x07
> > > +#define PL2303_HXN_CTRL_XON_XOFF     0x0C
> > > +#define PL2303_HXN_CTRL_RTS_CTS              0x18
> > > +#define PL2303_HXN_CTRL_NONE         0x1C
> 
> Charles Ans:
> I am not 100% sure what you mean, please see if it is defined below
> 
> #define PL2303_FLOWCTRL_MASK        0xf0
> 
> #define PL2303_READ_TYPE_HX_STATUS    0x8080
> 
> #define PL2303_HXN_CTRL_XON_XOFF    0x0C
> #define PL2303_HXN_CTRL_RTS_CTS        0x18
> #define PL2303_HXN_CTRL_NONE        0x1C
> #define PL2303_HXN_FLOWCTRL_MASK    0x1C
> #define PL2303_HXN_FLOWCTRL        0x0A
> 
> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE    0x03
> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE_MASK    0x03
> #define PL2303_HXN_RESET_CONTROL    0x07

I meant that you should move the bit values (masks) after the register
address that they apply to (as also mentioned above). For example,

	#define PL2303_HXN_RESET_REG	 			0x07
	#define PL2303_HXN_RESET_UPSTREAM_PIPE			0x02
	#define PL2303_HXN_RESET_DOWNSTREAM_PIPE		0x01

> > > +             pl2303_update_reg(serial, PL2303_HXN_RESET_CONTROL,
> > > +                             PL2303_HXN_RESET_CONTROL_MASK, 0x03);
> >
> > So two things; first, do you really need to read back the current value?
> > I would assume that it always reads back as 0 and that writing 0x03 in
> > this case would be sufficient to reset both buffers.
> >
> 
> Charles Ans:
>  Yes, I want to read back the current value.
> because the whole register is used for reset.
> Bit 0 and bit 1 are used for up & downstream data pipe,
> Bit 2 for interface reset
> Bit 4 for chip reset.
> 
> But I only reset bit 0 & bit 1.

Yes, but that doesn't imply that you need to read back the old value.

I'm assuming it would either always read back as 0, or you would read
back the previous value written, which means you could end up resetting
something you did not intend.

Either way, you should not read back the current value when resetting
the data pipes.

> > Second, please use a define for 0x03; no magic constants, as we have
> > discussed before. You don't need a separate mask define if you're always
> > resetting both buffers together (just use the same value define twice).
> 
> Charles Ans:
> OK, I will define for 0x03.
> 
> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE    0x03

As mentioned above, add separate defines for each pipe. You can also add
a third as their bitwise OR.

Johan
