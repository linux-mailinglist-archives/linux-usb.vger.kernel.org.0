Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 799CD1204A3
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 13:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfLPMBI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 07:01:08 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37958 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfLPMBI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 07:01:08 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so4024203lfm.5
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2019 04:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YlcJTgwZ2bJHjYwV0+9vnjDrv6I84UtGueNAvjEc5KQ=;
        b=hziTWfLCFS1n6JB0f44FyQdcS0WWZMtE38UYPaxTZKsfEwkK4fiOlxtK9iUs9chZeD
         Rq9apcCJ+zG0tPNVjcZ5E/3nsc6gvNqGvQrAjP2vVLNDOZhtoMTKvh7dCDvCQ9Y0E5Jn
         mjP6wRf62q7cOFD8Y92KCYCZ64fTTa6eSsqDnt04gTq9Bx+W9K7pB2QgvyVGmudEeaqp
         NZcOT95yOJh/GzxDL7meTxiNRa7IM2VVqCis4Z5MoIYr/l1djb/vnRhhXVEAwsETa+NC
         nYSEMaqOvIYNsT6GsRGxvJrKns77o8M0OOqO7NlmcVO2/eoeIw4ZgNMC33pM+yBSrsPu
         Th2w==
X-Gm-Message-State: APjAAAX35HcvHy99A/YVVepB8stGy4lHbEigN/i4ipxCOmWOtvWyZwYM
        n6xDc9WZUY0NmZ9tJye1HVE=
X-Google-Smtp-Source: APXvYqwYJIBYtCrYEu8wsqDh8lLfuXmA5242YKljyyNwO0aTA2TWqjT8Enynv3tLLlU36ZGb/aUtSQ==
X-Received: by 2002:ac2:5623:: with SMTP id b3mr16863339lff.10.1576497666160;
        Mon, 16 Dec 2019 04:01:06 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id w29sm8560690lfa.34.2019.12.16.04.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 04:01:05 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1igp3d-0003iK-SS; Mon, 16 Dec 2019 13:01:01 +0100
Date:   Mon, 16 Dec 2019 13:01:01 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH RESEND 1/1] usb: serial: option: add ZLP support for
 0x1bc7/0x9010
Message-ID: <20191216120101.GC22665@localhost>
References: <20191118133251.21401-1-dnlplm@gmail.com>
 <20191205145731.GM10631@localhost>
 <CAGRyCJGPzxT8AChC6sq-8v-PAQJFuY-bZqoHmoJiwGCyxrTgZg@mail.gmail.com>
 <20191206154330.GP10631@localhost>
 <CAGRyCJGt1dsiRRgEJ9Yj2YrVW2OGVQ-6zFOh4P75Dbq0+sH5eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRyCJGt1dsiRRgEJ9Yj2YrVW2OGVQ-6zFOh4P75Dbq0+sH5eA@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 06, 2019 at 04:56:52PM +0100, Daniele Palmas wrote:
> Il giorno ven 6 dic 2019 alle ore 16:43 Johan Hovold
> <johan@kernel.org> ha scritto:
> >
> > >
> > > > I wonder whether using option is the right thing to do here. We're just
> > > > currently throwing everything modem related in here it seems. :)
> > > >
> > >
> > > I understand your concern. At first, in fact, I tried to add support
> > > for this in usb-serial-simple, but the change seemed to me more
> > > impacting than the one I had to do for adding support in option.
> > >
> > > Let me know if you want me to continue investigating the
> > > usb-serial-simple way or you have another advice.
> >
> > Yeah, I was thinking along those lines as well. Let me get me get back
> > to you on that.
> >
> 
> Ok, thanks, I'll wait for your thoughts on that before submitting V3
> for the current patch.

Sorry about the delay here.

I think adding this to option/usb_wwan makes sense (e.g. only one driver
needs to be enabled) so just move the flag handling to port_probe as we
discussed in v2.

Johan
