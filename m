Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65409C41F5
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 22:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfJAUtP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 16:49:15 -0400
Received: from mail.blih.net ([212.83.177.182]:40861 "EHLO mail.blih.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726823AbfJAUtP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 16:49:15 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Oct 2019 16:49:12 EDT
Received: from mail.blih.net (mail.blih.net [212.83.177.182])
        by mail.blih.net (OpenSMTPD) with ESMTP id e18db738;
        Tue, 1 Oct 2019 22:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bidouilliste.com; h=date
        :from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=mail;
         bh=B5qeyVaQxUrFv9Bm17PyyYT1vI0=; b=d76OLVD4Zu6r6uJSwoiVHXcVXLgb
        ZTfCJWog7Oh4+vFdP61KuRRG/qoHkpkpF3oNCEbPXMJO5gMlp5/BrjXjmc3OitOL
        e2gKoMTZmph/YfpikK+TFwOYAfaZJGI7HGsuBbARgWkrP7gcy8kc2mpEnvcUYest
        QzF61dql5k092Ww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=bidouilliste.com; h=date
        :from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; q=dns; s=
        mail; b=dH2OY07Z+OHB3mNkDdiFXIC+5M+QS+tF7jBSjgi8O70iaQRrttF2Ox4+
        f40F07/RyOYdjIR00zSFZpCCodaq5zxz5PF8MVZl/cdMXBUihWzC6yi5ex4IxrZ/
        WEcr8lE3NN1LTc7nCCij5xl7CrGiEEcEK8m6OlvqIRplg0+jFpk=
Received: from skull.home.blih.net (ip-9.net-89-3-105.rev.numericable.fr [89.3.105.9])
        by mail.blih.net (OpenSMTPD) with ESMTPSA id 99bef17a
        TLS version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO;
        Tue, 1 Oct 2019 22:42:31 +0200 (CEST)
Date:   Tue, 1 Oct 2019 22:42:31 +0200
From:   Emmanuel Vadot <manu@bidouilliste.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] ARM: dts: sunxi: Remove useless phy-names from EHCI
 and OHCI
Message-Id: <20191001224231.3241cf90203b96f42da9c7af@bidouilliste.com>
In-Reply-To: <b7c3e6ebb9a98458b50f66323f8aa15f7af1772e.1555403233.git-series.maxime.ripard@bootlin.com>
References: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
        <b7c3e6ebb9a98458b50f66323f8aa15f7af1772e.1555403233.git-series.maxime.ripard@bootlin.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; amd64-portbld-freebsd13.0)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


 Hi Maxime,

On Tue, 16 Apr 2019 10:28:00 +0200
Maxime Ripard <maxime.ripard@bootlin.com> wrote:

