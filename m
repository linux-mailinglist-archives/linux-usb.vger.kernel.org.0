Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F64C46C9E9
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 02:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239014AbhLHB1d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 20:27:33 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:52982 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238624AbhLHB1b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 20:27:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1638926642; x=1670462642;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VCGiztZFtP/C7WAR4vZboInQR6f3D8gnC6Ty8l58+Pk=;
  b=c0DwfTcZ13zVN47jA/YyzFMr7e8qDNmiy+MFOj3NPFkTR7sxZ6Ypwx3j
   qbOeG30QfUYC37OwCPYR0q5n3bGyCKK5XsIpchsvnFqXRcjj3gq7/+fZb
   Ggtl2ONkXeoSol4tDKx/nZi4MeVPvcm4BnilsrX0PFQGcqHx5kbiKgLHI
   IW3RWvyQt8Dw4qPV3Srl8LNy81BdzyeIQPXNGFI+OuR1KttFZSLsVcmtJ
   ynQBYrsR6SvU4z+i5wRDpyNmw6AvunqYx5U4vsaMYHfjHMWeW2PSRsGyE
   KKvaLw2iCRAgZO5juItSHBt0JxFV5/GQKAmsjMvWFklPpbkIxhHLK2b6u
   g==;
X-IronPort-AV: E=Sophos;i="5.87,295,1631548800"; 
   d="scan'208";a="188713211"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 09:24:01 +0800
IronPort-SDR: WHBbWxlwHpuVOszdZzhP+rDqerebHeF8Arpr1VG/PBCE8WUCDGE1SLgXletCIf5v9dN89sFES1
 7OIYro5LU9LqM9Sd2Jx7S7v8JBEz8m5CKSw3fUEJQjGm1f7xm9NhojTKnZp4sshRajG0B3wNzH
 EaCHtyGWwoIPFRNxO+81cTl/5rngK5DaNZw2VuXwPAU9F7YXJJSNqOLOSiCjEGAdoCl6vkpZaH
 HwHnrCipFeP0hIEljBnr4syoZzc/SGmkHxgElX8f5PvPPgEwLiuimF/nBTUzl8AkvESBmmwh2M
 YHIqmpnjNJnLMJWXiJ+tW3jc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 16:57:04 -0800
IronPort-SDR: 54bpbzeErCBlowlws9lgWlfSPz2AXsa6okybDF0pjdxEItNE/Pe+K0DFOqf18DjLBDf39eKUxy
 dAvKkYJ4dFYX/76HaEb+w2Qg+ryXYgSOrM4hU5h/sXYA07xyOGCuEDbs9CiCpURhcjfuPDxSx1
 815H3Sk/W1u2tcJGTFYj87ZiIjubkvs3s8giBrN4y2I9ePEg7NcczXjuJV9+y2nvUmcnxNVyEo
 yck4EqwEBZXx9CloLUZ7QnMdLubHOdom18ZOuzJCufugN5twevkr8ZknrsK5nTSo2HC/cBcNpX
 cSs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 17:24:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J7zvz5SlQz1Rwvd
        for <linux-usb@vger.kernel.org>; Tue,  7 Dec 2021 17:23:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1638926638; x=1641518639; bh=VCGiztZFtP/C7WAR4vZboInQR6f3D8gnC6T
        y8l58+Pk=; b=rpxfrWJ8PXl9z6N9wFjxz1y+enP6ivOnx1AZxKc15RSXhjgwss8
        ahgE5xaeskLqaqMjx+2wHUg+FPiuKijoFBgyB/eei6+Uf7PHBsjT3G7zQBmPM3ux
        UBT69nmG65j5I5gZZbNAZrG2hT13YWtPikFtm7tj+WlFkNwOyxDL72nkdsXdGdi3
        jpxS8RrsnMxEHVV9ofzkZYEI+aBmCJDKBeaLSgCvsxMnaeKf4QpoeRF2LLOnsCfg
        1wfwamePfnbBagkD81fW5/LVtpuMJPYPGrfvAFzI/0fIsY3OJ/HJwUlkdY12RTTM
        2WYL5/18F3NHKCi7q8mKJZK7kuZEaUhtsTA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id eolj4RN2FIZ2 for <linux-usb@vger.kernel.org>;
        Tue,  7 Dec 2021 17:23:58 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J7zvr1H1Wz1RtVG;
        Tue,  7 Dec 2021 17:23:51 -0800 (PST)
Message-ID: <a9cdc25e-8819-30a3-8d21-81a2d429b7c2@opensource.wdc.com>
Date:   Wed, 8 Dec 2021 10:23:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3 12/15] ARM: dts: NSP: Rename SATA unit name
Content-Language: en-US
To:     Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Markus Mayer <mmayer@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Cooper <alcooperx@gmail.com>,
        Doug Berger <opendmb@gmail.com>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." 
        <linux-mmc@vger.kernel.org>,
        "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20211208003727.3596577-1-f.fainelli@gmail.com>
 <20211208003727.3596577-13-f.fainelli@gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <20211208003727.3596577-13-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/12/08 9:37, Florian Fainelli wrote:
> Rename the SATA controller unit name from ahci to sata in preparation
> for adding the Broadcom SATA3 controller YAML binding which will bring
> validation.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/arm/boot/dts/bcm-nsp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
> index 1c08daa18858..ded5a59e0679 100644
> --- a/arch/arm/boot/dts/bcm-nsp.dtsi
> +++ b/arch/arm/boot/dts/bcm-nsp.dtsi
> @@ -534,7 +534,7 @@ sata_phy1: sata-phy@1 {
>  			};
>  		};
>  
> -		sata: ahci@41000 {
> +		sata: sata@41000 {
>  			compatible = "brcm,bcm-nsp-ahci";
>  			reg-names = "ahci", "top-ctrl";
>  			reg = <0x41000 0x1000>, <0x40020 0x1c>;
> 

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
