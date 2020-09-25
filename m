Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3BD277D5E
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 03:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgIYBFy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 21:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgIYBFy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 21:05:54 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AA2C0613CE
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2020 18:05:54 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id d190so1040899iof.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2020 18:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wlgQ+NF7iew+9vMzELXSBFvU/xBgUpfd+l3Fv6Kbjo4=;
        b=HQIoo0+gk5qq1Duvz3ecTXAQUtJVkzAPLEA3ce3+C3emfkwtp1qvMAIxuruxMdl+fe
         CTLWwIoTKQdpxfH46UZJwtayezE8dCIDc0SxD6gEttpQRZM5Ic4Ot2oFssP/vlyVzVjH
         G5rY9c/NIH4VzFdovyR8LSv2FYK7lFBLbOz/0tKtld6LjfKhPBx+PdO1ph1ulhcCj6/d
         kpHyK5HRwLQJD0f1GqYrYhCw+N1jVWoUJLlSmV3J+vuuhv23gQeOzR4brxVAD2u4huxL
         zkOjkF6qFiNHp+iVGQCjw+DTA1/Q8CDNsmVDopB4Vs+s7bzCs2BF/b6uatuwUt5Ve2cb
         bLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wlgQ+NF7iew+9vMzELXSBFvU/xBgUpfd+l3Fv6Kbjo4=;
        b=D6Tk7Pi9vH3FPjSCPzDnusYzFvh1oJWlI7YwagvzdalxK4XTqLPhDFCywIMsa1AJ7+
         Nkw7ZMkDHorHPaN6O5gctdO5oinnzhdNTQdE+UHy8OZ0bVscqO34f1lm739z3uxLbUhH
         C3psZ80O2UCNSCqEQ3yrV9ICnyI93YbWkIJzZSWsXi9pri+y/D7P9xD2rbNPMSmlStqj
         E+HaZ+G5guZSBthLd2aUNQSECFdwwVzXSORS0x//x0o7swxWqjCnnRvDkNSrYwkxlfK5
         ZKApjK7zp2Ai5uRJ8IIY0uEg/50zb4faw/8qZE1/AEmShySDZyW3z+VbxuBvoir3j2Aj
         nicA==
X-Gm-Message-State: AOAM533trVR5XWyrzmaXlDVhQIBCwrGFK6SiqsCvFjXSpWDhjctclfkO
        Q7xBz6ogyOHj8j0kBujjB/zv+eGX/UKH5Q7plRF+KUHO
X-Google-Smtp-Source: ABdhPJzpz01rr/dO1adAvuVxKHDGW/ZvNtQU4CAX9lRbNzewjlu+h74ibL8V2QQW/CoybvdmPIs+qIeSvTts5ssR5Nw=
X-Received: by 2002:a02:cb53:: with SMTP id k19mr1306260jap.47.1600995953459;
 Thu, 24 Sep 2020 18:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200920192114.GB1190206@rowland.harvard.edu> <20200921140342.3813-1-yazzep@gmail.com>
 <20200921144827.GC1213381@rowland.harvard.edu> <CAEt1Rjq-DOwN0+_7F0m-kqUHTzm5YPUaXqUOpTszCsqrfLRt5w@mail.gmail.com>
 <20200921150611.GD1213381@rowland.harvard.edu>
In-Reply-To: <20200921150611.GD1213381@rowland.harvard.edu>
From:   yasushi asano <yazzep@gmail.com>
Date:   Fri, 25 Sep 2020 10:05:37 +0900
Message-ID: <CAEt1RjoypwL9-NsuOfypvT09sQb_7PYbgzegaAH-RfbjLmL44w@mail.gmail.com>
Subject: Re: [PATCH] Re: [PATCH v3] USB: hub.c: decrease the number of
 attempts of enumeration scheme
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     andrew_gabbasov@mentor.com,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Baxter Jim <jim_baxter@mentor.com>, linux-usb@vger.kernel.org,
        "Nishiguchi, Naohiro (ADITJ/SWG)" <nnishiguchi@jp.adit-jv.com>,
        "Natsume, Wataru (ADITJ/SWG)" <wnatsume@jp.adit-jv.com>,
        =?UTF-8?B?5rWF6YeO5oGt5Y+y?= <yasano@jp.adit-jv.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Alan,
I am waiting for the test result from the customer since Tuesday, but
I have not received a reply yet. I will inform you as soon as I
receive the result.

Best regards
Yasushi Asano

2020=E5=B9=B49=E6=9C=8822=E6=97=A5(=E7=81=AB) 0:06 Alan Stern <stern@rowlan=
d.harvard.edu>:
>
> On Mon, Sep 21, 2020 at 11:59:31PM +0900, yasushi asano wrote:
> > Dear Alan
> >
> > Thank you very much for the reply.
> > please merge my modification to your patch.
>
> Yes.
>
> I will wait to hear the result of your test before I submit the changes.
>
> Alan Stern
