Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6D83096D8
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jan 2021 17:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbhA3Qk2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jan 2021 11:40:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhA3QiL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 Jan 2021 11:38:11 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F815C061574;
        Sat, 30 Jan 2021 08:37:16 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id j13so14143062edp.2;
        Sat, 30 Jan 2021 08:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GkwA+ynSc7NfV2LjE4+F7AJzG11s+YV+stwraryvKKA=;
        b=aiM3Ql49kC2Soyrwp+wrw/il4h2gWS9fnLL9c/lnqKc0ScbEtS1QYnRCS3KNQo1oeA
         PawdFkcpvyhflsF2Hfyh34ajf+xzmuvaqfLTBepxcmX39G/RcnmG0GknrV6DaGW1LHcU
         olvjCWPWqzQ/ywAcADh5yQ+txdH38CJHhJg37Di7j8f+5FAmmstIulMjtQiDTUyAoB1U
         ARPctR2THUGs9jpZh+MzAG2vJMUwGQb+vj6Yi/q9UsKQUd0w0kIDEZ7cy3fZ8j7hTVqu
         6VFO2gj1PE7P6bugJIVzthe0a0ksBL8RwfLIw6Ucsh8+DA4kNUSo0MDMWbUzxOW0GD00
         2Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GkwA+ynSc7NfV2LjE4+F7AJzG11s+YV+stwraryvKKA=;
        b=XkLn6REOmKvlb8+yKdIPa0VTqxDZGX/VeHrzUhtNLsrIeGg6gv5oQyocGegk2H9oSi
         lA1YO49uUCzq3hJm9uAQJ+onTSVyo01a6AiVQiiYG+L4A2flOQRoDRDfIQxn8hXYqvSB
         kIt/hb237niL3EWk3Zz6RFD1uG/rT5wYfTQl+hnda0M+y7ysLPoN2NT/ms0MWoe/UDl9
         dvh65h+GvDPZvHOiAlwNV0UeWulRT6gMBNV8XPqusJT6nCgEKe5/4LnVX7g2+WcG9z3n
         SBy00tksuBEFcKgo4oyUekHYejuDvAhadnlYcJfJ7YTT0LgGtxDJlC0HwPkcanvQxxQM
         WZ8A==
X-Gm-Message-State: AOAM531quZERzFlbutzJVL6l86VcZw314YHVXpY2sTX3TvhNV5hSn3X8
        MAB4Vl1RZ+qZK3YFoljSY80I/MJ3VXLu6UFK4Uc=
X-Google-Smtp-Source: ABdhPJyiN0Ixj9mTg8dZYJBo7+b+fSr4lyn8XpW5U+LL7nWKNHADNk5AoxUV4qWmBBpw+WuadPWv2w==
X-Received: by 2002:a05:6402:26d3:: with SMTP id x19mr10733386edd.0.1612024635240;
        Sat, 30 Jan 2021 08:37:15 -0800 (PST)
Received: from [10.8.0.2] (terefe.re. [5.255.96.200])
        by smtp.gmail.com with ESMTPSA id f6sm6147897edv.83.2021.01.30.08.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 08:37:14 -0800 (PST)
Subject: Re: [PATCH] usb: host: xhci: mvebu: make USB 3.0 PHY optional for
 Armada 3720
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>
References: <20201223162403.10897-1-pali@kernel.org>
 <8560857d-a090-1e18-bdf0-3389897716a2@gmail.com>
 <20210130163539.lqtqipfhuts5t7d5@pali>
From:   Tomasz Maciej Nowak <tmn505@gmail.com>
Message-ID: <d3153167-d057-4810-cca5-3571b229b38c@gmail.com>
Date:   Sat, 30 Jan 2021 17:37:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210130163539.lqtqipfhuts5t7d5@pali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

