Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E1743919B
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 10:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbhJYInr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 04:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbhJYInq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 04:43:46 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96501C061745;
        Mon, 25 Oct 2021 01:41:24 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DD8BF82C88;
        Mon, 25 Oct 2021 10:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1635151281;
        bh=NpcncVu31JgIbIz/TvruPd31ur26WrTp/F6oXQfjbOc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gLCsdDYdb+1g4OO+6BwrauGPWy3Zpjvi9+aQ398kcyymBp1hVsfgVPZuQbzxI7kPb
         BamXSI38A5Q/beRGj9a0uZJQlKZACFjKrDKysGz5qLKuTVKMd7so/l+UWJswTg8EMC
         XcFHcF1N9RvpAfnnaG+Mb0MbNNG5NKmIlvwUuZAfHSpOCUxLstd1SihSHTcgOsgN2q
         0yI+BmmQcBjFVpCNUu3eam6S1318L6nHFOQ1DteTAUe19cJ/a7S6iDRgaudcOzMxKo
         UfWyRFpsXS3pyjkPbZJqbGh52m7VPbwrt26yiCCc0Z6NlLhTW8k+VY7Rb7AI8pKwd+
         O8F9fnSvOEDoQ==
Subject: Re: [PATCH] dt-bindings: usb: dwc2: Add otg-rev property
 documentation
To:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20211024003652.227772-1-marex@denx.de>
 <d3169061-e131-8dd9-5796-b82b9800cef1@foss.st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <ec71a312-daf6-d949-25af-e271c075616f@denx.de>
Date:   Mon, 25 Oct 2021 10:41:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d3169061-e131-8dd9-5796-b82b9800cef1@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/25/21 9:20 AM, Fabrice Gasnier wrote:
> On 10/24/21 2:36 AM, Marek Vasut wrote:
>> Copy the otg-rev property documentation from usb-drd.yaml into the DWC2
>> binding document, since some users of the DWC2 IP like STM32MP1 use the
>> otg-rev property in DT bindings for this controller.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> NOTE: Shouldn't this somehow be part of the USB core bindings instead?
> 
> Hi Marek,
> 
> Yes, this is similar to patch series I sent recently, see [1].
> 
> [1]
> https://lore.kernel.org/linux-usb/1634133425-25670-1-git-send-email-fabrice.gasnier@foss.st.com/

That looks good, thanks.
