Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAE127A1AA
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 17:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgI0Pnj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 11:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgI0Pnj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 11:43:39 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D65C0613CE
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 08:43:39 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id z25so8490085iol.10
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 08:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uo50z3nBr3H3YSVNjTum/ECQuiG6HoPJamr3dkwZOgI=;
        b=vhyGVX1LeUrDho1AATW28WvFPOysUcGEj/lrBUZFG0pnQWXUPD7yK/etQbfuc3y4DE
         jZjU5SJVxoeZo7vGbD4/QaVD7tSlwwIXR+r1gn7mKWpQceI//ShcYQ0duAsPD7yMg177
         guDqxiI8FfgEFD12LgCQGAXz5aBvn0uU0eKgMpBml2+mdCvEsI7oRmi83jMXwcZ047cY
         rPDSX9phetjMhoCR6EOXr8j0bxGXStEu8XTsLT4Zf6vziSUZMhwcuhhY07aOCrdUaNwl
         abb1K8aKRWWLPsaIzpDu0PtUoLEKgBQSsEq7aABwEAuZK7LIRUZVEp0ZgQU4B+uTaed5
         xZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uo50z3nBr3H3YSVNjTum/ECQuiG6HoPJamr3dkwZOgI=;
        b=UbLCpDO+ApRu1ggrwPA4e15TP/gVKhnXeIqeYNbDnErUWlwEDteHGWAExWIIGIEF0L
         8o3VptKzDx7zkniqSinGqxhok6cKOdwEh7ODYc7xjFItF5vBoEtslADnb4j+mObS3qp+
         HIvq7BMBrD/wQTaD6cxt/rlbr+9PZdJ2NRRqArYWfxm5aKJ3WFAONe/Q3hCAZDXYOd6C
         Us7FSs8IOK3q7X4B/1xq54/8XfZcANbiGQpu+C3lFj52e03OqCBnpUtWCN4AXrlTyu2j
         evGyEsj6Pv29yyXzXXFBDgdzK3VrIl9M5l/g3JD97byDuiN1fQfwcMk0/dR+t3Gof0Kj
         I3og==
X-Gm-Message-State: AOAM531rsBKcKtdTkM8UBR5twcVng1RxvsNZDaL+FxOPQbCtwfwvyD+G
        mHaLRVQyMrwH8GvaFsBDzqW6MPn4TvHISL8pRNE=
X-Google-Smtp-Source: ABdhPJwLOG8Jb//FF1/FlsgxHJ8oqtgaLSEew2jgdBJ27UB/dpnoXKixpy4581OP1v3R5zsrBFZhfge+d4Vy6ajs73c=
X-Received: by 2002:a02:cb53:: with SMTP id k19mr5945937jap.47.1601221418351;
 Sun, 27 Sep 2020 08:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200920192114.GB1190206@rowland.harvard.edu> <20200921140342.3813-1-yazzep@gmail.com>
 <20200921144827.GC1213381@rowland.harvard.edu> <CAEt1Rjq-DOwN0+_7F0m-kqUHTzm5YPUaXqUOpTszCsqrfLRt5w@mail.gmail.com>
 <20200921150611.GD1213381@rowland.harvard.edu> <CAEt1RjoypwL9-NsuOfypvT09sQb_7PYbgzegaAH-RfbjLmL44w@mail.gmail.com>
 <CAEt1Rjp2GKf47JZaRPAD3YnFWPF5+8mxHGmgY+F7Ta9wc1GvrQ@mail.gmail.com> <20200925184153.GA53451@rowland.harvard.edu>
In-Reply-To: <20200925184153.GA53451@rowland.harvard.edu>
From:   yasushi asano <yazzep@gmail.com>
Date:   Mon, 28 Sep 2020 00:43:18 +0900
Message-ID: <CAEt1Rjo_H5f0CD+o5y-jDBfU8__gEPie0PvqzsV48aaakO7JkA@mail.gmail.com>
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

>That's awfully close to the limit.  I think PORT_INIT_TRIES should be
>reduced to 4.
I understood. I agree with you.

>I'll go ahead and submit the patches.
Thank you very much.

Best regards
Yasushi Asano

2020=E5=B9=B49=E6=9C=8826=E6=97=A5(=E5=9C=9F) 3:41 Alan Stern <stern@rowlan=
d.harvard.edu>:
>
> On Sat, Sep 26, 2020 at 02:21:50AM +0900, yasushi asano wrote:
> > Dear Alan,
> > I received the test result of applying your patch and
> > my change from customer.
> > It was tested using PETtool. it barely passed the test.
> > It took 29.497 seconds. The patch worked well.
>
> That's awfully close to the limit.  I think PORT_INIT_TRIES should be
> reduced to 4.
>
> > The following is an excerpt from dmesg.
> > Could you please merge my change and proceed with this PR?
> > I really appreciate your kindness.
>
> I'll go ahead and submit the patches.
>
> Alan Stern
