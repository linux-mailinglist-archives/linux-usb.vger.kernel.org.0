Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2873E242F0C
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 21:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgHLTRn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 15:17:43 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39117 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgHLTRm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Aug 2020 15:17:42 -0400
Received: by mail-io1-f67.google.com with SMTP id z6so4236773iow.6;
        Wed, 12 Aug 2020 12:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vr7JJj3Y9GiAlYzvS0+5aTL0iogN2guoGVxaz2usNJw=;
        b=IDWFXRWPEdxdvvLiERhBXnfHf3giY6BH6XBIR2L6MDTFCgz2Yl3Fb+te+B5pqvevyn
         2gDx9m6ZxpX+KNU+RZ9qBhNJtxqCDWdYHYyC0c1gJroTatvp7dHzDzDtoVl66HiMoLYy
         pXV2rHpY3r63dWZfJqD877k/bfccjVprMGIxuOi+N5DKVWWgHXxg1JgvWojReaK/prLZ
         AUjtBplc1BRN1qSuDgChLoXD/MDN3J02s/UY1xugS+TklrKouZPk7TUcnxnKY0jjhCYy
         F7sl7gz0sqRwYQNK6VdD23MnGWpKCEVJEIOxlnwPMjJepIGXYh35S6oIOCCB81lkWfkK
         BMxw==
X-Gm-Message-State: AOAM532Ubj7ruE+YkO/QKe2+4ki7noroVVyGxR7aut46JiHN34XNH1ZA
        K1jP/4YgAA9gbcpYMpdGBg==
X-Google-Smtp-Source: ABdhPJxKxxPnwqRVYO+YsLSkOXYLymeOGqqn5pXYeKm702C03Xpk9n/t2XJ36W4WDKO1aokbNYZANA==
X-Received: by 2002:a02:bb82:: with SMTP id g2mr1048806jan.54.1597259862191;
        Wed, 12 Aug 2020 12:17:42 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z9sm1462109ilm.78.2020.08.12.12.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 12:17:41 -0700 (PDT)
Received: (nullmailer pid 2552036 invoked by uid 1000);
        Wed, 12 Aug 2020 19:17:40 -0000
Date:   Wed, 12 Aug 2020 13:17:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org
Subject: Re: [PATCH v3 1/4] doc: dt-binding: ci-hdrc-usb2: add property for
 samsung picophy
Message-ID: <20200812191740.GA2551988@bogus>
References: <20200724060532.3878-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724060532.3878-1-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 24 Jul 2020 14:05:29 +0800, Peter Chen wrote:
> Add two parameters which are used to tune USB signal for samsung picophy,
> which is used at imx7d, imx8mm, and imx8mn.
> 
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v3:
> - Changing propery name to indicate it is a samsung phy
> - Add property range and default value.
> 
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
