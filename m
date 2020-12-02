Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155E12CCA30
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 00:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387901AbgLBXAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 18:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387894AbgLBXAY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Dec 2020 18:00:24 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE381C0613D6
        for <linux-usb@vger.kernel.org>; Wed,  2 Dec 2020 14:59:43 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id k4so10234edl.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Dec 2020 14:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fFVnyQiPVtdSkBxfJGLdBr83R+RJdoHrPGVNkKi9Y5E=;
        b=W2Pr5CFnfgUMdV9Q0z4pCnByPtsy6F0HWEh9XiJcUnMGSUINz7V6jzVpg4Hdqew8ev
         O+b7WIJAIxzoo0f/EaUaQQvsxIYoUdzLDvAG/1WsJd5ylQVzns5PV5ZsYcKF3VCHiSJx
         XYF0D3IypO8au6VqARGgzuY09UFcMdy4H9byRh2i29rkXbIiIq2OAiz3HZuymzLqt7mX
         aBkvmn6kJSxnrBB2y+i0aNEuJBn+rvBGblY4HvqLUNsX+nnMozOI5KxlpUNhO7UPmqQz
         ffLAspsng/w0N7sI8RLAk8qGH5R6IpV5yMx68dOUkf0rLiARMpR18l7/0DYlLMyZMUzt
         WDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fFVnyQiPVtdSkBxfJGLdBr83R+RJdoHrPGVNkKi9Y5E=;
        b=QexV2adj1fCq0KqDsPhsvHHlQ1JMP89U6PhVDYB8f0nO0ROcuZL3SFyfflZEkyfstH
         tKPO9c6wxPD37+A2ZRRCU5/pymAxwoG+/Rp9esZvGB4dznpKmLcTcUMK3ZQoRXu4wkbV
         AxTa/271KjDrXQ4h4YPfsdbal9ePEfUhgQpgofOq0pZX6E8/DpTsYp1pH024cEHp+chX
         HTvl9WmQ9nvDVDTcpZfdMIBbrKhtCihsXd/r019E8Ge1NIXwOrqfeq3wFlYdY3CTZKEY
         eHF6lB3Yyj+Vq8RTMCSYecv8VVHQZ2bbR0mI9eX/vZLERyTyqmyWq2pRDpHo1tSUEWjc
         9qhw==
X-Gm-Message-State: AOAM531nsRcH3JgXfzsLIjZWF1KI6KIe2ih39oViLeiOTm37qJxGal89
        7G18Hu75L4O/GqLoc2EW7NJ6oOEnDuFtBWfMLOeEDM/s31fG0Q==
X-Google-Smtp-Source: ABdhPJwGfKcdJqOZv5eidUhShMEFxfQalI5xlessjwSGs8EjTWDWiTlMtDYPQ1vtuVZU4d03pCja/xfLHKjBDWcptAw=
X-Received: by 2002:aa7:cad2:: with SMTP id l18mr260624edt.183.1606949982368;
 Wed, 02 Dec 2020 14:59:42 -0800 (PST)
MIME-Version: 1.0
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com> <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com> <20200925210517.GA4487@google.com>
 <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com> <20201001164352.GA13249@google.com>
 <69f8cbc3-0ae7-cfb2-2fdd-556ada77381f@linux.intel.com> <20201012215348.GA3324220@google.com>
 <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com> <CAGRrVHwC=3qs00CTzPkrVPzXBnpcxfjRCKjgaYK9Hjt0GRfObg@mail.gmail.com>
 <ee24e656-f898-6b0b-ea91-9875390abb72@linux.intel.com>
In-Reply-To: <ee24e656-f898-6b0b-ea91-9875390abb72@linux.intel.com>
From:   Ross Zwisler <zwisler@google.com>
Date:   Wed, 2 Dec 2020 15:59:30 -0700
Message-ID: <CAGRrVHwgxtPF89niHV3N58SaDb7q5jWde_g7-yVxGPcKhemsaw@mail.gmail.com>
Subject: Re: xhci problem -> general protection fault
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 23, 2020 at 8:04 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:

> I think I got most of the functionality now working.
> The series is not in upstream shape, but should work, and can be tested.
> just pushed it to a rewrite_halt_stop_handling branch in my tree, ten patches on top of 5.10-rc4
>
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git rewrite_halt_stop_handling
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=rewrite_halt_stop_handling
>
> It still contains dead code that needs to be removed, and all streams (uas) cases are not
> handled properly, it won't pass checkpatch.. and so on,  but it should be testable.
>
> Thanks
> -Mathias

Unfortunately I'm still able to reproduce the failure with your
patches.  Here is a dmesg:

https://gist.github.com/rzwisler/05e52020e87f0ccd6185182be999dae0

I was testing at this commit:

3c1f3ab219e5f xhci: handle halting transfer event properly after
endpoint stop and halt raced.

Turning on ftrace makes it much harder to reproduce.  Should I keep
trying for a repro with tracing turned on, or is the fact that it
still happens informative enough to know we have to look elsewhere for
a solution?

Thanks,
- Ross
