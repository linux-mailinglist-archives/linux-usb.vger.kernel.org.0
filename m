Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC92C6A6B3
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 12:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387426AbfGPKmn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 06:42:43 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52405 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733156AbfGPKmn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 06:42:43 -0400
Received: by mail-wm1-f66.google.com with SMTP id s3so18150442wms.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 03:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v58SgvDz8XZtmO0gTEObbqaAAw5Ys4C9GkzWMkMWpiU=;
        b=oQm5TSHySDRGHodVu5vCKwEaxLgtrcCl1sdc5mez8PBeLPXcqHSw65TEKz2ldGsaKI
         cohgsPdWx4xGkXZZPlENoTqeGbLghpC9KQ/xTExkHsQ4GNwgbBQPuG26jQie2guPeWwD
         QWD/CPr3oLWjULHX4VdXfpK8mA6HtKV+r5Inne8ywXfb5mlSzAV7tLZ7TXU7GL+K94au
         Xtu/Oref9OGJF11E7qcnMupORQsVmsUuooxiQL+OIeizKqZumgHZ1DXJMJhh4i4MxwsP
         toOj4au5Cf0vt1OYNTsxM1fQMLT7viYhnOv6lMhY5ikVw3xn9d4xEpgNwlqLxM0QykKJ
         bQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v58SgvDz8XZtmO0gTEObbqaAAw5Ys4C9GkzWMkMWpiU=;
        b=mcBanr5yZzWoH1FA2ap6+Ynryz0qSZdymrtq3m3JbTu40DSXX+45c9S8QpOnJ54kNl
         HAf6PbvDqFXCSM1/QzvxM5jTwD/df3/NngGWI3UUaTmVbXvETT6QBGY0/Rd6QOgeQPUC
         QQkEphtOWwNUtqngVWQ0ygujRlWuA1I4u0DuuQ0ox724QOThp15Azdi6gIhRiI3dBI4z
         +o5p50Uo3+JZWo5RBo4C7SUd5Sn14GtMjGi2g3FQbPCe+iiawHSTRX50k7AOA+91kXDJ
         pN+Xg6BupCBx7DVfH7ZBNmxVNK4WojpUdUEGcnJhJCsIcq8omqL/TuRgPJRysidTvx61
         XpPQ==
X-Gm-Message-State: APjAAAWLxiosXIa5LwZfkbWuHo0yhAYgOaj7RLtVdkD6cKq+gckLbqQp
        5AgovLqGSKuJPwbxBdHTnI8do6ffYxwln+rT/iZALMXu
X-Google-Smtp-Source: APXvYqwvRipcrgWU5o/OtcMRDf4tYyxagWandgWYU+P50b1Soh2JZtLmNLdyfpwxbzHnjOqB53qEDfeQbysSLpUDq5A=
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr28810509wma.107.1563273761188;
 Tue, 16 Jul 2019 03:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190701122114.2952-1-charlesyeh522@gmail.com>
 <20190701133233.GI27333@localhost> <CAAZvQQ4Eb8CZbFUG=ZApDyft2ig8mOSj4shbQv_UVCw0pm8p_Q@mail.gmail.com>
 <20190701152942.GA3787@localhost> <CAAZvQQ6JDgkC2SD4eYzBVYhq3ApMwWc_-gXQQVMBH+CaXZSK5A@mail.gmail.com>
 <20190716083312.GA10939@localhost>
In-Reply-To: <20190716083312.GA10939@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Tue, 16 Jul 2019 18:42:30 +0800
Message-ID: <CAAZvQQ6W7SHOFFc7y5VwshiJxuFd283_BVWfeB8MhXST2zF=Aw@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v6] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I will first learn about inline gmail setting.. and then reply to you.

Charles.
