Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 797E15E7D2
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 17:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfGCP1c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 11:27:32 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:37309 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfGCP1c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 11:27:32 -0400
Received: by mail-wm1-f49.google.com with SMTP id f17so2866995wme.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Jul 2019 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorremedies-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FYQTDTIAXw+vyt/yEFYqaswqL2mofUSVAgjKdZ+8JC8=;
        b=T8v0L5JGhXWwKu69bSYeRCeqpQSkDOeG+Yf8RPqlCaahsO1OWVA3wdff/rUZbwv6jn
         sGwDr5APDUvU5cAkfsuwRQ3SwE3qpO4R2nRLpZxHFQLDVuuUVALgDRc3l5cZtPMyHbKu
         QckXPdfNpQDrCEoLIBrM4apkXGigpszgQcm1A2NMoz6X0dHJTJsqldNB9vK+OMlZ4fI9
         QNLwXT3+5wc29XmAsowSruFWFHIwSfeZ2gYapk39T6Z14230F6JOW37HfbFCu9Xyn1IL
         IOBCl9eFPdUUJZn9k6X9LbT8rRBM9T3IRwkK/OsWidXizEGO8jgoj0Aa2afHbZDIF+Op
         j4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYQTDTIAXw+vyt/yEFYqaswqL2mofUSVAgjKdZ+8JC8=;
        b=F6+pg1hd3F7meIMFmSQrWUCcWKwVAugW1s/VoPCF1lvDnO0hThW4eZ9j/iAE/NMAJe
         FhuiXFekNRAsiqUC4c7cVqXQGRUbW4F3joQKZen++YadAgIaMKu4znqxzZ27rSvuMM96
         GooFtaUrJtHirChnVBtW6Re91V6SE+FUJKxmyhYHggL/HZfWCfGykdRsjBCNnFSAwP1r
         dtvCdtttIEDPt9ihv4OR05Cl8Q/76wV+r3pD8AOC0483Ekss1kipT4ccwIQWkZEXUS+f
         MkDPRpGtx04HljfJA8CG9J11bMCFjDPeBRYOgRhnJoX7mynbt4ZIQfPd4F2Snmobk36X
         SL1A==
X-Gm-Message-State: APjAAAVFMU+SsXRMnAnkv0tfH6uuqzG7ikQRjYdwPDLb+o8u/WPPzvVJ
        psZXgHQ5ug0kpUlQhKLReiYAjLDSk7BnLmj9inee2vHcax4=
X-Google-Smtp-Source: APXvYqzkX+gi2hx7vKrLCwcoKQg+CojCrI2I3R4EMcB3HNM4POqM/wwhL1AA4y80MyXA1GDh9LBQsJKa95/xRmmePHg=
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr8522581wms.8.1562167651517;
 Wed, 03 Jul 2019 08:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <cc54d51ec7a203eceb76d62fc230b378b1da12e1.camel@unipv.it>
 <20190702120112.GA19890@ming.t460p> <20190702223931.GB3735@brian.unipv.it>
 <20190703020119.GA23872@ming.t460p> <20190703051117.GA6458@brian.unipv.it> <20190703063603.GA32123@ming.t460p>
In-Reply-To: <20190703063603.GA32123@ming.t460p>
From:   Chris Murphy <lists@colorremedies.com>
Date:   Wed, 3 Jul 2019 09:27:20 -0600
Message-ID: <CAJCQCtRCeY1tbhe84Uy-WfQg5jaur3VyOc+ROwmgC6ZZExApQQ@mail.gmail.com>
Subject: Re: Slow I/O on USB media after commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
To:     Ming Lei <ming.lei@redhat.com>
Cc:     Andrea Vai <andrea.vai@unipv.it>, Jens Axboe <axboe@kernel.dk>,
        linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 3, 2019 at 12:36 AM Ming Lei <ming.lei@redhat.com> wrote:
>
> BTW, 'rotational' shouldn't be set for USB drive, except for USB HDD,
> but that shouldn't be related with your issue.

I get
/sys/block/sdb/queue/rotational:1
for all USB flash drives on all computers with every kernel since
forever, including 5.2rc7. Lexar, Samsung, Kingston.


-- 
Chris Murphy
