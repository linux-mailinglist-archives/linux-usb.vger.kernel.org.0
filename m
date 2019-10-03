Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5B87CA0F5
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 17:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfJCPN3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 11:13:29 -0400
Received: from mout.gmx.net ([212.227.17.21]:36883 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726364AbfJCPN3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Oct 2019 11:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570115604;
        bh=/MWS+5UBRWC6B7R3c+xD/Ij8tplSudKiqgqLtWye8PM=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=Ig2QMKi+81l12V3CLpsjIweQRxk4WBdJ0VeOP7POrJeIB4zh6q/c16QJbirxpLEeJ
         mDPJyRTx1z3COyC5a6E0PaCbDOov0/yTZ9LEtuvdaQ7CA3FJG5jUgDZSUe6TBduXwq
         BWTJGTl0uuKAmKzN7b2iwgPrxMQU+kbHOZPo63AA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.132] ([212.88.11.189]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MirjY-1hbTJH3Sse-00eu1f; Thu, 03
 Oct 2019 17:13:24 +0200
Subject: Re: Regression: USB/xhci issues on some systems with newer kernel
 versions
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at>
 <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
From:   Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>
Message-ID: <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at>
Date:   Thu, 3 Oct 2019 17:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:32VEXOROH7cRomYuW+FLoqjnr1o885t48tFBYv0PvJmqi9xCXiW
 otr7HVoKXcbLQDSYSVwXcpTyK75ZHXz2GkcWO0uzjFe6OUsPevlmiB2mreng9ChiJOp0mTY
 y4XTGwnz+ZIsvDDVpUnAg5O50kFe23/h6NrU+5Q5XIVi3CPgN7PlCd7HjdGv0+qMBgxv2kO
 tVOjUv/fCJNeAorYbpbQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kWvgtYljLYI=:eShQDoluKH9RxCgD6jhFbd
 WrdNzQKXkDDLgHXM1p1KWh0+fSeKKhEPM1ZN1vwoDCfPxr/zNKjKvDBaoI3ENRdWhy++m4ljL
 pYWhstQxcX8akPGj3NUlDH2nCyF4UIyh4QlIJ5ELIjBONAIf7WjjiQmKSFv0lF90clFa9ETST
 IVNAYSmukXxLlS5AqQ2Qeitnir7o06uDRDkdwGlzIJ0zncLXV/VquV2OuLASaE30d64RZCJfZ
 ka8I0EFQm3XkSieSt3Y69q1ykjJWE5s2kCDai5Wt/RvmWSPCLYHEH6d1SXdApTsU0GSQfNxbi
 jkERSTe8xnPyyiqHTRwCg5M0PHVZl6r7Iyhjetj0ktWNueVcC0U+GhK+aRex2X6Kjwh7oH+rG
 vSLrG3IV1i2QgtecXUcPBiukKL/GidMBPC4GNBLTCG3tX2WevXgb7QkampYHVz9iR/QOM88sW
 nA2DO1loLYYKFv2/Tu8rgNwvLJ/npXXmi6sHG1iOfnCLDr4dt2rk6f2DGIBobQ9iGDJCfjFnh
 bXMqKUa8DTJe1Vd/7q0RQsz5PBD6PST8wsEMKWSJNOq7SDgT1Y1mNftKC1iqVjDb91RQOevMI
 QS+bRp2V6ukBjkOwEr/GM5xnIMI2Rw9zzWdSGH8Qa/IyBCacnA5IfXRp2CzvhyACrHkFJCXXL
 fDF4DvDJoZw735gyRrz7nFre2MCIliHiZEXdjM0R5Anmmj5aUVjlHao7MH+qNQD0c6Yqqp1bb
 GfwRfRux1SrUdoErSZhXOWGBpbr0HotTQk/4k8CQG6G5su9cFOhQLRmOlAcwITQl+xBEPIujZ
 5HTUG1a/RKcA2KWyWxLdcOJogDQPNjPmN/5mXBhCzF+awaxwF8ofDYVKI1u/Kgtx5/tkx0ocK
 hjQl4Iq5ERCaLpOlXuyz6i7cH15TsyqMfbFcLgLx2ZuN7pXpgV/pqhTCmtePbJIamw/54OtVy
 A8gE5NAql8TDjmkHtajB2eyhn2CDG68iwmHE0KExWR24xLHaDzCaEtJAaqKDiNk6OGo72lnU3
 04WLgB2qBFeNIaGWX0vyiNUzhVDLTTY8pPoo7LpkXi2aKo+nacWdPW451cfspxsOu/SSu/ZDC
 IAlA/CMXf33SSB8MFp6z2gzTH5oezllw9oeBkrGj+9QIAQagR3e8nrbcioaz/cCnOKSsckYs6
 vzVZCJV1N5jWnz5v6ng9BkqDjeMd4QPq5uMCVY4HlVs+//VQO+GcWtEP3kyujSaWi/BUK3Lat
 Vgx/9Vii019EfP4laXliCy99gZhQMiazNTdcVpklnoEiq/kJj9eYKp51Ptb8=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I sent the instructions to one of the users in the bug tracker.
Here is the download link for his logs: https://www.sendspace.com/file/413hlj

- Bernhard

Am 03.10.19 um 12:23 schrieb Mathias Nyman:
> On 2.10.2019 15.28, Bernhard Gebetsberger wrote:
>> Hi,
>>
>> There has been a regression in the xhci driver since kernel version 4.20, on some systems some usb devices won't work until the system gets rebooted.
>> The error message in dmesg is "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state", although for some reason there are some usb devices that are affected by this issue but don't throw the error message(including the device I'm using, I got the error in previous kernel versions though).
>> It seems like this bug can also lead to system instability, one user reported in the bug tracker(https://bugzilla.kernel.org/show_bug.cgi?id=202541#c58) that he got a system freeze because of this when using kernel 5.3.1.
>>
>
> Ok, lets take a look at this.
> Some of the symptoms vary a bit in the report, so lets focus on ones that
> show: "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state"
>
>> When looking at the responses in the bug tracker, it looks like it mostly affects Ryzen based systems with 300 series motherboards, although there are some other affected systems as well. It doesn't only affect wifi/bluetooth sticks, some users even got this issue when connecting their smartphone or their external hard drive to their PC.
>
>>
>> I have uploaded the whole dmesg file and the tracing file to transfer.sh: https://transfer.sh/zYohl/dmesg and https://transfer.sh/KNbFL/xhci-trace
>
> Hmm, trying to download these just shows "Not Found"
>
> Could someone with a affected system enable tracing and dynamic debug on a
> recent kernel, take logs and traces of one failing instance where the message
> "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state" is seen.
>
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
>
> < Trigger the issue >
>
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace
>
>>
>> The issues occur since commit f8f80be501aa2f10669585c3e328fad079d8cb3a "xhci: Use soft retry to recover faster from transaction errors". I think this commit should be reverted at least until a workaround has been found, especially since the next two kernel versions will be used by a lot of distributions(5.4 because it's a LTS kernel and 5.5 will probably be used in Ubuntu 20.04) so more users would be affected by this.
>>
>
> There some time left before 5.4 is out, lets see if we can find the root cause first.
>
> -Mathias
>
