Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7814254AF41
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jun 2022 13:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234452AbiFNLWI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 07:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233268AbiFNLWG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 07:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A58372495B
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 04:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655205724;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FuRkurbcX3kxyq/mqEblONcSqnZuF1xTQj6POfwhivE=;
        b=CrNMxeu7uUNYpgsGP0evbsPmdmHJboJkwWze7YVZJFH0NeoaWDotT8QTItzvNky0Sv2EDz
        was1TRxtU6rkECOe0a8QqRpA3bAl+pDQDPo/Rz1tjAkPB8alWr4Rfug+Mm8crkC3leiozw
        8RPkSOnNEUU35BThleV9sZ9+TFk5N5E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-rJdecIHkOfWOWuLDpDyP2A-1; Tue, 14 Jun 2022 07:22:03 -0400
X-MC-Unique: rJdecIHkOfWOWuLDpDyP2A-1
Received: by mail-ed1-f72.google.com with SMTP id z20-20020a05640235d400b0042dfc1c0e80so5931546edc.21
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 04:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FuRkurbcX3kxyq/mqEblONcSqnZuF1xTQj6POfwhivE=;
        b=qJ0rO9Dq+u06m0me/8zz9MqlXzaerz6SgY/fLE10B2Z3UzI8gP88o/Xd/P+0S/IgIR
         qiDFZ/vELmCjIgo/KrLuQD8oX0s19eO49bpFIhp8J0LOU9VVD19SMw0ll/yUBSnEEfpt
         NQ5O+C+SPkeZCRNkTNPH+fy4NJ4Fj+0tQRBkRzE/SDgWYOAkUcaFxXE9n8uE9UKhcnQr
         nI02CheEdXSJl+d78BpJPF48tlBZJe/Pgdz0w4a8at+6pt3sEM1OI70OH8Fzn/uKrgji
         +o2izWI8p54SbdoKUseCoTXTiuDdFYxjyHOcWzOQNy6J4bmCwVAvTmRDjTlcofL1aXeX
         S1wg==
X-Gm-Message-State: AOAM533B641PCJQuWp1d1zGg/ju+xRLoE8QvwQuN4WJ9n/EO20MMWlKT
        mmAsDg0I8l25k0dgciUOPws5LcW+Hgo7/sHTUZgKmkkjuom0IqwmlJxo593Kh5m9VbdG4eM8jBr
        117YipwSLQ2EYuQAATjFb
X-Received: by 2002:aa7:d157:0:b0:42d:c3a9:5beb with SMTP id r23-20020aa7d157000000b0042dc3a95bebmr5470167edo.160.1655205722472;
        Tue, 14 Jun 2022 04:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyhAidCDMOfdYnAswlMUBzIUY8nU2L38h95Hm86PKZgAMJSto2eVHEqw+VSlFhuoxbCFsg/w==
X-Received: by 2002:aa7:d157:0:b0:42d:c3a9:5beb with SMTP id r23-20020aa7d157000000b0042dc3a95bebmr5470142edo.160.1655205722246;
        Tue, 14 Jun 2022 04:22:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p14-20020a170906a00e00b007101f6f0720sm4923643ejy.120.2022.06.14.04.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 04:22:01 -0700 (PDT)
Message-ID: <700c885c-c977-4a9c-4aaa-79047f81a602@redhat.com>
Date:   Tue, 14 Jun 2022 13:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 6/9] phy: ti: tusb1210: Improve ulpi_read()/_write() error
 checking
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Ferry Toth <ftoth@exalondelft.nl>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-phy@lists.infradead.org
References: <20220205164535.179231-1-hdegoede@redhat.com>
 <20220205164535.179231-7-hdegoede@redhat.com>
 <YqdcU8nE/SMr353v@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YqdcU8nE/SMr353v@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 6/13/22 17:48, Andy Shevchenko wrote:
> +Cc: Ferry
> 
> On Sat, Feb 05, 2022 at 05:45:32PM +0100, Hans de Goede wrote:
>> ulpi_read() and ulpi_write() calls can fail. Add wrapper functions to log
>> errors when this happens and add error checking to the read + write of
>> the phy parameters from the TUSB1210_VENDOR_SPECIFIC2 register.`
> 
> 
> This patch seems to break Intel Merrifield platform.
> 
> Before:
> 
> [   36.333644] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> [   36.339828] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
> [   36.352566] xhci-hcd xhci-hcd.1.auto: hcc params 0x0220f06c hci version 0x100 quirks 0x0000000002010010
> [   36.367062] xhci-hcd xhci-hcd.1.auto: irq 16, io mem 0xf9100000
> [   36.378429] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> [   36.384705] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
> 
> After:
> [   32.986776] tusb1210 dwc3.0.auto.ulpi: error -110 writing val 0x41 to reg 0x80
> [   32.994053] phy phy-dwc3.0.auto.ulpi.0: phy poweron failed --> -110
> [   33.000601] dwc3 dwc3.0.auto: error -ETIMEDOUT: failed to initialize core
> [   33.007486] dwc3: probe of dwc3.0.auto failed with error -110
> 
> 
> Any ideas?

In my experience with using the phy for charger-type detection on some
x86 android tablets which don't have any other way to do charger detection,
these errors indicate a real communication issue for reading/writing
phy registers. At the same time this usually does not seem to be a big
problem since the phy seems to work fine with its power-on defaults.

In case of Bay Trail these errors were related to 2 things:

1. Autosuspend of the phy-interface block in the dwc3, fixed by:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d7c93a903f33ff35aa0e6b5a8032eb9755b00826

But dwc3_pci_mrfld_properties[] already sets "snps,dis_u2_susphy_quirk",
so I guess it is not this.

2. There being no delay in tusb1210_power_on() between toggling the
reset IO and then trying to communicate with the phy, fixed in:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df37c99815d9e0775e67276d70c93cbc25f31c70

Maybe the:

#define TUSB1210_RESET_TIME_MS				30

Added by that commit needs to be a bit bigger for the possibly
older phy revision used on the merifield boards?

(note it is fine to just increase it a bit everywhere).

Regards,

Hans




 
> 
> P.S> There is no bisect log, since it's done manually with a good guess by
> Ferry. I have just reverted patches on ULPI from this series and start applying
> them one-by-one.
> 

