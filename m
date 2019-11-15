Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B09CFDC43
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 12:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfKOL3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 06:29:30 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33833 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfKOL3a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 06:29:30 -0500
Received: by mail-lf1-f68.google.com with SMTP id y186so7781928lfa.1
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 03:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qMca59VuL5f8+C56ecpglXxSMlaSX9MCH5TwcS2YfMc=;
        b=kqaw7MuDnPcvEYxw54iIrEj/RxmN9F3K5eUtFXByPjopHQ2JOFAgVpcDtIOEPUGPpE
         LsNnf79OFWpQAAAaZv+QxJ+6am26ZL5uk6rw6bcZ+jMh31GRWuSzc7h4rBKJWcIlxkz3
         TNo+AnjTyq4ge5WcT2S5JXfdTAujn607j2LbDq9J81mkOm3O9WsKo7JMb9pYjhnW4p5B
         fwBwfTyQIa1o3JcVHCYHTJto9Ba0Y6IAX+tY/C15eWCxyqsr5AUZtDU3kMd2YvVHAJhW
         k/QphrquX7XK5GgKkNedJAVGn6qBfrZnj5XppIOWxoy+9LIK9yPLHPw0vei1C7KD68s1
         bJ0A==
X-Gm-Message-State: APjAAAXkGYcZp3851npxei7U2fNso9HWDhZ+qhavIWJ5SZUPak+SClhN
        CCykpp/gk/x18hcilgXJjv4lChiIGH8=
X-Google-Smtp-Source: APXvYqwfzASWBpE4IWsre0BPLk/Gp/oo5Gvxt5Il0bi5dL1rN3HAFmTwSTTCqeLTOUv5ipwWQx9i2Q==
X-Received: by 2002:ac2:43a3:: with SMTP id t3mr11156616lfl.150.1573817366938;
        Fri, 15 Nov 2019 03:29:26 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id d26sm4732101ljo.54.2019.11.15.03.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 03:29:26 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iVZnE-0000dQ-Q0; Fri, 15 Nov 2019 12:29:36 +0100
Date:   Fri, 15 Nov 2019 12:29:36 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/1] usb: serial: option: add ZLP support for
 0x1bc7/0x9010
Message-ID: <20191115112936.GI5633@localhost>
References: <20190920102336.21043-1-dnlplm@gmail.com>
 <CAGRyCJEUa7uZcHwdcF_BsOz4esZ=VSg6aYDWrZmxJSZY3SwEbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRyCJEUa7uZcHwdcF_BsOz4esZ=VSg6aYDWrZmxJSZY3SwEbA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Daniele,

On Fri, Nov 15, 2019 at 12:17:16PM +0100, Daniele Palmas wrote:
> Hello Johan,
> 
> Il giorno ven 20 set 2019 alle ore 12:24 Daniele Palmas
> <dnlplm@gmail.com> ha scritto:
> >
> > Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> > to be sent if out data size is equal to the endpoint max size.
> >
> > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> 
> should I resend this one or is there a problem with the patch?

This is the first time I see this one. Must have gotten stuck in a spam
filter or something. Sorry about that.

Would you mind resending, and I'll take a look?

Johan
