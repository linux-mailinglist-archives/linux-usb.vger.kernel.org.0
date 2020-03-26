Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D357A194511
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 18:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgCZRHi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 13:07:38 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35831 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgCZRHh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 13:07:37 -0400
Received: by mail-wr1-f67.google.com with SMTP id d5so8806303wrn.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=yG8mnS/7Wf3QagIw1IRfoA9/vCQQokGdgqK1IOvHV2g=;
        b=gGAH1JK2Yqu/Rri3kAaRKibkz8KDdvvV/vElt8nedk6qIbHVCMaPx6mQFn2XpVFDTw
         UfoFUA776en0f2UfP809nn+ZA1SCsOzenJsneVoldU5pXPHVpfhWH5c9yOUtePlbC4NZ
         DAj9mNDwdeGkV8Fm/ARam9FQwjDdCJKvjqpEqfRmRBom+Kzz6oy7aHI5E6QwTLeBIsj1
         qg7TWXkUU4CaFb6XuB4/fHD14mSKQ/zaYu5kOUga+xffAKsgvUz7ChKlqQ/irCW7KJtm
         76z03fsD0mdKLgeVFMn4cUkWHa0QsNjGWqdM3skWz2ficKoOJE7wFiQ64VHWzvhXDZVp
         GgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=yG8mnS/7Wf3QagIw1IRfoA9/vCQQokGdgqK1IOvHV2g=;
        b=g5Kt9g68u5BXfzJGHcbkyFdkIIx5pwK+5SFbon4WeZwt7bvNbCSU+pV18NFcwMZpyY
         VulZYdACEJqujhoIvj0MJbUwEwqqwjwxgRKZUhLSoi8WclwJunU4VImf4YkA8RysYgbq
         AeiG3zMW6qex7r6VO2zwITGIu/5bMZvQyoEwurvRHesU1mkRwGffynC75lQYkUfvsZaY
         o69hucRydRh4BpU4sGG5aoXCRfPNnPXyThmYptEtzcjlsS37mWlw9jEK6mZBpQKs3XqB
         cUJqmBM/TnGSDOB+1hhAavV3OVI9588VNOIixvTo3qs4xPjlaBODK2tCiT5YlOBuuzA2
         WdTw==
X-Gm-Message-State: ANhLgQ1P5UgsUlQd/LPexJ0e6sIjtoOumSdN9bcIOaUeKgArLunujchC
        8NLJhqFqOgBUoBM4VwTEKK8QDc57aiM+QA==
X-Google-Smtp-Source: ADFU+vuGQbaGhzBeh/H8K6xmWnyPMztntCAL/caXJ8TGW2xto9WiwXH9Mb2NzanvqYhMfmFRCRdEpg==
X-Received: by 2002:a5d:4e05:: with SMTP id p5mr10361103wrt.59.1585242453574;
        Thu, 26 Mar 2020 10:07:33 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id n9sm4358128wru.50.2020.03.26.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:07:32 -0700 (PDT)
Date:   Thu, 26 Mar 2020 18:01:09 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: using cdns3-imx driver on imx8qm
Message-ID: <20200326170109.GA28051@optiplex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

What is the right way for using the new cdns3-imx glue usb driver on a
imx8qm soc with linux-next. I added this snippet in imx8qm.dtsi and
enabled the driver in the kernel configuration.

usbotg3: usb3@5b110000 {
		compatible = "cdns,usb3";
		reg = <0x0 0x5B110000 0x0 0x10000>,
			<0x0 0x5B130000 0x0 0x10000>,
			<0x0 0x5B140000 0x0 0x10000>,
			<0x0 0x5B160000 0x0 0x40000>,
			<0x0 0x5B120000 0x0 0x10000>;
		interrupt-parent = <&gic>;
		interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
		clocks = <&usb3_lpcg 1>,
			 <&usb3_lpcg 0>,
			 <&usb3_lpcg 5>,
			 <&usb3_lpcg 2>,
			 <&usb3_lpcg 3>;
		clock-names = "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
			"usb3_ipg_clk", "usb3_core_pclk";
		assigned-clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
				  <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
				  <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
		assigned-clock-rates = <125000000>, <12000000>, <250000000>;
		power-domains = <&pd IMX_SC_R_USB_2>;
		cdns3,usbphy = <&usb3phynop1>;
		status = "disabled";
	};

In board dts I enabled this:

&usbotg3 {
	dr_mode = "host";
	status = "okay";
};


On probing I got:

[    2.932089] cdns-usb3 5b110000.usb3: missing host IRQ

I also tried to enable "fsl,imx8qm-usb3" compatible buts this results
directly into a crash.

What do I miss here? some comments would be helpful.

Best Regards,

Oliver
