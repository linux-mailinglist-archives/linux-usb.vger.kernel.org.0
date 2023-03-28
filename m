Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D28E6CC8E6
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 19:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjC1RNM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 13:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjC1RNK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 13:13:10 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4998E
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 10:12:59 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r11so12972977wrr.12
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680023578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVZiv5jycZEvQGqqHDvQbF/JFYTQ3FOT6YJ9tE/AK78=;
        b=TsJE6tA+xfouGdneoyPCqo4zs8rYlVFfuW0RnWwASUgESXXloS4EDB64/fYgjJNSji
         hwdb1CSXwqia6y/x7UVYHwxP9l0TS26qbHzrvBwVLLrP9ie/wqveRKU96CMeWmig/Ejv
         45FppuwgRQys5RM/S+BMqEgk+Q/bKule89MBYL7wnZl1GTk28sbgJivxARo9yLk4Qtr6
         nz0HUZ4QxIWxY4ANFvJK7uITY6asKx8OA6/3G+yegmt75BjJkxpQb2XvD8zdfWFSZus9
         IUkvzdb26HQRoJ8O4i+4qnIDRQcsI7CvEK5uYzvkeS1/icHrNtQPRxin0o+rpnigPZSZ
         QQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680023578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVZiv5jycZEvQGqqHDvQbF/JFYTQ3FOT6YJ9tE/AK78=;
        b=ANLh8FZJB+VPRu0ccV4oLBpeYB+72ZHS+D0ZmxqahbgCJqFQWeERkP3mrDux6hvZ20
         dMaY8z4O6y/wihS91Se49tRdwhqb9PUsxpBL5mYFv2GNehqZWYXXD9ARWTXLJ3zq9+lB
         GcF++bm19+zvqi1/8hU1LEZsylQx7SKgVPiUKlXkZtcKwah2TsSW0ix5/jgCNHZsEjxE
         4fZKzS1DnZwYbfr283/ml61N7Lv19OVxkGzAXj/udjH9QplB2KbhyJvDPSaYAFGPNVeX
         J0fwIp+KnbfDQf+hWQzqJ9stdi+ifVM6Nfb49O+JLRRtOsExVWwgLKg3QP8Qr0H3jbOt
         f69A==
X-Gm-Message-State: AAQBX9ccK/Np/W97AXqOw8PZovhl0FCaAg1cjl1w9//Djph/tPiBjQ3L
        EdHekgfvxF1LdQ5l1QXM6PgE9w==
X-Google-Smtp-Source: AKy350aPdNxL0GbCuGHKVW9Sb9laN0Fvp4DG8QwyuvpBwZoDSS7RAOEpF1f4THMUr+Y+20cKTfy7zw==
X-Received: by 2002:adf:e3cd:0:b0:2c6:e827:21c1 with SMTP id k13-20020adfe3cd000000b002c6e82721c1mr12052394wrm.50.1680023577932;
        Tue, 28 Mar 2023 10:12:57 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020adfce05000000b002d64fcb362dsm22839959wrn.111.2023.03.28.10.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 10:12:57 -0700 (PDT)
Message-ID: <c6a2001d-ebc5-79c9-edbd-83a17b1c9f47@linaro.org>
Date:   Tue, 28 Mar 2023 18:12:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] usb: typec: tcpm: try to get role switch from tcpc fwnode
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Li Jun <jun.li@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, xu.yang_2@nxp.com
References: <1679991784-25500-1-git-send-email-jun.li@nxp.com>
 <ZCL1pULmTtMOpaKB@kuha.fi.intel.com>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZCL1pULmTtMOpaKB@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/03/2023 15:11, Heikki Krogerus wrote:
> +Bryan
> 
> On Tue, Mar 28, 2023 at 04:23:04PM +0800, Li Jun wrote:
>> Try to get usb role switch from tcpc fwnode if failed to
>> get role switch from port dev, this is for case the port
>> for role switch endpoint is located in connector node,
>> as per connector binding doc, port@0 for HS is required.
>>
>> ptn5110: tcpc@50 {
>> 	compatible = "nxp,ptn5110";
>> 	...
>> 	status = "okay";
>>
>> 	connector {
>> 		compatible = "usb-c-connector";
>> 		label = "USB-C";
>> 		...
>>
>> 		ports {
>> 			#address-cells = <1>;
>> 			#size-cells = <0>;
>>
>> 			port@0 {
>> 				reg = <0>;
>>
>> 				typec_conn: endpoint {
>> 					remote-endpoint = <&usb2_controller>;
>> 				};
>> 			};
>> 		};
>> 	};
>> };
>>
>> Signed-off-by: Li Jun <jun.li@nxp.com>
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index a0d943d78580..f0534bdb4462 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -6557,6 +6557,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>>   	port->port_type = port->typec_caps.type;
>>   
>>   	port->role_sw = usb_role_switch_get(port->dev);
>> +	if (!port->role_sw)
>> +		port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
>>   	if (IS_ERR(port->role_sw)) {
>>   		err = PTR_ERR(port->role_sw);
>>   		goto out_destroy_wq;
> 
> This looks like exactly the same as the RFC from Bryan that I just
> commented. I have not objections if this looks okay to you Brian. I
> think we should still wait for comments also from Guenter.
> 
> thanks,
> 

It does look exactly the same. I don't mind letting Li have the commit.

---
bod
