Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F15F140F13
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 17:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgAQQgp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 11:36:45 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35695 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgAQQgp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 11:36:45 -0500
Received: by mail-oi1-f193.google.com with SMTP id k4so22741987oik.2;
        Fri, 17 Jan 2020 08:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IewFuBKmGoCSK8RfRVXaLBq0CbcaGKATXKy1D8qkvcQ=;
        b=CNdxLkfMZOH4uYVBS3IAEyb8j7xNfHnkXCw7wDCo6z4beChe0f8nCi6nDuar0N2kA5
         Pt03+2ddEonDLrWQuBVz6eWNMUj/hvb5y7u1HwduXVda2IjwJdyqCTlVayuiN7fMJW/T
         CjLvHrMre2Ch5JmXGXn6sj7FvqHqC5YBPVFeacquJkd+5vWDZsX1SY0EC5+QUxiaEuRB
         1ElEe1opIZ7gHEWFpHy84/HNhIoX00sgb1cQAEAAU8CZhw3L9K+aoPcaSEmq143rtiDO
         aaJQ8coTkSkuxf33EgvnRcNLrnbjkUIcxqWZt4/ddOy5RMj5igCOqKNE6DIdNh4DVCwY
         KITA==
X-Gm-Message-State: APjAAAUH9OgIxtx4RSr0GkPFpN7rBTt51PcxQ6FNgmaL+xK67jvUe0Mv
        erNUFbRVIuBNMjA1Kyq/TyiJuZ4=
X-Google-Smtp-Source: APXvYqyOFq+xE1QS2BO3+poxNMtpcUaYiXNpuJ/xk/dtoMC4kTw/mVBLr9Fbc+codyaUFKv0ygnNUQ==
X-Received: by 2002:a05:6808:9b4:: with SMTP id e20mr3833973oig.37.1579279004339;
        Fri, 17 Jan 2020 08:36:44 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z21sm8975604oto.52.2020.01.17.08.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 08:36:43 -0800 (PST)
Received: (nullmailer pid 1692 invoked by uid 1000);
        Fri, 17 Jan 2020 16:36:42 -0000
Date:   Fri, 17 Jan 2020 10:36:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
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
Subject: Re: [PATCH v6 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
Message-ID: <20200117163642.GA1636@bogus>
References: <1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com>
 <1579220504-110067-2-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579220504-110067-2-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 17 Jan 2020 08:21:39 +0800, Hanjie Lin wrote:
> Add the Amlogic A1 Family USB2 PHY Bindings
> 
> It supports Host mode only.
> 
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> ---
>  .../bindings/phy/amlogic,meson-g12a-usb2-phy.yaml         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
