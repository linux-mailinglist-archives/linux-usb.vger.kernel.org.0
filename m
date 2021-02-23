Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80737322E17
	for <lists+linux-usb@lfdr.de>; Tue, 23 Feb 2021 16:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbhBWPzp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Feb 2021 10:55:45 -0500
Received: from netrider.rowland.org ([192.131.102.5]:33137 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233507AbhBWPzZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Feb 2021 10:55:25 -0500
Received: (qmail 1263861 invoked by uid 1000); 23 Feb 2021 10:54:43 -0500
Date:   Tue, 23 Feb 2021 10:54:43 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     f.fainelli@gmail.com, jonas.gorski@gmail.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Prisk <linux@prisktech.co.nz>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: generic-ehci: document ignore-oc
 flag
Message-ID: <20210223155443.GB1261797@rowland.harvard.edu>
References: <20210223155005.21712-1-noltari@gmail.com>
 <20210223155005.21712-2-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210223155005.21712-2-noltari@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 23, 2021 at 04:50:04PM +0100, �lvaro Fern�ndez Rojas wrote:
> Over-current reporting isn't supported on some platforms such as bcm63xx.
> These devices will incorrectly report over-current if this flag isn't properly
> activated.
> 
> Signed-off-by: �lvaro Fern�ndez Rojas <noltari@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> index cf83f2d9afac..294bbf02399e 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -117,6 +117,11 @@ properties:
>        Set this flag if EHCI has a Transaction Translator built into
>        the root hub.
>  
> +  ignore-oc:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Set this flag for HCDs without over-current reporting support.

This is not a good description of a device property.  DT entries are 
supposed to described the hardware, not talk about how to use it.

When you say that the bcm63xx doesn't support over-current reporting, 
what exactly do you mean?  Do you mean that sometimes the hardware turns 
on the over-current bit when an over-current isn't actually present?  Or 
do you mean something else?

Alan Stern

> +
>    needs-reset-on-resume:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -- 
> 2.20.1
> 
