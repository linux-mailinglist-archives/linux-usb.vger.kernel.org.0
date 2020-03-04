Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E231794C2
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 17:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387505AbgCDQQO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 11:16:14 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42673 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbgCDQQO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 11:16:14 -0500
Received: by mail-oi1-f195.google.com with SMTP id l12so2616162oil.9;
        Wed, 04 Mar 2020 08:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GhAsniKvYUMptrJyDO+p1c/FdpaCICij3vPs9vpAABc=;
        b=AM/n4YR00J/Wy1i49Km/cUAwb+B0QZnL2VFTA2dq2ZpNR8oRTzr16Ursul74awi/a6
         6ilnUfUmh9XyF3aO6ydFSZv0P4tfvb9cWlr/BGF8YrW/BsjaTomBl4nMhm/mWZlSfsuq
         Y1ZznhItVa5nrzSwP+6E5oHVDOa5mjY1tTTLpTDs8N8jfmA4Y1v4L1YLnydYIpRQtId/
         R254ipFeUijAknWmM0snIiJn/hV16qgv74bi8+4tlPmn7O08W0aD7vAZpM5/U8z9FwPZ
         AjebC5mQcXI2XHgv77Jiaa8y+1xeNK6mI4o7flrhZQPodbEixf99Q/MyvXl1JNKl3g1o
         UJew==
X-Gm-Message-State: ANhLgQ1TLz5Glzy8oVAZqS7z5pIYgt3X0r9blZsHkFMj0LLMy4jVygQ7
        nezqOtilgFTiaEdpyQZTxg==
X-Google-Smtp-Source: ADFU+vscMM6br/Xn3C+U6tfhoqQLV4NMo3JZu/sSuSbhBxEB3/oNdCr4+Z6EvzgPb0uWjeursQTGaw==
X-Received: by 2002:aca:4f8e:: with SMTP id d136mr2309174oib.77.1583338572096;
        Wed, 04 Mar 2020 08:16:12 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s83sm8891708oif.33.2020.03.04.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 08:16:11 -0800 (PST)
Received: (nullmailer pid 26946 invoked by uid 1000);
        Wed, 04 Mar 2020 16:16:10 -0000
Date:   Wed, 4 Mar 2020 10:16:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     rentao.bupt@gmail.com
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Colin Ian King <colin.king@canonical.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        taoren@fb.com, Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH v7 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200304161610.GA26873@bogus>
References: <20200303062336.7361-1-rentao.bupt@gmail.com>
 <20200303062336.7361-8-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303062336.7361-8-rentao.bupt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon,  2 Mar 2020 22:23:36 -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add device tree binding documentation for the Aspeed USB 2.0 Virtual HUb
> Controller.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  Changes in v7:
>    - updated to dual license.
>    - removed description for "reg" and "clocks" properties.
>    - Added constraints (minimum/maximum/default) for vendor specific
>      properties.
>  Changes in v6:
>    - added 2 required properties into example and passed "make
>      dt_binding_check".
>  Changes in v5:
>    - updated maintainer to Ben.
>    - refined patch description per Joel's suggestion.
>  No change in v2/v3/v4:
>    - the patch is added to the patch series since v4.
> 
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
