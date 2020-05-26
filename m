Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A711B1A8D1B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 23:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633602AbgDNVCn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Apr 2020 17:02:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41714 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633583AbgDNVCe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Apr 2020 17:02:34 -0400
Received: by mail-ot1-f68.google.com with SMTP id f52so1180801otf.8;
        Tue, 14 Apr 2020 14:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1nuyaAjNqXWnHHUJzL2XAoGa0wH4Zq86LiHy6nqxsJQ=;
        b=SWVzQGhPDVbIqrNyXwBQOpSSRlU6S7cGLUOwbZtkbBlGCrqFK52hhQIlszeB6p3puT
         7NNuHO+7ZwoEWZ+XeaMkuebm3Vq+IdlQ/pTrOvNWsCDgzvFdZ8NJUJL9PV90RKNK387V
         NidhlWg6bonEzkE1pFjvPinfaQjuYY5Tby4uLps1N6i8nGv9AUPYlOfgVYhW0yCQQf2b
         Rk7vQojgC/UFr8914TjhQRzjMpgOTUCYq6xW/8QOX8elsQE/RnYK570kR9GtsPysfaJ3
         hT5KLa2MVE+58GRbqF97WqLYn3FhId46x2N9VimdjuwQsoQua76NIStcDkiB3EG3Z2nJ
         g9Wg==
X-Gm-Message-State: AGi0PuYc02MC7jq89L9MSL2pmBX2rU1PfKGv9Y8CrtvUvbvowfIQ5ebd
        hGvmXQHH+t1h5wVLS+oigQ==
X-Google-Smtp-Source: APiQypKapzYt9/7Q7GX3xQeCXyCjneXL8ofq3ZPCgF3NijaDtaMlETjB5mxGRQw13Z/0NIvx/NAIzg==
X-Received: by 2002:a05:6830:573:: with SMTP id f19mr11105288otc.195.1586898153253;
        Tue, 14 Apr 2020 14:02:33 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s73sm1425254oih.14.2020.04.14.14.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 14:02:32 -0700 (PDT)
Received: (nullmailer pid 5278 invoked by uid 1000);
        Tue, 14 Apr 2020 21:02:31 -0000
Date:   Tue, 14 Apr 2020 16:02:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 28/33] docs: dt: rockchip,dwc3.txt: fix a pointer to a
 renamed file
Message-ID: <20200414210231.GA5218@bogus>
References: <cover.1586881715.git.mchehab+huawei@kernel.org>
 <287bd271f5c542e9d12a132a6b6a17672c9fd67c.1586881715.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <287bd271f5c542e9d12a132a6b6a17672c9fd67c.1586881715.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 14 Apr 2020 18:48:54 +0200, Mauro Carvalho Chehab wrote:
> phy-rockchip-inno-usb2.txt was converted to yaml.
> 
> Fix the corresponding reference.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/rockchip,dwc3.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
