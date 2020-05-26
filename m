Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB441C5F52
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 19:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730667AbgEERwE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 13:52:04 -0400
Received: from foss.arm.com ([217.140.110.172]:46708 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729729AbgEERwD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 May 2020 13:52:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F08A91FB;
        Tue,  5 May 2020 10:52:02 -0700 (PDT)
Received: from [10.57.39.240] (unknown [10.57.39.240])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3E373F305;
        Tue,  5 May 2020 10:52:00 -0700 (PDT)
Subject: Re: [PATCH 00/16] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
To:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-4-andre.przywara@arm.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <eee99db5-4100-5064-97c0-abf54d2eec15@arm.com>
Date:   Tue, 5 May 2020 18:51:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505165212.76466-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-05-05 5:51 pm, Andre Przywara wrote:
> Date: Mon, 4 May 2020 12:43:18 +0100
> Subject: [PATCH 03/16] dt-bindings: ehci/ohci: Allow iommus property
> 
> A OHCI/EHCI controller could be behind an IOMMU, in which case an iommus
> property assigns the stream ID for this device.

Hmm, pretty much any DMA master device could be behind an IOMMU, and in 
a way that's basically entirely irrelevant to the device itself (and 
thus the consumer of its binding). Is there a better way we can handle 
this than repeating such "semi-standard" properties in individual 
bindings for ever more?

Robin.

> Allow that property in the DT bindings to fix a complaint about the Arm Juno
> board's DTS file.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
>   Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> index 10edd05872ea..20664c28bfb2 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -74,6 +74,9 @@ properties:
>     phy-names:
>       const: usb
>   
> +  iommus:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> index bcffec1f1341..ff6c04cde695 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -73,6 +73,9 @@ properties:
>     phy-names:
>       const: usb
>   
> +  iommus:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> 
