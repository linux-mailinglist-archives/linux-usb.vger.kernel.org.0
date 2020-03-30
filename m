Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07A1C197FE4
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 17:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgC3PkK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 11:40:10 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45982 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgC3PkK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 11:40:10 -0400
Received: by mail-io1-f67.google.com with SMTP id y14so1097665iol.12;
        Mon, 30 Mar 2020 08:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5EmumHqhrfCL8+xXAUyvojM91XvH5fmkeDk8mssRyio=;
        b=Y4zBQq/h/+9kX1VkpRt0kfCl1Tz6fzgTSHMjRfp8XtPXUbxC+gIDF5lsOH/kLnN1jl
         GCIBIYnpib6EbiuRkkwNskiyLMe+6vIn4z0LpyVnCtTA18rzMZnI3FzLlI8gr81G/cCt
         mTc1jEZOiieaTAGBvc84OIw/VcKpAYAf8vilX/CQVUEUVg5gAZSaSx8ZNjJyq37B4rKs
         NFTM666D6WORZe7hLoIbzoYJvej1qG6z83WOOrzv3dDCInzrTu/R/9kL0+5tJ+Z5jN8k
         06DamQQWajMSiC0YoUHID5Jk4WIkpuzJ93eDyE60AaQ1o6fOYVGvVcnVXpI8uCLL0pib
         ktPQ==
X-Gm-Message-State: ANhLgQ13uzcl9RI0ftBhXlnYG5ERW8RD3rKY768oKGAHOO3tO5xJfRyw
        FyS9sTS2i2+YJBMBrvAW0w==
X-Google-Smtp-Source: ADFU+vsKIQgLnYrrwgH6uhOytj/9w3/zIJ+UFiYqij0igCbLAlgTBgnkM3lxSz9B8+FRH7ubGIzAWA==
X-Received: by 2002:a6b:fc0d:: with SMTP id r13mr11321245ioh.18.1585582808925;
        Mon, 30 Mar 2020 08:40:08 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f80sm5062140ild.25.2020.03.30.08.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 08:40:08 -0700 (PDT)
Received: (nullmailer pid 21873 invoked by uid 1000);
        Mon, 30 Mar 2020 15:40:06 -0000
Date:   Mon, 30 Mar 2020 09:40:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Al Cooper <alcooperx@gmail.com>
Cc:     linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        Al Cooper <alcooperx@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        bcm-kernel-feedback-list@broadcom.com,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: Add Broadcom STB USB support
Message-ID: <20200330154006.GA21478@bogus>
References: <20200327204711.10614-1-alcooperx@gmail.com>
 <20200327204711.10614-2-alcooperx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327204711.10614-2-alcooperx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 27 Mar 2020 16:47:08 -0400, Al Cooper wrote:
> Add DT bindings for Broadcom STB USB EHCI and XHCI drivers.
> 
> NOTE: The OHCI driver is not included because it uses the generic
>       platform driver.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  .../bindings/usb/brcm,bcm7445-ehci.yaml       | 61 +++++++++++++++++++
>  .../devicetree/bindings/usb/usb-xhci.txt      |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.example.dt.yaml: ehci@f0b00300: 'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.example.dt.yaml: ehci@f0b00300: $nodename:0: 'ehci@f0b00300' does not match '^usb(@.*)?'

See https://patchwork.ozlabs.org/patch/1263005

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
