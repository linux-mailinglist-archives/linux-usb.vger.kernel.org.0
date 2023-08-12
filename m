Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6824779EAC
	for <lists+linux-usb@lfdr.de>; Sat, 12 Aug 2023 11:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236547AbjHLJrs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Aug 2023 05:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHLJrr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Aug 2023 05:47:47 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CA71733;
        Sat, 12 Aug 2023 02:47:49 -0700 (PDT)
Received: from [192.168.1.103] (178.176.75.155) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 12 Aug
 2023 12:47:43 +0300
Subject: Re: [PATCH 4/4] usb: typec: intel_pmc_mux: Configure Displayport
 Alternate mode 2.1
To:     Utkarsh Patel <utkarsh.h.patel@intel.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <heikki.krogerus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <pmalani@chromium.org>,
        <bleung@chromium.org>
References: <20230811210735.159529-1-utkarsh.h.patel@intel.com>
 <20230811210735.159529-5-utkarsh.h.patel@intel.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <e9d83459-623e-34e1-ce9d-eb0b83ea170f@omp.ru>
Date:   Sat, 12 Aug 2023 12:47:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230811210735.159529-5-utkarsh.h.patel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.75.155]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 08/12/2023 09:33:56
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 179211 [Aug 11 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.155 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.155 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;178.176.75.155:7.7.3,7.4.1,7.7.2,7.1.2
X-KSE-AntiSpam-Info: {iprep_blacklist}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.155
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/12/2023 09:38:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 8/12/2023 7:23:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 8/12/23 12:07 AM, Utkarsh Patel wrote:

> Mux agent driver can configure cable details such as cable type and
> cable speed received as a part of displayport configuration to support
> Displayport Alternate mode 2.1.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

   Hm, I think the R-b tags should follow your signoff...

> Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
> ---
>  drivers/usb/typec/mux/intel_pmc_mux.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 888632847a74..218f6e25518d 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
[...]
> @@ -282,6 +288,24 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
>  	req.mode_data |= (state->mode - TYPEC_STATE_MODAL) <<
>  			 PMC_USB_ALTMODE_DP_MODE_SHIFT;
>  
> +	if (!is_pmc_mux_tbt(port->pmc->iom_adev)) {
> +		u8 cable_speed = (data->conf & DP_CONF_SIGNALLING_MASK) >>
> +				  DP_CONF_SIGNALLING_SHIFT;
> +
> +		u8 cable_type = (data->conf & DP_CONF_CABLE_TYPE_MASK) >>
> +				 DP_CONF_CABLE_TYPE_SHIFT;
> +
> +		req.mode_data |= PMC_USB_ALTMODE_CABLE_SPD(cable_speed);
> +
> +		if (cable_type == DP_CONF_CABLE_TYPE_OPTICAL)
> +			req.mode_data |= PMC_USB_ALTMODE_CABLE_TYPE;
> +		else if (cable_type == DP_CONF_CABLE_TYPE_RE_TIMER)
> +			req.mode_data |= PMC_USB_ALTMODE_ACTIVE_CABLE |
> +					 PMC_USB_ALTMODE_RETIMER_CABLE;
> +		else if (cable_type == DP_CONF_CABLE_TYPE_RE_DRIVER)
> +			req.mode_data |= PMC_USB_ALTMODE_ACTIVE_CABLE;

   The chain of the *if* statements above is asking to use *switch* instead...

[...]

MBR, Sergey
