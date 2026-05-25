Return-Path: <linux-usb+bounces-37993-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAgWJXGuE2pKEwcAu9opvQ
	(envelope-from <linux-usb+bounces-37993-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 04:05:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E95C5525
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 04:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E4B23007F72
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 02:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79ED52773E5;
	Mon, 25 May 2026 02:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdp4sgY5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B521FB1
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779674732; cv=none; b=CmCafe8AxSX12166/Lx1fL8tqExexlX/Oc1+UT4/1CgqAz/9hSmst2tp1SuVf65P5IYYjf+5YYe0WdsL8Ok0te0TvgDir/YeI1bo2YDvuyIXsut3zOOH5FrJlhHSOzvZ3sSdkdGCUF0mUVqxtvqqyHkJHuTXbZa03gJ9sPm2WXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779674732; c=relaxed/simple;
	bh=60uL1EAd77dkMqJ+ReLfFWYgWr/SH/+UsONUBuWU3vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJA+7LeyDaWaPVDovROjZW/ZKtXfKxpubCqcSkViAzX8vk3mz+UcfCda9/+ktdZTnI0qmdj0XJrsZyCbVxINei8l6WpiNEfWnBd9wvH7FkHQVHilnti9XULpXsY40X2w9g9QwCSgCa/C4I900Y6WMU8/N2CfIqlhFc2aQBFOgOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zdp4sgY5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83945063f70so4671747b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779674729; x=1780279529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7jUX/Rr8JLpxFAZIW/CZdht7Ee+xnPqCKmwzhxjfF8=;
        b=Zdp4sgY5TB8EnYbheelm+2L7Bz4yP/aRy043ReRdmNxS3lbQPC2QrETJgLQbw4ZKi7
         AaU+4o5dlEbpne9uwyHVg875QdoxoDHUgSJzBKZldufa4DfQVPh/48EWxTTE78pV4W9w
         Zih/dw7az5ixkQwuxPIORfelRPEnxkuycB8rsVJ2jmW8vhbu8Xi3Y1OBV2mFIrhZibud
         J/SmUCKWRENu7KuLncB1YkXrpbceljAu1wvEbYDgG2MocTsWCxNgPXqKNPWTTUf3Sfmv
         9TbA44GqCq4FnnIEOmkNGFvWDZ2TveUi775Jl4KpUKN68a1S9ix5CurRS9FjasXRsQB0
         e2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779674729; x=1780279529;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7jUX/Rr8JLpxFAZIW/CZdht7Ee+xnPqCKmwzhxjfF8=;
        b=OUtv4SjfCjf/xZbOYcq9eu6a+t9tf8ElwimcwEFHpTr5lY4hNW/NjZclKZVr/tYDU8
         0/64SeFa2PSF/He+KQa7kW7frK0x4f/Jn8E/gY6ayPTuYrKhyKNjOvbBNgo8Gjg/HHs4
         aVf+OIcbAch0BZsfu2vuSq0janqz2xPMw/+ND75rkWiPfZzbDPyv9Mt+KYWGSeAYTYdK
         ax6JazRHSSqdmetz0EcKv3edhhnvGt6NFNfa6lGlinpJrxjl0GSWEsGy/G2CCnhJD3N/
         ZETOrIsGRjnNiAdef9sNwZGu+HPoWx/7D/4QEYFAAQv3jmic/KZWEg1OZUgDC0bW89yx
         yLyw==
X-Forwarded-Encrypted: i=1; AFNElJ8DCI68ASmQlFypmxACxjQff69tOWLZfhsDqEQnmBdTw9lgobHlPo+sPa0iMDRIha/Jfxkc6H6jLlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YweeRvOFUze95F86CmDJQO0VGfW6AiosAgDFG6NavaOZXxlxKKd
	KGBg1FNOf4hIt09/kgvN7HmR/V3Bsj3hvH4KUPsQolhl5moFeRI4P+ShHhrrUeR1
X-Gm-Gg: Acq92OGiaODHpIDX3ihu27mjRftrVxMOBLqVvsIf+YAMDiROKGHP6AdMFFx16bmPEWi
	2QFrB+APKqrl8VHCkYkqYbD0xV1ywjxCoQuGe+iR9q/TWJWmYBVfZD9XC+N0hX9jee+PqAJPUHb
	ztmrxDELAbCEhkSXatJ3XRBMkoEthW5C1UsG0SeESEATsjAMQmgTYplcV0PGcZLVhJA4pngBAKw
	HIvEaDbk/zgtf/uvKGiT0STdFxY5pZSpsOeCgMiXS/wLJVKEf7mW/uK89hcSHN9418d41NC6s9U
	tc7ztb8kOeYjIK3ZyDHmvnlgwB2z1LmhUM5lLN3rBuEXrGlAkOiHMFlyyKN/ST9K2A8iG4iVBCs
	AVRdgawKzp7Rd/04px3V8wkLhCXW+H3q/taniBnhhYhx6ApVOBH4fWX5gYh8xcKsbPoB2MuhkcC
	Ha3pvx7vo3YKsVH9RhwgKS9JP+LBRzHcNM4UBXjfvVvDNZkjlKTpotfPNAzb2K/fQnQLLUxIfNW
	w8=
X-Received: by 2002:a05:6a20:a10c:b0:3a1:785:a567 with SMTP id adf61e73a8af0-3b3297d027amr10105654637.26.1779674728937;
        Sun, 24 May 2026 19:05:28 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:2f00:658e:df8e:c08a:e98c? ([240e:38b:e68:2f00:658e:df8e:c08a:e98c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202a337fsm6471118a12.8.2026.05.24.19.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 19:05:28 -0700 (PDT)
Message-ID: <a6752fa9-b15b-4b50-baef-53c36460311e@gmail.com>
Date: Mon, 25 May 2026 10:05:23 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] docs/zh_CN: Add acm.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, linux-usb@vger.kernel.org,
 si.yanteng@linux.dev
Cc: gregkh@linuxfoundation.org, alexs@kernel.org, dzm91@hust.edu.cn,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1779355170.git.baikefan@leap-io-kernel.com>
 <9f865599e837c90d3048b9a8004efd65b2e3f9d3.1779355170.git.baikefan@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <9f865599e837c90d3048b9a8004efd65b2e3f9d3.1779355170.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37993-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: F41E95C5525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/21 17:55, Kefan Bai wrote:
> Translate .../usb/acm.rst into Chinese
> 
> Update the translation through commit ecefae6db042
> ("docs: usb: rename files to .rst and add them to drivers-api")
> 
> Reviewed-by: Yanteng Si<siyanteng@cqsoftware.com.cn>
> Signed-off-by: Kefan Bai<baikefan@leap-io-kernel.com>
> ---
>   Documentation/translations/zh_CN/usb/acm.rst  | 147 ++++++++++++++++++
>   .../translations/zh_CN/usb/index.rst          |   2 +-
>   2 files changed, 148 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
> 
> diff --git a/Documentation/translations/zh_CN/usb/acm.rst b/Documentation/translations/zh_CN/usb/acm.rst
> new file mode 100644
> index 000000000000..51d6eb8f5660
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/acm.rst
> @@ -0,0 +1,147 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/usb/acm.rst
> +
> +:翻译:
> +
> + 白钶凡 Kefan Bai<baikefan@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +====================
> +Linux ACM 驱动 v0.16
> +====================
> +
> +版权所有 (c) 1999 Vojtech Pavlik<vojtech@suse.cz>
> +
> +由 SuSE 赞助
> +
> +0. 免责声明
> +~~~~~~~~~~~
> +本程序是自由软件；你可以在自由软件基金会发布的
> +GNU 通用公共许可证第 2 版，或者（按你的选择）
> +任何后续版本的条款下重新发布和/或修改它。
> +
> +发布本程序是希望它能发挥作用，但它不附带任何担保；
> +甚至不包括对适销性或特定用途适用性的默示担保。
> +详情见 GNU 通用公共许可证。

Hi Kefan,

The alignment means we will try use the width for each of lines, not 
just stop for each of punctuation. Please fix all patches alignment, try 
to expand the whole width for lines unless it's broken a word or unreadable.

Thanks
> +
> +你应该已经随本程序收到了 GNU 通用公共许可证的副本；
> +如果没有，请致信：Free Software Foundation, Inc., 59
> +Temple Place, Suite 330, Boston, MA 02111-1307 USA。
> +
> +如需联系作者，可发送电子邮件至vojtech@suse.cz，
> +或邮寄至：
> +Vojtech Pavlik, Ucitelska 1576, Prague 8,
> +182 00, Czech Republic。
> +
> +为方便起见，软件包中已附带 GNU 通用公共许可证
> +第 2 版：见 COPYING 文件。
> +
> +1. 使用方法
> +~~~~~~~~~~~
> +``drivers/usb/class/cdc-acm.c`` 驱动可用于符合 USB
> +通信设备类抽象控制模型（USB CDC ACM）规范的
> +USB 调制解调器和 USB ISDN 终端适配器。
> +
> +许多调制解调器支持此驱动，以下是我所知道的一些型号：
> +
> +	- 3Com OfficeConnect 56k
> +	- 3Com Voice FaxModem Pro
> +	- 3Com Sportster
> +	- MultiTech MultiModem 56k
> +	- Zoom 2986L FaxModem
> +	- Compaq 56k FaxModem
> +	- ELSA Microlink 56k
> +
> +我知道有一款 ISDN 终端适配器可以与 ACM 驱动一起使用：
> +
> +	- 3Com USR ISDN Pro TA
> +
> +一些手机也可以通过 USB 连接。
> +我知道以下机型可以正常工作：
> +
> +	- SonyEricsson K800i
> +
> +遗憾的是，许多调制解调器和大多数 ISDN TA
> +都使用专有接口，因此无法与此驱动配合工作。
> +购买前请先确认设备是否符合 ACM 规范。
> +
> +要使用这些调制解调器，需要加载以下模块::
> +
> +	usbcore.ko
> +	uhci-hcd.ko ohci-hcd.ko or ehci-hcd.ko
> +	cdc-acm.ko
> +
> +之后就应该可以访问这些调制解调器了。
> +应当可以使用 ``minicom``、``ppp`` 和 ``mgetty``
> +与它们通信。
> +
> +2. 验证驱动是否正常工作
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +第一步是检查 ``/sys/kernel/debug/usb/devices``，
> +其内容应该类似如下::
> +
> +  T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=12  MxCh= 2
> +  B:  Alloc=  0/900 us ( 0%), #Int=  0, #Iso=  0
> +  D:  Ver= 1.00 Cls=09(hub  ) Sub=00 Prot=00 MxPS= 8 #Cfgs=  1
> +  P:  Vendor=0000 ProdID=0000 Rev= 0.00
> +  S:  Product=USB UHCI Root Hub
> +  S:  SerialNumber=6800
> +C:* #Ifs= 1 Cfg#= 1 Atr=40 MxPwr=  0mA
> +  I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
> +  E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=255ms
> +  T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=12  MxCh= 0
> +  D:  Ver= 1.00 Cls=02(comm.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  2
> +  P:  Vendor=04c1 ProdID=008f Rev= 2.07
> +  S:  Manufacturer=3Com Inc.
> +  S:  Product=3Com U.S. Robotics Pro ISDN TA
> +  S:  SerialNumber=UFT53A49BVT7
> +  C:  #Ifs= 1 Cfg#= 1 Atr=60 MxPwr=  0mA
> +  I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=acm
> +  E:  Ad=85(I) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +  E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=128ms
> +C:* #Ifs= 2 Cfg#= 2 Atr=60 MxPwr=  0mA
> +  I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
> +  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=128ms
> +  I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
> +  E:  Ad=85(I) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +  E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +
> +这三行的存在很关键（以及 ``Cls=`` 字段里出现的
> +``comm`` 和 ``data`` 类）；它说明这是一个 ACM
> +设备。``Driver=acm`` 表示该设备正在使用 acm 驱动。
> +如果只看到 ``Cls=ff(vend.)``，那就无能为力了：
> +这说明你手上的设备使用的是厂商专有接口::
> +
> +    D:  Ver= 1.00 Cls=02(comm.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  2
> +    I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
> +    I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
> +
> +在系统日志中应该可以看到::
> +
> +  usb.c: USB new device connect, assigned device number 2
> +  usb.c: kmalloc IF c7691fa0, numif 1
> +  usb.c: kmalloc IF c7b5f3e0, numif 2
> +  usb.c: skipped 4 class/vendor specific interface descriptors
> +  usb.c: new device strings: Mfr=1, Product=2, SerialNumber=3
> +  usb.c: USB device number 2 default language ID 0x409
> +  Manufacturer: 3Com Inc.
> +  Product: 3Com U.S. Robotics Pro ISDN TA
> +  SerialNumber: UFT53A49BVT7
> +  acm.c: probing config 1
> +  acm.c: probing config 2
> +  ttyACM0: USB ACM device
> +  acm.c: acm_control_msg: rq: 0x22 val: 0x0 len: 0x0 result: 0
> +  acm.c: acm_control_msg: rq: 0x20 val: 0x0 len: 0x7 result: 7
> +  usb.c: acm driver claimed interface c7b5f3e0
> +  usb.c: acm driver claimed interface c7b5f3f8
> +  usb.c: acm driver claimed interface c7691fa0
> +
> +如果以上都正常，请启动 ``minicom``，
> +把它配置为连接 ``ttyACM`` 设备，然后
> +尝试输入 ``at``。如果返回 ``OK``，说明一切工作正常。
> diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
> index b4cb0ccaa39b..686e5b0a9384 100644
> --- a/Documentation/translations/zh_CN/usb/index.rst
> +++ b/Documentation/translations/zh_CN/usb/index.rst
> @@ -17,10 +17,10 @@ USB 支持
>   .. toctree::
>       :maxdepth: 1
> 
> +    acm
> 
>   Todolist:
> 
> -* acm
>   * authorization
>   * chipidea
>   * dwc3
> --
> 2.54.0
> 


