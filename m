Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C82EF19668F
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2020 15:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgC1OLq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Mar 2020 10:11:46 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:36405 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgC1OLq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Mar 2020 10:11:46 -0400
Received: by mail-lf1-f46.google.com with SMTP id u15so1109572lfi.3
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2020 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zGTwwMaxnPvhSZo6BakxBazEsO3uUIAzW9QxunhlSo0=;
        b=FqErkkJ++29dabdk3ZObxpPHfoYF+ZYowYJJtLP47sgLTkAPiczubu2yY6Poz8pvK8
         4D+w8F24BVfNBRkJmtgH76HC7f0QPRn7n3oElghzgE1M0Xud14myCsc/6bQ81j8mPVSm
         w2y36KbxrqE+FaZTTd/g74zeHdoIuvDVQV1aWD+Y3gl4d6NB9nBLNgqAd0xrUiu83/ks
         uck5tiRxrx1jCH3j6uKh0mJD+Bi921wLXgRL4lGr0noTh2ZvuzMMtpt333Jv1lbP68Wy
         4JBxeD42GR+3iMwdjxl0uwxSqqnuE7+wQTvtCQzDg6Y7TZGB7mEURCRj9kZ9FZWZZcKZ
         5gyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zGTwwMaxnPvhSZo6BakxBazEsO3uUIAzW9QxunhlSo0=;
        b=sLVi03gpouaSJ9wiOWSDkzhJx5/SIBi6+8fuYpVfFxFTit+4gMSd7e2P8Gh46dKKz9
         KiOjdiVR2f0RUuPXEFLgtPDsQHXEg7OmRhBvsWrhc6Sh+xk3wCEUByqHVpj3/bWisDH8
         I0iW7ZnQ7Px8r+qQHMiSCi5ah0tncccjaYqU3UWH+T6DUEhaxGbk2RvKW6SUxQnWkNUO
         H5edprbqr1O1nCvUpPKzLy6jFAh1QUNJZ3GeUAz4GKLrW5ijU6rL4Ij1lj6nb5I+FYXa
         QZW/RpsQ97HXd6l27BZck72ufUhA1pM77KUj8L1VJV8WXQ20W41bsilw6TzE2scDCcYj
         DJkw==
X-Gm-Message-State: AGi0PuYMUEXR6J+ICdMOvahsW6En0Xnsdd3ohA2JP2QMNR5tpzD/mm4j
        8J6ER5pvsJeTZELLlW4Z8T1asQ59YmF7l/PbXRZewQ==
X-Google-Smtp-Source: APiQypK77jfZFuRsfT2dC5y+01Fu2/1tbesSs+zJ+KXYwJo3YvancsMhrTJBHsSA44d55TZKdnODaZ+t9VIgqVovcII=
X-Received: by 2002:ac2:51c3:: with SMTP id u3mr2595389lfm.25.1585404703400;
 Sat, 28 Mar 2020 07:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAEAjamtTnn+BZAshQ7=DQ7QdRHO83AbHeZP3xY1CpSzmbaHPDQ@mail.gmail.com>
 <Pine.LNX.4.44L0.2003261048010.5714-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2003261048010.5714-100000@netrider.rowland.org>
From:   Kyungtae Kim <kt0755@gmail.com>
Date:   Sat, 28 Mar 2020 10:11:32 -0400
Message-ID: <CAEAjamuCnVEyRKDsTa-MiU_4eTnaD0d38dmSBPbbkmjd+MZxpQ@mail.gmail.com>
Subject: Re: Fwd: BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170 drivers/usb/core/hcd.c
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 10:49:40AM -0400, Alan Stern wrote:
> On Tue, 24 Mar 2020, Kyungtae Kim wrote:
>
> > Thanks for the patch. Unfortunately, we don't have a repro program to
> > test right now.
>
> Okay.  Can you at least try running your tests with the patch installed
> to check that the patch doesn't actually break anything?
>
> Alan Stern
>

I tested with that patch for more than 24 hours. It worked well
without triggering the same bug.

Thanks,
Kyungtae Kim
