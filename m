Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDE6467606
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 12:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351684AbhLCLUh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 06:20:37 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58017 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243029AbhLCLUg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 06:20:36 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id C864C5C03D9;
        Fri,  3 Dec 2021 06:17:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 03 Dec 2021 06:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=4
        bWv2ChQn7L3EW8K6hRwBEV5zMkpJSeymGKUrCzceAA=; b=hwp5EHxQXb1ysw/6h
        SWRJf+LbCvVgxMs46l8/s/8mOoywrnI2j7YCgE4XFHn/40QlG1UR+2Oa6NIZHsvX
        Tarf+Mv4JG7j3WixO0Y54cg159U4u2uBhy2jMbOpeGisLlwJHsq7B2Tnr/Si4Ws8
        2+fxozYb7HRj6JesdkEwQ7YI0DUNVnh9cegFpEBqFOYfgpt/uFy78Kw2ei37V6D2
        KLdjdgpys6TcQ43GCBSznJiEkTg+6ehnJhV0BuYZFshM2RBEy/a0gnMHoD4KnSIT
        tp6w2/MKA7GLsIUnBEXPbDer9SkdcUPg2X/ccKmCFduuYxVJ6NBPwAKoGwsQQ/zc
        CyRyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=4bWv2ChQn7L3EW8K6hRwBEV5zMkpJSeymGKUrCzce
        AA=; b=QdPPZAJEVNVO728cips7KUDsVeLjHdCmt9XgaOsh9KgcVVvFOfWsBJuAa
        nI7nhbH3gmlivya4HYOToCDn1Wo57aold7/SINj+PnqfpVOQQcCl8oavN+kjV9Ne
        QEMzLqbMB/zaxyuRlAw05Kh6GP4yBLhUxHzDk5SwKJ/imnHAc8SRI0YrqYBDjwEf
        4UtZmg54SPKgw3zS8tHxynMQsxg72LJIaCH6oXfct2hI3ZPkL/9XlFutm6+cfArI
        gyU4qlXfbeDhFxf2bVWJc5PjMwCIR5S/8ez4WbBlk49IKT0D8ygeNIyg9OyRHsQr
        Mh6YrqZxEgAJc3rA+W39Uk7f075KQ==
X-ME-Sender: <xms:uPypYVKczby9BWFGj6cYq2KHgBwd0YPHOfbPZahavb_3iF_w2S0hMA>
    <xme:uPypYRJXi537kG6KjZTfvdQ7q1xTDUxiTPQthWrX-9vofFY2fmJ4voMvjaJWnJCgg
    trYq5OSauCkgQ>
X-ME-Received: <xmr:uPypYduWhhzXaL_wWxYnbjd1ZTjqZitoOChchC5Sn1TM-kMdDxz3Xn9T1sdFbJ8xte9Rh9bCVN3WLFZqPKSnoKFvjZmGBw3j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegieejue
    dvffeuvdfftdetfeeuhfekhefgueffjeevtedtlefgueduffffteeftdenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:uPypYWZpnlGQqIOwhxikB6J-vbhW0A4nR1nVJ1NTRkZcZR7qC2FCuA>
    <xmx:uPypYcZIcO2MER3lO1kkpulbgiASm6m7z3kpg_MH-Vaze-qHjkp8GA>
    <xmx:uPypYaB8n0XMafJNRHEM9hvV4sk8pLPg8VvHJZ4BJMpY9Ak_sYWvog>
    <xmx:uPypYRO6AsyVyg0NpfHbdfYlbqmMB4k45Zi5lL3E2wDBbWz5mtL6lA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 06:17:12 -0500 (EST)
Date:   Fri, 3 Dec 2021 12:17:09 +0100
From:   Greg KH <greg@kroah.com>
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 0/5] tools/usbip: Patch set summary
Message-ID: <Yan8tanF5oNjZT5m@kroah.com>
References: <20211130222254.GA16447@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211130222254.GA16447@dell-precision-T3610>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 30, 2021 at 11:22:54PM +0100, Lars Gunnarsson wrote:
> To forward a remote usb device over usbip the following steps is required:
> 
> 1. Execute "usbip bind" on remote end.
> 2. Execute "usbip attach" on local end.
> 
> These steps must be perfomed in above order and after usb device is plugged in.
> If the usb device is unplugged on the remote end the steps above needs to be
> performed again to establish the connection. This patch set implements a feature
> to persistently forward devices on a given bus. When using flag "-p|--persistent"
> on remot end, the USB device becomes exported when plugged in. When using flag
> "-p|--persistent" on local end, the USB device becomes imported when available
> on remote end. Thus it is only required to run the usbip command once on each
> end, in any order, to persistently forward usb devices on a given bus.
> 
> This is sent in five separate patches:
>   tools/usbip: update protocol documentation
>   tools/usbip: update manual pages
>   tools/usbip: add usb event monitor into libusbip
>   tools/usbip: export USB devices on a given bus persistently
>   tools/usbip: import USB devices on a given bus persistently

Oh wow, this patch series subject lines and threading is crazy, there is
no way to figure out what is going on here.

This is what this series looks like in my mailbox:

	Nov 30 Lars Gunnarsson ( 479) [PATCH v4 5/5] tools/usbip: import USB devices on a given bus persistentl
	Nov 30 Lars Gunnarsson ( 206) [PATCH v5 4/5] tools/usbip: export USB devices on a given bus persistentl
	Nov 30 Lars Gunnarsson ( 292) [PATCH v4 3/5] tools/usbip: add usb event monitor into libusbip
	Nov 30 Lars Gunnarsson (  86) [PATCH v2 2/5] tools/usbip: update manual pages
	Nov 30 Lars Gunnarsson ( 118) [PATCH v3 1/5] tools/usbip: update protocol documentation
	Nov 30 Lars Gunnarsson (  20) [PATCH v6 0/5] tools/usbip: Patch set summary


You have a mix of "v" levels and nothing is threaded at all, showing
what patch is related to what.  Look at the lore.kernel.org link for
this, which shows none of the patches in the series:
	https://lore.kernel.org/all/20211130222254.GA16447@dell-precision-T3610/

Please use tools like 'git send-email' and 'git format-patch' to send
and create patches if you don't want to do it by hand as they will
handle the threading and versioning properly for you automatically.

Here's how a patch series looks in my mailbox that was done correctly as
contrast:

	Nov 24 Prashant Malani (  34) [PATCH 0/4] usb: Use notifier for linking Type C ports.
	Nov 26 Heikki Krogerus (  32) ├─>
	Nov 30 Heikki Krogerus (  40) │ └─>
	Nov 30 Prashant Malani (  57) │   └─>
	Dec 01 Heikki Krogerus (  77) │     └─>
	Nov 24 Prashant Malani ( 109) ├─>[PATCH 1/4] usb: typec: Add port registration notifier
	Nov 24 Prashant Malani ( 114) │ └─>
	Nov 24 Prashant Malani ( 199) ├─>[PATCH 2/4] usb: Use notifier to link Type C ports
	Nov 25 kernel test rob (  55) │ └─>
	Nov 24 Prashant Malani (  92) ├─>[PATCH 4/4] Revert "usb: Iterator for ports"
	Nov 24 Prashant Malani (  60) └─>[PATCH 3/4] usb: Link the ports to the connectors they are attached t

See how the patches are linked together?  That is because the correct
"In-Reply-To:" lines are being set.

Please fix up and resend as a "v7" patch series for ALL patches (patch
versions are for the whole series, not for individual patches, otherwise
it is crazy to try to track...)

thanks,

greg k-h
