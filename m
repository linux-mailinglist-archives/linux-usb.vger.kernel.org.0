Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1E9A1A716
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2019 09:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbfEKHj6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 May 2019 03:39:58 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37468 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728392AbfEKHj5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 May 2019 03:39:57 -0400
Received: by mail-lf1-f67.google.com with SMTP id h126so5675936lfh.4
        for <linux-usb@vger.kernel.org>; Sat, 11 May 2019 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2QQvaa/SSPqU/FGa7FdkdaExZgaJpUrgkhTOk/BWtiM=;
        b=WHflFKkhglb72GcEopz4ufUa4gcFc2YBuChFrCOLWMjoEPseufiTopM+2ObjCOI3dJ
         +shsE8KjFphsphk73bpvif8SepL1UqiZQHdh2CFy3U9LQe2bAJc8YubUjXobMfb0gAWQ
         hWmDOcmiENM9bTedee+trHBabvExBGL7TLBKDKGTIeIunI7LiPRI9jWpdyUWEtpZaTKL
         gjd+24bC6kzoY5I0ruDjZnN/dvwXfRMTfqYwshrKj9fyZdcOFQ7NDXRwG+vCeTkPzviS
         9ESbeN9PKKPB19TCSXzbitNsn4tJ8puhpxG/DFxb+MYWQe1VNKBqzYol7FiCudw20MZR
         vm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2QQvaa/SSPqU/FGa7FdkdaExZgaJpUrgkhTOk/BWtiM=;
        b=TMP/AOBu0Ba/TQOk2sYBJ7boFWkzFEbPIQA2rv6qQP1CIjAPLkxdxcYSRnjEeqQGpS
         DWzcboC9ymXwI5mtmW/SMJ1xpsYuBl5Ort3o1TRG7UNUgXe+btirQCe+zRnfLS0iBbVv
         JwQ6erLKBpku/gbVG6kkCWf2PaoWCzb/jUraYj3efwj1q4lmQtzHUmERZygs7IoZvoLN
         dEbomuZWogAZEOE13PaTgvJzUZO4v5GJCM+MsVpBOk9D2DU7JZnstvJG8Vwe0lSdMTFs
         Y5jHOpG7QHzmq/RyWiHWGfoi3KZKsJR4Mpos18rULYYslCQdEU4wklO7hUdSHhJIsQ6o
         U68w==
X-Gm-Message-State: APjAAAXBd/2U/x2G2pbI1H2BJlXpuSGGyBcVXzYjfCCXR2YjtvZCW/cg
        zrCrUod7sIOUEQrCcVmIseu1b64XnxI=
X-Google-Smtp-Source: APXvYqxhynHXBx45Q7/bEav695m59fzNRlA3xStpUwAkKwFbG8IjXtbZ8gRAuWPzfuQJ4ORvVExG5g==
X-Received: by 2002:a19:cc95:: with SMTP id c143mr8090645lfg.138.1557560395529;
        Sat, 11 May 2019 00:39:55 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.81.194])
        by smtp.gmail.com with ESMTPSA id 10sm2005112ljv.47.2019.05.11.00.39.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 May 2019 00:39:53 -0700 (PDT)
Subject: Re: [PATCH v2 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-6-chris.brandt@renesas.com>
 <e987df36-eca6-f05f-d1bf-7dc43fc9d4b4@cogentembedded.com>
 <TY1PR01MB15628A94DA371A7636984A708A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <711839c7-930f-938e-4626-8a7524f5b82e@cogentembedded.com>
Date:   Sat, 11 May 2019 10:39:40 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB15628A94DA371A7636984A708A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.05.2019 16:55, Chris Brandt wrote:

>>> +	} else {
>>> +		/* Not OTG, so dr_mode should be set in PHY node */
>>> +		mode = usb_get_dr_mode(channel->dev);
>>> +		if (mode == USB_DR_MODE_HOST)
>>> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
>>> +		else if (mode == USB_DR_MODE_PERIPHERAL)
>>> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);
>>
>>      Maybe a *switch* instead?
> 
> I like that idea because I can get rid of the dr_mode variable.

    Yes. :-)

> However...
> I just tried it, but if I only have a case for HOST and PERIPHERAL, I
> get this gcc warning:
> 
>    warning: enumeration value ‘USB_DR_MODE_UNKNOWN’ not handled in switch [-Wswitch]
>    warning: enumeration value ‘USB_DR_MODE_OTG’ not handled in switch [-Wswitch]
> 
> 
> So, my code would have to be:
> 
> 	} else {
> 		/* Not OTG, so dr_mode should be set in PHY node */
> 		switch (usb_get_dr_mode(channel->dev)) {
> 		case USB_DR_MODE_HOST:
> 			writel(0x00000000, usb2_base + USB2_COMMCTRL);
> 			break;
> 		case USB_DR_MODE_PERIPHERAL:
> 			writel(0x80000000, usb2_base + USB2_COMMCTRL);
> 			break;
> 		case USB_DR_MODE_UNKNOWN:
> 		case USB_DR_MODE_OTG:

    Maybe default: instead?

> 			break;
> 		}
> 	}
> 
> I guess that is still OK.

    Yes. :-)

> Chris

MBR, Sergei
