Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9CE1F4C14
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jun 2020 06:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgFJEWf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Jun 2020 00:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgFJEWf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Jun 2020 00:22:35 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFAEC05BD1E
        for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2020 21:22:34 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id o26so403455edq.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Jun 2020 21:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X/7GIe/cSktc8SYuRAXvLSXstrKZKVNYkG1k7d3sGOE=;
        b=RXF0XT230hb8XgjbMQ+NqD411ZZlP9PnLiPup1KUmeN/2I+mXbvU6+05vvZsbtDdOx
         KtG432c5VwW3Wb6DXmRxPtXmxYwaVAHibzXBTGl/tToW4tMLmnt+6wBUmOjIltUC3p55
         KX2BeVathgu7qKsMqC5EXub5MYys3mzIt4o6ar2QpsSPGlQl8XXbzeBeru1PDg44dv76
         ckGQmSNYlL7M1T4MoAIByyf7td2Flz+Gft4QKQThQAw24W/m12bSPSg8XBeWInBY6ll2
         +QHFj/XF5n7l18ozmQXn17OfsKPOqAQaOhbYU1rWqFkRK7H2cFYBuqH6BVrutPVc0Wje
         +07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X/7GIe/cSktc8SYuRAXvLSXstrKZKVNYkG1k7d3sGOE=;
        b=PE4jOfHFmPERMAYGLO1su5kWE1+k5/x0RLAg6YbsxaSJQ7OnkDc66Ji4SaB79cMeJB
         SOOez5iAOrn+t54/lxpWTNwS8nXCId5P3xzHEWFWDrsM5eop1wt+qRYHOAyDDDF2je8c
         FpsEG7xQWO9iJyfTEST3rdJvmDnLa2XCTGuoHGiUM/ulGOj9M8urEkf6f4jBREpIL3xp
         4D0xKBX6rcUoOYJpXdja/ApgHaMBdsAIkmRfVEcxUAq0rI24H+m6oPdEcFfN1dPJFBCp
         oLYo46lDSmay60OCrgek/2tMSXrvOdizL8b0HZQOHLKgoA8E7r5NMTfcUXUg02UKKOQq
         e7Ng==
X-Gm-Message-State: AOAM533AFiV+7M/L429ZBCFJbKaTbVjDGj9tzXefkaVO+3mXawVjeAYe
        USXREP0i1Wfon30yALjLvVM=
X-Google-Smtp-Source: ABdhPJwKDHFC6pL+0Err+YpBtIxYGEnxU0Wwi2sTSCC0U/bH2/vVWtOQY9jmuagilUvu/0p+/5pJ9A==
X-Received: by 2002:aa7:dc4e:: with SMTP id g14mr851921edu.346.1591762952457;
        Tue, 09 Jun 2020 21:22:32 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id v7sm16070092edq.82.2020.06.09.21.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 21:22:31 -0700 (PDT)
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: add property to disable xhci
 64bit support
To:     Peter Chen <peter.chen@nxp.com>, Jun Li <jun.li@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
 <1591701165-12872-2-git-send-email-jun.li@nxp.com>
 <20200610024816.GA18494@b29397-desktop>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <5e4d7227-afd7-27cf-720c-defeadff8450@gmail.com>
Date:   Tue, 9 Jun 2020 21:22:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610024816.GA18494@b29397-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 6/9/2020 7:47 PM, Peter Chen wrote:
> On 20-06-09 19:12:40, Li Jun wrote:
>> Add a property "snps,xhci-dis-64bit-support-quirk" to disable xhci 64bit
>> address support, this is due to SoC integration can't support it but
>> the AC64 bit (bit 0) of HCCPARAMS1 is set to be 1.
>>
>> Signed-off-by: Li Jun <jun.li@nxp.com>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index d03edf9..d16cba7 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -109,6 +109,9 @@ Optional properties:
>>  			When just one value, which means INCRX burst mode enabled. When
>>  			more than one value, which means undefined length INCR burst type
>>  			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
>> + - snps,xhci-dis-64bit-support-quirk: set if the AC64 bit (bit 0) of HCCPARAMS1 is set
>> +			to be 1, but the controller actually can't handle 64-bit address
>> +			due to SoC integration.
>>  
>>   - in addition all properties from usb-xhci.txt from the current directory are
>>     supported as well
> 
> Why not adding it at usb-xhci.txt directly? It is more like general
> property, I see Renesas rcar platforms also have this quirk.
> 

Or rather define a compatible string for the specific SoC integration
here and based upon that compatibility string set the xhci->quirks to
have XHCI_NO_64BIT_SUPPORT set.
-- 
Florian
