Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 311ACBD978
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 10:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442696AbfIYIB0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 04:01:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41908 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442663AbfIYIBZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 04:01:25 -0400
Received: by mail-lf1-f68.google.com with SMTP id r2so3463988lfn.8;
        Wed, 25 Sep 2019 01:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UknG2yHf9h+N44FozrRcie4n8BfOUNoQCbhwVSB3rmE=;
        b=EBZl86APvj+Xww1N9yX6nN8x3v8I8y0KXsadO5FqzNEKxeb4wZLCQsFVNLUh+qOXZ4
         UqA1vgF3juivU/WAXgutkgnC5pryKHGJWlDss2p0QmvFuH6P13kyBXmBX5P35pMybXSj
         lz6tWhLbLyI8H59vqpEduqkSJzZVK7GUX0PaSaxUP6qCBDCPWu0SpS2DyP5GVbJCEKbe
         e385UnRuySCYp1sw/ed+4MgG87BUyZoP6M3xXUb4S1hL4TcQmuL12th8AkDhXzaVdMQq
         lTF894SuwMRL7EXpDikvKJ10Zara3iwfVaEfkU6YbsRufqd8QUUjq+Gv44KFLXtjP6gg
         zayQ==
X-Gm-Message-State: APjAAAUimGCivLR0xQ9B4mHId01S9A307fO4x4HxQC6qyymK/lvZh/lb
        oZvCzSleOorOPjA92GbRgEgf6K0d
X-Google-Smtp-Source: APXvYqzEPMsaJ5EW327pTC5e8gUpSyH1YFx2VgN6IHzvAglBqRvLePimyMC9FwsHKf8U26DDWAvcVg==
X-Received: by 2002:a19:ee02:: with SMTP id g2mr4760924lfb.113.1569398482146;
        Wed, 25 Sep 2019 01:01:22 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id j17sm977721lfb.11.2019.09.25.01.01.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 01:01:20 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iD2Eo-0003rF-3y; Wed, 25 Sep 2019 10:01:26 +0200
Date:   Wed, 25 Sep 2019 10:01:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Jiri Kosina <trivial@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH trivial] usb: Fix Kconfig indentation
Message-ID: <20190925080126.GB14159@localhost>
References: <20190923154956.6868-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923154956.6868-1-krzk@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23, 2019 at 05:49:56PM +0200, Krzysztof Kozlowski wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
>     $ sed -e 's/^        /\t/' -i */Kconfig
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/usb/dwc3/Kconfig           |  4 +-
>  drivers/usb/gadget/legacy/Kconfig  | 20 ++++-----
>  drivers/usb/gadget/udc/Kconfig     |  2 +-
>  drivers/usb/host/Kconfig           | 68 +++++++++++++++---------------
>  drivers/usb/misc/Kconfig           |  8 ++--
>  drivers/usb/misc/sisusbvga/Kconfig |  2 +-
>  drivers/usb/serial/Kconfig         | 44 +++++++++----------
>  7 files changed, 74 insertions(+), 74 deletions(-)

Acked-by: Johan Hovold <johan@kernel.org>
