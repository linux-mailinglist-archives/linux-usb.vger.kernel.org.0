Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF10A13C8B4
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 17:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgAOQFT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 11:05:19 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36973 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgAOQFT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 11:05:19 -0500
Received: by mail-oi1-f193.google.com with SMTP id z64so15885172oia.4
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 08:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AIn1O5GCmKw7dugKJey6e6TvKV2y4GDiW1xXQSe2Ay0=;
        b=CuESpJsh95As/IeMZdwwX0c4vrLK9YonW1/J6GwdRqCihvRpqdH1UIgfA7SmPJKy4K
         p6sf0arR39uyOcWL6e8L3QslfZEk/3kcy2bS6iT8GM0QHLRTnmp6VO4Y22VBR62aPP9d
         Yoy41gL+kT8jxShcLuAtIhx7CRMqcrUdXHgfPFD9+sbBSEgbLJF2iuafIcln8Vy3Zu4r
         uhtgY1XCCCkTapJGbQHIKKtBVjiPtBJa/APrwLdiqKxMFdsSdVe3j5jLthyS/sofY9t3
         XxVf+NvjrSvZEurvWM8PJr6B6wNp1trHGRBnxFa1u+yFJxKHwcucH1QeLsBmjDMC8Z8d
         M11g==
X-Gm-Message-State: APjAAAWcF9XXPSwfk7Jslf7N5h6q9EQOFD5H9zGbWfO1Ke4CbFLuxm+B
        uIUYQQ5LCbSDOXXiEAmKOp2H17o=
X-Google-Smtp-Source: APXvYqzaTrhUSIaybvU0xY9AafJxBlZlmkv58i2ae+tHFNxiTQZy8xamogPb7WGRju7Hxlnxtq4cDg==
X-Received: by 2002:a54:4396:: with SMTP id u22mr401145oiv.128.1579104317705;
        Wed, 15 Jan 2020 08:05:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s128sm5774151oia.4.2020.01.15.08.05.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 08:05:17 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22040c
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 10:05:16 -0600
Date:   Wed, 15 Jan 2020 10:05:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        robh@kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com,
        JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH v1] dt-binding: usb: add "super-speed-plus"
Message-ID: <20200115160516.GA18911@bogus>
References: <20200113060046.14448-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113060046.14448-1-jckuo@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 13 Jan 2020 14:00:46 +0800, JC Kuo wrote:
> This commit adds "super-speed-plus" to valid argument list of
> "maximum-speed" property.
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  Documentation/devicetree/bindings/usb/generic.txt | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Applied, thanks.

Rob
