Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613AC19546A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 10:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgC0Juc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 05:50:32 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46697 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgC0Juc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 05:50:32 -0400
Received: by mail-wr1-f67.google.com with SMTP id j17so10547044wru.13
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2020 02:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O/Xt2YxnxvGOqHEgwxRfPUMM/HDqkvBsetAV4ukEay8=;
        b=nFijgZtf2xkQuon5Ivx2igbl+LiykoJBfnGz31wfLwwJqtL0TXO7p9assVv33ltlSi
         fzfrHvRuAodXvkQ8gC3tyhvypCZN4d+JgYOAB4zoZNfyOCuRBzHRJq8kTUMvUNPiFiAY
         mLElfVoPZ6f0aJVDKoHuPLlXrPQW7qywCh4SR9nu7MZT8ZcHSo/4HgatyLNptBxBuGaC
         AYnHueQQaIzujvSWeS2hUe6NjmXYbDykK90/cz7AgQLSvRsA0cT9ziZ1TqNf5CBYOeDY
         DNAOSUy/8Kyss4f5tyxbJQI4uSM6QytJsb4zZ06rWXCv61QpEk+Uh2iGYfg2ZyiniIH3
         Vtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O/Xt2YxnxvGOqHEgwxRfPUMM/HDqkvBsetAV4ukEay8=;
        b=WSc1hvAD+cvp2qcN1wQeKtOpQbkMCI0xMn6RTA3oH0pLNfzOJg1QhOPquENOkXO8Nh
         Y3kBQO9WUTeuBFEUguvX3+zWP8IP8zwEcgz8/6t0tfDPC1foAw7tSdfCU8tf11Tj0dPz
         MDRdxiedzl+yE6hh+AEtCiYB+xg8x4MeHrAU27SViWnGF9fnrAL9GnSPprmzZCvuOhLX
         1CDJELJmoMyfRtMb5/n0XocfbSSR5Cklgk0QXbaXXcYBgTz6JECZ0CSGt9NKTL5MqLmj
         U7kAXFrDEs3BVS5sPtU5avxEEwOF+PIbi5UHKzfIER0BUt3RTWSZPud4TfV4kjBAC25q
         mJNA==
X-Gm-Message-State: ANhLgQ3GXMa57OX9vuCOlxu9dhq8GEUC3n53QbmQCYbofS5J7sY/bQ7S
        Dh3s6mowABRhO0dnoDV4174=
X-Google-Smtp-Source: ADFU+vtN5eGCnq2lSymlQhO7COvrnm+IKCi6QRpdZmpqSVA8b07ig7rMVujeskZ82g2fv1AlLpNisg==
X-Received: by 2002:adf:e492:: with SMTP id i18mr8951643wrm.316.1585302629731;
        Fri, 27 Mar 2020 02:50:29 -0700 (PDT)
Received: from localhost ([31.17.95.22])
        by smtp.gmail.com with ESMTPSA id t10sm7668651wrx.38.2020.03.27.02.50.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2020 02:50:28 -0700 (PDT)
Date:   Fri, 27 Mar 2020 10:50:28 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oliver Graute <Oliver.Graute@KoCoConnector.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: using cdns3-imx driver on imx8qm
Message-ID: <20200327095028.GA19809@ripley>
References: <20200326170109.GA28051@optiplex>
 <20200327090554.GA31160@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327090554.GA31160@b29397-desktop>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/03/20, Peter Chen wrote:
> On 20-03-26 18:01:09, Oliver Graute wrote:
> > Hello,
> > 
> > What is the right way for using the new cdns3-imx glue usb driver on a
> > imx8qm soc with linux-next. I added this snippet in imx8qm.dtsi and
> > enabled the driver in the kernel configuration.
> > 
> 
> Hi Oliver,
> 
> I just checked linux-next-0326, there is no imx8qm dtsi. 

I'am currently using this series on top of linux-next-0214.

https://patchwork.kernel.org/patch/11248331/


> When I worked this driver, I use a internal version
> based on v5.4, the dts layout is different with internal tree.

I looked also at:

https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi?h=imx_5.4.3_2.0.0

How do I adapt the usbotg3 for linux-next? I already ported some usb
related dependencies from imx8-ss-conn.dtsi. But the cdns3 core driver
is stucked at probe and currently I don't understand how the cdns3-imx glue
layer comes into play.

> 
> Besides, you need a PHY driver for upstream version:
> https://patchwork.kernel.org/patch/11454581/


Best Regards,

Oliver
