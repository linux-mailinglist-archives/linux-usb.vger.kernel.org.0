Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D67CB458
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 08:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388229AbfJDGMK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 02:12:10 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39723 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387618AbfJDGMJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 02:12:09 -0400
Received: by mail-lj1-f196.google.com with SMTP id y3so5242596ljj.6
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 23:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ovwOPn8gNTgoIzty2iqq+3ZNROjhRlZ+JjIiJWJcg8g=;
        b=I2kjGZA5MTeO71mgaFkQMrrd0saVsE73SCQ75peH6+KASgjc91YMgVYGC3F8MykR3E
         vIvKiKEA25rXFRtBWESsqnhUwmPd2tHDcU/HxczGNbxQ9WiIhClYbW3m1rIc8oDrLzAF
         /GdpM3KaDcW90uFwATE074B9jhxxIHdFkZZVI0QYOKNnI4rJte3+qFg7FvO3RZ5zg527
         tMeWpPUN0PZ1WZyKT/gj8LBvcuUbpxvQhS2J0JdhrEVq+lhIqNY+XQUM3uEdO5HPgkfD
         T11wzu213vYFtcFWgGUfpFGzMdNfye10eXZSxsZZXSPKqE1M+l65IVFBgGU0C19EngOD
         NYqA==
X-Gm-Message-State: APjAAAXzxifhTSLwKZH7FUpF5BKFItTLNotpFIXd7NRbcqebMoFIkXSw
        EhtewvGqJGtDwvcIrhBzoFKtNaP6
X-Google-Smtp-Source: APXvYqwSCesWAU+c3i98hBWqn+PP1zJsGPHE2EXwcYj+/t3bQQxm0n+WNuW+Gl2BngJwlxDxWq+tDg==
X-Received: by 2002:a2e:1614:: with SMTP id w20mr8394432ljd.159.1570169526316;
        Thu, 03 Oct 2019 23:12:06 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id p22sm1051170ljp.69.2019.10.03.23.12.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 23:12:05 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iGGp4-0002ZI-7d; Fri, 04 Oct 2019 08:12:14 +0200
Date:   Fri, 4 Oct 2019 08:12:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Reinhard Speyerer <rspmn@arcor.de>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add support for Cinterion CLS8
 devices
Message-ID: <20191004061214.GB13531@localhost>
References: <20191003165320.GA1626@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003165320.GA1626@arcor.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 03, 2019 at 06:53:21PM +0200, Reinhard Speyerer wrote:
> Add support for the serial ports of Cinterion CLS8 devices.
> 
> T:  Bus=01 Lev=03 Prnt=05 Port=01 Cnt=02 Dev#= 25 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1e2d ProdID=00b0 Rev= 3.18
> S:  Manufacturer=GEMALTO
> S:  Product=USB Modem
> C:* #Ifs= 5 Cfg#= 1 Atr=80 MxPwr=500mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
> E:  Ad=89(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>

Applied, thanks.

Johan
