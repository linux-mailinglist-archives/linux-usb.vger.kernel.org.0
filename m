Return-Path: <linux-usb+bounces-37566-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNBnIhGdCmr84AQAu9opvQ
	(envelope-from <linux-usb+bounces-37566-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:01:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BAE565D30
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D85BE301A1FA
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 05:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBCB385D60;
	Mon, 18 May 2026 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWdOWxzJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668463101D8
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 05:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080457; cv=none; b=q1K1tktqB9iFWxCiy0mpGzqw1QUeE5VnYeG2PQfRAvJ4ETIPpKgQ9y8mykfkah+gtxn8QX/6poqsUOhZYlcEIWIUjL/M8iBaxmbxzeNVkn04/y3ik/Ebj34ddDDJbycxxCvO8fhCN68n7/JZDrF5+Lffp99/6+gBD4v9xElFaNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080457; c=relaxed/simple;
	bh=j5L8abn7trrRnFjiGjawwxdkH3HWpmk2/h8C+GT+bEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5r0kP98YnXsIxpb32VOQx6T16AUTpEukLwmSO/rWC9TctZNLGMC2dS0Zb7ZotzPMzeqcy1UX+PpgRdBIsxsx1TThvod3Hv7hNHNEWJCvJmW02k9ACLZSdHq4rq1B4lCdHpeZPxU3W8cNi4ACoHvfRkuXsNMS6F1xbG+gl5OVQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWdOWxzJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3691a0a4e1aso129468a91.3
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 22:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080456; x=1779685256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1idOwy53kR7o+gaXCnXuC8j6usF8duhi1khMI+JkZeo=;
        b=HWdOWxzJFabaIewK5kGWuVa0HCY6IwEgL4Fo1Cq5baV38SKg5nKxVkpfFja/3BjJFU
         X34SOozns2h4+RyFElMPjjHOlCgXAi25ZY0ilp69Qkx/bh3bV+t4DHlBOyFjpXDyWG2G
         W624EzB6frV7JXUBlJYC3wsruzqezNHDNrInS/J3GOyK/EZ+CHbOCkDDoitYyYgAoASu
         JY781amg7rtpsq9RDIgqu9X2hcU2kf6Cr+Rgke63bBeNza08RQdrR1g/Mq4JCvi2tiZk
         lUwvt5FPEkMP8so966tRpFPy4CQ/grc0BCIr8efNB4UlGOClROIU8QVQt9nAxg/R+yOs
         ywww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080456; x=1779685256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1idOwy53kR7o+gaXCnXuC8j6usF8duhi1khMI+JkZeo=;
        b=kjD4o1Ib9DN87b9mOuzFcZlQADe9UrkuptnOIDxAkDvX69UhbIVyYteurYaYo6JoZq
         rAjA/P1eTxKy5Civ1GN3gBKo/iGc5epL8Jmj5O0WW8tc6kLRsvuuwpaYZ+k2IAcl0ON5
         bxGucIZxVFNzKnweZkOdZsvBavxvgW7Otwek0CHAlSoLJZ/ulTC4GBrFDpl5TVyeS9Ym
         cELIFcI0ib4JP92P2WZlqKSmlTOiDE5KpnuvDVpxvLh74fCfwAqTKmhnoK1mRDLlbz9a
         bSRZWV/dssvR+vqfP4g+mpNxGufX6JbMRH2wlNV22Nsj7VaUekLZa5Epk1BuRN/2MCNB
         Bi+Q==
X-Gm-Message-State: AOJu0YzP/1/jaFatKFTtS1XTH7wqLN5wzk5VBOshK3yPFQQB/0AH5jLE
	Ebql6CLhpcFRFxMBMgIDNU7r1e6dl+eaPCxg4YXvZyDfjWkGRdF8ixFiSj5mvJpG4zo=
X-Gm-Gg: Acq92OHVilHocEsy+WU98r4R8L9804SVPrnDQG6ceJCJ4Wq+jyDq+rwbf5+nBR04Qe0
	ESLLRmeaJlWBSywnAP4OzJ8YZzEjBWyPZ/Tix3vUz+DQV076MBh3lw6vW8vl9glOOOiNwub9rvr
	zTBiUr3/G3kR4qxLMcDWW2mBHdKgwiCnjzONO/F+Hzc7shpwFdvhfyWnVuTmIWkbEWGcC58IZU8
	RxQggp8MJ8wwMYTb62NHfp8uO45sOSGyLlcgD/1bVNeb+RUt0PPk68iMwpdBZtVAQWhg+iG4dG6
	Cc1aeJn84WMoPtF1KXrDQxbooqnWHaPocXKJaDLxnKevi3zx+97peGyA8hvHzq9XeD8l+U1IjPD
	XWGz+c3ShvG26uBrAnzuV3yiYxv0vrhlT+SPhx+LwO6DTJgAx4sX+NdsY7FQaQFtDq32iK3clvy
	fM65WtGq+2boGnFn396jtUSObPxutNqJpm3Q==
X-Received: by 2002:a17:90b:4d0d:b0:368:44d:bbac with SMTP id 98e67ed59e1d1-36951ca93d8mr7318737a91.6.1779080455621;
        Sun, 17 May 2026 22:00:55 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.167.244])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-369517d8570sm9954272a91.14.2026.05.17.22.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 22:00:55 -0700 (PDT)
