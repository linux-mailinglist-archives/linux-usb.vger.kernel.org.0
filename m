Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7497033327
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 17:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbfFCPKU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 11:10:20 -0400
Received: from crumpet.qq2.net ([80.247.17.44]:33515 "EHLO crumpet.qq2.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729145AbfFCPKU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jun 2019 11:10:20 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54])
        by crumpet.qq2.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <geoff@defgeoff.co.uk>)
        id 1hXobK-0002H7-Ey
        for linux-usb@vger.kernel.org ; Mon, 03 Jun 2019 16:10:18 +0100
Received: by mail-wr1-f54.google.com with SMTP id m3so12495038wrv.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2019 08:10:18 -0700 (PDT)
X-Gm-Message-State: APjAAAVj0U01c+pyrTpe6IeCEKVrxet6qJhe4+GVYtS3N9UpLZbZlA05
        C1zpZ4/0odsuvrfInX1EgFS2E7TT7wm/vd6Ncg==
X-Google-Smtp-Source: APXvYqxj9lfQ65zcOdkVZcfnQo0AAMO/w8YeSuLUdgJMMEJHXFDQb94RZYvpR8uYRiI+oTo8NIMY15dDYLwqlI2to4k=
X-Received: by 2002:adf:f909:: with SMTP id b9mr17313175wrr.119.1559574618205;
 Mon, 03 Jun 2019 08:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAEzk6fe0+LHFbZgN4t8_NVS_fysj7wHFGerMB1fhoHmXsCogVw@mail.gmail.com>
 <20190531191128.GA25230@kroah.com>
In-Reply-To: <20190531191128.GA25230@kroah.com>
From:   Geoff Winkless <geoff@defgeoff.co.uk>
Date:   Mon, 3 Jun 2019 16:10:07 +0100
X-Gmail-Original-Message-ID: <CAEzk6feqwwW9=9Wun0MjqLk09m7Qiuh4D=884Z70nSOgXX7VcA@mail.gmail.com>
Message-ID: <CAEzk6feqwwW9=9Wun0MjqLk09m7Qiuh4D=884Z70nSOgXX7VcA@mail.gmail.com>
To:     Greg KH <greg@kroah.com>
Cc:     Linux-USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on crumpet.qq2.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: ehci support on old VIA vt82xxx disappeared around kernel 3.8.
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 31 May 2019 at 20:11, Greg KH <greg@kroah.com> wrote:

> Can you run 'git bisect' to determine the exact commit that caused this
> problem?  That would be most helpful.

Oh for goodness sake. Sorry, I was being an idiot. After half a day of
building bisect scripts and another 3 hours of waiting for
compile-reboot-test I finally get to

[adfa79d1c06a32650332930ca4c488ca570b3407] USB: EHCI: make ehci-pci a
separate driver

I guess that should have been fairly obvious, really.

modprobe ehci-pci and the bus entry reappears.

Thanks (and also to Alan) for the help, apologies for wasting your time.

Geoff (going to hide his blushes in a corner somewhere)
