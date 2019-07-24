Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3210A7403D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 22:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbfGXUmZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 16:42:25 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35605 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfGXUmZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jul 2019 16:42:25 -0400
Received: by mail-io1-f68.google.com with SMTP id m24so92529941ioo.2;
        Wed, 24 Jul 2019 13:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AQ+XNg3mKrfw1Dey6tLDfZ0Xozax/S6VlSKKVITqYxE=;
        b=W1bK2ybHVLAsDIDxzXtP4lvwwEfRu4GItHcfnUkecJTn6o/i5HFWlN71w/3e5FBGRm
         1b7FWMd4Z6UleapARAzi7pjwS2uwbkVVQXMW+fDbrY4BwDNZydH8+gk7dllKdsnie3K+
         x5VvFj/kbxgZIuBHeYM7iKyk6CjvmPlT4MfhxgrkU/4sHREmygFAehfHqA7NWZpuhyoK
         VCieIxIYnkpTNfYNAPI0qztUUa61P9aFK7A/lOgXlN1R03HyswQNBUKsIuPFy2T9pM0e
         NPXJE0YN18wMQ5bRJjP65y7rccFchiCno3LEyUDg62P6oJz/pvPklLn9jhEUVvSXeeTP
         1j+Q==
X-Gm-Message-State: APjAAAV/RCFLidRigWjNoUfuneKMwh9eyTNoMT/T5md8pZJGwjseSmH6
        JIAGcFMV/54nUEhGjSX81T1VTU8=
X-Google-Smtp-Source: APXvYqxERI4TICWkUHvGJaze2V775PQlWBtoSbvl2z376iV55nDG8Nfoy+6l673Jsjr2IVXUL9H9NA==
X-Received: by 2002:a02:c6a9:: with SMTP id o9mr31087012jan.90.1564000943817;
        Wed, 24 Jul 2019 13:42:23 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id r24sm34314514ioc.76.2019.07.24.13.42.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 13:42:23 -0700 (PDT)
Date:   Wed, 24 Jul 2019 14:42:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] usb: dwc3: Add node to update cache type setting
Message-ID: <20190724204222.GA1234@bogus>
References: <20190712064206.48249-1-ran.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190712064206.48249-1-ran.wang_1@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 12, 2019 at 02:42:05PM +0800, Ran Wang wrote:
> Some Layerscape paltforms (such as LS1088A, LS2088A, etc) encounter USB
> detect failues when adding dma-coherent to DWC3 node. This is because the
> HW default cache type configuration of those SoC are not right, need to
> be updated in DTS.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v2:
> 	- New file.
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt | 43 ++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 8e5265e..7bc1cef 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -110,6 +110,43 @@ Optional properties:
>   - in addition all properties from usb-xhci.txt from the current directory are
>     supported as well
>  
> +* Cache type nodes (optional)
> +
> +The Cache type node is used to tell how to configure cache type on 4 different
> +transfer types: Data Read, Desc Read, Data Write and Desc write. For each
> +treasfer type, controller has a 4-bit register field to enable different cache
> +type. Quoted from DWC3 data book Table 6-5 Cache Type Bit Assignments:
> +----------------------------------------------------------------
> +MBUS_TYPE| bit[3]       |bit[2]       |bit[1]     |bit[0]
> +----------------------------------------------------------------
> +AHB      |Cacheable     |Bufferable   |Privilegge |Data
> +AXI3     |Write Allocate|Read Allocate|Cacheable  |Bufferable
> +AXI4     |Allocate Other|Allocate     |Modifiable |Bufferable
> +AXI4     |Other Allocate|Allocate     |Modifiable |Bufferable
> +Native   |Same as AXI   |Same as AXI  |Same as AXI|Same as AXI
> +----------------------------------------------------------------
> +Note: The AHB, AXI3, AXI4, and PCIe busses use different names for certain
> +signals, which have the same meaning:
> +  Bufferable = Posted
> +  Cacheable = Modifiable = Snoop (negation of No Snoop)

This should all be implied from the SoC specific compatible strings. 

Rob
