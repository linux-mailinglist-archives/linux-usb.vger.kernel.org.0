Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3CB9128BA
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 09:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfECH2R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 03:28:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39112 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbfECH2R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 03:28:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id a9so6473881wrp.6
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2019 00:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lsS6iGGKkw8PQ8EZRahWc1dfNOwoNKDYRw7nDJz2nc8=;
        b=RWT/msteoAdlCA3+uzfj0ppgKvHt5eyDJAcnm6Y6XXKX04qf5QS5KruPvS2oRr9Uga
         GLiFsuwWVO4JlQgxmLw8AZ2A/VaA70W68YlUUv7JKtPwzYKecxJwbF52tG2lSafFmtp8
         6jusNV55fy2pQpDZ3Qbbnx4CEH5LmnPqBH2c8hs68JhH/MVGyURrvXwKyNloCej6rJbx
         Nr9pGp4ouWyIxAYPwZ5ChPjtXgA2hAu6b7Y0seSVmvkvS7u2dxK4ylM9SX/81oU64xwV
         EWJoHy2tQRUQfkMiXDKRB116nBVWKLUepKrRxtMpYISeMyIyGqLiamZQg5PGcGnRaRjw
         21lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lsS6iGGKkw8PQ8EZRahWc1dfNOwoNKDYRw7nDJz2nc8=;
        b=COa20ekZ3AjY+NvRaLVzKEXRTZYi3yx0kEFXQuvTTZNk6obUBlW9ZV/GUfQahYy1tK
         Xp0vPGPmUgmlc0FUFWRQwItodDbFCejI4emUuLBIpGGNtz8VUllyknBfQKvHjn9o/FZ3
         jxM9snNBMJefhvj0FWE69Kr2jwJrgabkYQ96N63/ionxVC9+TGqQs5s9cSystu46ZsLi
         K4Zuj1eHNuuFiEPKYhJaDkASfdvjCuJ7VyUBLpVKskmSDenILlakrl1mlfO6kZzqZmgq
         rHuIV3SAVrzSJ78ypqSWE9XIdy0l2xa5tQjS1D+DfOof1Zbi3nf4WADWtWWtZaPHjy7X
         VryA==
X-Gm-Message-State: APjAAAUPtWV62G2ZBeqCn6joctY490hqEvQZKrPRfZnrWwtMVQxviyTP
        6HXoey4vX98A0hPBiESTRGzQmnP2MIsUQUu4kdIKVEFa
X-Google-Smtp-Source: APXvYqyQ4gYFMSJLJTfnw4aJoEynkl2cNQ8HVZVJ5aJriAleVh9e1q4jbXdh2cz8GZkKGCt0YIVSGceveRwgFkfDgfQ=
X-Received: by 2002:a5d:4b0c:: with SMTP id v12mr6008008wrq.330.1556868495853;
 Fri, 03 May 2019 00:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190429121237.13136-1-charlesyeh522@gmail.com> <20190503071128.GB26546@localhost>
In-Reply-To: <20190503071128.GB26546@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Fri, 3 May 2019 15:28:04 +0800
Message-ID: <CAAZvQQ6EmDu-Rh_LTGCpz7T=3BbCvP=tUDRo=HCCgqscwn8+zA@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v2] USB:serial:pl2303:Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B45=E6=9C=883=E6=97=A5=
 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:11=E5=AF=AB=E9=81=93=EF=BC=9A
> What changed in v2? You forgot to add a changelog here.
>
> Looks like this one is not based on the current driver code (e.g. my
> usb-next branch as we discussed), and also does not address some of the
> issues raised so far (e.g. you're overwriting the entire flow control
> register on updates).
>

I used the Kernel tree:
git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git

but the pl2303.c inside does not have the "pl2303_update_reg" you mentioned=
.

Charles.
