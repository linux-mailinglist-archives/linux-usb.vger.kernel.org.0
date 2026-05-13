Return-Path: <linux-usb+bounces-37390-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAQpAAeVBGqrLgIAu9opvQ
	(envelope-from <linux-usb+bounces-37390-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 17:13:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CF5535D71
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 17:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EAF0310027A
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3400B477990;
	Wed, 13 May 2026 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKhuGsS4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16955310645
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684624; cv=none; b=CukyFVbv9bp6VTHBaKEowhVhe+8Ssj+9ZpA3QGlJ2t9AchhFIyZQZzJaXoPtp6UCOQc3Z524ZoTqTi+3oG6caXlS99ezFYJrRuZfTB6+lIsl7m9u5Xh2UL3fgrFVhbx9+ptyuvwLZO9w+5JbD+M6K5FLO/cPlcTcT6bVOtjC8Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684624; c=relaxed/simple;
	bh=7X+UObE12Sn+4xoSEm9MUagPY4OTrNYE+EcPWjiNXUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMpykCQldgEd0QxulJopb/Hw86gfbC/U2n5sNAWu1M6XVjI9IcofRrtp9RBGOJ1WFQeFcFpRTPElNzn6rx7+YEzldWTN7RX4e9xmkGLfaTHhsjnt3GDUWMekz9wDuTXEHYSovN4AqNHkiMmxLdUKgPogOo8L9BW/kZppyK+gY1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKhuGsS4; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bcff2d08ca8so532004766b.3
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 08:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778684621; x=1779289421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vVht3nvRKg7Tx3cTpSoG3suIJkNk3ic/dNcJ5A2+mDw=;
        b=TKhuGsS4sBI167Hqr/kDTUpr0ea9pxoAnG14IOGUeoxvDi1jYhk8bDZRHYHbH/PIr7
         Fuk1h118vGYIwxTRQOxFKx2G3Wn3ES9SZapOJzN48OJ/dGE9dkNDezseN+5eViUI0q8z
         WmATYOv3yP2GcUEJ+kOKvwcmenmLg2uvPcHkBl7duaHuO8mTOPLtmI1YUcseyF3rhFka
         15xg3Kt/dyKo9M49HEUsMAqtW6VmLaO9+A0zQ/szZIbMSNu9H/Pjtwr7kFgAYKlqPydz
         cGDhFVsjq0JufCajYI3Q9olNb7wyn8MfyKcK+/CHqlQyN4Hskg4umBmsys0Wg2pcSBwe
         tIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684621; x=1779289421;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVht3nvRKg7Tx3cTpSoG3suIJkNk3ic/dNcJ5A2+mDw=;
        b=QvPB4/mNBtham2VfMCDV0dhRfPIiBgYgQwfHFC/hm5Vil5MsBS6q2jGm+TNmIAiwdF
         osBGdV4R6gSFv7xPRtnTsyKAIKUc4ihzoyYN7kRaiGfv/tpaAYcXYRm7h8TYuwIvRCN+
         yMZ0RNhvy7kJ+ZQGQ4SgC7KQzaLT/e/Yiq4GfSuHqsJYKKh6nYYihWswIACqnBOWrsOz
         O+MBVOTGZK2pQ5j0UavdKAPeuASbO5/bQeIQzYRf7RKQT1MMThtex8ec2hpvljRCeovw
         wJDz3LE3/Sm5WdhFDA4xVTe3hP6M3DbQIbcdcpkerJbZcfj28Xy4MflDVXuITiGA74Lm
         Uqdg==
X-Forwarded-Encrypted: i=1; AFNElJ/6XrFVjWr1MuBcH+a52F24OEgEuk5IltO3BMkROutq32Jow3nxbWOVJZBZNz+zJacidTP2LJ5pGxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztwa/xOycHY5yJRkf1mgqEW61CzdNgSMPfP3UmGvCsVrf8lhoI
	h13cdR6COBYmW14AR4beIxJa5Sx9S7yhFk2Qs7ePfTaRfRz7ec1ea2Ea
X-Gm-Gg: Acq92OFObmzJDReu+ovKilfnzE3/82A16GuqZdZltNgOyHQUFeorIO00ctzTnvcegSX
	h0LvJjLuJ7gojkBzq4Y2K0+RiSsrRkFrGraFaQkDLA0R3LxNmiQ5jDfZYxLL/yt5wpkIj+xs99p
	ff4xkNoY26dGJupI3PldaWwwSA08BNCyFpjQHLu188bleDDLcRVdUzXFe4ZG2hJ8Q2AuLgFurYh
	Fb8lMo1+ioh+JWl0UIJsK/mCQ0MO1M/Z+GXqkMPg/ZbrG7Ed2dyaqfbg8UTVRgJqA8xspxiQlbr
	MBlVy6bK42iHujDFeCueF5b6q3A1KGeTelFek6qSZ2WBPBgSPPtlNdoXrRVX9kdbm+3qVXyiBk7
	C7i9H3F6phptzQGF76U3dvc0Gng/ZDkO6NOijxMsezn0NkjUQS4syAXYfPDaD4BWKV00mij00S7
	WP/MdTvqj2kET2WyHAh//DcQ==
X-Received: by 2002:a17:907:746:b0:ba8:8094:f7af with SMTP id a640c23a62f3a-bd3e0c3415amr226191666b.18.1778684620998;
        Wed, 13 May 2026 08:03:40 -0700 (PDT)
Received: from [10.51.4.117] ([149.11.192.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm832636466b.28.2026.05.13.08.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:03:40 -0700 (PDT)
Message-ID: <bf468ab5-2f62-408c-889f-2f99a599d190@gmail.com>
Date: Wed, 13 May 2026 17:03:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] docs/zh_CN: Add acm.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, linux-usb@vger.kernel.org,
 si.yanteng@linux.dev
Cc: gregkh@linuxfoundation.org, alexs@kernel.org, dzm91@hust.edu.cn,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1778415392.git.baikefan@leap-io-kernel.com>
 <0ab199e9eafc0f7e312008063059aec4af0c65bc.1778415392.git.baikefan@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <0ab199e9eafc0f7e312008063059aec4af0c65bc.1778415392.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 65CF5535D71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-37390-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cqsoftware.com.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 2026/5/10 15:53, Kefan Bai wrote:
> Translate .../usb/acm.rst into Chinese
> 
> Update the translation through commit ecefae6db042
> ("docs: usb: rename files to .rst and add them to drivers-api")
> 
> Reviewed-by: Yanteng Si<siyanteng@cqsoftware.com.cn>
> Signed-off-by: Kefan Bai<baikefan@leap-io-kernel.com>
> ---
>   Documentation/translations/zh_CN/usb/acm.rst  | 136 ++++++++++++++++++
>   .../translations/zh_CN/usb/index.rst          |   2 +-
>   2 files changed, 137 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
> 
> diff --git a/Documentation/translations/zh_CN/usb/acm.rst b/Documentation/translations/zh_CN/usb/acm.rst
> new file mode 100644
> index 000000000000..25ec83afd25f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/acm.rst
> @@ -0,0 +1,136 @@
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
> +=======================
> +Linux ACM 驱动 v0.16
> +=======================
> +
> +版权所有 (c) 1999 Vojtech Pavlik<vojtech@suse.cz>
> +
> +由 SuSE 赞助
> +
> +0. 免责声明
> +~~~~~~~~~~~~~
> +本程序是自由软件；你可以在自由软件基金会发布的 GNU 通用公共许可证第 2 版，
> +或者（按你的选择）任何后续版本的条款下重新发布和/或修改它。
> +
> +发布本程序是希望它能发挥作用，但它不附带任何担保；甚至不包括对适销性
> +或特定用途适用性的默示担保。详情见 GNU 通用公共许可证。
> +
Hi Kefan,

Please align the lines above to make them look a bit cleaner. They don't 
need to be aligned perfectly, but the current formatting could be 
improved. Please apply this same standard to all patches.

Thanks
Alex

> +你应该已经随本程序收到了 GNU 通用公共许可证的副本；
> +如果没有，请致信：Free Software Foundation, Inc., 59
> +Temple Place, Suite 330, Boston, MA 02111-1307 USA。
> +
> +如需联系作者，可发送电子邮件至vojtech@suse.cz，
> +或邮寄至：
> +Vojtech Pavlik, Ucitelska 1576, Prague 8, 182 00, Czech Republic。
> +
> +为方便起见，软件包中已附带 GNU 通用公共许可证第 2 版：见 COPYING 文件。
> +
> +1. 使用方法
> +~~~~~~~~~~~~~
> +``drivers/usb/class/cdc-acm.c`` 驱动可用于符合 USB 通信设备类抽象控制模型
> +（USB CDC ACM）规范的 USB 调制解调器和 USB ISDN 终端适配器。
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
> +一些手机也可以通过 USB 连接。我知道以下机型可以正常工作：
> +
> +	- SonyEricsson K800i
> +
> +遗憾的是，许多调制解调器和大多数 ISDN TA 都使用专有接口，
> +因此无法与此驱动配合工作。购买前请先确认设备是否符合 ACM 规范。
> +
> +要使用这些调制解调器，需要加载以下模块::
> +
> +	usbcore.ko
> +	uhci-hcd.ko ohci-hcd.ko or ehci-hcd.ko
> +	cdc-acm.ko
> +
> +之后就应该可以访问这些调制解调器了。
> +应当可以使用 ``minicom``、``ppp`` 和 ``mgetty`` 与它们通信。
> +
> +2. 验证驱动是否正常工作
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +第一步是检查 ``/sys/kernel/debug/usb/devices``，其内容应该类似如下::
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
> +这三行的存在很关键（以及 ``Cls=`` 字段里出现的 ``comm`` 和 ``data`` 类）；
> +它说明这是一个 ACM 设备。``Driver=acm`` 表示该设备正在使用 acm 驱动。
> +如果只看到 ``Cls=ff(vend.)``，那就无能为力了：这说明你手上的设备使用的是
> +厂商专有接口::
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
> +如果以上都正常，请启动 ``minicom``，把它配置为连接 ``ttyACM`` 设备，
> +然后尝试输入 ``at``。如果返回 ``OK``，说明一切工作正常。
> diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
> index 7cfe99a4dc0a..449e8ac2dff0 100644
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


