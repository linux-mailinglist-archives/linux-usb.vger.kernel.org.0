Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF1914A75F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 16:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgA0PkH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 10:40:07 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44556 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729538AbgA0PkH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jan 2020 10:40:07 -0500
Received: by mail-oi1-f193.google.com with SMTP id d62so7003982oia.11;
        Mon, 27 Jan 2020 07:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RwQwZevFlTrDSdjxtAiHikYO0hvJy4VPiNd1u9KWS3w=;
        b=kc9zybugzDoroRZ+2GHx+dwOm9NF5qYGXFFPz2AIjZXfAvmxH0OumRbxAWBEGFTMU0
         Lq8JxbWF+2uOH7XvmPplcjuW4nM5qwGmW8ulGV/XClkMfHVRu+CdFWVB1cPBoHqxRZLX
         Xad8l5EIUi7VAJx+ygo8lbgM2Lat0G4j1kIr7DjndDHY9jGFt5g4j7bf7xfxths1hWDh
         WfV5cBcRRmVY7kwQ2Qy8YA29DsQbSMu+fVzKuWNev9WkWlHRj6ReXQXxCvimkUPdHBoN
         80KspeRhl0Uwl7EVXCgDHaTm4LePOvW0XtSsqroooj+zuHH5dNCpIoWuBuvndNwA5NJn
         4X7w==
X-Gm-Message-State: APjAAAXRKAWuGTMqY6XA9Ua/25GnnEDv4UXRV6mUj6OXQDidzEZKFIi4
        Er4Ip1CHYnWOzTlPC8bkOA==
X-Google-Smtp-Source: APXvYqwFoO1WzM9OhkG/CQ093ljC7Z7jRg+UOvp1qnPiv8ZdQXf5MpbHaGx5yl1kPWlgf3o82vpzUw==
X-Received: by 2002:a54:410e:: with SMTP id l14mr7569492oic.42.1580139606090;
        Mon, 27 Jan 2020 07:40:06 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d131sm4924900oia.36.2020.01.27.07.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 07:40:05 -0800 (PST)
Received: (nullmailer pid 5257 invoked by uid 1000);
        Mon, 27 Jan 2020 15:40:04 -0000
Date:   Mon, 27 Jan 2020 09:40:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
Message-ID: <20200127154004.GA5197@bogus>
References: <1579489086-157767-1-git-send-email-hanjie.lin@amlogic.com>
 <1579489086-157767-3-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579489086-157767-3-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 20 Jan 2020 10:58:03 +0800, Hanjie Lin wrote:
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>  - a DWC3 IP configured as Host for USB2 and USB3
> 
> A glue connects the controllers to the USB2 PHY of A1 SoC.
> 
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> ---
>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
