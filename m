Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1C47985FF
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 22:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730518AbfHUUxD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 16:53:03 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:36889 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728932AbfHUUxC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 16:53:02 -0400
Received: by mail-oi1-f173.google.com with SMTP id b25so2707206oib.4;
        Wed, 21 Aug 2019 13:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SGYHxejg3P6JfEhkuxPGJepswg1DyB62XBYoZAyQOwI=;
        b=DUAQTRXvqGBQTqe+wTaFdmKWlbxIKVF7v4ekZM0frsCrh9Jl/jk02r1v/506/DNKoS
         BiZ33BmRZpac4gs7S54ERse7atITfM+GwNbFEeKztuY92dbSEsVfAXaI/qrMDfBpTqdt
         iVL8ZBpYWHv+XuULDIPmSv9xginQstH+aULQPB/gmnaJdU4yP+fL+Qa1uER3We9NOA9/
         RZCe+SAbUKM1WfzIhcYsTDmFpOI0k8YYKqQOccujfThr3IuGSgcEdgfg1ppJ6Y31E0B7
         rwO5qLtW0DLqEB1oFgJB7kNViz6f9ZQovuoXoRKvfDltOkur8tDsFSgE0DRfOS7GjxMp
         r93g==
X-Gm-Message-State: APjAAAWGsYSBM+2M6noKB5aSKtQqZlpkt9sY9//omDZHtpaszeRe+c62
        AmZDlEV7ctnl7T8ygZF9ow==
X-Google-Smtp-Source: APXvYqzArBaWbsuXw1tcCgjmNjwBnCZk1gjGxZmi6TBOR+eLTO+3Jq5t/Yf6eVyY/6dK5fr8zJcYjw==
X-Received: by 2002:aca:c713:: with SMTP id x19mr1457830oif.158.1566420781078;
        Wed, 21 Aug 2019 13:53:01 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t21sm5531064oic.6.2019.08.21.13.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 13:53:00 -0700 (PDT)
Date:   Wed, 21 Aug 2019 15:52:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [Patch V6 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
Message-ID: <20190821205259.GA12805@bogus>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-5-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565257046-9890-5-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 8 Aug 2019 15:07:22 +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 SoC. This controller supports the USB 3.0
> specification.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Reviewed-by: JC Kuo <jckuo@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 110 +++++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
