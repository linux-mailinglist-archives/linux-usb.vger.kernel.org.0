Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271665BFD6
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 17:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbfGAP3v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 11:29:51 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39064 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfGAP3v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 11:29:51 -0400
Received: by mail-lj1-f194.google.com with SMTP id v18so13651300ljh.6
        for <linux-usb@vger.kernel.org>; Mon, 01 Jul 2019 08:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yaJBSh2eJmCFfZVDJU04OZRGk1HNYuaIZWqZf9nZ8ZM=;
        b=W/AwrFBTObldHhgSk83Xz2A70RpvITR6TGmeZ+eN7ONJjuFfYhYxeLSxBIsRVZaI6I
         Ab9zbE9k1ffv8GRb7apCGFMyPwcGV7Lts5fSkAecaZSz8ndxeeE7crqNHQPuliXqWjDF
         QZfbbRLEY+IkFxVj4vvVwi+BgK0MGFy1UUJi4cFkzFwln7WhRxLN5X1DLiTTD2pU2IS1
         qVc6SqJvj6HF0nF2nnGzwpMBPuovZ2E+8X4j4eBzGo2Rr6/Y50k45MC0qL09yasLmAjg
         62AKwWa0+YzNPSO92CRopUp++hDtSoWOKEN3oU2BktdULR2PE/rm6UAh2edV+uz1OE0x
         uFNA==
X-Gm-Message-State: APjAAAUOwl2dyB3jXagJLBUzEYCBHjf1h1pxES6+q03V37EGAVT2Y7ni
        pFWAG2HjESolcBKX0YMDpqU=
X-Google-Smtp-Source: APXvYqzIucO7VF7Op8YdxNsQ63+FtrBDuX4dYhzcyI1ZCP+4UqZaowmvyfCUtoD3ybjqVDgd6LbwZA==
X-Received: by 2002:a2e:9951:: with SMTP id r17mr14217944ljj.125.1561994989211;
        Mon, 01 Jul 2019 08:29:49 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id f1sm3344263ljk.86.2019.07.01.08.29.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 08:29:48 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hhyFS-00012l-KI; Mon, 01 Jul 2019 17:29:43 +0200
Date:   Mon, 1 Jul 2019 17:29:42 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v6] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190701152942.GA3787@localhost>
References: <20190701122114.2952-1-charlesyeh522@gmail.com>
 <20190701133233.GI27333@localhost>
 <CAAZvQQ4Eb8CZbFUG=ZApDyft2ig8mOSj4shbQv_UVCw0pm8p_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ4Eb8CZbFUG=ZApDyft2ig8mOSj4shbQv_UVCw0pm8p_Q@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 01, 2019 at 11:11:02PM +0800, Charles Yeh wrote:
> > > +             if (spriv->quirks & PL2303_QUIRK_LEGACY) {
> > > +                     pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK,
> > > +                             0x40);
> >
> > No need to break this line even if you end up with slightly more than 80
> > chars.
> >
> OK. I will ignore "WARNING: line over 80 characters".

Yeah, it's ok to go slightly above 80 chars when it improves readability.

> > > +             } else if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> > > +                     pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> > > +                             PL2303_HXN_FLOWCTRL_MASK,
> > > +                             PL2303_HXN_CTRL_RTS_CTS);
> >
> > Again, continuation lines should be indented at least two tabs further
> > (you only use one tab now).
> >
> 
> I have done it the way you do today...but after checking
> ./scripts/checkpatch.pl.. I got another warning message...
> So I am a little confused now...
> Previously before submitting.. must first pass ./scripts/checkpatch.pl
> check. No ERROR, or WARRING message...
> 
> I will return to the office tomorrow ... I will post another warning
> message (according to the way you mentioned)

checkpatch isn't always right. Just remember to indent continuation
lines at least two tabs further, such as

	pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
			PL2303_HXN_FLOWCTRL_MASK,
			PL2303_HXN_CTRL_RTS_CTS);

> >         } else if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> >
> > > +                     pl2303_vendor_write(serial, PL2303_HXN_RESET_CONTROL,
> > > +                             0);
> >
> > You again completely ignored my question about why you're wring 0
> > instead of 3 here.
> >
> > I'll ignore your patch until you explain.
> 
> 3. In pl2303_open: Because TYPE_HXN is different from the instruction of reset
>    down/up stream used by TYPE_HX.
>    Therefore, we will also execute different instructions here.
>    The default of chip Reset Control is 0xFF(TYPE_HXN), therefore we will
>    write 0x00 to reset down/up stream(TYPE_HXN).

I'm asking why you write the value 0 instead of 3 (or say, 0xfc)? Your
documentation said bit 0 and 1 are used to reset the up and downstream
pipes.

To be more specific; what happens if I

	1. set bit 0
	2. clear bit 0?

and leave the other bits alone (write back the same value, e.g. 0xfe).

Johan
