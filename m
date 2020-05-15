Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78251D43F8
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 05:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgEODRK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 23:17:10 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44252 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgEODRK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 23:17:10 -0400
Received: by mail-oi1-f195.google.com with SMTP id a2so982801oia.11;
        Thu, 14 May 2020 20:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cg886WtTenbgiEe14/3Z+QrAl6uqIU+XFzLFxY3ocVs=;
        b=fjTqqSS92WA9hF4Aa0iRejQO16D7VCKVCq3BHcjK8/wR5ktp83930mGyTZ2/ja0Wpi
         YdP59XR7zqsKg8ma6YnDtkNSlmrEAQ9SDliLvRuvWVjuk6n6kPE6cN0DenFDICMNXU3n
         BHF0nX20+8T715PU8x2A/6DfBi3BpJ3OZBbHpxNZVSk46onublNeofuUyrwgXNAmuDf0
         skzaVPEuVbrwZHSpg/QTm1Y3Hu5FlVrVhXvG20a51cZpB0Zh9JLjZdh5CIK8OKHiCMBm
         DsRRkD5xzAX6mCRyRfSJ1wkszMl+ZddlNnKsfeO0pKxWDuh6D2Lxup7MfhYFzJRm4E8L
         YmDQ==
X-Gm-Message-State: AOAM531im3KAY82UK7vAKWX48CLkJIdzgALExdrU/JCJaFb6RaKt5JBa
        N/tGbfr1ctsJL+sUE3XuHw==
X-Google-Smtp-Source: ABdhPJx86g0hoTKASew6ChT92rGRrKIzjg4EHMkFeMEsNXruUCeUNgVuswoc+pEB6xTa8PwJBz7ZJA==
X-Received: by 2002:aca:b2c1:: with SMTP id b184mr769083oif.57.1589512629659;
        Thu, 14 May 2020 20:17:09 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p18sm120917oth.2.2020.05.14.20.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 20:17:09 -0700 (PDT)
Received: (nullmailer pid 4527 invoked by uid 1000);
        Fri, 15 May 2020 03:17:08 -0000
Date:   Thu, 14 May 2020 22:17:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 20/20] dt-bindings: ehci/ohci: Allow iommus property
Message-ID: <20200515031708.GA4452@bogus>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-21-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513103016.130417-21-andre.przywara@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 13 May 2020 11:30:16 +0100, Andre Przywara wrote:
> A OHCI/EHCI controller could be behind an IOMMU, in which case an iommus
> property assigns the stream ID for this device.
> 
> Allow that property in the DT bindings to fix a complaint about the Arm Juno
> board's DTS file.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
>  2 files changed, 6 insertions(+)
> 

Applied, thanks!
