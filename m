Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D2F1DB129
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 13:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgETLNC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 07:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETLNC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 07:13:02 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC35EC061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 04:13:01 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f13so2151982wmc.5
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 04:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fk6zGCG0jVNsbpNxiOvPgZWxb/DfSqS0jI/gL+O22iI=;
        b=b0C8+ZfQ1OKilg6MSSEWv9DY/xvn0vAXP1LH3NANj+sSJdEwfeiMc9D80zRLPncaUr
         R8+1vGbnH7zvps6foZbgLbaBAbeRmUmLqSvs2WZY+1wcB6n94+6SfaSPicZ98lP+HJbY
         G8x/NLGLlc5DoJfvxc8EahwzCGWAIO0OnJlxfMGSfmYpH/ZgzCZAfHGb5mSRjdl9el+u
         fsEVR4NMJrMzjspJ0A6wo+n9tzkoZ8isHOSCOfCUvec11h+3HQGE4Dou+ZE42GQeLR2X
         QOdf9PGOdiPnz+7itU+QuM077fIw/G+n0OSNCpbHej48DHCv68GuOlR1z6k31Rssv+5S
         XFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fk6zGCG0jVNsbpNxiOvPgZWxb/DfSqS0jI/gL+O22iI=;
        b=JySibQtJJevJj6+8bu3ye93A2yp+Jwuyq85cgjcIlY9waipWwn/7hx0623KuvAy7Rw
         sIWQM+gk6sAV/vAfY6eSbS2Q8jTfeK3RQI7F/m7tSwd1UMhDgl1aSrn8u18ghCH09ze/
         GDRIBtol0l70eHU8J9dfS83GnVxtwvM1GP+rl7uwZQViK2fyku29wSqqcJeUgmG0GWb5
         fC5pOHqirDWtJWvWerPu4Et0mrowUVTOoEPfh7e+0dGgysGLaN76tEA2pFKRG62/tYWj
         KZEdq75w6Z+lcdWQh0dVzMdawAryRXuJQSPjrPC3yZhvZX56ZBtlpGS3OQnYB+dbFa0e
         pHcg==
X-Gm-Message-State: AOAM532kOIT4hfP9rGrulXKIEhuThQF2PNh5lvofa+9OvyWioGWu26QI
        apleAThrdIctOmfVm31H/CLBlw==
X-Google-Smtp-Source: ABdhPJw7P+YM4d6a9Vy7w4tCK1jARFaszeGJt8msMF4anOg7nm2MODIA7coTm0cyBKe7O7Z3knveQA==
X-Received: by 2002:a7b:cf05:: with SMTP id l5mr4419820wmg.100.1589973180512;
        Wed, 20 May 2020 04:13:00 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id y3sm2471424wrm.64.2020.05.20.04.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 04:13:00 -0700 (PDT)
Subject: Re: [PATCH] usb: typec: Ensure USB_ROLE_SWITCH is a dependency for
 tps6598x
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
 <20200520103542.GF1298122@kuha.fi.intel.com>
 <c1b5a729-6b2a-9c91-6ed0-94ffbc529fcd@linaro.org>
Message-ID: <4f5aaa11-194f-24ad-bd8a-ce510b2bce94@linaro.org>
Date:   Wed, 20 May 2020 12:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c1b5a729-6b2a-9c91-6ed0-94ffbc529fcd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/05/2020 12:08, Bryan O'Donoghue wrote:
> On 20/05/2020 11:35, Heikki Krogerus wrote:
>> On Wed, May 20, 2020 at 11:05:26AM +0100, Bryan O'Donoghue wrote:
>>> When I switched on USB role switching for the tps6598x I completely 
>>> forgot
>>> to add the Kconfig dependency.
>>>
>>> This patch ensures the dependency is there to prevent compilation error
>>> when role-switching is off.
>>
>> There are stubs for the those functions, so there should not be any
>> compilation errors.
>>
> 
> That's what I initially thought too, then I saw this.
> 
> git show da4b5d18dd949abdda7c8ea76c9483b5edd49616
> 
> but looking at role.h
> 
> #if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
> 
> int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role 
> role);
> 
> #else
> 
> static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
>                  enum usb_role role)
> {
>          return 0;
> }
> 
> #endif
> 
> That should work.
> 
> Hmm, let me see if I can figure this out...

Well if I do this

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index d53db520e209..636a5428b47e 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -6,7 +6,6 @@ config USB_CHIPIDEA
         select EXTCON
         select RESET_CONTROLLER
         select USB_ULPI_BUS
-       select USB_ROLE_SWITCH

my build does this

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
drivers/usb/typec/tps6598x.o: In function `tps6598x_set_data_role':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/typec/tps6598x.c:208: 
undefined reference to `usb_role_switch_set_role'
drivers/usb/typec/tps6598x.o: In function `tps6598x_remove':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/typec/tps6598x.c:603: 
undefined reference to `usb_role_switch_put'
drivers/usb/typec/tps6598x.o: In function `tps6598x_set_data_role':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/typec/tps6598x.c:208: 
undefined reference to `usb_role_switch_set_role'
drivers/usb/typec/tps6598x.o: In function `tps6598x_probe':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/typec/tps6598x.c:520: 
undefined reference to `fwnode_usb_role_switch_get'
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/typec/tps6598x.c:590: 
undefined reference to `usb_role_switch_put'
drivers/usb/typec/tps6598x.o: In function `tps6598x_set_data_role':
/home/deckard/Development/qualcomm/qlt-kernel/drivers/usb/typec/tps6598x.c:208: 
undefined reference to `usb_role_switch_set_role'
make[1]: *** 
[/home/deckard/Development/qualcomm/qlt-kernel/Makefile:1106: vmlinux] 
Error 1

  so its consistent anyway
