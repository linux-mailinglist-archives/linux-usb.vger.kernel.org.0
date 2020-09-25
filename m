Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F042D2790F1
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 20:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbgIYSlz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 14:41:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43559 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728069AbgIYSly (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 14:41:54 -0400
Received: (qmail 54048 invoked by uid 1000); 25 Sep 2020 14:41:53 -0400
Date:   Fri, 25 Sep 2020 14:41:53 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     yasushi asano <yazzep@gmail.com>
Cc:     andrew_gabbasov@mentor.com,
        "Rosca, Eugeniu \(ADITG/ESM1\)" <erosca@de.adit-jv.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Baxter Jim <jim_baxter@mentor.com>, linux-usb@vger.kernel.org,
        "Nishiguchi, Naohiro \(ADITJ/SWG\)" <nnishiguchi@jp.adit-jv.com>,
        "Natsume, Wataru \(ADITJ/SWG\)" <wnatsume@jp.adit-jv.com>,
        =?utf-8?B?5rWF6YeO5oGt5Y+y?= <yasano@jp.adit-jv.com>
Subject: Re: [PATCH] Re: [PATCH v3] USB: hub.c: decrease the number of
 attempts of enumeration scheme
Message-ID: <20200925184153.GA53451@rowland.harvard.edu>
References: <20200920192114.GB1190206@rowland.harvard.edu>
 <20200921140342.3813-1-yazzep@gmail.com>
 <20200921144827.GC1213381@rowland.harvard.edu>
 <CAEt1Rjq-DOwN0+_7F0m-kqUHTzm5YPUaXqUOpTszCsqrfLRt5w@mail.gmail.com>
 <20200921150611.GD1213381@rowland.harvard.edu>
 <CAEt1RjoypwL9-NsuOfypvT09sQb_7PYbgzegaAH-RfbjLmL44w@mail.gmail.com>
 <CAEt1Rjp2GKf47JZaRPAD3YnFWPF5+8mxHGmgY+F7Ta9wc1GvrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEt1Rjp2GKf47JZaRPAD3YnFWPF5+8mxHGmgY+F7Ta9wc1GvrQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 26, 2020 at 02:21:50AM +0900, yasushi asano wrote:
> Dear Alan,
> I received the test result of applying your patch and
> my change from customer.
> It was tested using PETtool. it barely passed the test.
> It took 29.497 seconds. The patch worked well.

That's awfully close to the limit.  I think PORT_INIT_TRIES should be 
reduced to 4.

> The following is an excerpt from dmesg.
> Could you please merge my change and proceed with this PR?
> I really appreciate your kindness.

I'll go ahead and submit the patches.

Alan Stern