W dniu 30.01.2021 o 17:35, Pali Rohár pisze:
> On Saturday 30 January 2021 17:31:41 Tomasz Maciej Nowak wrote:
>> W dniu 23.12.2020 o 17:24, Pali Rohár pisze:
>>> Older ATF does not provide SMC call for USB 3.0 phy power on functionality
>>> and therefore initialization of xhci-hcd is failing when older version of
>>> ATF is used. In this case phy_power_on() function returns -EOPNOTSUPP.
>>>
>>> [    3.108467] mvebu-a3700-comphy d0018300.phy: unsupported SMC call, try updating your firmware
>>> [    3.117250] phy phy-d0018300.phy.0: phy poweron failed --> -95
>>> [    3.123465] xhci-hcd: probe of d0058000.usb failed with error -95
>>>
>>> This patch calls phy_power_on() in xhci_mvebu_a3700_init_quirk() function
>>> and in case it returns -EOPNOTSUPP then XHCI_SKIP_PHY_INIT quirk is set to
>>> instruct xhci-plat to skip PHY initialization.
>>>
>>> This patch fixes above failure by ignoring 'not supported' error in
>>> aardvark driver. In this case it is expected that phy is already power on.
>>>
>>> It fixes initialization of xhci-hcd on Espressobin boards where is older
>>> Marvell's Arm Trusted Firmware without SMC call for USB 3.0 phy power.
>>>
>>> This is regression introduced in commit bd3d25b07342 ("arm64: dts: marvell:
>>> armada-37xx: link USB hosts with their PHYs") where USB 3.0 phy was defined
>>> and therefore xhci-hcd on Espressobin with older ATF started failing.
>>>
>>> Fixes: bd3d25b07342 ("arm64: dts: marvell: armada-37xx: link USB hosts with their PHYs")
>>> Signed-off-by: Pali Rohár <pali@kernel.org>
>>> Cc: <stable@vger.kernel.org> # 5.1+: ea17a0f153af: phy: marvell: comphy: Convert internal SMCC firmware return codes to errno
>>> Cc: <stable@vger.kernel.org> # 5.1+: f768e718911e: usb: host: xhci-plat: add priv quirk for skip PHY initialization
>>>
>>> ---
>>>
>>> When applying this patch, please include additional line
>>>
>>> Cc: <stable@vger.kernel.org> # 5.1+: <COMMIT_ID>: usb: host: xhci-plat: fix support for XHCI_SKIP_PHY_INIT quirk
>>>
>>> with correct COMMIT_ID of mentioned patch which is available in the thread:
>>
>> Hi,
>> and sorry for late reply, but that might be good reminder for maintainers.
>> Anyway I tested this patch in conjunction with v2 from this topic:
>>> https://lore.kernel.org/lkml/20201221150903.26630-1-pali@kernel.org/T/#u
>> The USB ports work flawlessly with older ATF, so:
>>
>> Tested-by: Tomasz Maciej Nowak <tmn505@gmail.com>
> 
> Thank you for testing. But as was mentioned in discussion in above
> patch, I have to rework both patches. I have new changes prepared but
> have not had a chance to test new changes yet. If you want I can send
> you a new version of those untested patches.

Yes, will gladly test them.

> 
>> At OpenWrt we are using patch which removes Comphy assignments from nodes
>> in dts, but that is sub optimal, since that "discriminates" users with
>> updated ATF. I would prefer this patch instead of what we are doing now
>> in OpenWrt.
>>
>> Thanks.
>>
>>>
>>> As mentioned patch is required for change in this patch to work. Above
>>> mentioned patch is prerequisite for this patch and therefore needs to be
>>> reviewed and applied prior this patch.
>>>
>>> Note that same issue as in this USB 3.0 PHY patch was already resolved and
>>> applied also for SATA PHY and PCIe PHY on A3720 SOC in following commits:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=45aefe3d2251e4e229d7662052739f96ad1d08d9
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b0c6ae0f8948a2be6bf4e8b4bbab9ca1343289b6
>>>
>>> And these commits were also backported to stable kernel versions (where
>>> were affected commits which broke drivers initialization).
>>> ---
>>>  drivers/usb/host/xhci-mvebu.c | 35 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>>
>>> diff --git a/drivers/usb/host/xhci-mvebu.c b/drivers/usb/host/xhci-mvebu.c
>>> index 60651a50770f..ec4f6d6e44cf 100644
>>> --- a/drivers/usb/host/xhci-mvebu.c
>>> +++ b/drivers/usb/host/xhci-mvebu.c
>>> @@ -8,6 +8,7 @@
>>>  #include <linux/mbus.h>
>>>  #include <linux/of.h>
>>>  #include <linux/platform_device.h>
>>> +#include <linux/phy/phy.h>
>>>  
>>>  #include <linux/usb.h>
>>>  #include <linux/usb/hcd.h>
>>> @@ -77,9 +78,43 @@ int xhci_mvebu_mbus_init_quirk(struct usb_hcd *hcd)
>>>  int xhci_mvebu_a3700_init_quirk(struct usb_hcd *hcd)
>>>  {
>>>  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
>>> +	struct device *dev = hcd->self.controller;
>>> +	struct phy *phy;
>>> +	int ret;
>>>  
>>>  	/* Without reset on resume, the HC won't work at all */
>>>  	xhci->quirks |= XHCI_RESET_ON_RESUME;
>>>  
>>> +	/* Old bindings miss the PHY handle */
>>> +	phy = of_phy_get(dev->of_node, "usb3-phy");
>>> +	if (IS_ERR(phy) && PTR_ERR(phy) == -EPROBE_DEFER)
>>> +		return -EPROBE_DEFER;
>>> +	else if (IS_ERR(phy))
>>> +		goto phy_out;
>>> +
>>> +	ret = phy_init(phy);
>>> +	if (ret)
>>> +		goto phy_put;
>>> +
>>> +	ret = phy_set_mode(phy, PHY_MODE_USB_HOST_SS);
>>> +	if (ret)
>>> +		goto phy_exit;
>>> +
>>> +	ret = phy_power_on(phy);
>>> +	if (ret == -EOPNOTSUPP) {
>>> +		/* Skip initializatin of XHCI PHY when it is unsupported by firmware */
>>> +		dev_warn(dev, "PHY unsupported by firmware\n");
>>> +		xhci->quirks |= XHCI_SKIP_PHY_INIT;
>>> +	}
>>> +	if (ret)
>>> +		goto phy_exit;
>>> +
>>> +	phy_power_off(phy);
>>> +phy_exit:
>>> +	phy_exit(phy);
>>> +phy_put:
>>> +	of_phy_put(phy);
>>> +phy_out:
>>> +
>>>  	return 0;
>>>  }
>>>
>>
>> -- 
>> TMN


-- 
TMN
