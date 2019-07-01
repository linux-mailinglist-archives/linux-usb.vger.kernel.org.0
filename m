Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF995BD07
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 15:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbfGANf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 09:35:58 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40439 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbfGANf6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 09:35:58 -0400
Received: by mail-lj1-f196.google.com with SMTP id a21so13211930ljh.7
        for <linux-usb@vger.kernel.org>; Mon, 01 Jul 2019 06:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0idxPjX5KRPosXEyHJirDh+YTguKV06i2AuJT+y3/Qs=;
        b=O1vJi6wKVJyt2hcJP4/R24OPFVy74gYLh5KMy5NvBnnVjkOWGkg2vUHeNU5LQwiTiJ
         WAiKe9S3lRa9YFYbwaAem2qC782e1QfOgWklWy68FaKQdNU6uTX0MS0r4V5tg5jIgYxj
         Rmr1ivb+UUtdPQe1Q8WBRb+tFpFoZ7ime6P91NlBOZt43KfDqR0yOnseThNyKpxWh6HH
         rqIElRyu+hmPxhn+CsrAOnBMNkVm5su7lAEx9jfrw1Bp9ItsvGZrGKgS7zYAGJbKQKR3
         Hy8AAFjpXWmaScUGJkMWTPHqd9eKStsXo530B213A0U2Hf3RdKdhaEQaLEGUetBnJIs5
         eJsA==
X-Gm-Message-State: APjAAAXLFmqjWfjVniexpibbMdMS335SL69k2rNoaGhHBTmIsC9th/zF
        XaXcsybjLHyB5+i1t5oM9ek=
X-Google-Smtp-Source: APXvYqxZVpkHKPB5nl2Q09BynvxK4qkV+v40iCzXI1t9cOOvNqwvgxLxUvVC0KgnOOIO43H9uS709A==
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr14305828ljl.21.1561988156530;
        Mon, 01 Jul 2019 06:35:56 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id a70sm3241701ljf.57.2019.07.01.06.35.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:35:56 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hhwTG-0006w2-VE; Mon, 01 Jul 2019 15:35:51 +0200
Date:   Mon, 1 Jul 2019 15:35:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw
Subject: Re: [PATCH] [PATCH v6] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190701133550.GJ27333@localhost>
References: <20190701122114.2952-1-charlesyeh522@gmail.com>
 <20190701133233.GI27333@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701133233.GI27333@localhost>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 01, 2019 at 03:32:33PM +0200, Johan Hovold wrote:
> On Mon, Jul 01, 2019 at 08:21:14PM +0800, Charles Yeh wrote:
 
> >  #define PL2303_FLOWCTRL_MASK		0xf0
> > +#define PL2303_HXN_FLOWCTRL_MASK	0x1C
> 
> Move after PL2303_HXN_RESET_CONTROL as I suggested.

Sorry, I meant PL2303_HXN_FLOWCTRL here.

> > +#define PL2303_READ_TYPE_HX_STATUS	0x8080
> > +
> > +#define PL2303_HXN_RESET_CONTROL	0x07
> > +#define PL2303_HXN_FLOWCTRL		0x0A
> > +#define PL2303_HXN_CTRL_XON_XOFF	0x0C
> > +#define PL2303_HXN_CTRL_RTS_CTS		0x18
> > +#define PL2303_HXN_CTRL_NONE		0x1C

Johan
