Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5F4E2A76
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 08:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437692AbfJXGdQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 02:33:16 -0400
Received: from cable.insite.cz ([84.242.75.189]:45757 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727750AbfJXGdQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Oct 2019 02:33:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id D09AAA1A40B04;
        Thu, 24 Oct 2019 08:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1571898791; bh=gQ/xEn4pbToz5mF04We/UEV+YjtLQxG+NFCq9gnkQh4=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=e+amU0Mypm60aHqQfi1AaF9f5C7NPe0yvISwa/4KQU+ZZm9/pCrT24w7mC2pZcQkR
         jRaORt3JE4NWEwHP2bbQ1ML0tD+S+1/9I5YnHdQrmpGW9eElwBxVPLk/Zx7+qTup/f
         VAIcgnPgzQymYLVcCzzHGoJq+Dv4bBfTTNrqYjZ8=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TsOkM0FXex11; Thu, 24 Oct 2019 08:33:11 +0200 (CEST)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id A7B68A1A40B01;
        Thu, 24 Oct 2019 08:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1571898791; bh=gQ/xEn4pbToz5mF04We/UEV+YjtLQxG+NFCq9gnkQh4=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=e+amU0Mypm60aHqQfi1AaF9f5C7NPe0yvISwa/4KQU+ZZm9/pCrT24w7mC2pZcQkR
         jRaORt3JE4NWEwHP2bbQ1ML0tD+S+1/9I5YnHdQrmpGW9eElwBxVPLk/Zx7+qTup/f
         VAIcgnPgzQymYLVcCzzHGoJq+Dv4bBfTTNrqYjZ8=
Subject: Re: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
References: <3496ebef-c3b6-d884-8bd8-fed48e875b10@ivitera.com>
 <52dc70dc-86e4-c47a-ae49-1f201b066b2e@ivitera.com>
 <97fed6c8-e780-021f-4f93-64701a14bc3f@synopsys.com>
 <60def6a9-89f3-d7b9-4bc1-2f1a7a5ce769@synopsys.com>
 <deb8918a-14f5-ca3f-53d5-0d99d406fc3c@ivitera.com>
Message-ID: <79aba6ae-befe-878e-cc17-e1fde9ac6a80@ivitera.com>
Date:   Thu, 24 Oct 2019 08:33:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <deb8918a-14f5-ca3f-53d5-0d99d406fc3c@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,

Dne 13. 10. 19 v 20:39 Pavel Hofman napsal(a):
> Hi Minas
> Dne 11. 10. 19 v 9:45 Minas Harutyunyan napsal(a):
>> Hi Pavel,
>>
>>>
>> Could you please send regdump and debug log for failing case.
>>
> 
> Thanks a lot for your reply.
> 
> Attaching regdump-960bytes.txt for 32kHz/16b/15ch both playback and 
> capture,  bInterval=4 in 


I do not know if the debug info was sufficient. Please should I provide 
more?

Thanks a lot.

Best regards,

Pavel.
