Return-Path: <linux-usb+bounces-3871-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786D808E1A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 18:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5FEBB21237
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 17:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273A5481CD;
	Thu,  7 Dec 2023 17:02:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E8410EB;
	Thu,  7 Dec 2023 09:02:18 -0800 (PST)
Received: from [192.168.1.104] (31.173.84.200) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 7 Dec
 2023 20:02:08 +0300
Subject: Re: [PATCH v2] dt-bindings: usb: nxp,ptn5110: Fix typo in the title
To: Fabio Estevam <festevam@gmail.com>, <gregkh@linuxfoundation.org>
CC: <jun.li@nxp.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>, Fabio Estevam
	<festevam@denx.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231207163426.2651126-1-festevam@gmail.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <11a53ffd-3bc1-cf27-ff01-b9502195f03e@omp.ru>
Date: Thu, 7 Dec 2023 20:02:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231207163426.2651126-1-festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 12/07/2023 16:34:44
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181948 [Dec 07 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 6 0.3.6 62f5a4619c57459c9a142aa1486ed27913162963
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.84.200 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	devicetree.org:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.84.200
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/07/2023 16:40:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 12/7/2023 3:22:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 12/7/23 7:34 PM, Fabio Estevam wrote:

> From: Fabio Estevam <festevam@denx.de>
> 
> Fix the misspelled "Controller" word.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes since v1:
> - Use a single line in the commit log. (Krzysztof)
> 
>  Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> index 28eb25ecba74..f154fae290a4 100644
> --- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> +++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/usb/nxp,ptn5110.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NXP PTN5110 Typec Port Cotroller
> +title: NXP PTN5110 Typec Port Controller

   Perhaps it's worth fixing Typec to Type C?

[...]

MBR, Sergey

