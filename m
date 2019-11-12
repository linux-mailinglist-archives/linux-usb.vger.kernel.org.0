Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B97F9994
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 20:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfKLTSy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 14:18:54 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42867 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfKLTSy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Nov 2019 14:18:54 -0500
Received: by mail-ot1-f68.google.com with SMTP id b16so15321295otk.9;
        Tue, 12 Nov 2019 11:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C8RN/4Lot74Z8hHAoW4T8RvZMwjuhJQp7SZN7GEXRZo=;
        b=I4bbeUuMCNCRAUNr+1vZ/zGzHzJ3mD3psb3UKXydPCTzgLn4gv8qIyl8sGxePEGbBH
         tGlSKA3q3sSV4V5Ce9Fnt9YNvysSOTSvz+6gTr0epiNVHOEzJPyI1S/vdM8yYTLulxO8
         ALa8j6A9teR57JbvH4sNFVp4t4y+gwxYw+hXzcBhfun1SsjVIl8uCHl//6SRO3jZ65NJ
         V1Oa6XrUOMMdl5mJc7fkYwZr4h0IAaUViV5G3tJdfxOTsB+Jaz+3bOcffIFmDq3w8AVZ
         n5hx8L8z/V2a8Xqf0NxX1m4m4wiLk1IFsNCmEOLEzrrO7ZjUb8X2aRNiRPT9ZTFsEfhQ
         YxfA==
X-Gm-Message-State: APjAAAW5DeYtYcv+o3gIwcPZReJUUtepys0R/NC9iUC0hjj+5WO75rBN
        NugtkrNQUqskA63/wDU0oQ==
X-Google-Smtp-Source: APXvYqw5bl13Kzo4qqKC0gVYIr7J47XJMAX9hl5y++C4Qm7VvY/Iq9HpaD6ItEZmttJyzDJ74ZvUtw==
X-Received: by 2002:a05:6830:13d5:: with SMTP id e21mr26066466otq.271.1573586332791;
        Tue, 12 Nov 2019 11:18:52 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c20sm6260196otm.80.2019.11.12.11.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 11:18:52 -0800 (PST)
Date:   Tue, 12 Nov 2019 13:18:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: usb: generic: Add
 role-switch-default-mode binding
Message-ID: <20191112191851.GA5974@bogus>
References: <20191108011723.32390-1-john.stultz@linaro.org>
 <20191108011723.32390-3-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108011723.32390-3-john.stultz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri,  8 Nov 2019 01:17:22 +0000, John Stultz wrote:
> Add binding to configure the default role the controller
> assumes is host mode when the usb role is USB_ROLE_NONE.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> CC: ShuFan Lee <shufan_lee@richtek.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Yu Chen <chenyu56@huawei.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Jun Li <lijun.kernel@gmail.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Jack Pham <jackp@codeaurora.org>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v5: Switch to string rather then a bool
> ---
>  Documentation/devicetree/bindings/usb/generic.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
