Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F42B4B7AF
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 14:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731654AbfFSMLF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 08:11:05 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:42164 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfFSMLE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 08:11:04 -0400
Received: by mail-lf1-f53.google.com with SMTP id y13so11918585lfh.9
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2019 05:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=uR7f48wHFUWEXhWOGahRrwd36u9zKsF+WNVmK3CIQxA=;
        b=AuvHfTgWb4fra/V99W8a7PJsm7etI/3x6vY1nsQt+bKShAUG6r+ieyUgIEQK48Ewgu
         NOtIsZ4t9GoHClqINWWvyijR4wbwUoB9y2v9Ll898KTTOHSM2n94CPDN6VqWmq2crfkH
         L149NHLT43fIG7p0XYrs10gt8399P92efoO0n44iEYcSMvGKT5kxL1Q3A5SqXz0A5bFo
         T9GlCqoLrLqfySGGUE8Tj+FwDRl5+TEWop47DFjyjgfdhNfTvmfI5/6LEfYy6rstyRpv
         V8dt4/1DkGM9IczaebxKfxB4sfUw58wNQRDecJDSLU0waMRJWsqoT99mk/CJepM254mT
         nFhQ==
X-Gm-Message-State: APjAAAWyGyRB+811nmTrGBhKaj2xKI0y/+vLggIiiJBrQFmrRbFKqsa9
        tADG67icHQdWB1wPfqUt67A=
X-Google-Smtp-Source: APXvYqyHQ78NrQQmXmNwOM6ULtwSHV7FusTPVs0t063hkWjg+7QlhfgmUAfDiFFoFdGKOG7WFFg56Q==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr5377421lfd.27.1560946262415;
        Wed, 19 Jun 2019 05:11:02 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id 72sm3062262ljj.104.2019.06.19.05.11.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 05:11:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hdZQY-0001NO-SM; Wed, 19 Jun 2019 14:10:58 +0200
Date:   Wed, 19 Jun 2019 14:10:58 +0200
From:   Johan Hovold <johan@kernel.org>
To:     =?iso-8859-1?Q?J=F6rgen?= Storvist <jorgen.storvist@gmail.com>
Cc:     linux-usb@vger.kernel.org, johan@kernel.org
Subject: Re: [PATCH] USB: serial: option: add support for GosunCn ME3630
 RNDIS mode
Message-ID: <20190619121058.GD25248@localhost>
References: <20190619002812.00006025@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190619002812.00006025@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 19, 2019 at 12:30:19AM +0200, Jörgen Storvist wrote:
> Added USB IDs for GosunCn ME3630 cellular module in RNDIS mode.
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=03 Dev#= 18 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=19d2 ProdID=0601 Rev=03.18
> S:  Manufacturer=Android
> S:  Product=Android
> S:  SerialNumber=b950269c
> C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
> I:  If#=0x1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
> I:  If#=0x2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> 
> Signed-off-by: Jörgen Storvist <jorgen.storvist@gmail.com>

Applied, thanks.

Johan
