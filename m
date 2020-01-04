Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 085D312FF9D
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2020 01:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgADAdp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 19:33:45 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:34383 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgADAdp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jan 2020 19:33:45 -0500
Received: by mail-il1-f193.google.com with SMTP id s15so38063389iln.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jan 2020 16:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2jtU2GwA92LWxQFkeCrbjyJNc+9eRgZ+rt7rVVu7gPA=;
        b=Lt94AwlXCO4yhnvkq6TH/2aETIXM4v/dRwGwL5XNmFxP1KN3EJdle2U9fuZBYe1fzh
         LYhIKlUoJMb5zseeQJF1tCIn0BzctG0AHfcmMNi4E9tyRuwCSgZwktfgu9ZGot+o9gOe
         wkIZ6wEZ3S4RZh2ygtDumEkQpyIn7ffhXatvG9YHZ+0zUyksDlp3ndzVpBA858je94zj
         ds+9PCcHit4tXiUkdEY0f6b1df9zLg20sL8K1ibq8mC+RF/slVdPv+C2n2JOxufaqlZk
         ybxfXzhP1ce7UiCdmFfjr8pZNWNZ/h2L+DNKhxuaRn7ZcnDF6mtzd/rkOfyGhsqq8e1T
         Oncw==
X-Gm-Message-State: APjAAAWml99+2QCFJU8sbEdhnTDi7V3xJi3SRh0biVKutIcFwW4twnZD
        0cVgLNMCd2KKdoEIHtxyMwGuIP8=
X-Google-Smtp-Source: APXvYqwuprLY1m5EUZ8x6S86snR9cvfjGnnf8/kBKLtDsaM+J4t3wSfHYRJ768fOVa8GeySHrkHD/w==
X-Received: by 2002:a05:6e02:cc5:: with SMTP id c5mr62053704ilj.47.1578098024028;
        Fri, 03 Jan 2020 16:33:44 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id e184sm9102506iof.77.2020.01.03.16.33.42
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:33:43 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221a53
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:33:41 -0700
Date:   Fri, 3 Jan 2020 17:33:41 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/16] dt-binding: usb: ci-hdrc-usb2: Document NVIDIA
 Tegra support
Message-ID: <20200104003341.GA5889@bogus>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191228203358.23490-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 28 Dec 2019 23:33:43 +0300, Dmitry Osipenko wrote:
> NVIDIA Tegra SoCs use ChipIdea silicon IP for the USB controllers.
> 
> Acked-by: Peter Chen <peter.chen@nxp.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
