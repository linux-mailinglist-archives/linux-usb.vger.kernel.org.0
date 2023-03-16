Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902A86BC998
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 09:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjCPIpx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 04:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjCPIpv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 04:45:51 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB875C9D5;
        Thu, 16 Mar 2023 01:45:49 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G8ag0k007160;
        Thu, 16 Mar 2023 09:45:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+VvmrXu/ffvFh3TQJ7KSmvkzPKsp4yTuF1jOM7wniec=;
 b=JSdlal0NCcbDLkw7dfUkNrpQxEAhVQ6p3/G4VXRssSgDWkLIr46kcX9eRn3J8HPZeOs2
 0F1fw3LlEEQH2t99PBVI7iEIV3rUPdO0dJsMpOU5iT9I3xZqgdDw1ZYDfYqdWgqvGi/W
 /U/6YCaCKjytO5ypOX01/8+nXb4M141V9ljH25E1xLfd/icOK6fO05YnNEL/CVwomoH6
 iEv/Dvh7Kgi8XyvT72jKmXYdAmYXo7Ky6XpMXuzahiDSVAvVE3HS7WXJroofek3iH6UJ
 Sg0ceqpON7qS2e+HKVB5lQF6iJMUcxTIY2y8DhNZg8LB5hsCp0ru9BoGXPVziUSHeKqB bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pbpwq2rf2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Mar 2023 09:45:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3F2610002A;
        Thu, 16 Mar 2023 09:45:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8C2E2105A5;
        Thu, 16 Mar 2023 09:45:36 +0100 (CET)
Received: from [10.48.1.102] (10.48.1.102) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 16 Mar
 2023 09:45:35 +0100
Message-ID: <0473d8b1-aa99-2458-7993-4320f1178e5b@foss.st.com>
Date:   Thu, 16 Mar 2023 09:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] usb: dwc2: fix a devres leak in hw_enable upon suspend
 resume
Content-Language: en-US
To:     <hminas@synopsys.com>, <gregkh@linuxfoundation.org>,
        <maz@kernel.org>, <m.szyprowski@samsung.com>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <amelie.delaunay@foss.st.com>, <alexandre.torgue@foss.st.com>
References: <20230315163246.3848102-1-fabrice.gasnier@foss.st.com>
From:   Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20230315163246.3848102-1-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_06,2023-03-15_01,2023-02-09_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/15/23 17:32, Fabrice Gasnier wrote:
> Each time the platform goes to low power, PM suspend / resume routines
> call: __dwc2_lowlevel_hw_enable -> devm_add_action_or_reset().
> This adds a new devres each time.
> This may also happen at runtime, as dwc2_lowlevel_hw_enable() can be
> called from udc_start().
> 
> This can be seen with tracing:
> - echo 1 > /sys/kernel/debug/tracing/events/dev/devres_log/enable
> - go to low power
> - cat /sys/kernel/debug/tracing/trace
> 
> A new "ADD" entry is found upon each low power cycle:
> ... devres_log: 49000000.usb-otg ADD 82a13bba devm_action_release (8 bytes)
> ... devres_log: 49000000.usb-otg ADD 49889daf devm_action_release (8 bytes)
> ...
> 
> A second issue is addressed here:
> - regulator_bulk_enable() is called upon each PM cycle (suspend/resume).
> - regulator_bulk_disable() never gets called.
> 
> So the reference count for these regulators constantly increase, by one
> upon each low power cycle, due to missing regulator_bulk_disable() call
> in __dwc2_lowlevel_hw_disable().
> 
> The original fix that introduced the devm_add_action_or_reset() call,
> fixed an issue during probe, that happens due to other errors in
> dwc2_driver_probe() -> dwc2_core_reset(). Then the probe fails without
> disabling regulators, when dr_mode == USB_DR_MODE_PERIPHERAL.
> 
> Rather fix the error path: disable all the low level hardware in the
> error path, by using the "hsotg->ll_hw_enabled" flag. Checking dr_mode
> has been introduced to avoid a dual call to dwc2_lowlevel_hw_disable().
> "ll_hw_enabled" should achieve the same (and is used currently in the
> remove() routine).
> 
> Fixes: 54c196060510 ("usb: dwc2: Always disable regulators on driver teardown")
> Fixes: 33a06f1300a7 ("usb: dwc2: Fix error path in gadget registration")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---

Hi all,

Please ignore this patch, I just sent a V2 to replace it.

Best Regards,
Fabrice
