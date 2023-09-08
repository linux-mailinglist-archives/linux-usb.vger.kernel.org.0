Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79B4E7985D8
	for <lists+linux-usb@lfdr.de>; Fri,  8 Sep 2023 12:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240870AbjIHK2P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Sep 2023 06:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbjIHK2P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Sep 2023 06:28:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9191C1FDD
        for <linux-usb@vger.kernel.org>; Fri,  8 Sep 2023 03:27:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A53C433C7;
        Fri,  8 Sep 2023 10:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694168786;
        bh=otATmKpqASfoIXt8nFB5MZkHzVHbSNpHDLGJ0goO+TY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JarDw4ex+4rzT7xg/gGdU6i4emPD3o0AE8F6X5zDq3ZNWAd/yJqO0M9+3z5Wd93RP
         9ceklvLbDa+JPHeOmU41kxbame4FJSWQxZHcd5eUgOxBXNfipy9x7giFKc+kc5ddEA
         K4zfYz9EbjFZ8oCE00GeL2zLB52q7BvU7y99i3DNEA4zfCiuaxWWKeOvzubWwdXS1n
         d6LJZev7AkD5FLVG1W69M40d6bgJGOH3FUp+l2yr3J07FyrV4v8pqbrQAjMAT1xOED
         Vi9D9BCAca4Iz/wSOqRg31XgUxR6x51bLmRp8AGlh7bUr5qEFPb9T4mInH5L7iB8Wo
         1hmuWpzQFTcIQ==
Date:   Fri, 8 Sep 2023 18:26:18 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Advise for adding Nuvoton BMC Synopsys USB 2.0 device
 controllers to Linux kernel USB Chipidea driver
Message-ID: <20230908102618.GA1134975@nchen-desktop>
References: <TY0PR03MB627615C146DF1CCED0BCAA2C84EEA@TY0PR03MB6276.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY0PR03MB627615C146DF1CCED0BCAA2C84EEA@TY0PR03MB6276.apcprd03.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-09-07 14:33:29, tomer.maimon@nuvoton.com wrote:
> Hi Peter
> 
> My name is Tomer I am working in Nuvoton system in the Linux kernel, our project developing BMC SoC for servers.
> In Nuvoton BMC (NPCM) there are ten identical Synopsys USB 2.0 device controllers called NPCM UDC.
> 
> Lately we started to work with USB Chipidea driver to add NPCM UDC as well.
> The NPCM BMC using only the UDC and not the USB host.
> 
> Using the default compatible<https://elixir.bootlin.com/linux/v5.15.130/C/ident/compatible> = "chipidea,usb2<https://elixir.bootlin.com/linux/v5.15.130/B/ident/chipidea%2Cusb2>" didn't work for us since:
> 
> 1.       The USB_MODE should be set at boot or after reset since the reset The USB_MODE is incorrect (0x15002)
> 
> [cid:image002.jpg@01D9E1B1.691030B0]
> 
> 
> It solved by setting USB_MODE during NPCM reset ci_hdrc_npcm_notify_event, now using unique npcm-udc compatible :)
> 
> 
> 
> 2.      vbus_active parameter don't change, stay 0.
> 
> The Device Control Capability Parameters Register (DCCPARAMS) is a read only register that indicate the module is only DC (Device Capable)
> 
> This is why the driver didn't indicate the driver is OTG
> 
> https://elixir.bootlin.com/linux/v6.5.2/source/drivers/usb/chipidea/core.c#L948
> 
>               ci<https://elixir.bootlin.com/linux/v6.5.2/C/ident/ci>->is_otg<https://elixir.bootlin.com/linux/v6.5.2/C/ident/is_otg> = (hw_read<https://elixir.bootlin.com/linux/v6.5.2/C/ident/hw_read>(ci<https://elixir.bootlin.com/linux/v6.5.2/C/ident/ci>, CAP_DCCPARAMS<https://elixir.bootlin.com/linux/v6.5.2/C/ident/CAP_DCCPARAMS>,
> 
>                            DCCPARAMS_DC<https://elixir.bootlin.com/linux/v6.5.2/C/ident/DCCPARAMS_DC> | DCCPARAMS_HC<https://elixir.bootlin.com/linux/v6.5.2/C/ident/DCCPARAMS_HC>)
> 
>                                   == (DCCPARAMS_DC<https://elixir.bootlin.com/linux/v6.5.2/C/ident/DCCPARAMS_DC> | DCCPARAMS_HC<https://elixir.bootlin.com/linux/v6.5.2/C/ident/DCCPARAMS_HC>));
> 
> Why otg is set only when DC and HC is set?
> 
> By enabling ci<https://elixir.bootlin.com/linux/v6.5.2/C/ident/ci>->is_otg<https://elixir.bootlin.com/linux/v6.5.2/C/ident/is_otg> = true we see we need to set the extcon in the device tree, why we need extcon to handle the vbus? Can the vbus be permanent?
> 
> 
> 
> Even after setting extcon vbus to dummy GPIO we succeed to modify the vbus_active parameter to is_active but it didn't worked in the end because it a dummy GPIO that not related to the USB vbus.
> 
> 
> 
> BTW,
> 
> If we adding ci->vbus_active = true at probe stage the UDC Chipidea driver works fine.
> 
> https://elixir.bootlin.com/linux/v6.5.2/source/drivers/usb/chipidea/core.c#L1123
> 
> 
> 
> Appreciate if you could you advise how should we overcome this issue

After loading the gadget driver, try to force "connect" udc using /sys
entry. See the below code at file: drivers/usb/gadget/udc/core.c

static ssize_t soft_connect_store(struct device *dev,
		struct device_attribute *attr, const char *buf, size_t n)


Your issue is probably due to the UDC don't know it is connected, so DP
is not pulled up.

-- 

Thanks,
Peter Chen
