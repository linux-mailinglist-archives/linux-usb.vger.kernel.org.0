Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2AC572DE7
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 08:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233945AbiGMGJu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 02:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiGMGJs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 02:09:48 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C03C549F;
        Tue, 12 Jul 2022 23:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657692585; x=1689228585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4nFKxO4afJQpvsWiPSIl6nUGp+NfKatTVDsQqfZtJvw=;
  b=pWN1ofIR8JY7QZIHKg/1OYT3EEr1gLwqfqvBUqdVgY/lqc517/JTQyBK
   62YKAdCDwuk38fe1tFor2TULcXmQP9krO7Kk6cGQ+ySaoF9hSNaUMYMgd
   KB5NhcxLq2RhVZXZPeZppyCW/H+UsHax7d3nlTIgl46xrt5pqO8mrrAk7
   Bt0n5ncgxu7IRKAffQM6cpgwfmKZx4tpVKlOUHXg5Gi2yUmeUVWvVYMus
   rLXfwO6j1HaAB0LTZcDRoQ6IsqgP7P3J3fVOQXXkPbPP/Vg4GpK+1vMyF
   uHPl2QY9s+fHZTZd6jLWHnPcRjY0VE3pYy7cF6DmKXXoQaW58ShM6aovL
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650924000"; 
   d="scan'208";a="25014832"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Jul 2022 08:09:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 13 Jul 2022 08:09:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 13 Jul 2022 08:09:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657692583; x=1689228583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4nFKxO4afJQpvsWiPSIl6nUGp+NfKatTVDsQqfZtJvw=;
  b=fbu1777g4YrFNfun75T6lRt+wHdwoqR6JZmABUhlksFWBI1PDWrOp5WH
   HKAA1HTr6ilTTILrb5EIwV62f/Oc9tCGD28KU5PlvfN2QBqA0BAnRNG2s
   b/B3D7qlXXgR7mnkLiRBLsBUtoeZ8fJrDgTwXnCU/sjSSFWLuufESkKkc
   KXghvwX69YmDlpl0QYuyoMHdcsf/XqQnVI5wiWDBZvwswfiA9fOMWctst
   +FrsRss8mFYPJ+9z0vWGh6eWECh37BZ15B4n5/wlkMw5ntn3fJcIrFGva
   6137aClBm8D9sK5iKKrm19LkgTScS93+i9u2mWqq3aChtG6wHMoqrDR+0
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650924000"; 
   d="scan'208";a="25014831"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Jul 2022 08:09:43 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D9F1A280056;
        Wed, 13 Jul 2022 08:09:42 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub controller
Date:   Wed, 13 Jul 2022 08:09:40 +0200
Message-ID: <2249043.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <b2476f28-6830-860d-9bd6-502aa24031e5@linaro.org>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com> <Ys3mrAukkXXDHopg@google.com> <b2476f28-6830-860d-9bd6-502aa24031e5@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Krzysztof,

Am Dienstag, 12. Juli 2022, 23:32:12 CEST schrieb Krzysztof Kozlowski:
> On 12/07/2022 23:25, Matthias Kaehlcke wrote:
> > On Tue, Jul 12, 2022 at 11:12:06PM +0200, Krzysztof Kozlowski wrote:
> >> On 12/07/2022 19:25, Matthias Kaehlcke wrote:
> >>> Hi Alexander,
> >>> 
> >>> On Tue, Jul 12, 2022 at 05:06:25PM +0200, Alexander Stein wrote:
> >>>> The TI USB8041 is a USB 3.0 hub controller with 4 ports.
> >>>> 
> >>>> This initial version of the binding only describes USB related aspects
> >>>> of the USB8041, it does not cover the option of connecting the
> >>>> controller
> >>>> as an i2c slave.
> >>>> 
> >>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>> ---
> >>>> Well, this is essentially a ripoff of
> >>>> Documentation/devicetree/bindings/usb/realtek,rts5411.yaml with USB IDs
> >>>> replaced, reset-gpio added and example adjusted.
> >>>> IMHO this should be merged together with realtek,rts5411.yaml. Is it ok
> >>>> to rename bindings files? I guess a common onboard-usb-hub.yaml
> >>>> matching
> >>>> the driver seens reasonable. Any recommendations how to proceed?
> >>> 
> >>> It's a tradeoff between keeping the individual bindings simple and avoid
> >>> unnecessary duplication. The current RTS5411 and TI USB8041 bindings are
> >>> very similar, which suggests combining them. However over time hubs with
> >>> diverging features could be added (e.g. with multiple regulators, a link
> >>> to an I2C/SPI bus, a clock, ...). With that a common binding might
> >>> become
> >>> too messy.
> >>> 
> >>> From a quick look through Documentation/devicetree/bindings it doesn't
> >>> seem common to have generic bindings that cover components from multiple
> >>> vendors. In that sense I'm leaning towards separate bindings.
> >>> 
> >>> Rob, do you have any particular preference or suggestion?
> >> 
> >> Not Rob, but my suggestion is not to merge bindings of unrelated
> >> devices, even if they are the same class. By unrelated I mean, made by
> >> different companies, designed differently and having nothing in common
> >> by design. Bindings can be still similar, but should not be merged just
> >> because they are similar.
> > 
> > Thanks for your advice, let's keep separate bindings then.

Ok, thanks for the feedback.

> Although for the record let me add that we did merge some trivial hwmon
> devices like LM75 or LM90 but their bindings are trivial and programming
> model is also similar between each other (handled by same device
> driver). I guess we can be here flexible, so the question would be how
> similar these USB hubs are.
> 
> If in doubt, just keep it separate.

Right now it might seem sensible to have the bindings merged, as the features 
are quite similar. But things might change, if/once i2c support is added. So 
this is one additional matter to keep them separated.

Best regards,
Alexander



