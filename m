Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE6586922E7
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 17:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbjBJQD7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 11:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbjBJQD6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 11:03:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6657DB3
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 08:03:57 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A565904;
        Fri, 10 Feb 2023 17:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676045035;
        bh=0cF4hVUpDIHU8UVGwxQIlRFt6gg8iA5hCIp3ZntDaAQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WFo+aPgDix9Dc53+1eyCu+aows/Q5db6B2Qx2COkXa1kcY86lzyyaHgmtzcnloprF
         olkeaU+EZ8JY+yHjCX3D9xXBtWZo4ui0Cihm3GAGNJ4Vzxn7SgTkFL8wfDi1XV/DSp
         BNjZvWLep9Gz8AydNlCT5Zw/1MzDNedWhtEHVuZw=
Message-ID: <28381c7f-ec2b-621e-c441-20795689174f@ideasonboard.com>
Date:   Fri, 10 Feb 2023 16:03:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] usb: gadget: configfs: Fix set but not used variable
 warning
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20230209094359.1549629-1-dan.scally@ideasonboard.com>
 <Y+ZotAmeiaypxSxw@smile.fi.intel.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y+ZotAmeiaypxSxw@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Andy

On 10/02/2023 15:54, Andy Shevchenko wrote:
> On Thu, Feb 09, 2023 at 09:43:59AM +0000, Daniel Scally wrote:
>> Fix a -Wunused-but-set-variable warning in gadget_string_s_store()
> A side comment below.
>
> ...
>
>>   	if (len > USB_MAX_STRING_LEN)
>>   		return -EINVAL;
>>   
>> -	ret = strscpy(string->string, page, size);
>> -	return len;
>> +	return strscpy(string->string, page, size);
> Do you need above check with strscpy()? You may supply the maximum length
> and negative error code from the strscpy() will indicate the cut.
>
It would still copy the truncated string in that case though, correct? 
Seems cleaner to me to just fail and leave the string as-is, but I don't 
particularly mind either way.
