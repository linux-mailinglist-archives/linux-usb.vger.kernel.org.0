Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79454241D11
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 17:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgHKPUu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 11:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbgHKPUs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 11:20:48 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46588C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 08:20:48 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id g19so13013846ioh.8
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JdtWbzHFFrLnpkKaDlOJhr39J5tFuU8QjZMTXQuWoo8=;
        b=BfHE8btZCBDPiBM7YzjdiJrccijcEPBhWxnZesu+gZ5XqmpeuKxv0CL0qbH4xfAdy6
         8qQDx9f/OjiKfObPI9LXjBqdWz2ondQNG7rr+4/F7qw7uRGepUtWoFTreF7AMH7VEb5G
         IgL7Yyv/3zc/yUUoXsx4y5Ab5lqmbvraJseT/b4DYuufjFdb2h4j8QoiEaE+qwFDeS+1
         Aw1cgc5ybQPN1xhJkXlXNhyG5CGtp4sp74u9G1JJb7Au176f8bxJN73HbUknxI+hxKGr
         JYiqT3On3Fu0yjXYNLxWN3bXboBJij9xKBNNHl7vWUatDQrg+ESCD6qWwT1NI2xiaQE5
         eahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JdtWbzHFFrLnpkKaDlOJhr39J5tFuU8QjZMTXQuWoo8=;
        b=HseFOcvSwhJ+hAE/iB8mY3/gZMTKo1LGH2t1y7OMAAmOB8aW0H1CfLiV8xrSBo3z3K
         bYm0GDc4lwcqCaCxm8ZMqlRpiXCK9hFOf6h7SqYxQjHAI7iwBgrvHv9WGVYl4jMxQ614
         RfuxfDWBBLjDwtQNYddHPep+ZoSc00Nvq+LHm/zgzkr29nP2A+FrpoLYcZfY8smnBOfB
         DCgluztIn36hyrs4HYqKqnE0it+6owj5SNrSSK1Eebye71sK0BHIm/hcVY1Q2p4TcvDk
         mvX1ZxjnUvT9ZDkUJP3+uXHtBR80Nnq012l5YbV3JZ8wQigk5He4yUlnpZGSkzSLJROo
         MwVw==
X-Gm-Message-State: AOAM530l40qkk1jjXm/BNAiroVPQjowCjHT95uOFCOdyFGVyjsnzlXgM
        fyC4GOoAlQ9mqe3SZNrSbLVolFbeJuHHfR1PvMM=
X-Google-Smtp-Source: ABdhPJyiMNzaTsJmazkxT6Yj64wcxf7YdXSXZdrwkuv3JU44uj/DySXYigZTS0RdlrWiS1joP2kCbSF/9mZhFqJSBLw=
X-Received: by 2002:a6b:b4d1:: with SMTP id d200mr23327865iof.70.1597159247684;
 Tue, 11 Aug 2020 08:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200808151648.GC256751@rowland.harvard.edu> <20200810001935.4489-1-yazzep@gmail.com>
 <20200810001935.4489-2-yazzep@gmail.com> <20200810074601.GC1529187@kroah.com>
In-Reply-To: <20200810074601.GC1529187@kroah.com>
From:   yasushi asano <yazzep@gmail.com>
Date:   Wed, 12 Aug 2020 00:20:31 +0900
Message-ID: <CAEt1Rjq+Fz85KU-aKO+boNE5yL7GiwdopmRd3-FxEL+mzEui-g@mail.gmail.com>
Subject: Re: [PATCH v2] [RFC] USB: hub.c: decrease the number of attempts of
 enumeration scheme
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        andrew_gabbasov@mentor.com, Baxter Jim <jim_baxter@mentor.com>,
        "Natsume, Wataru (ADITJ/SWG)" <wnatsume@jp.adit-jv.com>,
        "Nishiguchi, Naohiro (ADITJ/SWG)" <nnishiguchi@jp.adit-jv.com>,
        =?UTF-8?B?5rWF6YeO5oGt5Y+y?= <yasano@jp.adit-jv.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Greg, I'm sorry for the inconvenience. I was not sure how to use
[RFC] well. If the patch works well, we already don't need to add RFC
in the subject line? This patch works fine on my target.  If it is not
needed [PFC] ,I will send the patch again without RFC in the patch
title and subject line in email later.

Best regards
Yasushi Asano


2020=E5=B9=B48=E6=9C=8810=E6=97=A5(=E6=9C=88) 16:45 Greg KH <gregkh@linuxfo=
undation.org>:
>
> On Mon, Aug 10, 2020 at 09:19:35AM +0900, Yasushi Asano wrote:
> > From: Yasushi Asano <yasano@jp.adit-jv.com>
> >
> > According to 6.7.22 A-UUT =E2=80=9CDevice No Response=E2=80=9D for conn=
ection timeout
> > of USB OTG and EH automated compliance plan v1.2, the enumeration
> > failure has to be detected within 30 seconds. However, the old and new
> > enumeration schemes made a total of 16 attempts, and each attempt can
> > take 5 seconds to timeout, so it failed with PET test. Modify it to
> > reduce the number of attempts to 5 and pass PET test.
> >
> > in case of old_schene_first=3DN and use_both_schemes=3DY
> > attempt 3 * new scheme, then 2 * old scheme
> > in case of old_schene_first=3DY and use_both_schemes=3DY
> > attempt 2 * old scheme, then 3 * new scheme
> >
> > Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
> > ---
> >  drivers/usb/core/hub.c | 16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
>
> Why is there a "[RFC]" on the subject line, do you not think this works
> properly?  Does it work for your devices and solve the problem for you?
>
> thanks,
>
> greg k-h
