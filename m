Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84153A2B80
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 14:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhFJM2z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 08:28:55 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:33491 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbhFJM2y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Jun 2021 08:28:54 -0400
Received: by mail-lj1-f170.google.com with SMTP id r16so4716375ljc.0;
        Thu, 10 Jun 2021 05:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=L8WQx6EE/IlhVFhQTxsJM20bswYPVNQYquk3IkIommc=;
        b=GwOObBE1OJMgwO3C0m+nQRBNqlxKfG+aFsOU+NXezbZ8/XwXKo+IOcr7UdZZssDO14
         61aGsdOVzJfkLB5wgR+bPrQj/l1g7yEwo3fOhx+MfTEsrUdP1qsyW4x5ZNYht/magaUY
         65P9izFhmcIZf4JArphxXAHrutyItQ/Et1cmXm6SyZ77KFyIMBp1MwVMn+7hlusrJdJt
         UNa7J6Bp9mXv1VUj4kMlx4sK2dNk2yAGvL3efzNYhu1sMa9uknZXP2ezs0RJeJfPPvcj
         RUx9P+mxpYS+o2hr8TZyF2CW22lhIjEtfrNuqOrzyRAxj50YTvqO8qaqLKpPw+Adsoxg
         et6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=L8WQx6EE/IlhVFhQTxsJM20bswYPVNQYquk3IkIommc=;
        b=pQ1fRWQjjNw1jWTrKkV0RZ783dE13zAb9zEnSLTkm5mvX1CTNxIN2zduXNFCnQo53a
         NJjwFrBbARCXakyNjsTr2jYW601eaPFxE6AB3P6X1E03zUeCqQM8O87uVNlBQ5FeO/c8
         ZqOp2hQEc9UNKJecxhlYoxlc6XPPY/GW+5eFTmB+xclWw5e9aLzUBpI17IwWTVgyrXJ2
         VOOdouuo6AJwzsJo3rLrTUcwzMbBgyt9PT/O0iMpS/8/rQhZ+1Ghp3gmN2Kqalf2aSmy
         2M7OZqY0XPesmbKdNEY7SUY32wks85Wsriby4vpIM8Mgud2d32cw6otXhLQmLvMN6RxT
         bQfQ==
X-Gm-Message-State: AOAM533SFwGGEXvF72din6O9gc4Ocu3ZMjXA22fEfQnh6C41/39msd2B
        kmfB6cdHa8Lt1W4UH5lO5c94u+O/vHz+VuHiIX1yjJLENYI3Mw==
X-Google-Smtp-Source: ABdhPJzeK+WemLNSBTS/Urzc5MQeMbnBvlGYJ/an7S5GFqPZus7f0UuMHY3Onu7p3DEHsA4VHS773pMxKtGsOIaI7qE=
X-Received: by 2002:a05:651c:20c:: with SMTP id y12mr2009850ljn.428.1623327938132;
 Thu, 10 Jun 2021 05:25:38 -0700 (PDT)
MIME-Version: 1.0
From:   Muni Sekhar <munisekharrms@gmail.com>
Date:   Thu, 10 Jun 2021 17:55:26 +0530
Message-ID: <CAHhAz+hjt57HjF=ap8+Y7X=Q8Dcsz9NYAJWj1Z8Sq_JEWuoGcw@mail.gmail.com>
Subject: SNDRV_PCM_IOCTL_READI_FRAMES returns EIO
To:     linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

 I noticed recording(arecord) audio data on a USB sound card fails at
SNDRV_PCM_IOCTL_READI_FRAMES is giving EIO.

Can someone please clarify when the kernel returns EIO for Ioctl
SNDRV_PCM_IOCTL_READI_FRAMES?


-- 
Thanks,
Sekhar
