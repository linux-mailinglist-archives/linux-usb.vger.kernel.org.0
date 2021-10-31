Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2EE440DB6
	for <lists+linux-usb@lfdr.de>; Sun, 31 Oct 2021 10:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhJaJ7a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 Oct 2021 05:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhJaJ7a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 31 Oct 2021 05:59:30 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37700C061570;
        Sun, 31 Oct 2021 02:56:57 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 969BD8119C;
        Sun, 31 Oct 2021 10:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1635674215;
        bh=7AYbWGTGcCNOgK5bfSPIOgJQ5VoaoHBTv0b+B2mNrcQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Xo92MBscHd8bMFnCMMN1IaOUBFE3f+MKKekTR7XxAOjQtLolN2MWtaMyKJtfn4FSY
         GQu6bBr0+2vC7E0HAnvXQA95/9R+o1zHk8mlw2JbHBMMJG/2UsUYxLRXgFRIHYsGl+
         aEyzb1y9c6FY7GdttCyAP8sduhKTKNhnzxoZ4wtfDWfvA6tzb4EwZYTIYwInubLcqL
         HT/7nVbxe6okxFmhusdmhdmoTPCbIlVK/0wE4DtU3752cfMDs5NvbZEzZMWZd/Rodm
         syXFMYOLL0Zp6PeiUJl/I22KRchROFtqDbsBYdeRqPy+Vbuz53yGxOXrON3iiNpwph
         GoXN0P1kKJw2w==
Subject: Re: [PATCH] dt-bindings: usb: dwc2: Add otg-rev property
 documentation
To:     Rob Herring <robh@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>
References: <20211024003652.227772-1-marex@denx.de>
 <YXtXwhXcGOqj8Pv8@robh.at.kernel.org>
From:   Marek Vasut <marex@denx.de>
Message-ID: <90d58857-8f71-fb47-66fa-d54cffab779f@denx.de>
Date:   Sun, 31 Oct 2021 10:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXtXwhXcGOqj8Pv8@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/29/21 4:09 AM, Rob Herring wrote:
> On Sun, Oct 24, 2021 at 02:36:52AM +0200, Marek Vasut wrote:
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
> Yes, usb-drd.yaml IIRC

Right, drop this patch, since the patchset from Fabrice is better and 
does exactly what I was wondering about in the NOTE.
