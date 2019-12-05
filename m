Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7780E114800
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 21:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfLEUUJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 15:20:09 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43864 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfLEUUJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 15:20:09 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB5KK5wg096970;
        Thu, 5 Dec 2019 14:20:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575577205;
        bh=mJd0a+dUybmP+Qhi7sQSDg+RFvptJi1GCzRBNu0+c5s=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Z/1Dao01K6xMIe/6C6tCUqI27+0EuaN+mc5nU5PW95PT/jpkAGBRErICIojm95L4K
         tEGJz+Ofyp+HlbusKXSZNUzzPC5jOm72nXVz2WQxb3iS8klfroKjkRVoarw7TkK/0T
         tFWb5uEAJj2GGzqQDpaugh+B6HPKmrjszAnawJnE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB5KK5TW109652
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Dec 2019 14:20:05 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 14:20:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Dec 2019 14:20:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB5KK3rL015154;
        Thu, 5 Dec 2019 14:20:03 -0600
Date:   Thu, 5 Dec 2019 14:19:36 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-usb@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] musb: davinci: Convert to use GPIO descriptor
Message-ID: <20191205201936.GA19754@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
References: <20191205142200.145252-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191205142200.145252-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On Thu, Dec 05, 2019 at 03:22:00PM +0100, Linus Walleij wrote:
> The DaVinci MUSB glue contains an optional GPIO line to
> control VBUS power, convert this to use a GPIO descriptor
> and augment the EVM board file to provide this descriptor.
> 
> I can't get this driver to compile properly and it depends
> on broken but when I didn get it to compile brokenly, it
> did at least not complain about THIS code being broken so
> I don't think I broke the driver any more than what it
> already is.
> 
> I did away with the ifdefs that do not work with
> multiplatform anyway so the day someone decides to
> resurrect the code, the path to get it working should be
> easier as well since DaVinci is now multiplatform.

Generally I don't take such patches unless they are part of the effort
to un-broken the driver. But is this patch a prerequisite of any cleanup
in DaVinci family or ARM architecture? What is the motivation of this
patch?

Sekhar/Tony,

This DaVinci glue driver has been marked as BROKEN since 2013 and seems
no one complained about it. Is there any development on the DaVinci
devices still active? Does it make sense to remove this driver out of
the kernel instead?

-Bin.
