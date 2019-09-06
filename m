Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF0DBAC1C6
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 23:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfIFVCR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Sep 2019 17:02:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42755 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfIFVCQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Sep 2019 17:02:16 -0400
Received: by mail-wr1-f67.google.com with SMTP id q14so7892204wrm.9
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2019 14:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWTPA4QfT/u7KTpMZfkRfalR4VSn/NKlHg21Ui/OIDk=;
        b=iCYCAb3lmKvS7toXdPufd/dlWaKSRFbbE5ldGZEmOOJ7hmmtkwHCGqG2wPHaurJapi
         DQK3za+Zr2DI3lINdL/cwKlNGMqUoJOHgy32OAvgWIetKPL/FXFqSZ6mbhHV5DnaviW2
         OO0Zm5rZpMtwbBYKYbFYi8MagfpyMDmeHzBow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWTPA4QfT/u7KTpMZfkRfalR4VSn/NKlHg21Ui/OIDk=;
        b=qTcQXiDWK9huwqPsJk0iuPA7A4hFjaOCKpF4AhZ4jW7Zbc5unL0qouzHOjkjdDQXED
         Jem4IAJl4COTdkXqtJUq+IvJSeMn0TsAFErD1GxmZlIgpzrMDZk6RSXQB6t0vm9N31u6
         iZZ4A0oneAN73NMaspZ9tvFY68xqJn44+ilQg9F1B3nPvbgaBRZttRcEIADYXpfqxNIx
         qTsbD3vZ+lBtdTKQo2iG01T0aFbcAjRAgBdZyTgJlrXFAajhPkCBndWnPQ/CGZaU3hIs
         QM0UFqoxheKB6CCHheD9uQCeaZdE8N6Q3cfOJXrrd+14x05G9KJWa/Y8EetNNd0Ncy0Q
         ndgQ==
X-Gm-Message-State: APjAAAXrO+2Yggfe38BQSF0lNOigdsyvIjwZWt1Sp8OQc3AfnzijliGM
        XEwSRVwkIN+M0F0+YPt8atKm6668zP1FlN116H9VOw==
X-Google-Smtp-Source: APXvYqzTpeQnofOOEHooWUc0GkE/tyjL8IOg3Cj5aUeG9aIpdqyy8lUYfaNt8qj//u253apeEtSpih3zrNBb2FezOwk=
X-Received: by 2002:adf:f284:: with SMTP id k4mr9018630wro.294.1567803734187;
 Fri, 06 Sep 2019 14:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190903091953.GA12325@kroah.com> <Pine.LNX.4.44L0.1909031009250.1859-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909031009250.1859-100000@iolanthe.rowland.org>
From:   Julius Werner <jwerner@chromium.org>
Date:   Fri, 6 Sep 2019 14:02:00 -0700
Message-ID: <CAODwPW-FybmnZ97eTfShya_z1Oxrc91ofe6yC4vNN2ri51V5fw@mail.gmail.com>
Subject: Re: [PATCH] usb: storage: Add ums-cros-aoa driver
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, Oliver Neukum <oneukum@suse.com>,
        Julius Werner <jwerner@chromium.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>,
        Dan Williams <dcbw@redhat.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

FWIW, I found a suitable workaround now to get my use case working
with existing kernels: I can do the mode switch from userspace, then
after the device reenumerates I can manually disable any interfaces I
don't like by writing 0 to their 'authorized' node, and then I write
the VID/PID to usb-storage/new_id.

I still think it would be nice in general to be able to force a driver
to bind a specific device (rather than a VID/PID match), but it's not
a pressing need for me anymore.
