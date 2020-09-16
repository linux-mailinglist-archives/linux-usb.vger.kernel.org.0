Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C85F26C9D3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 21:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbgIPT2p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 15:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbgIPT1s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Sep 2020 15:27:48 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F50C06174A
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 12:27:18 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f18so4550230pfa.10
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 12:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sR/xYZr4LEgOrl+IbZ9jlJQDRZY5vQLajnenX9LFols=;
        b=MNVF8TvcPWY3eeFn4HzT6kU1YkW7DvEZmNLo7UYzumvDpZ4mECWs58glstVCILzfW+
         yaY5Ar/3V3T6TrxxrGNtBWUfp2Mh4ZOcb8StDZf0Z7XH6/zRv0WYYyUVFzY5m2Nu1v7p
         FkL2YwUOGv+fA3lNECNbUWaSIFtnnE0C1krC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sR/xYZr4LEgOrl+IbZ9jlJQDRZY5vQLajnenX9LFols=;
        b=U5XNSA6/1foHy7W2XwHmRmYRbiZ3n+aQ22oFj10xEWjbLLb6Onl2ukmU5cNG5ck7g/
         U4Zd2WgwK/pvOPI45iXhRVEfi7Bl2vR13MHyy8fIsw6ibpAOn7zSybrwbIQ0qRUfE6E/
         UNWnoIwnSaRXgkvetnUpmRPB9EHpDQIj/TszumlFDILZGjJMMYsH7lQTHj9YAcM7gTP0
         qvjlgRGPSUKPnpv/WWMZ4bRxKys3PiQSl7dPbXt13ZLHkSn1Cb8plMQt/9m+wP2wlrYL
         F0BH+/dHXK8y2/e6/2cFNRqCu+EeghzQ9ibsd9GhCsf1CwHq5t2ExsLD3lBfIk0vYDyW
         UWKg==
X-Gm-Message-State: AOAM532jYmRXse3W9ygD6NEsqiglMDpeH0x7mJCaeFTWrNwT0dOtlt4n
        wMerC+tR13n17bX6YaUgW+5Dfw==
X-Google-Smtp-Source: ABdhPJy0DnJtx4hulvq3KJWtC6BUsatwfwJXaBeWhCGFtsumy/RNBJ1kLXeNp7WDRc9RK+97rX8DRQ==
X-Received: by 2002:a05:6a00:1481:b029:142:2501:35d7 with SMTP id v1-20020a056a001481b0290142250135d7mr7928007pfu.55.1600284437582;
        Wed, 16 Sep 2020 12:27:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id k24sm17799139pfg.148.2020.09.16.12.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 12:27:17 -0700 (PDT)
Date:   Wed, 16 Sep 2020 12:27:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] USB: misc: Add onboard_usb_hub driver
Message-ID: <20200916192715.GC3560556@google.com>
References: <20200914112716.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
 <20200914112716.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <20200915025426.GA17450@b29397-desktop>
 <20200915050207.GF2022397@google.com>
 <AM7PR04MB715735A8A102F3EC9041EA328B200@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200915230345.GF2771744@google.com>
 <20200916021421.GA1024554@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916021421.GA1024554@rowland.harvard.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 15, 2020 at 10:14:21PM -0400, Alan Stern wrote:
> On Tue, Sep 15, 2020 at 04:03:45PM -0700, Matthias Kaehlcke wrote:
> > Hi Peter,
> > 
> > On Tue, Sep 15, 2020 at 07:05:38AM +0000, Peter Chen wrote:
> 
> > > Whether or not it is a wakeup_source, it could get through its or its children's
> > > /sys/../power/wakeup value, you have already used usb_wakeup_enabled_descendants
> > > to know it.
> > 
> > I conceptually agree, but in practice there are some conflicting details:
> > 
> > wakeup for the hubs on my system is by default disabled, yet USB wakeup works
> > regardless, so the flag doesn't really provide useful information. I guess we
> > could still use it if there is no better way, but it doesn't seem ideal.
> 
> The wakeup setting for USB hubs affects only the following events: port 
> connect, port disconnect, and port overcurrent.  It does not refer to 
> forwarding wakeup requests from downstream USB devices; that is always 
> enabled.  So maybe your wakeup flag really is accurate and you didn't 
> realize it.

Thanks for the clarification!

> > Similar for udev->bus->controller, according to sysfs it doesn't even have wakeup
> > support. Please let me know if there is a reliable way to check if wakeup is
> > enabled on the controller of a device.
> 
> The host controller's sysfs wakeup setting should always be correct.  If 
> it isn't, that indicates there is a bug in the host controller driver or 
> the corresponding platform-specific code.

Good to know :)

> What driver does your system use?

The driver is dwc3-qcom, Peter pointed me to a patch he recently sent to add
the missing wakeup entry (https://patchwork.kernel.org/patch/11717835/). It
seems that should solve the problem, except for some confusion on my side
about the wakeup flag of the xHCI device vs. that of the platform device
(details in my reply to Peter).
