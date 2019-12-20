Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE45128533
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 23:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfLTWsE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 17:48:04 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:35200 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfLTWsE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Dec 2019 17:48:04 -0500
Received: by mail-il1-f196.google.com with SMTP id g12so9316475ild.2;
        Fri, 20 Dec 2019 14:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5ydh8/8SwQZQURpsj7H5OMlNH6BqWqcQ+ZSr278ZEo8=;
        b=p5nTIHIDOZeE5Lqqnshklv7LPVQaFQft7rGYRhMWXwZumlmvgCbzjTYCtVi3gcoc9u
         rlSiJpDLoMx1i+/4BLEqbbZ4fWxUtv9900at5i1Jg/0s7TBWiavTs7CXXYyoyxwElcXL
         6d43HaGk6SkY58Dh4jPlqKZdwTX45P/qs0l3FK7VvTMeaEGjrG8a0CCi2AM9WnTUPpgz
         e2Y/AM2SwxRVAPRT7Zmqma9shMm4TsQ+7ToXn2NHsbfVar2uu2sXkCUKUru4ojmW8slT
         KbxRDstuEML2o8IwTBc0xFZLg153dQ16bd9AF12C1FxFJMJuG4BXSPz6nXpRDoHL+qrt
         3QdQ==
X-Gm-Message-State: APjAAAUDOSfh1Ec04O8jRgHuYoOCrbXywVJHKKcLKPruGnrUsIpdVk0j
        pLX9maYC73ESqOyOsa7hUw==
X-Google-Smtp-Source: APXvYqzy+s5mc7VlnG7SFlraOtuA08IEQUgo479SMw+kCniTuFHiYyY/N6k1UpCt0aeX1y2CIkVv9Q==
X-Received: by 2002:a92:af08:: with SMTP id n8mr14166376ili.217.1576882083423;
        Fri, 20 Dec 2019 14:48:03 -0800 (PST)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id j26sm3918819iok.3.2019.12.20.14.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 14:48:02 -0800 (PST)
Date:   Fri, 20 Dec 2019 15:48:02 -0700
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com, khilman@baylibre.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: fix clock
 names
Message-ID: <20191220224802.GA26316@bogus>
References: <20191218142613.13683-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218142613.13683-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 18 Dec 2019 15:26:13 +0100, Benjamin Gaignard wrote:
> dwc2 bindings require clock-names to be "otg".
> Fix the example in amlogic,meson-g12a-usb-ctrl to follow this requirement.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
