Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2CFA6BC15
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 14:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfGQMFg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 08:05:36 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42480 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfGQMFg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 08:05:36 -0400
Received: by mail-pl1-f195.google.com with SMTP id ay6so11873943plb.9
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2019 05:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bV4oFTVrR5ITw61uV0+hRpWZlLTeGAeSnKjtK//VhYI=;
        b=tjQTDJKOdrR2RzWTomurz0zVY2xwINFhSGftsH4DvdFDLTqPt3kd5iTZQG/I/wiqH/
         hSptuXyBjShdfure20VlD+dHqW4rCyEJ0YA5UPkco7g61fKm/3rl7cv850ApBGxoRPBG
         TAenP7nyJKBYTtBRiaFQ7Sui5rLDd2qoQfmW5PB8VSXt/3MeESiO3F9xGDRqQkPfLJjm
         Y2gJ+D58sfmOX17WHYzHpmJ1g/wZlGGeQj7z5wqoZzluMN2GJ+2m6CWNzKQ6B4UbfHrq
         L0q8vaFXCINu8XBoyN+ku5HblzqkSEOQTSQ1J51IPtGXQWxF568nzS5ZVaWjhq3uuIhC
         Q3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bV4oFTVrR5ITw61uV0+hRpWZlLTeGAeSnKjtK//VhYI=;
        b=cMWlenWprkSsdwwzQM53Amm8Zwa0Ks9QN9i7by764u3WC89l7yRZ0AhTJWWm0srNiB
         8O15OEBhaFQEumFYRmeIWI9tVIPUtZXqKd5j6pF0rgdwwIxZdf87+QgQHgn+ftnago7y
         msa4ddYDNQRwmPhrWCYzF2iK7Se1XInlr+9OVfs/F6cx2+rccKMEm4OIPVa7eFlU+Puh
         iXgToS//XFtYjMqm+z1X/6A3AMw66KiX4q5BepVGufdcNIaWARRKD1q4+3+Ktt8uwiQM
         iS0b0bXzYzq4IITtCqssC0Bjgcn7uFgybCFTY0An6jHs5q6E+5t8hvARq25KtcNxgSS/
         Gc7w==
X-Gm-Message-State: APjAAAXJMXqZBgsm1TkYu4NP93qY0D0PZAxbtxHM644flE1WExC/wwX4
        5WJJK/L6NBw+MgiIhtEaa53ECxfTIddjQw==
X-Google-Smtp-Source: APXvYqwfO5gFTpRp4pKby1ng8xi/OSduTIMam/E4HHvoYYuFJmTsgjIj4k8a3tXBt/F8WZuK+/pQcQ==
X-Received: by 2002:a17:902:2be6:: with SMTP id l93mr43037551plb.0.1563365135567;
        Wed, 17 Jul 2019 05:05:35 -0700 (PDT)
Received: from [10.37.0.94] ([45.56.153.209])
        by smtp.googlemail.com with ESMTPSA id 30sm58548682pjk.17.2019.07.17.05.05.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 05:05:35 -0700 (PDT)
Subject: Re: [PATCH v2] USB: serial: option: Add support for ZTE MF871A
To:     Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>, johan@kernel.org
Cc:     hyamamo@allied-telesis.co.jp, linux-usb@vger.kernel.org
References: <20190716090553.GA3522@localhost>
 <156334196350.13827.8927178214233271211.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
From:   Lars Melin <larsm17@gmail.com>
Message-ID: <5b4971b3-64e7-605a-948c-9e1e02b11eb2@gmail.com>
Date:   Wed, 17 Jul 2019 19:05:27 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156334196350.13827.8927178214233271211.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/17/2019 12:40, Yoshiaki Okamoto wrote:
> This patch adds support for MF871A USB modem (aka Speed USB STICK U03)
> to option driver. This modem is manufactured by ZTE corporation, and
> sold by KDDI.
> 
> Interface layout:
> 0: AT
> 1: MODEM
> 
> usb-devices output:
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  9 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=19d2 ProdID=1481 Rev=52.87
> S:  Manufacturer=ZTE,Incorporated
> S:  Product=ZTE Technologies MSM
> S:  SerialNumber=1234567890ABCDEF
> C:  #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> 
> Co-developed-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
> Signed-off-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
> Signed-off-by: Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
> ---
> 
> Changes in v2:
> - Add Co-developed-by tag.
> - Move away product-id define and add short comment after the entry.
> 
>   drivers/usb/serial/option.c |    1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index a0aaf0635359..3188b3cb0f21 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1548,6 +1548,7 @@ static const struct usb_device_id option_ids[] = {
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, 0xff),  /* Telewell TW-LTE 4G v2 */
>   	  .driver_info = RSVD(2) },
>   	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1476, 0xff) },	/* GosunCn ZTE WeLink ME3630 (ECM/NCM mode) */
> +	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1481, 0xff) },	/* ZTE MF871A */
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1533, 0xff, 0xff, 0xff) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1534, 0xff, 0xff, 0xff) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1535, 0xff, 0xff, 0xff) },
> 

Please do a full test of the interface attributes (Class/SubClass/Proto) 
whenever possible, this could be helpful in case the mfgr makes a device 
with different interface layout but re-uses an already used vid:pid.
Both interfaces has attributes ff/00/00 so there is no reason for doing 
a less accurate test.

rgds
/Lars

