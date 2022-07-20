Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4C357B195
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 09:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235321AbiGTHS5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 03:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234048AbiGTHSy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 03:18:54 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A22766BB3;
        Wed, 20 Jul 2022 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658301532; x=1689837532;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zUPz/jNHWKV/ruP+0EbV2srSIJLyNRaeKOLx7V5MVtI=;
  b=q5ANMqFxelHqChsVD/XZF5U3fk/9MpH/rD5kklZvx+AfUi1qOUCVrYWk
   3rn2aWI6k73hDx0/BgfZEtQGTNOI8Xa5iD3PuA4ac+tn0F1gXoHC7JgF4
   wblUfASk0me/jsAEjTfV2SZeWpGLYM/JxsdmArBk7k+1+G3bKBElMkfQI
   W0jckgZXpkcggaVwTMlJxcWsy0oTeibWqXqLKUPDGuXzWoLupKbbbT09o
   geGlhHqBL2i2P5roxT1tQ16c1erjklRwt7rB4BvWcwCwsoANTNALOJyKY
   jnvLcWa3UnwUPJAeyD8+kYRxQcOikNpu3JeBbra1u8qbc/zEuNX1pLGrF
   A==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25149610"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jul 2022 09:18:50 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 20 Jul 2022 09:18:51 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 20 Jul 2022 09:18:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658301530; x=1689837530;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=zUPz/jNHWKV/ruP+0EbV2srSIJLyNRaeKOLx7V5MVtI=;
  b=V4mmg62R7nkoZyURncAhv3CgJQA3DCzJBLpMwdTv9ZEJnPqMO+wJcP+e
   h0BBf+YHhXiSdtU+OsdjO9oCTIVvFKH/iwkJZ/VyGG4DZ/qj+zil66Zjk
   +kiqkq+mNl4Blod7uVz1BYXlVmwxgcuVnVIXPxyt4sll77QtT+Y7DQtrU
   PGDExyCuJJcQShGMvmxyeF5/oFupQaygwiUL4Rp9a8mCa6Qpu0B6UEVqT
   ZWxF2AU6myp5TJREwoMB9KnfSFcStOA7zGqqsCRS4g6DlJtitt18zBk4/
   0Fnj+lY3yd9NhsEU6uQYvrqSxu1JsFgi5JaMqlaA6yGgf8tu7DvOQ90Z4
   A==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25149609"
Subject: Re: Re: [PATCH v2 3/3] usb: misc: onboard_usb_hub: Add TI USB8041 hub support
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2022 09:18:50 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 911B4280056;
        Wed, 20 Jul 2022 09:18:50 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Date:   Wed, 20 Jul 2022 09:18:50 +0200
Message-ID: <3525334.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtHFEY+iAipCROPl@google.com>
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com> <20220715073300.868087-3-alexander.stein@ew.tq-group.com> <YtHFEY+iAipCROPl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, 15. Juli 2022, 21:50:41 CEST schrieb Matthias Kaehlcke:
> On Fri, Jul 15, 2022 at 09:33:00AM +0200, Alexander Stein wrote:
> > This is a 4-port 3.0 USB hub.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Add devtype data containing waiting times
> > 
> >  drivers/usb/misc/onboard_usb_hub.c | 3 +++
> >  drivers/usb/misc/onboard_usb_hub.h | 7 +++++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/usb/misc/onboard_usb_hub.c
> > b/drivers/usb/misc/onboard_usb_hub.c index 1dd7f4767def..319b4b1748fb
> > 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.c
> > +++ b/drivers/usb/misc/onboard_usb_hub.c
> > @@ -339,6 +339,7 @@ static struct platform_driver onboard_hub_driver = {
> > 
> >  /************************** USB driver **************************/
> >  
> >  #define VENDOR_ID_REALTEK	0x0bda
> > 
> > +#define VENDOR_ID_TI		0x0451
> > 
> >  /*
> >  
> >   * Returns the onboard_hub platform device that is associated with the
> >   USB
> > 
> > @@ -416,6 +417,8 @@ static const struct usb_device_id
> > onboard_hub_id_table[] = {> 
> >  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
> >  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
> >  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
> > 
> > +	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
> > +	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
> > 
> >  	{}
> >  
> >  };
> >  MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
> > 
> > diff --git a/drivers/usb/misc/onboard_usb_hub.h
> > b/drivers/usb/misc/onboard_usb_hub.h index 7e743f4c8aaa..fcb6a9024bbd
> > 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.h
> > +++ b/drivers/usb/misc/onboard_usb_hub.h
> > @@ -11,7 +11,14 @@ struct onboard_hub_devtype_data {
> > 
> >  	unsigned long reset_duration;		/* reset pulse width in 
us */
> >  
> >  };
> > 
> > +static const struct onboard_hub_devtype_data ti_tusb8041_data = {
> > +	.power_stable_time = 3000,
> > +	.reset_duration = 3000,
> 
> Aren't these two values actually the same thing, i.e. the minimum
> duration of the reset?
> 
> From the data sheet:
> 
>   A minimum reset duration of 3 ms is required
> 
>   td2: VDD and VDD33 stable before de-assertion of GRSTz (>= 3ms)
> 
> My understanding is that td2 is just another expression of the first
> requirement.

They may have the same values, but IMHO they are applied differently.
'power_stable_time' (or power_stable_us now) applies after supplying power, 
while 'reset_duration' (or reset_us now) applies when you deassert the reset 
line. 
For that reason I would like to keep them separated.

Thanks and best regards,
Alexander



