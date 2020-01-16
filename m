Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5C513DF54
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 16:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgAPP4g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 10:56:36 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46771 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgAPP4g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 10:56:36 -0500
Received: by mail-lf1-f68.google.com with SMTP id f15so15841104lfl.13
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2020 07:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xdwyJS4JOKP06Lh2uqCg4lcXTdRwjpXxTyvLEWDMt3g=;
        b=MGz25EkgPJwyYyuvMUzNlMydnQRAorj8tLMRerFv3QezidM6NvzV5wQfYIbEGIPb/t
         GUiji9f905YyOu/md2lTjWu2Cot60QtG1qHKcz+dDffWM6aRwfvJIFqDBnDrCDL3gzNU
         4ZfPllViX2L/AQXet1EyTHLe3oDm/PJ6UWRaP2CoIB+giWVTiOFS36QZblE19tXNtMI3
         d+86S0bhC7xVBMfup6jKU9LIJU0GP9clW7kJZwdyqjji3Y9zZXmTwgjfZEG2fUD189G8
         mQnzuuUjSJHhQgE2S1UQAmNfLwTzWMiT81fYS304kZcmAMYQDgT6gC2VTAGyl0WI5Y+9
         S62g==
X-Gm-Message-State: APjAAAVx37molSbns+wAoYEn6l+9+eh69A6Z1xVqfMHMKtpkwz0zUaWy
        YAQvOq/musbEWwOxzzApOWg=
X-Google-Smtp-Source: APXvYqxKxmO7lHpgJyf0KpTkFyuNJyw06n3HQ4hl6oN/JVecTFNdGFi5H6uXnF620bJLlSh5CZOcCg==
X-Received: by 2002:a19:5013:: with SMTP id e19mr2930197lfb.8.1579190194703;
        Thu, 16 Jan 2020 07:56:34 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id n11sm10947045ljg.15.2020.01.16.07.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 07:56:33 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1is7VZ-0004nJ-6o; Thu, 16 Jan 2020 16:56:33 +0100
Date:   Thu, 16 Jan 2020 16:56:33 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Reinhard Speyerer <rspmn@arcor.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Kristian Evensen <kristian.evensen@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add support for Quectel RM500Q in
 QDL mode
Message-ID: <20200116155633.GM2301@localhost>
References: <20200114132923.GA18330@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114132923.GA18330@arcor.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 14, 2020 at 02:29:23PM +0100, Reinhard Speyerer wrote:
> Add support for Quectel RM500Q in QDL mode.
> 
> T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 24 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2c7c ProdID=0800 Rev= 0.00
> S:  Manufacturer=Qualcomm CDMA Technologies MSM
> S:  Product=QUSB_BULK_SN:xxxxxxxx
> S:  SerialNumber=xxxxxxxx
> C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=option
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> It is assumed that the ZLP flag required for other Qualcomm-based
> 5G devices also applies to Quectel RM500Q.
> 
> Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>

Applied, thanks.

Johan
