Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2CB2F5701
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 02:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbhANB50 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 20:57:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbhAMXnx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 18:43:53 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59788C061786
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 15:43:13 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id c7so4749928qke.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 15:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npqs+XnSms+QqxQFheUKw1A0QlwsGAlZlDjk1lG0kQw=;
        b=vGwqjEk5rL3VJSz9yHCNMd+E9dzlCFZqeIejVehA5GHTBAAThvVDO/isEgQDGdpFGZ
         Maq/GZJVJcq7o0hgg7OmxzeudyWjDz9FwPrxw/PMZc+Hr/I9GE8W1Sydly4s7QlKwHAg
         iDTJqJ53tp4hWDu1rUhzL8cRcvIPCHdDVnO2OlTquJsG4SpESjt0WfqhV3k+yZOg02YR
         1GzmWHjgKZ2OPCGgFbcSf/dS3OHHyaLwG5yazE9uifEZUPRIpaYMCLNII6ZyK5mBiBYZ
         1yc2TPLf1qC4oP7PZ3kervKWZHfMtHgdNHncg++KwtzI01LKxA+GusVIMVYmIp/fzE+W
         nPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npqs+XnSms+QqxQFheUKw1A0QlwsGAlZlDjk1lG0kQw=;
        b=IzREIlY+haFYI82OetF5ZWPfnDUHb7mUaDpoiD8bepv8JAQ4bEKxdYeJE/7aP66fAZ
         3T6BKbVzd3QbGkcZD3Wlfp7fP45xdTM7XjwcF8X8X1+KgzViPwyCohbbfiz7pWPa2m6t
         9BSBWdRW06pO/lmtYBIqpUCAJCegs1tdbwhzc1XIKlCCa+hzu04C51OkpDeQeNe+rSm4
         Eq0yNvJs3opppM5h3B0XC546QnblmDMoYwBxLa864H8UPogrsmBfiTV/pUAgc3iBAjmp
         eLulXjKs5BARgjaV31QZkCoDnbZ65zjzvFMvHx7DKFrjdL5xU2ctGI6+zxL+RMEp2JI8
         X9yw==
X-Gm-Message-State: AOAM531EDmZrWB920+9T8oqDUtcKne6WXkWv9USP5hJkM3t/Qbyz2EQ2
        FovSuQ5AMRwMunz8HLBuSNpbIQrNlRZ1Qi726vMKeTU5UDfQBA==
X-Google-Smtp-Source: ABdhPJz2Lf5OA1MFX1PTvcxlH3K1mNZftya96HHNoq74UfOTaFbf731Q9hdn189f15+EGToSEcrPZG0aG09kOWFDLa4=
X-Received: by 2002:a25:3d84:: with SMTP id k126mr6383959yba.162.1610581392340;
 Wed, 13 Jan 2021 15:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20210113154550.789244-1-lorenzo@google.com> <X/8d3bI5HP4FYnge@kroah.com>
In-Reply-To: <X/8d3bI5HP4FYnge@kroah.com>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Thu, 14 Jan 2021 08:43:00 +0900
Message-ID: <CAKD1Yr3pLrzFA8kzW8qHzP+NyQus-p31Ni1Lq_haRWR5fBbF7w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: u_ether: support configuring interface names.
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 14, 2021 at 1:19 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > -     bool                    zlp;
> > -     bool                    no_skb_reserve;
> > +     bool                    zlp:1;
> > +     bool                    no_skb_reserve:1;
> > +     bool                    ifname_set:1;
>
> Not to be a pain, but "bool var:1"?  What's wrong with just a bool
> itself?  gcc is known to have issues with setting/clearing bit fields
> like this, and there is no size issues here with this device, adding one
> more byte is just fine.
>
> So just add:
>         bool            ifname_set;

Ack. I guess turning it into a bitfield was premature optimization.
Sent out v3 where this is its own boolean.
