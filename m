Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682D12535EB
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 19:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgHZRSs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 13:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgHZRSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 13:18:43 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9F3C061756
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 10:18:42 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h19so3231045ljg.13
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 10:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2pT89N8VTc50vb4WZvr37iDU8cKlOdxTlcFrKtLW66U=;
        b=cMOLov8uCC9JY8w6U13qumCS9ENiAGpNrGXqc146BmlR/vAukuVhgZfHIUqIeUkdg4
         lLbw9ZtMP5viBD8sFKvrK3hno/r9xAlRjIECnyA5JcySvUvAJyflC5m773B/E/NUUD4+
         w7bCHAb/+HOhXubK+D31xy7psk63Dj248+vR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2pT89N8VTc50vb4WZvr37iDU8cKlOdxTlcFrKtLW66U=;
        b=NDLaZq+b30KQ0CgfhnzDsbwKfemRHNMtmrs7yOnvzO6FKc83jqJXoTVjcrClnqOWnO
         xCfrm3BzzMh3cONVnpvMXVEiJIPPv15G2IfGIB5cNB4NhNOoXQ3TS/HRHbVQ6rGth2SI
         SHsUI4queJxizjFUiIwYVIKfp2m2katTzAG3IHpU0ctIN0wUEUrLp3oA4jWbAFcTTNG8
         FsHks9WkRnin+1WRx/BX3Q0wD0uaDBqjFTZYsv4QIZPjb1tQC6Lp2RN/guFew7T7PFUV
         VPH3QaCIv5fZdMByjjYpSeoDeEM7U3LiENO3/0SQ7e28/g+Q6RhW8ahlfCzxU2G672c1
         6vmg==
X-Gm-Message-State: AOAM532WHRlSJNz4ck+AGWB4xmRJjL5QXYlMV+HiSqTBGJ29smnHl5IH
        lqEpcerCVYt88HDimQrrrGeRJ9QiQo7gPQ==
X-Google-Smtp-Source: ABdhPJzL0ND+VtZIjD4xUDqLUKT3Z0N69w7PDsRxRMmO6tzu/U3/Fo5KNodGPLS7fGQN9kWwz8HmFA==
X-Received: by 2002:a05:651c:1343:: with SMTP id j3mr7076923ljb.112.1598462320694;
        Wed, 26 Aug 2020 10:18:40 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 20sm635110ljj.51.2020.08.26.10.18.39
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 10:18:39 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id g6so3238816ljn.11
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 10:18:39 -0700 (PDT)
X-Received: by 2002:a2e:2e04:: with SMTP id u4mr7260728lju.102.1598462319103;
 Wed, 26 Aug 2020 10:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200826134315.GA3882506@kroah.com>
In-Reply-To: <20200826134315.GA3882506@kroah.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Aug 2020 10:18:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiMMTpFxd9q7roL+L6dZb3JoQYCF0uP4+7RNHFHbfC29Q@mail.gmail.com>
Message-ID: <CAHk-=wiMMTpFxd9q7roL+L6dZb3JoQYCF0uP4+7RNHFHbfC29Q@mail.gmail.com>
Subject: Re: [GIT PULL] USB fixes for 5.9-rc3
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 6:43 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> USB fixes for 5.9-rc3

I'm dropping this, since it seems to break things more than it fixes.

I see that the breakage is already figured out, but I'll just wait for
the next fixes pull with the fix for the problem.

                Linus
