Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 405F9EFCF2
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 13:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730852AbfKEMKQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 07:10:16 -0500
Received: from cable.insite.cz ([84.242.75.189]:38802 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbfKEMKQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Nov 2019 07:10:16 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id EC3B6A1A40B01;
        Tue,  5 Nov 2019 13:10:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1572955811; bh=Fd+t3RFLK3gg8Tw+8trwWwMm/4k2jeMu5ftL1yTf2L4=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=pHhearld6g7H3znY7djRX7uz0oT6FQU9BLkkmrqpxO7Dd2LZ8lP4314or8AAcG41j
         eyfn80gi5cui+d6O4vrI+Ve2ay4xNJYg2nXvG+/E7VLri1+3yebdaiVL+1pUuiJRaF
         pBjV0TqCo028D7uQG52xEtS1iNq3wEkjhJcadk+M=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2uqTL6pzyoWr; Tue,  5 Nov 2019 13:10:11 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 970FEA1A40B05;
        Tue,  5 Nov 2019 13:10:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1572955811; bh=Fd+t3RFLK3gg8Tw+8trwWwMm/4k2jeMu5ftL1yTf2L4=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=pHhearld6g7H3znY7djRX7uz0oT6FQU9BLkkmrqpxO7Dd2LZ8lP4314or8AAcG41j
         eyfn80gi5cui+d6O4vrI+Ve2ay4xNJYg2nXvG+/E7VLri1+3yebdaiVL+1pUuiJRaF
         pBjV0TqCo028D7uQG52xEtS1iNq3wEkjhJcadk+M=
Subject: Re: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <3496ebef-c3b6-d884-8bd8-fed48e875b10@ivitera.com>
 <52dc70dc-86e4-c47a-ae49-1f201b066b2e@ivitera.com>
 <97fed6c8-e780-021f-4f93-64701a14bc3f@synopsys.com>
 <60def6a9-89f3-d7b9-4bc1-2f1a7a5ce769@synopsys.com>
 <deb8918a-14f5-ca3f-53d5-0d99d406fc3c@ivitera.com>
 <79aba6ae-befe-878e-cc17-e1fde9ac6a80@ivitera.com>
 <926c3136-1979-4df7-0afb-a91df9a2ab01@synopsys.com>
 <5f7cc638-ed27-8f8f-95db-c1b198ebb8f5@ivitera.com>
 <7f1b3cc0-718c-731a-4069-809bf2b2dca4@synopsys.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <172d6cd4-3e48-3a40-bf1c-4f50ba921838@ivitera.com>
Date:   Tue, 5 Nov 2019 13:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7f1b3cc0-718c-731a-4069-809bf2b2dca4@synopsys.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 05. 11. 19 v 12:30 Minas Harutyunyan napsal(a):
> Hi Pavel,
> 
> 
> Could you please perform follow 3 tests:
> 
> 1. Test#1. Disable all debug prints for dwc2 driver and test again 960
> bytes mps.

Do you mean without any patches, with the existing code? That will 
result in the existing (incorrect) behaviour.

I will do all the other tests, thanks alot for your effort.

Regards,

Pavel.
