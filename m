Return-Path: <linux-usb+bounces-4086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A180F6BA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 20:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F64CB20EC0
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 19:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEC881E58;
	Tue, 12 Dec 2023 19:32:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA127106;
	Tue, 12 Dec 2023 11:31:52 -0800 (PST)
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rD8Tp-0005mP-OM; Tue, 12 Dec 2023 20:31:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Mathias Nyman <mathias.nyman@intel.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Sam Edwards <cfsworks@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sam Edwards <CFSworks@gmail.com>
Subject: Re: [PATCH 1/2] xhci: Introduce "disable-usb3" DT property/quirk
Date: Tue, 12 Dec 2023 20:31:45 +0100
Message-ID: <4854020.GXAFRqVoOG@phil>
In-Reply-To: <20231208210458.912776-2-CFSworks@gmail.com>
References:
 <20231208210458.912776-1-CFSworks@gmail.com>
 <20231208210458.912776-2-CFSworks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 8. Dezember 2023, 22:04:57 CET schrieb Sam Edwards:
> Some systems may have xHCI controllers that enumerate USB 3.0 ports, but
> these ports nevertheless cannot be used. Perhaps enabling them triggers a
> hardware bug, or perhaps they simply aren't connected and it would be
> confusing to the user to see an unusable USB 3.0 rhub show up -- whatever
> the case may be, it's reasonable to want to disable these ports.
> 
> Add a DT property (and associated quirk) to the xHCI driver that skips
> over (i.e. ignores and doesn't initialize) any USB 3.0 ports discovered
> during driver initialization.
> 
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>

I'm very much unsure, where the line goes between hw-quirk and
dt-is-not-a-configuration-space - in this specific instance.

DT is meant to describe the actual hardware present and not how
any operating system supports it.

So having that usb3phy present in the kernel - even if only in
a more limited form as you describe would be my preference.


But for a short-term thing, the usb3-phy in the binding is optional, so
so you could "just" deduce the no-usb3 state in your code from its
absence from the dt-node?


Heiko



>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>  drivers/usb/host/xhci-mem.c                         | 4 ++++
>  drivers/usb/host/xhci-plat.c                        | 3 +++
>  drivers/usb/host/xhci.h                             | 1 +
>  4 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> index 180a261c3e8f..8a64e747260a 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> @@ -25,6 +25,10 @@ properties:
>      description: Set if the controller has broken port disable mechanism
>      type: boolean
>  
> +  disable-usb3:
> +    description: Ignore (don't initialize, don't use) USB3 ports
> +    type: boolean
> +
>    imod-interval-ns:
>      description: Interrupt moderation interval
>      default: 5000
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 0a37f0d511cf..bf8fcab626e4 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1968,6 +1968,10 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
>  	minor_revision = XHCI_EXT_PORT_MINOR(temp);
>  
>  	if (major_revision == 0x03) {
> +		/* Ignore USB3 ports entirely if USB3 support is disabled. */
> +		if (xhci->quirks & XHCI_DISABLE_USB3)
> +			return;
> +
>  		rhub = &xhci->usb3_rhub;
>  		/*
>  		 * Some hosts incorrectly use sub-minor version for minor
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index b93161374293..75285fb5bbbc 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -249,6 +249,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>  		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
>  			xhci->quirks |= XHCI_BROKEN_PORT_PED;
>  
> +		if (device_property_read_bool(tmpdev, "disable-usb3"))
> +			xhci->quirks |= XHCI_DISABLE_USB3;
> +
>  		device_property_read_u32(tmpdev, "imod-interval-ns",
>  					 &xhci->imod_interval);
>  	}
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 5df370482521..c53fbeea478f 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1906,6 +1906,7 @@ struct xhci_hcd {
>  #define XHCI_RESET_TO_DEFAULT	BIT_ULL(44)
>  #define XHCI_ZHAOXIN_TRB_FETCH	BIT_ULL(45)
>  #define XHCI_ZHAOXIN_HOST	BIT_ULL(46)
> +#define XHCI_DISABLE_USB3	BIT_ULL(47)
>  
>  	unsigned int		num_active_eps;
>  	unsigned int		limit_active_eps;
> 





