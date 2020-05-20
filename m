Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F561DB510
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 15:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgETNbz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 09:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgETNbz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 09:31:55 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58380C061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 06:31:54 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z4so2545534wmi.2
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WKb5reimJ7iV4mJAoJaKrSBzkHfNJtbSOMgTKyruvqk=;
        b=NylspHXCgKaBJVbR0Npo7JUuJbc2LrhMvEeqRPaqreJmT/sOSwqFu+3H6OD3HtCeQ0
         wU4henHA5txxJ08VO6B9Ze0wB6V0e6ZsdewOOkpmnkhTbztXXBdfk+dHnSuoNn5PHG3O
         37cEEQnBwtZwDR/p4C6gFG2AFCf5WqJ5b+laSao+HRjghn4XM7TENCsGkdEdAL+i2x1L
         0B+I9YfK98vORv8aJObPABobdZ+oRrHTnpE524uLL59bwkdqIswZnZ9lhUBqcm/MHNiJ
         7LMu1f+/1j+Dyi7gucVU7Bz8Kk8n4nry9QRUIMmtiyKHxUjzxSNulHsAOIuxE/mgysRA
         a9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WKb5reimJ7iV4mJAoJaKrSBzkHfNJtbSOMgTKyruvqk=;
        b=DXFTuBzu+frGKm2ZobWj768+sQbJx82Vj2JtKYAKZ0+AofDmVUYuHH9l5BvfcHyn3I
         He8Fw0pZCrHfh6Da3jKkH8rodLdYjRfXppRZK6+Vpzws72nW3M1AH/J5jqJN7UetUyf1
         M2XdbssVw4ZC424r6mCfQ1K9eCY33E3Jl8N0W+Vowrgheae+ArcYBuB8vstaDYzOcvra
         VTqe1ltYlpA9BwOvTs3WWERePb1Srk0e3gueOkP2iBxFQFr+8qPqucPl7avrtV+Qwdot
         0mmgCdVLCaRYaJ8JbZBKsuxWLtIsRmDYNLc4VEAem1Jkks2QZuVBAvly2IPgVDTKKYfU
         mnSA==
X-Gm-Message-State: AOAM533Jo9uvFS4nU/1pL72HxsLFfXZyC5scr+WcmxTMAxIPixouLhd6
        VYcPBWXGyAxjA5eYoKzuOLmnVQ==
X-Google-Smtp-Source: ABdhPJyyCZVi1T6t0EAdycGIjJ3d3q9jRA3v3aI6hM28uov2Z6hP4n8ZvAsrDYkFsPtV09UgEaH16Q==
X-Received: by 2002:a1c:9803:: with SMTP id a3mr4572999wme.171.1589981513077;
        Wed, 20 May 2020 06:31:53 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id x17sm2846959wrp.71.2020.05.20.06.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 06:31:52 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] usb: typec: Ensure USB_ROLE_SWITCH is selected for
 tps6598x
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
 <20200520123312.320281-2-bryan.odonoghue@linaro.org>
 <20200520131728.GJ1298122@kuha.fi.intel.com>
 <ae7915f0-be5b-1756-c51a-b839ec3de8eb@linaro.org>
Message-ID: <16b990e1-2046-23e8-f4be-bf1f8659313b@linaro.org>
Date:   Wed, 20 May 2020 14:32:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ae7915f0-be5b-1756-c51a-b839ec3de8eb@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/05/2020 14:24, Bryan O'Donoghue wrote:
> On 20/05/2020 14:17, Heikki Krogerus wrote:
>> depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> 
> Hmm.
> 
> That broke for me with a recursive dependency
> 
> but this will work
> 
> +       depends on REGMAP_I2C
> +       depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> 

Sorry Heikki.

If I make the above change and then do this to switch off where the USB 
controller in my build is selecting - role switch

index d53db520e209..636a5428b47e 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -6,7 +6,6 @@ config USB_CHIPIDEA
         select EXTCON
         select RESET_CONTROLLER
         select USB_ULPI_BUS
-       select USB_ROLE_SWITCH
         select USB_TEGRA_PHY if ARCH_TEGRA
         help


it breaks

drivers/usb/dwc3/drd.o: In function `dwc3_usb_role_switch_get':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/dwc3/drd.c:508: 
undefined reference to `usb_role_switch_get_drvdata'
drivers/usb/dwc3/drd.o: In function `dwc3_usb_role_switch_set':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/dwc3/drd.c:484: 
undefined reference to `usb_role_switch_get_drvdata'
drivers/usb/dwc3/drd.o: In function `dwc3_setup_role_switch':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/dwc3/drd.c:555: 
undefined reference to `usb_role_switch_register'
drivers/usb/dwc3/drd.o: In function `dwc3_drd_exit':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/dwc3/drd.c:628: 
undefined reference to `usb_role_switch_unregister'
drivers/usb/chipidea/core.o: In function `ci_usb_role_switch_get':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:621: 
undefined reference to `usb_role_switch_get_drvdata'
drivers/usb/chipidea/core.o: In function `ci_usb_role_switch_set':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:635: 
undefined reference to `usb_role_switch_get_drvdata'
drivers/usb/chipidea/core.o: In function `ci_hdrc_remove':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:1231: 
undefined reference to `usb_role_switch_unregister'
drivers/usb/chipidea/core.o: In function `ci_hdrc_probe':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:1210: 
undefined reference to `usb_role_switch_unregister'
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/chipidea/core.c:1143: 
undefined reference to `usb_role_switch_register'
make[1]: *** 
[/home/deckard/Development/qualcomm/qlt-kernel/Makefile:1106: vmlinux] 
Error 1
make[1]: Leaving directory 
'/home/deckard/Development/qualcomm/qlt-kernel-tools/qlt-kernel/build/square_5.x-tracking'

to do what you want to do - shouldn't we have to make all of those 
"select USB_ROLE_SWITCH" into "depends on USB_ROLE_SWITCH" ?

i.e. make all of the consumers depends on instead of selects ?