> Neither the OHCI or EHCI bindings are using the phy-names property, so we
> can just drop it.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi     | 4 ----
>  arch/arm/boot/dts/sun5i.dtsi         | 2 --
>  arch/arm/boot/dts/sun6i-a31.dtsi     | 4 ----
>  arch/arm/boot/dts/sun7i-a20.dtsi     | 4 ----
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 2 --
>  arch/arm/boot/dts/sun8i-a83t.dtsi    | 3 ---
>  arch/arm/boot/dts/sun8i-r40.dtsi     | 4 ----
>  arch/arm/boot/dts/sun9i-a80.dtsi     | 5 -----
>  8 files changed, 28 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
> index ef6ec526f394..e88daa4ef1af 100644
> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> @@ -520,7 +520,6 @@
>  			interrupts = <39>;
>  			clocks = <&ccu CLK_AHB_EHCI0>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -530,7 +529,6 @@
>  			interrupts = <64>;
>  			clocks = <&ccu CLK_USB_OHCI0>, <&ccu CLK_AHB_OHCI0>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -610,7 +608,6 @@
>  			interrupts = <40>;
>  			clocks = <&ccu CLK_AHB_EHCI1>;
>  			phys = <&usbphy 2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -620,7 +617,6 @@
>  			interrupts = <65>;
>  			clocks = <&ccu CLK_USB_OHCI1>, <&ccu CLK_AHB_OHCI1>;
>  			phys = <&usbphy 2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
> index cb820bd7974c..0d71b01967a3 100644
> --- a/arch/arm/boot/dts/sun5i.dtsi
> +++ b/arch/arm/boot/dts/sun5i.dtsi
> @@ -391,7 +391,6 @@
>  			interrupts = <39>;
>  			clocks = <&ccu CLK_AHB_EHCI>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -401,7 +400,6 @@
>  			interrupts = <40>;
>  			clocks = <&ccu CLK_USB_OHCI>, <&ccu CLK_AHB_OHCI>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
> index fa983f9ff5f5..c04efad81bbc 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -543,7 +543,6 @@
>  			clocks = <&ccu CLK_AHB1_EHCI0>;
>  			resets = <&ccu RST_AHB1_EHCI0>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -554,7 +553,6 @@
>  			clocks = <&ccu CLK_AHB1_OHCI0>, <&ccu CLK_USB_OHCI0>;
>  			resets = <&ccu RST_AHB1_OHCI0>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -565,7 +563,6 @@
>  			clocks = <&ccu CLK_AHB1_EHCI1>;
>  			resets = <&ccu RST_AHB1_EHCI1>;
>  			phys = <&usbphy 2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -576,7 +573,6 @@
>  			clocks = <&ccu CLK_AHB1_OHCI1>, <&ccu CLK_USB_OHCI1>;
>  			resets = <&ccu RST_AHB1_OHCI1>;
>  			phys = <&usbphy 2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 794c915f504b..9ad8e445b240 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -612,7 +612,6 @@
>  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&ccu CLK_AHB_EHCI0>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -622,7 +621,6 @@
>  			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&ccu CLK_USB_OHCI0>, <&ccu CLK_AHB_OHCI0>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -705,7 +703,6 @@
>  			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&ccu CLK_AHB_EHCI1>;
>  			phys = <&usbphy 2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -715,7 +712,6 @@
>  			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&ccu CLK_USB_OHCI1>, <&ccu CLK_AHB_OHCI1>;
>  			phys = <&usbphy 2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> index f76aad0c5d4d..af2fa694a467 100644
> --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> @@ -307,7 +307,6 @@
>  			clocks = <&ccu CLK_BUS_EHCI>;
>  			resets = <&ccu RST_BUS_EHCI>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -318,7 +317,6 @@
>  			clocks = <&ccu CLK_BUS_OHCI>, <&ccu CLK_USB_OHCI>;
>  			resets = <&ccu RST_BUS_OHCI>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index b105a85467b3..392b0cabbf0d 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -632,7 +632,6 @@
>  			clocks = <&ccu CLK_BUS_EHCI0>;
>  			resets = <&ccu RST_BUS_EHCI0>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -644,7 +643,6 @@
>  			clocks = <&ccu CLK_BUS_OHCI0>, <&ccu CLK_USB_OHCI0>;
>  			resets = <&ccu RST_BUS_OHCI0>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -656,7 +654,6 @@
>  			clocks = <&ccu CLK_BUS_EHCI1>;
>  			resets = <&ccu RST_BUS_EHCI1>;
>  			phys = <&usbphy 2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> index 56c6885b02d1..bb856e53b806 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -273,7 +273,6 @@
>  			clocks = <&ccu CLK_BUS_EHCI1>;
>  			resets = <&ccu RST_BUS_EHCI1>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -285,7 +284,6 @@
>  				 <&ccu CLK_USB_OHCI1>;
>  			resets = <&ccu RST_BUS_OHCI1>;
>  			phys = <&usbphy 1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -296,7 +294,6 @@
>  			clocks = <&ccu CLK_BUS_EHCI2>;
>  			resets = <&ccu RST_BUS_EHCI2>;
>  			phys = <&usbphy 2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -308,7 +305,6 @@
>  				 <&ccu CLK_USB_OHCI2>;
>  			resets = <&ccu RST_BUS_OHCI2>;
>  			phys = <&usbphy 2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
> index c1aa26db44ae..0c1eec9000e3 100644
> --- a/arch/arm/boot/dts/sun9i-a80.dtsi
> +++ b/arch/arm/boot/dts/sun9i-a80.dtsi
> @@ -342,7 +342,6 @@
>  			clocks = <&usb_clocks CLK_BUS_HCI0>;
>  			resets = <&usb_clocks RST_USB0_HCI>;
>  			phys = <&usbphy1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -354,7 +353,6 @@
>  				 <&usb_clocks CLK_USB_OHCI0>;
>  			resets = <&usb_clocks RST_USB0_HCI>;
>  			phys = <&usbphy1>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -376,7 +374,6 @@
>  			clocks = <&usb_clocks CLK_BUS_HCI1>;
>  			resets = <&usb_clocks RST_USB1_HCI>;
>  			phys = <&usbphy2>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -406,7 +403,6 @@
>  			clocks = <&usb_clocks CLK_BUS_HCI2>;
>  			resets = <&usb_clocks RST_USB2_HCI>;
>  			phys = <&usbphy3>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> @@ -418,7 +414,6 @@
>  				 <&usb_clocks CLK_USB_OHCI2>;
>  			resets = <&usb_clocks RST_USB2_HCI>;
>  			phys = <&usbphy3>;
> -			phy-names = "usb";
>  			status = "disabled";
>  		};
>  
> -- 
> git-series 0.9.1

 Sorry for the late reply on this mail but it seems that it was only
applied for 5.2 and I've just imported those DTS for FreeBSD recently.

 So, this is not correct, the phy-bindings.txt documents says that
phy-names is a required property for any phy user node. I agree that
the generic-{o,e}hci doesn't say what name the phy should be
represented but almost all DTS seems to agree on the "usb" name (at
least when they have only one phy).
 All the BSDs requires (or used to since this change) the phy-names to
be present since it's a required property.
 I've badly patched FreeBSD since I though this was an Allwinner thing
before someone directed me to the phy-bindings.txt document.

 Please revert this patch or send a patch to update the documentation.

 Thank you.

-- 
Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
