Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0601000C9
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 09:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfKRIwQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 03:52:16 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:35764 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfKRIwQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 03:52:16 -0500
Received: by mail-qv1-f65.google.com with SMTP id y18so6194302qve.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 00:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=90C7hPp0jjaPYLe8/qhSTZ7vmNH4K6cF3RIbxB4NlI8=;
        b=h+DlLwIYPwkEGm7ZwxM9QJLnJfsunRWIedIWJ9B3S7ojb1/F7YdnBvGfpCWtt2P6eE
         ZHN9kG3Fa8IBk9MopizRa68GDkKaxUIODQul193ZJ4n95myJmTqCaab7imPgHrruhtwh
         c9xP7YeXINGmtqGVaMBieRXt4fgzVhPTaibcqilhjpTPndqwFNazKjFwVxX2wOCTRcN4
         k4CIUGjRLoQcM9SWQCl3r7Y5GAGb1LKWQmg7KTAtR4LW9kQ8Du0hgbXlcEkgtxP7Uqam
         KZ73heL7JguFUx9b73bmSdJkrJk1ceY85PzJZsMP0X49WMs5mAeG57IFT9mRkLgv9awm
         LGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90C7hPp0jjaPYLe8/qhSTZ7vmNH4K6cF3RIbxB4NlI8=;
        b=a3Jepf3PWhokHGOR7zAdTu63BZpXX/5OTA1PrebQpXUYTsjkFnJtF+5Dyj+zcDQrBD
         IfFLXheM25d7ELR/udet6tM0ML7i7i2IUCyCBR2qCmn5NCof2w9weS7fQSBlS2JbPpDY
         oG4jM99ndHL3o51kDFTEPkEfQCbHyeA56FxtdPdiTH5IkAUn2ex5S/S77sHhvJ+REW4k
         GFSE2L6Q1Pwv2oDZ8cacSZa26njvhiSQc+FFuyPrbciXvptUORS2RML3zJzif9vGa2OJ
         bCCpZmjq4k76AQXVeP8Zg1My3qPO/YS8h5V8zVKRZJW7BHvfCpAXHdxQQpA6fdjbbW0z
         ANaQ==
X-Gm-Message-State: APjAAAXWokL5MXCpTqUrytPPmYday3O19XuMaYQHqP0EC61ACOn5h+P1
        h016C4LezFsJ6ucz17hJkCcilHxl/His7Dxb+sKo2g==
X-Google-Smtp-Source: APXvYqx4wlDkliAAM0cS02/2UUhvIK8zKh6KQrQBhzlkEtuIsELYprvnD3s0HH+9QRTRcCKli2zottiLXVwM9jiUuoI=
X-Received: by 2002:a0c:bf4d:: with SMTP id b13mr3703586qvj.115.1574067134850;
 Mon, 18 Nov 2019 00:52:14 -0800 (PST)
MIME-Version: 1.0
References: <CAD8Lp47HgAi-86ni5WHhZT1-sEd7oJEZUiG6KNU66qpmRCfaXw@mail.gmail.com>
 <20191025162814.GA130180@google.com> <CAD8Lp44f9EQS93VkYUfnZYPjHMpOVCPuGoKD+dZ+=+tfyZHU5w@mail.gmail.com>
In-Reply-To: <CAD8Lp44f9EQS93VkYUfnZYPjHMpOVCPuGoKD+dZ+=+tfyZHU5w@mail.gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Mon, 18 Nov 2019 16:52:04 +0800
Message-ID: <CAD8Lp46qQootoWqOA5fyE=y0stqr+9qTmXymvNsmX9ghjox=aw@mail.gmail.com>
Subject: Re: [PATCH] PCI: increase D3 delay for AMD Ryzen5/7 XHCI controllers
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
        Linux Upstreaming Team <linux@endlessm.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bjorn,

Any further ideas here? Do we go ahead with the quirk or try to find a
more generic approach?

On Mon, Oct 28, 2019 at 2:32 PM Daniel Drake <drake@endlessm.com> wrote:
> It looks like we can detect that the reset has failed (or more
> precisely, not quite completed) by reading PCI_COMMAND (value not yet
> 0) or PCI_PM_CTRL (doesn't yet indicate D0 state, we already log a
> warning for this case).
>
> From that angle, another workaround possibility is to catch that case
> and then retry the PCI_PM_CTRL write and delay once more.

Thanks
Daniel
