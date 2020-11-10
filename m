Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5906E2AD6D1
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 13:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbgKJMtv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 07:49:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbgKJMtv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Nov 2020 07:49:51 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2FCC0613D1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2020 04:49:50 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id h2so2889542wmm.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2020 04:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fd0rvLSxv3w0DGSQl7/MR8nNwRxQn2EkK7Jf55cFZrE=;
        b=Af/MIMAKTQFyxeHZZ16ClAESfRN5kB3gwq1ekyEsJw9VWZtvXazxaHfDBudJlv5Yfe
         sG+w67uZ1tV0fV0JuRrShzclzjjo1v5Hk4cDXOlThxui7dlxO690C+LdlsHAN7Go4jz4
         9QN0p1pD7iRWnebbIfEOspzjTobQjXBHaVga8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Fd0rvLSxv3w0DGSQl7/MR8nNwRxQn2EkK7Jf55cFZrE=;
        b=VJ0SqBVqCaZ3ck9c4BGiWRVdUQeRX3ChXRvK3aMpufgshoWK1qcqEx9mI832zHrKHF
         ImSDpMZcgTz9S95/fWtFhzr2k1bsnytiuLS/on4/UBNlV6pgjfOqUwRk00pA0WdvFHb3
         QcB2hI4GSS7vwBDgz5H7BJQn8vbKm/JFUf01fsfD3eYG6xYmZs00O+gFLdRxmxhMVClC
         kDox5WYQEDyKgRewo1X3sR6nx9rSVpIq8lLHjBGEZfQAEzVK9KY4nxt/UD7ba1IaHf5x
         7BMbAPM2rWgAqA+rwVxXfgKE6NS2+di9q8jKgfQRMHIDT5YjMVUzbnbNeXw96hyARVij
         5MuA==
X-Gm-Message-State: AOAM531ee9YM0O80ohIB6H7Oc+YY2GKYepbUgpFaMZfscgSpZFmztiQE
        koA6WW3D6Isj5iPSpBjNz3Ri4g==
X-Google-Smtp-Source: ABdhPJzPchZV3CYprZV/WF3ChAiYPcWT+V/aERZoo0KWm+pFd7h/KOdwCODP/u/gnKrwWH9ItChKBw==
X-Received: by 2002:a1c:1b43:: with SMTP id b64mr4458160wmb.64.1605012589235;
        Tue, 10 Nov 2020 04:49:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h81sm2905596wmf.44.2020.11.10.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 04:49:48 -0800 (PST)
Date:   Tue, 10 Nov 2020 13:49:46 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        George Kennedy <george.kennedy@oracle.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/2] console: Remove dummy con_font_op() callback
 implementations
Message-ID: <20201110124946.GF401619@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        George Kennedy <george.kennedy@oracle.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
 <20201106105058.GA2801856@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106105058.GA2801856@kroah.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 06, 2020 at 11:50:58AM +0100, Greg Kroah-Hartman wrote:
> On Sat, Oct 31, 2020 at 03:24:41AM -0400, Peilin Ye wrote:
> > `struct console_font` is a UAPI structure, thus ideally should not be
> > used for kernel internal abstraction. Remove some dummy .con_font_set,
> > .con_font_default and .con_font_copy `struct consw` callback
> > implementations, to make it cleaner.
> > 
> > Patch "fbcon: Prevent global-out-of-bounds read in fbcon_copy_font()"
> > depends on this patch, so Cc: stable.
> > 
> > Cc: stable@vger.kernel.org
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Context: https://lore.kernel.org/lkml/CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com/
> > 
> >  drivers/usb/misc/sisusbvga/sisusb_con.c | 21 ---------------------
> >  drivers/video/console/dummycon.c        | 20 --------------------
> >  2 files changed, 41 deletions(-)
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Peilin, can you pls resend this together with all the other pending
patches from you? I think that's better than me trying to cherry-pick the
bits we decided to keep from random places.

Greg, ok if I just pull these in through drm-misc-next? It's a pretty bad
hairball anyway and that avoids the tree coordination issues. Only thing
that might get in the way is the vt font_copy removal, but that's in -rc3
so easy to backmerge.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
