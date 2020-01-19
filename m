Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23B96141ECB
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 16:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgASPPX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 10:15:23 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45690 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgASPPX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jan 2020 10:15:23 -0500
Received: by mail-lf1-f66.google.com with SMTP id 203so21971621lfa.12
        for <linux-usb@vger.kernel.org>; Sun, 19 Jan 2020 07:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=90mDrTiviGnQb3P8DX9/Gf/gRmv7ssD/oh7r95iUQIQ=;
        b=nM0ke52z+QFBekif34qTuBLL+So/33UOmoKaVKyaXRcvxoI4DZYBizL51blha/91gw
         GU++yLhMw4V+4rkWy6q4mZmKln+MlyEzJ2RRilFXC1xW3CDQKrdTNz3hNHwpZQJoow3w
         j672A+AKCjOFzcRyn9jxejxfg//90ZYVA8lRXBk5fx010GnoVkQbTPZUoD2kFs2iSw3D
         oGQZU4Er48WbeoLFgTrZCwphAiLY1joM3NiVXAesi7J/bMKyT41YV/7HMSSLtwIru6X9
         4HAdUAMZrHDhPjVfa158s7bzNHGQP+A+LugXBw7oHaKg01rOUlyoyQSUlBClicMtKFNw
         r6qw==
X-Gm-Message-State: APjAAAX/C0lr6UBFJzeuWdq6ZFzwc4QiEBF0p1WW6tpw25+h4xOqtCgU
        dlfvDc+AY9uUJeHAIAbB1odQiyia
X-Google-Smtp-Source: APXvYqwzlgYGLY+a+onul6MWnXDhl8z1Ece5vtuKpDTmcbX55P9B+6Nuses2ACUW53r58yR6Sm/ieA==
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr10637479lfm.105.1579446921343;
        Sun, 19 Jan 2020 07:15:21 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id q17sm15557120ljg.23.2020.01.19.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2020 07:15:20 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1itCIJ-0007ak-37; Sun, 19 Jan 2020 16:15:19 +0100
Date:   Sun, 19 Jan 2020 16:15:19 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Steve Markgraf <steve@steve-m.de>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: Regression in 5.5.0-rc6 for FL2000 USB 3.0 to VGA adapter
Message-ID: <20200119151519.GZ2301@localhost>
References: <9cadc6b9-16f7-e072-abee-53ac5c143198@steve-m.de>
 <20200119135811.GY2301@localhost>
 <734d9503-29ef-2fa0-5df8-6ef5701d3d61@steve-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <734d9503-29ef-2fa0-5df8-6ef5701d3d61@steve-m.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 19, 2020 at 03:48:32PM +0100, Steve Markgraf wrote:
> Hi Johan,
> 
> On 19.01.20 14:58, Johan Hovold wrote:
> > I just took a quick look at the libosmo-fl2k code and it appears that
> > you claim both interfaces but never set alternate setting 1 for
> > interface 0, which would enable those endpoints.
> > 
> > Could you see if that's all that's needed to get your application
> > working again?
> 
> Yes, you are right, I had another look at it today and tried exactly
> that, and it's working now with altsetting 1 of interface 0.
> I will push a change to osmo-fl2k shortly.

That's good to hear, thanks for confirming.

> There is also an out-of-tree kernel driver that makes use of this
> device, and might even need interface 1, but I haven't verified this so
> far:
> 
> https://github.com/FrescoLogic/FL2000

I'm afraid we don't care much about out-of-tree kernel drivers.

> The question is if there are other devices out there where there are
> duplicate endpoints on different interfaces. The spec clearly states
> that this is forbidden, but the USBx0CV Chapter 9 tests do not test for
> this and pass just fine, so I assume the FL2000 will not be the only
> device in the market where this mistake has been made.

That's a valid concern, but the problem is that USB core cannot really
handle such devices currently. If we get a flood of reports about this
we may have to reconsider how best to deal with them however.

Johan
