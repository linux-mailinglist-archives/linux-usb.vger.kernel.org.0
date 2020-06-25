Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4140B20A8B5
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 01:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407760AbgFYXS4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 19:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406605AbgFYXSz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 19:18:55 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F9CC08C5DB
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 16:18:54 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id k13so4503985vsm.13
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 16:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UZUejZ4FxIPzgalcSBOTl7RrSB8oG1JXXKFu2TzIVTY=;
        b=gEFD/h6/YccJ6NUPfYT/xgz0X+isX8Cd6CGn2UCUGx7jpM3t81GIEKLZxSIh9n3gSf
         LyFFAVqzLW2EOg2vox4IxQFv/KkghELE3h+1pMYcAk3L5vCjE1vuqYv6ModKBhiykPJm
         E+uZ3A7Yo3f2524NLn2qvAOct1Q0SfZjBL3KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZUejZ4FxIPzgalcSBOTl7RrSB8oG1JXXKFu2TzIVTY=;
        b=pePxs844S321LaEYfEwLQYliVqVwopy0FWnYB5FXmgloNkJq0CIPrrIxUrk/jh9I9w
         1EQrjQ8Tg/PQF+sjuIuwKsliINtvUni3LyhVoorZm8mOoDG+/3E1BpPzebfvQsSgZK1Y
         +XNQXZhUiPSM+i1Gnx1cX1Vwb6z1+L5l1nfdbXzMCmInJWwdDnM8Z9fuYycF6Y+dICQg
         4Sd7tKGCKUbhTY+il5TwfVjno9Ysv01/yujUxzpIjT/mX7KMLIId7zmP6Amt6D5JAvXa
         IHmG4oBLva0nu5N0ni0un3DiO9O6bsX3kZrf75DB3GOU962B9Qa4R+eoUluizdlxBH+X
         4BnA==
X-Gm-Message-State: AOAM530K4c703/ws6w9WVv9mnTwojGa3WCiBTX5M0HonInLVSecnBB6d
        oPGQcwvbA0WbeXVT9wLoCUYFXDo8n4hiaCH9KuPdQg==
X-Google-Smtp-Source: ABdhPJzhi8dHdwc7k/3b1+iOeFD6RskzYY/+B8+g9RbXB08kX6vZ9AZiixX+D9Pnv0ODrkx1cdSZ8uCd7wY1U33lSFI=
X-Received: by 2002:a05:6102:1167:: with SMTP id k7mr517235vsg.71.1593127133874;
 Thu, 25 Jun 2020 16:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200624111128.v2.1.Ibae403db54245c458d14297f1892c77c5055da41@changeid>
 <1593080522.28236.17.camel@suse.com>
In-Reply-To: <1593080522.28236.17.camel@suse.com>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Thu, 25 Jun 2020 16:18:42 -0700
Message-ID: <CANFp7mUmk=HqPyJ5TS5uQPyaEtOWdz=D+7XBS8MyikuF9y9EJQ@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: btusb: Reset port on cmd timeout
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Rocky Liao <rjliao@codeaurora.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        ChromeOS Bluetooth Upstreaming 
        <chromeos-bluetooth-upstreaming@chromium.org>,
        linux-usb@vger.kernel.org, Linux PM <linux-pm@vger.kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the heads up Oliver -- I will send a patch with a comment on this.

On Thu, Jun 25, 2020 at 3:22 AM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Mittwoch, den 24.06.2020, 11:11 -0700 schrieb Abhishek Pandit-
> Subedi:
> > QCA_ROME sometimes gets into a state where it is unresponsive to
> > commands. Since it doesn't have support for a reset gpio, reset the usb
> > port when this occurs instead.
>
> Hi,
>
> on first glance this looks like an unbalanced PM reference. It is not
> because the operation is suicidal, but this deserves a comment, unless
> you want to get a note telling you that you caused an imbalance every
> few weeks.
>
>         Regards
>                 Oliver
>
