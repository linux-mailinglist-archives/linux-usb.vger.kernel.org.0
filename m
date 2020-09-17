Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACB526E077
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 18:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgIQQTL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 12:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728391AbgIQQSo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 12:18:44 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AC1C06178C
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 08:54:06 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so1616652pgl.2
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SLbdaPRsUm17Oxy4TshTtUDtovCxhCm/CCE1+IYwJv8=;
        b=d7RlsgYHVPiVpsrOpvAWEc4RvTmn1+NdIwLr6SDhRJVU1RnMyCgMfxJ1KWUX88M71x
         EiuWvXsBPc1t1n+DA4dM4TZB6/w+CJJ4wJ0xQXy7zQ/dWeWNHofW1gzGdH28Z8h/Vh1y
         7fqvBfBwFXFjgEnzwLmO0AtTXxY2rKi+dbGAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SLbdaPRsUm17Oxy4TshTtUDtovCxhCm/CCE1+IYwJv8=;
        b=Dqc51v79VPCIK0/S6WsEuV7a+MdDDHFmoBds+c8zbn7gynXOx/BkPPLD5lEg4Xa+ro
         RuRjZ/05rLt+SMyUugsTmBNxsuZPsGYu7d8Qe/+GGwcYw7OFsp8NVcUPdzuEmBNcvvuG
         A3tdTrZnoPW6Yx/kuo+finEfmTloDEcregL815v4LlB4jZ5+mwppPDnHe+NOFClfpd7G
         X38ZMYkauoxqbUaIx9k1iNRPgbEfIizAQ+vOzbr6JZjN5g6spEDQwYDuMnH5Y9QAENu6
         mqWvtEvYbbLCb534uCuM1TPV4LPzNTia9RGg48QY9yrdDtRkoSJ5x2+hkE3AtDibyT1E
         B72w==
X-Gm-Message-State: AOAM530WB1KnJvsaOnktsrWehW4ImVf87rOZs03qZIMB+xqOVNMTFHB9
        G/VpUkTsex/f3GTVDHr1Dc10Gw==
X-Google-Smtp-Source: ABdhPJx3sAJiavm4slDW3NkgOwvuqia4sXV+vKNmPQVo6YaTKWma2qu3v9hvtwlfbebcMPf1/2VNiA==
X-Received: by 2002:a65:4984:: with SMTP id r4mr22470809pgs.261.1600358044925;
        Thu, 17 Sep 2020 08:54:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id 1sm21247pfx.126.2020.09.17.08.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:54:04 -0700 (PDT)
Date:   Thu, 17 Sep 2020 08:54:03 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
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
Message-ID: <20200917155403.GA21107@google.com>
References: <20200914112716.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <20200915025426.GA17450@b29397-desktop>
 <20200915050207.GF2022397@google.com>
 <AM7PR04MB715735A8A102F3EC9041EA328B200@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200915230345.GF2771744@google.com>
 <20200916081821.GA14376@b29397-desktop>
 <20200916191607.GB3560556@google.com>
 <20200917002646.GA23310@b29397-desktop>
 <20200917004758.GD3560556@google.com>
 <AM7PR04MB7157872B1019B748119B7DBA8B3E0@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7157872B1019B748119B7DBA8B3E0@AM7PR04MB7157.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 17, 2020 at 01:24:30AM +0000, Peter Chen wrote:
> > > >
> > >
> > > You may need both (glue & xhci), it depends on system design, and
> > > usually, these two kinds of wakeup setting isn't conflict.
> > 
> > Ok, thanks. So if I understand correctly the onboard hub driver should check the
> > wakeup state of the xHCI to determine if remote wakeup is enabled for the
> > controller (after all it doesn't know anything about the platform device).
> > Wakeup might not work properly if it is disabled for the platform device, but it's
> > the responsability of the board software/config to make sure it is enabled
> > (possibly this could be done by making the dwc3-qcom driver understand the
> > 'wakeup-source' property, as the xhci-mtk driver does).
> 
> No, every level should handle its own wakeup setting. You may have to do this since the USB bus and platform bus
> are two different buses, you should not visit device structure across the bus. And you don't need a device tree property
> to do it. For platform driver, you could use device_may_wakeup, for onboard hub power driver, you could use
> usb_wakeup_enabled_descendants since you need to cover descendants.
> 
> The purpose of these two wakeup logic is different, for USB bus, it is used to tell USB devices to enable remote wakeup
> and do not power off its regulator; for platform bus, it is used to tell the controller to enable its wakeup setting and keep
> the regulator for its USB controller and USB PHY (if needed).

Sorry, I didn't express myself clearly. With the platform device I was
referring to the dwc3-qcom ('glue') in this case, which could check
it's own 'wakeup-source' attribute to enable wakeup at boot. The driver
currently enables wakeup statically. The onboard_hub driver is agnostic
of this device.
