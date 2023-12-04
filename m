Return-Path: <linux-usb+bounces-3679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F780319A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 12:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2092A1F20F7C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861FA22F06;
	Mon,  4 Dec 2023 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RWyA6QH0"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF23B0
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 03:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ipxyLd7B/D0Yr/CXYF8U/1s/JJQQmIoxvG5wyP+lU5Q=; b=RWyA6QH0I64Ji7egiTa1BgBD2+
	v0XiNE3F6UYbRj8GGzG0ovS8WbgavT33rL/uEhDfOG7jz8NWlG/UsKiZtSwruGX/N5kQOITUej8Gx
	V8KjkEHOh93VYaDl2CgvW8BA7rkXQgAAUgkU6FfFcTrC4ETeOL6bUzfL7oHZmWNDILCuL+4s9eIS7
	rSFPWbH2zOdSwnU/XUaxzCNQdqVfjdIoT7FlkJgrYX5TRiR/qjWEiGJeb5IeKx6y/9RVwFHToehX4
	2ofsXT9zUakfZ3l6odIxS4xm3Ks/KlLuwXaXXQNXXXFB8cByMyzczNYxLCm1LHDmoT/z5vcNUL4v8
	KrHYG20A==;
Received: from [179.232.147.2] (helo=[192.168.0.5])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rA7G0-00A9vh-O0; Mon, 04 Dec 2023 12:37:01 +0100
Message-ID: <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
Date: Mon, 4 Dec 2023 08:36:54 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Content-Language: en-US
To: linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, johan@kernel.org,
 quic_wcheng@quicinc.com, kernel@gpiccoli.net, kernel-dev@igalia.com,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Vivek Dasmohapatra <vivek@collabora.com>
References: <20231122165931.443845-1-gpiccoli@igalia.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20231122165931.443845-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/11/2023 13:51, Guilherme G. Piccoli wrote:
> It was noticed that on plugging a low-power USB source on Steam
> Deck USB-C port (handled by dwc3), if such port is on device role,
> the HW somehow keep asseting the PCIe PME line and triggering a
> wakeup event on S3/deep suspend (that manifests as a PME wakeup
> interrupt, failing the suspend path). That doesn't happen when the USB
> port is on host mode or if the USB device connected is not a low-power
> type (for example, a connected keyboard doesn't reproduce that).
> 
> Even by masking all maskable ACPI GPEs, the problem still reproduces; also
> by having the PCIe PME mechanism using non-MSI interrupts, the symptom is
> observed as the HW succeeding to S3/suspend but waking up right after.
> 
> By changing the PRTCAP mode to DWC3_GCTL_PRTCAP_HOST in the controller
> (as one of the latest steps on gadget common suspend), we managed to
> circumvent the issue. The mode restore is already done in the common
> resume function. Notice that this patch does not change the in-driver
> port state on suspend, or else the resume path "thinks" the port was
> in host mode prior to suspend and resume it on a wrong fashion.
> 
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Vivek Dasmohapatra <vivek@collabora.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
> 
> 
> Hi folks, first of all thanks in advance for reviews/feedback on this one.
> 
> This patch is the result of a debug approach with no datasheet access.
> With that said, I'm not 100% sure writing to this register is free of
> undesired side-effects; one thing I'm considering is the following scenario:
> imagine a device A with the USB port on device/peripheral mode, and a device B
> connected to it, acting as host. What if we want device B be able to wakeup
> device A? Would this patch prevent that for all cases, always?
> 
> I appreciate ideas in case this is not the best approach to fix the
> problem. We could also gate this approach to the HW board as a first step,
> for example.
> 
> Thanks,
> 
> 
> Guilherme
> 
> 
>  drivers/usb/dwc3/core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 0328c86ef806..5801d3ebbbcb 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -104,7 +104,7 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
>  	return 0;
>  }
>  
> -void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
> +static void __dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
>  {
>  	u32 reg;
>  
> @@ -112,7 +112,11 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
>  	reg &= ~(DWC3_GCTL_PRTCAPDIR(DWC3_GCTL_PRTCAP_OTG));
>  	reg |= DWC3_GCTL_PRTCAPDIR(mode);
>  	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
> +}
>  
> +void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
> +{
> +	__dwc3_set_prtcap(dwc, mode);
>  	dwc->current_dr_role = mode;
>  }
>  
> @@ -2128,6 +2132,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  			break;
>  		dwc3_gadget_suspend(dwc);
>  		synchronize_irq(dwc->irq_gadget);
> +		__dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:

Hi folks, friendly ping on this one.
Thanks,


Guilherme

