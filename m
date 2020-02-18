Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2272163367
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 21:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgBRUrT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 15:47:19 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36771 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgBRUrS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 15:47:18 -0500
Received: by mail-oi1-f195.google.com with SMTP id c16so21559415oic.3;
        Tue, 18 Feb 2020 12:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VPaoilgC2MVulKsvvmY3VL8acfEnq/hEkFxwm21dKyY=;
        b=kwsuoJdfVhtQ5XAZPyC6/Ihu+u1L8lUqzAdSRfWzpjrGO97YmA5VJPS/bTUVEi7/0h
         igrZcv0kh9lBOj9dgEvDl/jcMT1P574gFBfMM/IsO+7y+sFrHn4gyL/tO3SfnCL33qa9
         aIn74/5l/956yKWEvEDRkeJVR4dQdSpjuRutfh5E79Rhgkx1u1hp0ChDPYRJVzB3qBiM
         jMF1RisnDT5AGTNMlKb4aUPkZwt4agUmDcp+x/Csy9s1mvckHrcT1N5MMXbII07vPmWS
         o8KKRQbnpq/UiIkRUozXhw+mmj0xLmkm/Jus/CmmD/W/tU9q+RAZFENC4SRzCujhjoGe
         OIxA==
X-Gm-Message-State: APjAAAVDF8r6WOt4hcFhrxTR/OQEIWDlsCfsZHz+P0spKHvCvZuMdbuR
        fIVr/oVlqxFmdvO7A4ddIw==
X-Google-Smtp-Source: APXvYqxps8IdMZeg25SMK6apXOiY+3Bdn4PwC0ZH41zv7AZ2UDrwTVfF/4BmTyrHIpnk7zX90lyxmQ==
X-Received: by 2002:a54:4085:: with SMTP id i5mr2484867oii.17.1582058838189;
        Tue, 18 Feb 2020 12:47:18 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i7sm1559438oib.42.2020.02.18.12.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 12:47:17 -0800 (PST)
Received: (nullmailer pid 9634 invoked by uid 1000);
        Tue, 18 Feb 2020 20:47:16 -0000
Date:   Tue, 18 Feb 2020 14:47:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        robh@kernel.org, jonathanh@nvidia.com, kishon@ti.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH v6 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Message-ID: <20200218204716.GA9575@bogus>
References: <20200212061133.11665-1-jckuo@nvidia.com>
 <20200212061133.11665-4-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212061133.11665-4-jckuo@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 12 Feb 2020 14:11:31 +0800, JC Kuo wrote:
> Extend the bindings to cover the set of features found in Tegra194.
> Note that, technically, there are four more supplies connected to the
> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
> , but the power sequencing requirements of Tegra194 require these to be
> under the control of the PMIC.
> 
> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it
> is possible for some platforms have long signal trace that could not
> provide sufficient electrical environment for Gen 2 speed. This patch
> adds a "maximum-speed" property to usb3 ports which can be used to
> specify the maximum supported speed for any particular USB 3.1 port.
> For a port that is not capable of SuperSpeedPlus, "maximum-speed"
> property should carry "super-speed".
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> Changes in v6: none
> Changes in v5:
> - re-use "maximum-speed" instead of adding "nvidia,disable-gen2"
> Changes in v4: none
> Changes in v3: none
> Changes in v2:
> - fix a typo
> 
>  .../phy/nvidia,tegra124-xusb-padctl.txt        | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
