Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21DC4D4253
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 16:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbfJKOIZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 10:08:25 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33758 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbfJKOIZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 10:08:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so10006464ljd.0;
        Fri, 11 Oct 2019 07:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kq69ey+m/z5tqfV/9IOKfxX5Rfcxt+ZNgiO1EUz+ow8=;
        b=bE6JQ9FDGbX4JfXPKcJcm9LPO/a0MlHLlqZYmYDgcUaCRWqAnDVo7vNB91FMEZhoTd
         A2pWp79rBtnJ8f4Tw/DaU3zUVUf0fXp6hZuyVBjWfhOH4q3guYZPrsPRvbuMN//9SDTj
         BUeccl4PZy1HwlGJr26TuWPR2jn3eUXphjC5DQYodMxwUbTnK+38+Jvm5ff6ebqT4pRR
         7zy91eaIVYgoOukq7v1Rg9I6aQfpwJRNj8qtTOmTEpgU7S5t93iLi6vEqFUwU5RcpLNP
         zSFbT8o9szZsUTsyDACuu47N6rfglU1zji0921jPL+S0qnm44TgMHpbj3EWbs4imJAcc
         ufhg==
X-Gm-Message-State: APjAAAXnKw56sYnTJAYbBrpwxdjGDRIowVMhFTX2XKH41gC2s5zO43M4
        PPLik/XtnnbLyvT8TJfpk54=
X-Google-Smtp-Source: APXvYqze3lQWca18LwMM/zYo2hgKC1VfqkFxWyXmDo3h78mUHJsFxxdWHAperjG4kzVSi4kBh8belg==
X-Received: by 2002:a2e:9707:: with SMTP id r7mr5946539lji.219.1570802900984;
        Fri, 11 Oct 2019 07:08:20 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id n3sm2001976lfl.62.2019.10.11.07.08.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 07:08:20 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iIvap-0000x9-Kb; Fri, 11 Oct 2019 16:08:31 +0200
Date:   Fri, 11 Oct 2019 16:08:31 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     walter harms <wharms@bfs.de>,
        Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: legousbtower: fix a signedness bug in tower_probe()
Message-ID: <20191011140831.GJ13531@localhost>
References: <20191011133525.GB22905@mwanda>
 <5DA088DE.5040902@bfs.de>
 <20191011135855.GE4774@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011135855.GE4774@kadam>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 04:58:56PM +0300, Dan Carpenter wrote:
> On Fri, Oct 11, 2019 at 03:51:26PM +0200, walter harms wrote:
> > 
> > 
> > Am 11.10.2019 15:35, schrieb Dan Carpenter:
> > > The problem is that sizeof() is unsigned long so negative error codes
> > > are type promoted to high positive values and the condition becomes
> > > false.
> > > 
> > > Fixes: 1d427be4a39d ("USB: legousbtower: fix slab info leak at probe")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/usb/misc/legousbtower.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
> > > index 9d4c52a7ebe0..835908fe1e65 100644
> > > --- a/drivers/usb/misc/legousbtower.c
> > > +++ b/drivers/usb/misc/legousbtower.c
> > > @@ -881,7 +881,7 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
> > >  				  get_version_reply,
> > >  				  sizeof(*get_version_reply),
> > >  				  1000);
> > > -	if (result < sizeof(*get_version_reply)) {
> > > +	if (result < 0 || result < sizeof(*get_version_reply)) {
> > >  		if (result >= 0)
> > >  			result = -EIO;
> > >  		dev_err(idev, "get version request failed: %d\n", result);
> > 
> > i am not an USB expert but it seems that this is a complicated way
> > to check for result != sizeof(*get_version_reply).
> 
> Yeah.  You're right.  That would look nicer.  I will resend.

Your version, or adding an explicit cast to int, may be preferred as
they document that there's something to watch out for here.

Either way you have my ack.

Johan
