Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08E9012A31
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 10:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfECI7e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 04:59:34 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41138 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfECI7d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 04:59:33 -0400
Received: by mail-lf1-f68.google.com with SMTP id d8so3875154lfb.8
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2019 01:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2yh51p7rKE25MPy+hiFN/S48OR8d5gLtF0aNfdhs4tQ=;
        b=K0gJAIa35OwK1d3Zs6SAZuAd3xoE7W1bmCeU7yCuBIdb7J8KHMYF7eab586HPmAbwt
         LlBHnGrOfNo8vbnnqP2J1XtBVMxdKw6Ue3TSDX/efLOEh/tA6Er7SFIgYAlJzqRts4Wx
         rNBw6dgEppE+axtuqK0liEJjJdyApAshUGLv8lKONTlXeDfcGbeLwazh8D0j8IuznlGY
         3NzB5cFefdF/yqY3lFXcP8zaiMH1AFPOFCOg8vyu7mIAqd68GWA4Ohen4XRSN0PDpqJq
         o8HKoS/65tyrpXQ8mxrCo+OobJec3xvElcsYibuVLJKagZgS1FLmiE8D4lu9PTp05b6w
         j3kg==
X-Gm-Message-State: APjAAAU8m5+nPXyOqbGYfl1eBWeQXTeZNZyERipURrcnc2omnTk4MMau
        z6x2B7mRbNMKh9uEGKdIX/s=
X-Google-Smtp-Source: APXvYqwIkGUEpVbENc3ygQf9DstvFDit3dHlajJezQYylZOLxGkWcBvOP14UF+jXHQgUFpi+Moconw==
X-Received: by 2002:a19:c7c3:: with SMTP id x186mr4840100lff.107.1556873971590;
        Fri, 03 May 2019 01:59:31 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id w14sm174260lfc.51.2019.05.03.01.59.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 01:59:30 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hMU2h-0007rO-4Z; Fri, 03 May 2019 10:59:43 +0200
Date:   Fri, 3 May 2019 10:59:43 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v2] USB:serial:pl2303:Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190503085943.GD26546@localhost>
References: <20190429121237.13136-1-charlesyeh522@gmail.com>
 <20190503071128.GB26546@localhost>
 <CAAZvQQ6EmDu-Rh_LTGCpz7T=3BbCvP=tUDRo=HCCgqscwn8+zA@mail.gmail.com>
 <20190503074113.GA17809@localhost>
 <CAAZvQQ5AyH_Y0FtNxUUHjncV4af7rL2ihHtxVg7hVfmcz5s96A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAZvQQ5AyH_Y0FtNxUUHjncV4af7rL2ihHtxVg7hVfmcz5s96A@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 03, 2019 at 04:22:01PM +0800, Charles Yeh wrote:
> Johan Hovold <johan@kernel.org> 於 2019年5月3日 週五 下午3:41寫道：
> 
> > Perhaps you did not use the usb-next branch? That branch has the following
> > commit:
> >
> >         https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-next&id=f64c3ab230682e8395a7fbd01f3eb5140c837d4e
> >
> 
> OK, I will do another patch witch
> "https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/snapshot/usb-serial-f64c3ab230682e8395a7fbd01f3eb5140c837d4e.tar.gz"
> 
> I already have seen pl2303_update_reg in the pl2303.c file.

It's better if you use the full usb-next branch, e.g.

	git clone https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git
	cd usb-serial
	git checkout -b pl2303 usb-next

or similar. That way you can easily fetch any future changes.

Johan
