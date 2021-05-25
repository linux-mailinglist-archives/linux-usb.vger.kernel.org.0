Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DF4390767
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 19:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbhEYRWC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 13:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233745AbhEYRVo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 May 2021 13:21:44 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF53C061574
        for <linux-usb@vger.kernel.org>; Tue, 25 May 2021 10:20:13 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id q25so6087993pfn.1
        for <linux-usb@vger.kernel.org>; Tue, 25 May 2021 10:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0ZW710WMTVU/rhTJ9pJrGtoEN8Es/IYU5eqz2cSniTw=;
        b=mPofpo9R1ZIS4mJ0nVfiAZhXVI6DrKYvTqiOwseJSvaXOLIhH0qVRYDdGN1k4si3JL
         E4jUzXe/n8Sn1ZNGaRqlAM8S2KZuID2uFBkgxr/IboVp1NR6PC9lbxeq+gyeyPVmKGXI
         gdqBB2bdWt4JGUOgh1gBrwCIGZthH9pFR0YEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0ZW710WMTVU/rhTJ9pJrGtoEN8Es/IYU5eqz2cSniTw=;
        b=cT+Zp3lUwc35Z8mGgydDmFQZk0EphMkruqHa0CQHcfMfcQ4m1iMk6J8G1YboG3Gc8l
         P3Xb4QO7+NtCcPcdaBNH3+9vl40zE52w043Rps/HYt8c1h/GONWdlLn4jJiCezYmFA9z
         L5HETc18uP1LkbOB5qwP2eUt7RbZqwKbXrvaMV0mkUnQH/Zovbpb6RlvJlDT2C6tSrCT
         P23oEv53HtiEUX3TsRpp531crvUPnX3KEDzHC2stW9kftGVKbx+351CyXa0zM92IThKa
         2va681+zHMzhuu5/9H9u+myQo6di6KqLNdVUMRRVhKMyKyEZCIY2dRI4S5wytaUclUpW
         eFTA==
X-Gm-Message-State: AOAM530nkBPWwxkNFUAdH8tof5UnPijJbjJFOKIT6+dbEKij60DSz/tR
        oOWk8wbo98lwdA5fBWTf/C0N5Q==
X-Google-Smtp-Source: ABdhPJyHqhVZhAfLCXQWGfWxKqDYqNm0Zw6XXmhbL7ULffsKvJ0KsmowTifw2htA6udPXNE7d9aa1g==
X-Received: by 2002:a05:6a00:234f:b029:2c4:b8d6:843 with SMTP id j15-20020a056a00234fb02902c4b8d60843mr30995973pfj.71.1621963213212;
        Tue, 25 May 2021 10:20:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ab0:bbc9:a71:2916])
        by smtp.gmail.com with UTF8SMTPSA id o24sm14593603pgl.55.2021.05.25.10.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 10:20:12 -0700 (PDT)
Date:   Tue, 25 May 2021 10:20:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v10 2/5] USB: misc: Add onboard_usb_hub driver
Message-ID: <YK0xyi+LjIeRAKI9@google.com>
References: <20210511155152.v10.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <YKPz7a68duMyXU5x@google.com>
 <20210518194511.GA1137841@rowland.harvard.edu>
 <YKQ0XxhIWaN37HMr@google.com>
 <20210519144356.GB1165692@rowland.harvard.edu>
 <YKWaJdrpj1ixx9+v@google.com>
 <20210520020521.GB1186755@rowland.harvard.edu>
 <YKZnA2bifn346bPa@google.com>
 <YKbRJylHrDiuSRGH@google.com>
 <20210521011436.GA1224757@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210521011436.GA1224757@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 20, 2021 at 09:14:36PM -0400, Alan Stern wrote:
> On Thu, May 20, 2021 at 02:14:15PM -0700, Matthias Kaehlcke wrote:
> > On Thu, May 20, 2021 at 06:41:23AM -0700, Matthias Kaehlcke wrote:
> > > On Wed, May 19, 2021 at 10:05:21PM -0400, Alan Stern wrote:
> > > > On Wed, May 19, 2021 at 04:07:17PM -0700, Matthias Kaehlcke wrote:
> > > > > On Wed, May 19, 2021 at 10:43:56AM -0400, Alan Stern wrote:
> > > > > > On Tue, May 18, 2021 at 02:40:47PM -0700, Matthias Kaehlcke wrote:
> > > > > > > 
> > > > > > > Could you also have a look at "[4/5] usb: host: xhci-plat:
> > > > > > > Create platform device for onboard hubs in probe()"
> > > > > > > (https://lore.kernel.org/patchwork/patch/1425453/)? It's a
> > > > > > > relatively short patch that creates the platform device for
> > > > > > > the driver from xhci-plat as you suggested in the v4
> > > > > > > discussion.
> > > > > > 
> > > > > > I'm not the maintainer for xhci-related drivers.
> > > > > > 
> > > > > > However, there is at least one thing about this patch which looks 
> > > > > > suspicious: Adding the onboard_hub_dev pointer to struct usb_hcd instead 
> > > > > > of to struct xhci_plat_priv, where it would make a lot more sense.
> > > > > 
> > > > > I can move it to struct usb_hcd if that's preferred
> > > > 
> > > > Thinko: The patch already has it in struct usb_hcd.  I suggested moving 
> > > > it to struct xhci_plat_priv.
> > > 
> > > Ah, didn't actively recall to which struct I added it to, it has been a
> > > while since I wrote that patch ;-)
> > 
> > > Agreed that struct xhci_plat_priv is a better place.
> > 
> > Or not, xhci_plat_priv is optional, which doesn't make it a good candidate
> > for holding a field that could be used by any xHCI controller.
> 
> You could always allocate an xhci_plat_priv structure in cases where an 
> onboard-hub device is present, if one doesn't exist already.

that's an option, thanks for the suggestion.

> > Should I move the field to struct xhci_hcd instead?
> 
> That's another option.
> 
> Look, I'm not the person you should be asking about this.  What I say 
> doesn't matter -- you need to get approval from Mathias Nyman, the 
> xhci-hcd maintainer.

ok, thanks
