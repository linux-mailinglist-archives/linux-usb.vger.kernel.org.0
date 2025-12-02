Return-Path: <linux-usb+bounces-31091-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA227C9A1B8
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 06:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D87864E27A9
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 05:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001A32F6592;
	Tue,  2 Dec 2025 05:40:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.fintek.com.tw (mail.fintek.com.tw [59.120.186.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAA245019;
	Tue,  2 Dec 2025 05:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=59.120.186.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764654059; cv=none; b=RGeUYNPwDn/vka10IA1pmMOrrnHHgN9zc4T0glDVulFVCt2PGlxYbQA36OO/+oGq3vC6WeRNDxn2aGCC9btZujLI1g52CttEg7NUJIXjS4QhvgBF7f+OyeSbikhGVYoqDIHwzymH9thslTm/y8pCq5IbdIN08VpPMl2ejS9hrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764654059; c=relaxed/simple;
	bh=GZLvM4R8kxzMH90T8bEgGawH6lBDh4Kuihe+Kb1Ugek=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kMKZk4MAHmQ8yoM9dTM0xsD7C98kT5odk0ZmYseZL6YuPou+c7OWwKlRbD0sugpNDsj7nh8XmPn6TS3oCO7IdGWMaoA8Xdlt/K7h9DFsluj7jQ05YH6GzzP8Rko4JJeCNxtl76Gl2/E9SyxuMjeCRWQ7YDrlHFixJhX8dnhJjcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintek.com.tw; spf=pass smtp.mailfrom=fintek.com.tw; arc=none smtp.client-ip=59.120.186.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintek.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintek.com.tw
Received: from ag.fintek.com.tw ([192.168.1.45])
	by mail.fintek.com.tw with ESMTP id 5B25eTRH046517;
	Tue, 2 Dec 2025 13:40:29 +0800 (+08)
	(envelope-from peter_hong@fintek.com.tw)
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5B25eTnjD2548612, This message is accepted by code: ctloc85258
Received: from vmMailSRV.fintek.com.tw ([192.168.1.1])
	by ag.fintek.com.tw (8.15.2/3.20/5.94) with ESMTPS id 5B25eTnjD2548612
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Dec 2025 13:40:29 +0800
Received: from [192.168.1.132] (192.168.1.132) by vmMailSRV.fintek.com.tw
 (192.168.1.1) with Microsoft SMTP Server id 14.3.498.0; Tue, 2 Dec 2025
 13:40:28 +0800
Message-ID: <fd3e97cf-6f92-4921-9482-e0d6863a46b2@fintek.com.tw>
Date: Tue, 2 Dec 2025 13:40:28 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/1] USB: serial: f81232: fix incomplete serial port
 generation
To: Johan Hovold <johan@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tom_tsai@fintek.com.tw>,
        <yu_chen@fintek.com.tw>
References: <20251128085244.14044-1-peter_hong@fintek.com.tw>
 <aS2aQF_6ljhFtLI_@hovoldconsulting.com>
Content-Language: en-US
From: Peter Hong <peter_hong@fintek.com.tw>
In-Reply-To: <aS2aQF_6ljhFtLI_@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-12.5.0.2055-9.0.1002-27556.001
X-TM-AS-Result: No-12.524900-8.000000-10
X-TMASE-MatchedRID: QW5G6BKkLTooYl6g7FoK+XUVR7WQKpLPC/ExpXrHizw0tugJQ9Wdw4Vw
	K/oeBn0wRT8GbcQMlnqRoepQgi+s8tTgNUieJDkRqdwbW9Wx9tCUq+GQ/zyJdIDpStszePepA9c
	nPM9LcuINDE+yvVUhXYhMTcdVKb+F0tgpF36C0l6G/X7YnfJAXEWGJun24Wb1sMZG2pUzAfNCiT
	724Nfkx9VGHSNUjihq8GTivvI1UrZFaODtl6PR3Wob+ut/AloW/PIJ2UtmA9N3Y7kpVKWrn6Bmi
	WqJMLjH585VzGMOFzA870o9QRfzO1Z0V5tYhzdWxEHRux+uk8h+ICquNi0WJPS+MgtpViA0iU+l
	ejmsHGpR1hezafVFE7yCv49CWRJRftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.524900-8.000000
X-TMASE-Version: SMEX-12.5.0.2055-9.0.1002-27556.001
X-TM-SNTS-SMTP:
 9B41D0DC0F24F5F56A0D7AC3497FB6CA2D4800A053C8913D17AB121A440551CF2000:8
X-DKIM-Results: [192.168.1.45]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:mail.fintek.com.tw 5B25eTRH046517

Hi,

Johan Hovold 於 2025/12/1 下午 09:38 寫道:
> On Fri, Nov 28, 2025 at 04:52:44PM +0800, Ji-Ze Hong (Peter Hong) wrote:
>> The Fintek F81532A/534A/535/536 family relies on the
>> F81534A_CTRL_CMD_ENABLE_PORT (116h) register during initialization to
>> both determine serial port status and control port creation. If the
>> driver experiences fast load/unload cycles, the device state may becomes
>> unstable, resulting in the incomplete generation of serial ports.
>>
>> Performing a dummy read operation on the register prior to the initial
>> write command resolves the issue. This clears the device's stale internal
>> state. Subsequent write operations will correctly generate all serial
>> ports.
>>
>> Tested on: HygonDM1SLT(Hygon C86 3250 8-core Processor)
>>
>> Signed-off-by: Ji-Ze Hong (Peter Hong) <peter_hong@fintek.com.tw>
>> ---
>> Changelog:
>> v2:
>> 	1. remove loop in accessor function.
> Thanks for verifying.
>
> Did you try removing the retry loop also in the set_register() helper?
> Perhaps that's no longer needed after the dummy read.

I will try removing the retry loop in set_register() helper.
If that worked, could I use the same patch file or series of patches?

Thanks,


-- 

*洪繼澤 **Peter Hong*

精拓科技股份有限公司

Feature Integration Technology

Address: 302新竹縣竹北市台元二街10號7樓

TEL: 03-5600168 #813

FAX: 03-5600166

E-Mail﹕peter_hong@fintek.com.tw