Message-ID: <42f37513-2686-41a9-ba88-c9bdf67d131a@gmail.com>
Date: Mon, 18 May 2026 12:00:51 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: qcserial: add new usb-id for Dell
 Wireless DW5826e-m
To: Jack Wu <jackbb_wu@compal.com>, Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518015418.327252-1-jackbb_wu@compal.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260518015418.327252-1-jackbb_wu@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E0BAE565D30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37566-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larsm17@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,compal.com:email]
X-Rspamd-Action: no action

On 2026-05-18 08:54, Jack Wu wrote:
> Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea & 0x413c:0x81eb.
> 
> It is 0x413c:0x81ea
> T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=110 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=413c ProdID=81ea Rev= 5.04
> S:  Manufacturer=DELL
> S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
> S:  SerialNumber=358988870177734
> C:* #Ifs= 7 Cfg#= 1 Atr=a0 MxPwr=500mA
> A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=qcserial
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=qcserial
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=qcserial
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> It is 0x413c:0x81eb
> T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=109 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=413c ProdID=81eb Rev= 0.00
> S:  Manufacturer=DELL
> S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
> S:  SerialNumber=358988870177734
> C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=qcserial
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
> v2:
>    -sorted by PID and add the newline separator before the Huawei devices.
> ---
> ---
>   drivers/usb/serial/qcserial.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
> index 1a930dc668e4..bb1647a17066 100644
> --- a/drivers/usb/serial/qcserial.c
> +++ b/drivers/usb/serial/qcserial.c
> @@ -186,9 +186,11 @@ static const struct usb_device_id id_table[] = {
>          {DEVICE_SWI(0x413c, 0x81d0)},   /* Dell Wireless 5819 */
>          {DEVICE_SWI(0x413c, 0x81d1)},   /* Dell Wireless 5818 */
>          {DEVICE_SWI(0x413c, 0x81d2)},   /* Dell Wireless 5818 */
> +       {DEVICE_SWI(0x413c, 0x81ea)},   /* Dell Wireless DW5826e-m */
> +       {DEVICE_SWI(0x413c, 0x81eb)},   /* Dell Wireless DW5826e-m QDL */
>          {DEVICE_SWI(0x413c, 0x8217)},   /* Dell Wireless DW5826e */
>          {DEVICE_SWI(0x413c, 0x8218)},   /* Dell Wireless DW5826e QDL */
> -
> +
>          /* Huawei devices */
>          {DEVICE_HWI(0x03f0, 0x581d)},   /* HP lt4112 LTE/HSPA+ Gobi 4G Modem (Huawei me906e) */
> 
> --
> 2.34.1
> 
> 
> 
> ================================================================================================================================================================
> This message may contain information which is private, privileged or confidential of Compal Electronics, Inc. If you are not the intended recipient of this message, please notify the sender and destroy/delete the message. Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon this information, by persons or entities other than the intended recipient is prohibited.
> ================================================================================================================================================================
> 
Hi Jack,
DEVICE_SWI is intended for non-GOBI Sierra Wireless devices or DELL 
branded version of them which the DW5934e isn't.
A DEVICE_SWI interface layout has a QMI/RMNET function in interface #8 
which the DW5934e hasn't.
So the DW5934e does not belong in qcserial, it should instead be added 
in the serial option driver.

thanks
Lars

