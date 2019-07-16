Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCF36A3ED
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 10:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730972AbfGPIdI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 04:33:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44443 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfGPIdI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 04:33:08 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so19051855ljc.11
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 01:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=brQIicZU2VSNnk16G6cBzLLh2eApEsfO4nG8jsHLZ64=;
        b=C/YoxIHNg0vCUYhfq8OrbOTSrL3+8LkkrhP1p/wzg2lwwCN1WeIp7kcdHyU3Lw7UFt
         NC0Otzf0u+6PgoGCkjw9hQFs4N6fPjz5sHFVp/49VkhnC35WPYVrPk/glNmT3o3IECz2
         1NsIA3EAWCaeuXw0gwhiJX6O4TftAr0LcqzS8kwiB331KIFE3lvooQd3H9YjYDhbJU8S
         OzL5zWgGhuppQQSs+RgwL74kEKhf2TJGLlXs4bU32mALg7XWXqPMtf1gM6TTBARM62fU
         MuQf7mh5Nw6ntBs1MlICF1XdD6LP3eeK1GBHVycQNSYZbUnycxAGYyJncUEHY+TLQy7f
         zuUQ==
X-Gm-Message-State: APjAAAUw3YRZu5RxITiwVc/MzL6eZHDfBM5CUG3mPwI8p2QnkZ+dZxtT
        0doU7QuYbw94gmaZSxCy+KI=
X-Google-Smtp-Source: APXvYqyPUh75WjUqdZ0BAwhYjfBcfdmBhAcKZCxaQ/mq7PJU5DfUH1ika3U/JvtGUsMOUkgUMlHQYA==
X-Received: by 2002:a2e:3a05:: with SMTP id h5mr1705418lja.114.1563265985833;
        Tue, 16 Jul 2019 01:33:05 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id k82sm3581517lje.30.2019.07.16.01.33.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 01:33:04 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hnItc-0002uD-Mz; Tue, 16 Jul 2019 10:33:12 +0200
Date:   Tue, 16 Jul 2019 10:33:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v6] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190716083312.GA10939@localhost>
References: <20190701122114.2952-1-charlesyeh522@gmail.com>
 <20190701133233.GI27333@localhost>
 <CAAZvQQ4Eb8CZbFUG=ZApDyft2ig8mOSj4shbQv_UVCw0pm8p_Q@mail.gmail.com>
 <20190701152942.GA3787@localhost>
 <CAAZvQQ6JDgkC2SD4eYzBVYhq3ApMwWc_-gXQQVMBH+CaXZSK5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAZvQQ6JDgkC2SD4eYzBVYhq3ApMwWc_-gXQQVMBH+CaXZSK5A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Please do not top post, reply inline and trim irrelevant context.
  Specifically do not copy context to the top of the mail.

  Reordering your reply below. ]

On Wed, Jul 03, 2019 at 12:22:45AM +0800, Charles Yeh wrote:
> Johan Hovold <johan@kernel.org> 於 2019年7月1日 週一 下午11:29寫道：
> > On Mon, Jul 01, 2019 at 11:11:02PM +0800, Charles Yeh wrote:

> > > >         } else if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> > > > > +                     pl2303_vendor_write(serial, PL2303_HXN_RESET_CONTROL,
> > > > > +                             0);
> > > >
> > > > You again completely ignored my question about why you're wring 0
> > > > instead of 3 here.
> > > >
> > > > I'll ignore your patch until you explain.
> > >
> > > 3. In pl2303_open: Because TYPE_HXN is different from the instruction of reset
> > >    down/up stream used by TYPE_HX.
> > >    Therefore, we will also execute different instructions here.
> > >    The default of chip Reset Control is 0xFF(TYPE_HXN), therefore we will
> > >    write 0x00 to reset down/up stream(TYPE_HXN).
> >
> > I'm asking why you write the value 0 instead of 3 (or say, 0xfc)? Your
> > documentation said bit 0 and 1 are used to reset the up and downstream
> > pipes.
> >
> > To be more specific; what happens if I
> >
> >         1. set bit 0
> >         2. clear bit 0?
> >
> > and leave the other bits alone (write back the same value, e.g. 0xfe).

> You are right..
> set "1" is reset.
> set "0" is nothing.
> 
> I have used pl2303_update_reg instead pl2303_vendor_write which to reset
> the upstream and downstream pipe data

Ok, thanks for confirming. Note that I asked you about this back in
April (15 April).

In that very same mail thread I also pointed out that you must not
ignore review feedback. Even if for some reason disagree with it you
should at least explain why.

Johan
