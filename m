Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5698312FFB3
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2020 01:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbgADAhY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 19:37:24 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:33643 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbgADAhT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jan 2020 19:37:19 -0500
Received: by mail-io1-f48.google.com with SMTP id z8so43113437ioh.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jan 2020 16:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DyH66go0qsvcEZgmTI6bctw9NNe8CYLjRZjlFnsO2lI=;
        b=FczkugBarosy0TFO1YXSMSo2+OD/Ir5sFQhDDuckBqSkrTjw5h8LmCBDyZ++3tCumt
         6qzgRFSV9KyoviHAx6zPpOr7aEw76FmpnNxYCU3s5+s/meUxIzxZCvmLSaC/Bd7Xj1+W
         9vcU1zkkrqc2JlTsH3vRAmOIgTcG0Ef1ZGSgbXL0JdaoOT7HJTUqKhlSLLCg8qD3eLd0
         VOVM433uWz8fiKlU495pshjF7EpvOhSmPqDtC5aHfezqSZtcGb0IssbNpTatCiY9gOjR
         rhuCYTxgWvJV3r6N6RcDc5Kw631Dm4qtE/QCSKWgt7r3SFeaFvSngpyb+eAUK7LEgTpO
         6Bjg==
X-Gm-Message-State: APjAAAXUBRtoKWm8ZDmHXL7oav00yrRd1ncwJfVLBZJqTv0zS12duui9
        91bqdNPLjllO16awyt10AQVDlRg=
X-Google-Smtp-Source: APXvYqwvSSDcrTuqW8gjnPQBQ3PDJFSgAtRzeemIMFkWncCV7zgcV3/oopOEnqcRYtZAVdS1Ppmt4w==
X-Received: by 2002:a02:cdcb:: with SMTP id m11mr72001455jap.125.1578098238629;
        Fri, 03 Jan 2020 16:37:18 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id m90sm17530111ilh.56.2020.01.03.16.37.17
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:37:17 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:37:17 -0700
Date:   Fri, 3 Jan 2020 17:37:17 -0700
From:   Rob Herring <robh@kernel.org>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [Patch V3 01/18] dt-bindings: phy: tegra-xusb: Add
 usb-role-switch
Message-ID: <20200104003717.GA11747@bogus>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-2-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577704195-2535-2-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 30 Dec 2019 16:39:38 +0530, Nagarjuna Kristam wrote:
> Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
> entry is used by XUSB pad controller driver to register for role changes
> for OTG/Peripheral capable USB 2 ports.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> V3:
>  - Added Acked-by updates to commit message.
> ---
> V2:
>  - Moved usb-role-switch to seperate Required section as suggested by Thierry.
>  - Added reference to usb/usb-conn-gpio.txt for connector subnode.
> ---
>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
