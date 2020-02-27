Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 345DC170DCC
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 02:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgB0B1B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 20:27:01 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:40918 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgB0B1B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 20:27:01 -0500
Received: by mail-il1-f194.google.com with SMTP id i7so917772ilr.7
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2020 17:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=niYJTFK4DpkkpGrI6D79gsEsDkTbl1WvT765RVC9gGs=;
        b=kVtx9Jk1F3w9czXm+f7r8hkFgwrxacYVFgZx2K/ioFQ+pmUHG1YZbiIAQubSUQYwER
         zHrORMngJjXj02N0VfpI7RWEnAHq6XLMxicdQYjjrXQzI2pXhWDwdFsTKcr+It7VtBDJ
         1UvCUhjpiM263g7KxiNuzH6Oaxjhqun8fY92psiW0IWkoBbjbSdQKv1O6cyu9Pwgxo/C
         HqnIEMJdJ4ngnk5g1majM6zBnxC/vsZdvUN4AsKVt7NBeTqPUPyQzRhiEpupv7WoDj7Q
         lS20/gDTFBcBtJ5LB9fuiEOgvwKdsHxz0+wo3ZX5BOFjsqgJWDJih2bsKexwVu1Dh46B
         Bgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=niYJTFK4DpkkpGrI6D79gsEsDkTbl1WvT765RVC9gGs=;
        b=OT9Z0ETZqzFSFExDgSzJRBzCoOyebHHe/eoY4fcCrvB0caLrbFZq5OVZlxsqKKzchM
         Y3+ZLiOYCvVsgMSBfkEyl5eKb5ZO52CNSNHfOtgIVjVqCmxKKFQYxAQZojlLA8PW9P8l
         aaxdUIuovcSa0Jn0BwmkqicpOi5mCw0S9fx089cprTeVWrLs7dC9PoQKZw6yaurwSVVc
         /M+hhL/jc8byXce3j1lMG+kFsLbjDNr8EfRrkcY+P72Xrx7DanZpTbLeT8vKAqaoAuap
         mGzAhwrJE+kSUO/uU7K8oSJ594XSpPZrFgEmz1SiRblS/yNrVB5kv/gc5pBdSigOkS6K
         nLdg==
X-Gm-Message-State: APjAAAWxciH1XEOcJ+OTy+mKlCJtaFsOIsAuugwlrtRZUX3qygrnvZXW
        gALAbaqeRbzzJ27T6dEhJCM9d1VIn0xElZ6HwcRDUNUj
X-Google-Smtp-Source: APXvYqzRXj5Hq9w+KLRXaH+GF0oiU9cdldIa9VJ90IEW34rjRZXgM4QZ+0RHQJfJnAW8mCEBtkmInMEpeWEPWJ2xySw=
X-Received: by 2002:a92:dac3:: with SMTP id o3mr2052185ilq.237.1582766820236;
 Wed, 26 Feb 2020 17:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20200219141455.23257-1-peter.chen@nxp.com>
In-Reply-To: <20200219141455.23257-1-peter.chen@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Thu, 27 Feb 2020 09:26:49 +0800
Message-ID: <CAL411-o_nGQ3VkvLt-brffjOk8YjDYLyxmN6_6jnpW3NkRhbQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] usb: cdns3: two fixes for gadget
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, USB list <linux-usb@vger.kernel.org>,
        linux-imx@nxp.com, pawell@cadence.com, rogerq@ti.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 19, 2020 at 10:16 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> These two issues are found during run "Error Recovery Test"
> for the latest USB CV MSC test, the TRB doesn't advance correctly
> after dequeue and clear halt. With these two fixes, the test
> can be passed.
>
> Peter Chen (2):
>   usb: cdns3: gadget: link trb should point to next request
>   usb: cdns3: gadget: toggle cycle bit before reset endpoint
>
>  drivers/usb/cdns3/gadget.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>

A gentle ping...

Peter
