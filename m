Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333AE204BCA
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 10:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731581AbgFWH77 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 03:59:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46239 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731296AbgFWH77 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jun 2020 03:59:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id h19so1198441ljg.13
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2020 00:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nv+PdUKfTbpX5bGrIKRqhzWCJu3W2yG0Dr4H2tPwUP8=;
        b=Sty95Ipz8gE6+wKczLZ6ZBCGVpnCsaJ7imRg19TvNrasAim752YcymWsIT3m+EgGRF
         H1wfBZgnmkLVYYdEL3xZBODY2Yc2qWFwlR+kd1JmXfv/SV44w08NxI4CHoruHprhaG3+
         ouLgstsZv52E5oeFYP6SpN9PaE3HXAVclm2q7nFbiZWEE0XN4ioswpWG/iw3JlZmUhEk
         IHOz0Ry14tafSK61SGmMoaMPR/i0aECtK+Ib5mcH4Ec17rJvgbx+GAPjC9CQ3+fb+6dB
         EhaeXjdzhI8RTHYTOC3N8g0c6yqhUeikjYbCXxsWbpMYeENJ1uQ9kINx4qXNW29i4xT8
         E6rw==
X-Gm-Message-State: AOAM531VUQQdHK7Gcv4/DyJ9iS3GJtQCuNpB8NN0G8dDvj/oqhNogrCK
        WnG5WBl4zINltBB8ZNjY150=
X-Google-Smtp-Source: ABdhPJxMTwZxk925rCf+Dn8RgC2HLfdn4nibDyImjGAaVxhbo+T1SicdRtAi/UyKr2q5MSFO6tt4aw==
X-Received: by 2002:a05:651c:1a1:: with SMTP id c1mr11149999ljn.32.1592899196866;
        Tue, 23 Jun 2020 00:59:56 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id m30sm3097938ljb.70.2020.06.23.00.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 00:59:56 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jndqV-0001me-8c; Tue, 23 Jun 2020 09:59:55 +0200
Date:   Tue, 23 Jun 2020 09:59:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     =?iso-8859-1?Q?J=F6rgen?= Storvist <jorgen.storvist@gmail.com>
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add GosunCn GM500 series
Message-ID: <20200623075955.GF3334@localhost>
References: <20200622221359.16729-1-jorgen.storvist@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200622221359.16729-1-jorgen.storvist@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 23, 2020 at 12:13:59AM +0200, Jörgen Storvist wrote:
> Add USB IDs for GosunCn GM500 series cellular modules.
> 
> RNDIS config:
> usb-devices
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 12 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=305a ProdID=1404 Rev=03.18
> S:  Manufacturer=Android
> S:  Product=Android
> S:  SerialNumber=
> C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
> I:  If#=0x1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
> I:  If#=0x2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> 
> MBIM config:
> usb-devices
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 11 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=305a ProdID=1405 Rev=03.18
> S:  Manufacturer=Android
> S:  Product=Android
> S:  SerialNumber=
> C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> I:  If#=0x3 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> I:  If#=0x4 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> 
> ECM config:
> usb-devices
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 13 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=305a ProdID=1406 Rev=03.18
> S:  Manufacturer=Android
> S:  Product=Android
> S:  SerialNumber=
> C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> I:  If#=0x3 Alt= 0 #EPs= 1 Cls=02(commc) Sub=06 Prot=00 Driver=cdc_ether
> I:  If#=0x4 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
> 
> Signed-off-by: Jörgen Storvist <jorgen.storvist@gmail.com>

Now applied. Thanks, Jörgen.

Johan
