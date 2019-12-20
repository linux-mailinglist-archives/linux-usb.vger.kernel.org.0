Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCF021279D0
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 12:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfLTLN1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 06:13:27 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41551 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbfLTLN1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Dec 2019 06:13:27 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so6733377lfp.8
        for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2019 03:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nT0ney0BJdKrOo9mMzxM+gus+B3oqopYfNLsxJh9bEA=;
        b=dLLThYth9ukMXeRVQlAqLDHYtw+k60UrEWcb+BER4JTfu/asHLLedNqHu9lPvC1CAb
         69CFuvJ938/OpUI7LcoefcfirbhQqj4avknDl6XCH+GxBjPZQBEo3WXTmEbhrvupc/LW
         1DRRpXg7KNbzYJMlveW1ln+ZB9NM8TBmfdcPUbDaK1K4Wc4cvNOh6j4CE6+WQ4eqQVsN
         PPn9RiSPTTaUY6fpVUcTHm6Or3aKG69fU3i47ngAYdhHY87j9P+dDfQRyF81zNno7ilp
         lzgoNw9/eY3stk//Vio8WxIZMlNXli7se8SN7VSvySo3W/V9U8+mR6YPEviwIGD+7Llj
         d0vQ==
X-Gm-Message-State: APjAAAXisC9TWRYpBgVk08WKxE+c1Ne+tOwh6VmAoUuxVGf+N6Onqlls
        5fJsyJ1jHH+nT76594qEzxw=
X-Google-Smtp-Source: APXvYqwZhfIS1n6g/JiGahnf87qk/MA1QXa7CDSW1DCX9Lkb5ivp3iYgbZEHnZi1fdTfD0Z+6DGdYw==
X-Received: by 2002:a19:cc49:: with SMTP id c70mr8646706lfg.73.1576840405826;
        Fri, 20 Dec 2019 03:13:25 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id l28sm3818338lfk.21.2019.12.20.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 03:13:24 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iiGDk-0006Sn-7l; Fri, 20 Dec 2019 12:13:24 +0100
Date:   Fri, 20 Dec 2019 12:13:24 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH V3 1/1] usb: serial: option: add ZLP support for
 0x1bc7/0x9010
Message-ID: <20191220111324.GV22665@localhost>
References: <20191219100707.21916-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219100707.21916-1-dnlplm@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 19, 2019 at 11:07:07AM +0100, Daniele Palmas wrote:
> Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> to be sent if out data size is equal to the endpoint max size.
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
> V3: moved zlp setting to urb setup
> V2: removed transfer_length calculations

Applied for 5.5-rc with a stable tag (even if it's borderline).

Thanks!

Johan
