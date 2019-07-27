Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF78777BDD
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2019 22:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388035AbfG0Un2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jul 2019 16:43:28 -0400
Received: from sonic303-25.consmr.mail.ne1.yahoo.com ([66.163.188.151]:38352
        "EHLO sonic303-25.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387841AbfG0Un2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Jul 2019 16:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bellsouth.net; s=s2048; t=1564260206; bh=YdvryUNxz6A1UKbjZOw7YtrCPsg49cfcmToR6wG5lGs=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=cE9nAJ7rKDluw1hEufUoPt4/eBQXuymBDA0/+6mPTBlbRU4J+yn+gVInXwgu8h71Y5yzxF9aCujH+rW++3BXuRKjM9W7K8FxZk57E//U5xY6LJTlhEBIg/69y6uE6/5cTEDb/4Yor35dyld8XR64KApdP7jo6obDd/du3cFRx56oq7wrAnKKyWZAvPRkl7Xf3u8L5M3GljHt3UmhfXTysYYzE70BgNPFhhGJZ8MZI7hJ1/C070lXGaKWFWjaVPuU5vYXK0wssrlesup0ecaQvPLjeGRifAveGN/8whJHGX6//kmnsDNqF93z3ED6auC99DAPxdQmSQjl9Kn7DxiGPA==
X-YMail-OSG: 8KtfpiUVM1k7x6AanpbOw7L1xYgxp8I9deVMhUc36e_T_KRYw1iyLZJ19hp.VFY
 uhdjWjeNiiwQRm8R28YE3Bv8EB9xBYKCXsWi6Ei89ZKYTWu6f0Sq5Rhg7_Jj6sUmBLkTtUyynU6S
 Dcok31UOTEdPEJt7ypAMa4pYLuHBiXqFSD.9LdcmNWs.Z0TkNwdHLzY94AKylDcsDiAQ.Tp85pYM
 0IrlzZwF5loTkniKm.BmPMFynP7M7.A.2SJJY6NrVgg50rbzygcySQZxYYdYtAHsuSChenu24Dyk
 XCFwPTuOALHkUxs6B.V1nFnKDU1EsXa4FWgY7zn0zv.1CTuXj6_99UGhr4JGVRNNQMLutnNeQ3zR
 a0bgv_KUQScbleyt1rsFtwJ5PCZtH2hVzY7Jk7OO144fYnxRWRRrrkGc52GNdH3vl8YIWKTSri17
 _j6DFfLzLnAyQYHFWhZgMHqSFK7qYbNnrsnizW7v8t4pVSEJdFa5DwkgHmNRdOfPkN0zNdPZ03BC
 XilOiiOI.wSFre8VWASNOGrhRi15qbzIyoGwmX1QM5UkcsFDn5p0nfSyVsuKgL3TDIm7P2mPhxN3
 lEGJ_S8ZjT6Gs1pbvOc_eCScdHtSkNuVXDbTMgeR9qjdRBak6LnZAqTNL5WweWTZhCCAlKe.AN_C
 2jtsPQaN3nRspZM0cVcKrXmCVfKFTuD92ZavK8vaqOeM18wjF_Iadr_bzVLdEORlqqBiR79dsK2n
 R8OexpkiIKE0L00h9tLxafb7emyM6ZuibA8_pXdUYoXWmTPKJFJzvEAsQexl0jgd9gR5ClcRoRMW
 VK7cOVTi94FsXqGg8EgxqGhZ0vm8pTEHLlwq958A7rDivNUoi0k2mt0xNpa.43tgXPXDXxHK35G_
 mrW4hnlP3.O.bPe3O_zVFF3oD3lfdvgRPuyLquEHuWYIcLRMV8xttmDIVSW99Y.Ya67sEyPPDTGJ
 4Y5Yvyj.6mFYAwdxadQVTloovH2ONge87wO13mvNCL7lhHlFNiWaxbMTPpEm5yQewL9k2cMoJowD
 bsLwgvv0ru5YZSakD62IblcgiH4y0t.cQUO5xV.vSbM32ksTjc3oosZfgJ.Sl0sIGBC93VoNkyiI
 bO.Ck6Ao17TrnfkNPCNDoxTmTfh5BJvQuvHinYcUDoLw4KpYYf0DmiiJh6nXqWcEQMG356obVabi
 o6Au8zXgtcH54OdehyQBSegfTqFyeMomw7hbW2KyNhx_oEDmG_o1QcJMN92vt7Rabe5n9a44QiSA
 wLEgihg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Sat, 27 Jul 2019 20:43:26 +0000
Received: by smtp401.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID a74d2ed11d730cd859394c9683c1ab15;
          Sat, 27 Jul 2019 20:43:23 +0000 (UTC)
Subject: Re: Oops in xhci_endpoint_reset
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
 <20190727105955.GE458@kroah.com>
From:   Bob Gleitsmann <rjgleits@bellsouth.net>
Message-ID: <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
Date:   Sat, 27 Jul 2019 16:43:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190727105955.GE458@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

OK, here's the result of the bisection:

ef513be0a9057cc6baf5d29566aaaefa214ba344 is the first bad commit
commit ef513be0a9057cc6baf5d29566aaaefa214ba344
Author: Jim Lin <jilin@nvidia.com>
Date:???? Mon Jun 3 18:53:44 2019 +0800

?????? usb: xhci: Add Clear_TT_Buffer
??????
?????? USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
?????? processing for full-/low-speed endpoints connected via a TT, the host
?????? software must use the Clear_TT_Buffer request to the TT to ensure
?????? that the buffer is not in the busy state".
??????
?????? In our case, a full-speed speaker (ConferenceCam) is behind a high-
?????? speed hub (ConferenceCam Connect), sometimes once we get STALL on a
?????? request we may continue to get STALL with the folllowing requests,
?????? like Set_Interface.
??????
?????? Here we invoke usb_hub_clear_tt_buffer() to send Clear_TT_Buffer
?????? request to the hub of the device for the following Set_Interface
?????? requests to the device to get ACK successfully.
??????
?????? Signed-off-by: Jim Lin <jilin@nvidia.com>
?????? Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
?????? Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

??drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++++++++++++-
??drivers/usb/host/xhci.c?????????? | 21 +++++++++++++++++++++
??drivers/usb/host/xhci.h?????????? |?? 5 +++++
??3 files changed, 52 insertions(+), 1 deletion(-)


On 7/27/19 6:59 AM, Greg KH wrote:
> On Fri, Jul 26, 2019 at 11:15:46PM -0400, Bob Gleitsmann wrote:
>> Hello,
>>
>>
>> I have seen kernel oopses on waking from suspend to memory. I got this
>> twice, one dmesg with backtrace attached. The other one had the failure
>> in the same place in the code.
>>
>>
>> This is kernel 5.3.0-rc1, patched for another problem in ethernet PHY
>> driver. Have not had the problem with earlier kernels. Using Gentoo
>> linux, amd64, but git kernel.
> Any chance you can run 'git bisect' to track down the offending commit?
>
> thanks,
>
> greg k-h
>
