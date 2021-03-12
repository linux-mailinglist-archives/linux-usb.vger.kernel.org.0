Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C317A3386C0
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 08:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbhCLHq2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Mar 2021 02:46:28 -0500
Received: from gw.atmark-techno.com ([13.115.124.170]:45782 "EHLO
        gw.atmark-techno.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbhCLHqA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Mar 2021 02:46:00 -0500
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
        by gw.atmark-techno.com (Postfix) with ESMTPS id 767D080365
        for <linux-usb@vger.kernel.org>; Fri, 12 Mar 2021 16:36:27 +0900 (JST)
Received: by mail-pj1-f70.google.com with SMTP id lj2so8592105pjb.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 23:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ni/mHNWDgJgCkV2Qov8K8m4Vof33qd0Q1DF+vfmUdJw=;
        b=J/1Lud5x9nEJecOTymd2oKEdX7JR/EjkTqpA8heLk2yA58Z/BNbr7Q2fWCb/MZcLmB
         i9vGwneGT7LwPQ3fEHzUt+Q/9Fg8ypmEe4GqN54wqiuq3xJ09zmm1lPBtv6lnzyniNFG
         WziZAj6d6vF5upA3wMm7fVB4pmzWqxLZLmDD3MaKFus0y5M/CqDJVfs07RgZQZCm0pqV
         a1lY4rABIRhwa+8WZE/gUf/h8knfsXvz2x3JOqEeqbRqcbw082EJKNYKJuTmrNUmWsAK
         fq6epBvY0EN8/2W0a5eAnKEf43A/MXPt7BWB7G7HGGlD+UWITu61sCgcTIy4Nc9Bncpw
         FLSg==
X-Gm-Message-State: AOAM533v0GOD2bo3GyUw7bqNJwwK79NyEuZQzTRm/N18HLTn6nyWt5rF
        59yOhVVrquQoTxM07doK1ikAx5r+wyKxD+EJGzWltx1vgCOIU2zkA2lYpV+TeAKvUoLIU0ndkFy
        88UpLcZWmN9v3b4v34jJVD62p
X-Received: by 2002:a63:5924:: with SMTP id n36mr10949125pgb.183.1615534586544;
        Thu, 11 Mar 2021 23:36:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPIbKeb6psvpJsnHpQF8t4zkciEeez16xtGwuvrFudffyi1swnWFKsq/aprlUbvp4R5h1Ymg==
X-Received: by 2002:a63:5924:: with SMTP id n36mr10949118pgb.183.1615534586316;
        Thu, 11 Mar 2021 23:36:26 -0800 (PST)
Received: from pc-0115 (35.112.198.104.bc.googleusercontent.com. [104.198.112.35])
        by smtp.gmail.com with ESMTPSA id e131sm4680920pfh.176.2021.03.11.23.36.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 23:36:25 -0800 (PST)
Received: from martinet by pc-0115 with local (Exim 4.94)
        (envelope-from <martinet@pc-0115>)
        id 1lKcLQ-0010Se-An; Fri, 12 Mar 2021 16:36:24 +0900
Date:   Fri, 12 Mar 2021 16:36:14 +0900
From:   Dominique MARTINET <dominique.martinet@atmark-techno.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/5] media: uvcvideo: Fix race conditions
Message-ID: <YEsZ7qnSRv0EkJGG@atmark-techno.com>
References: <20200917022547.198090-1-linux@roeck-us.net>
 <20200917124714.GD3969@pendragon.ideasonboard.com>
 <990652f1-b6e4-211c-7a96-8c3fc3ea6efd@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <990652f1-b6e4-211c-7a96-8c3fc3ea6efd@roeck-us.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Guenter Roeck wrote on Thu, Sep 17, 2020 at 07:16:17PM -0700:
> On 9/17/20 5:47 AM, Laurent Pinchart wrote:
> > On Wed, Sep 16, 2020 at 07:25:42PM -0700, Guenter Roeck wrote:
> >> Something seems to have gone wrong with v3 of this patch series.
> >> I am sure I sent it out, but I don't find it anywhere.
> >> Resending. Sorry for any duplicates.
> > 
> > I haven't checked the mailing list, but I've found it in my inbox :-)
> > I'm not forgetting about you, just been fairly busy recently. I still
> > plan to try and provide an alternative implementation in the V4L2 core
> > (in a form that I think should even be moved to the cdev core) that
> > would fix this for all drivers.
> > 
> Thanks for letting me know. As it turns out, this problem is responsible
> for about 2% of all Chromebook crashes, so I'll probably not wait for
> the series to be accepted upstream but apply it as-is to the various
> ChromeOS kernel branches.

We have a customer who reported the same issue recently, has there been
any development?

I don't see anything in either uvc nor v4l2 that would address the race
since this mail half a year ago (well, I could have missed it ;))


If nothing happened I'll probably backport this series as well, at which
point it might make more sense to take it in until a better fix gets
here then revert it...


Thanks!
-- 
Dominique
