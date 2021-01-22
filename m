Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6392FFDEB
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 09:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbhAVIKP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 03:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbhAVIKG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jan 2021 03:10:06 -0500
X-Greylist: delayed 162 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 22 Jan 2021 00:09:11 PST
Received: from mout2.freenet.de (mout2.freenet.de [IPv6:2001:748:100:40::2:4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213F2C06178A
        for <linux-usb@vger.kernel.org>; Fri, 22 Jan 2021 00:09:11 -0800 (PST)
Received: from [195.4.92.120] (helo=sub1.freenet.de)
        by mout2.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l2rVF-0005pJ-Q7
        for linux-usb@vger.kernel.org; Fri, 22 Jan 2021 09:09:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:References:To:From:Subject:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/6dqcPHOtAPhCD/76WHeSOIokip3LdcTwTVf/enc58E=; b=By2t0R++xVIYtb2rFi1c0rwDx
        kyj+t/rNMOt05q5JMzpRu+rvAZp9QrOv1j2s/2cz/1C+HmGxwXJF/3o20vv5JGHwlAG3vXi6qhzpJ
        gDhnaCdp6Sm5UunQARyEYXouv7v1z2ztgehNOWFSsnIAoM8jlFk819M8wwJNb1knOY+nESxFJvBlK
        B2bNnlJT0ea2UOFgKqx0UKC6O50Q3A+8S87xCSWQcRwn4i5hbW9Z4c7/LUpnj7LXLhxfaobxEztCR
        2F73fd7TaAbP/qFIAJz/6sG/Er2qQhRTNq3TipvSLy9pHYYC61Cs75/qxU1s6AbPsas5EO7y7U7rK
        mzPcYVH6w==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:41882 helo=mail.maya.org)
        by sub1.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l2rVF-0006wr-Mw
        for linux-usb@vger.kernel.org; Fri, 22 Jan 2021 09:09:09 +0100
Received: internal info suppressed
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
From:   Andreas Hartmann <andihartmann@01019freenet.de>
To:     linux-usb@vger.kernel.org
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
Message-ID: <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
Date:   Fri, 22 Jan 2021 09:09:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
Content-Type: multipart/mixed;
 boundary="------------56E2304374A3B590F2EF171B"
Content-Language: en-US
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!41882
X-FNSign: v=2 s=4D1B493FF8C95BCFBB50BA635A533FCC61560E22403B52B05840C5E95A025BA6
X-Scan-TS: Fri, 22 Jan 2021 09:09:09 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------56E2304374A3B590F2EF171B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, forgot to attach the log file ... .

Now, it's there.


Thanks
Andreas Hartmann



On 22.01.21 at 09:06 Andreas Hartmann wrote:
> 
> Hello!
> 
> Since a new Notebook, which sadly only provides USB 3 interfaces, I have a more or 
> less big problem with an old driver (rt5572sta), which not just sometimes produces 
> those warn messages, but even stalls sometimes after those warn messages (e,g, 
> Kernel 5.3.x or 5.10.x or 5.8.x) - see attached log file.
> 
> The driver uses the bulk method to communicate with the USB bus. By reducing the 
> max. bulk size from 24 kByte to 12 kByte, I was able to massively reduce those 
> warning messages and now, the USB bus even seldom stalls any more.
> 
> I achieved this by changing the building of the bulk package from
> 
> if (((ThisBulkSize&0xffff8000) != 0) || ((ThisBulkSize&0x6000) == 0x6000))
> 
> to
> 
> if (((ThisBulkSize&0xffff8000) != 0) || ((ThisBulkSize&0x3000) == 0x3000))
> 
> 
> I can see this problem on two different AMD USB 3 controller, e.g. X370 Series 
> Chipset USB 3.1 xHCI Controller [1022:43b9] (rev 02).
> 
> I'm wondering how to solve this problem? But mostly I'm wondering, why a USB 2 
> device is handled by USB 3 code, expecting to follow USB 3 rules at all? Is it 
> possible to bind the driver to the USB 2 code path?
> 
> At the moment I think, that the attempt to "transfer" a valid USB 2 package to a 
> valid USB 3 package by xhci_hcd seems not always to be transparent to the driver 
> producing and controlling its send packets. Could it be possible, that there are 
> some situations, where the driver can't check the package after manipulation 
> through xhci_hcd any more? Please see the attached log file.
> 
> Or how should I fix the driver to be USB 3 ready? Please take into account, that 
> I'm not an USB protocol specialist and I don't know, at which level or how to 
> build a valid bulk packet which confirms to USB3 rules.
> 
> At the time being, I'm debugging on base of the pretty loud debug messages of the 
> rt5572sta driver and the xhci_hcd debug messages (echo "module xhci_hcd =pf" > 
> /sys/kernel/debug/dynamic_debug/control)
> 
> 
> Thanks for any idea how to proceed!
> Andreas Hartmann


--------------56E2304374A3B590F2EF171B
Content-Type: text/plain; charset=UTF-8;
 name="usb3-alignment_error.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="usb3-alignment_error.txt"

MjAyMS0wMS0xOVQxNDowMTo0Ny40OTIzMTYrMDE6MDAgbG9jYWxob3N0IGtlcm5lbDogWzI2
NTA5LjY4Njk3Ml0geGhjaV9oY2QgMDAwMDowMDowNi4wOiBXQVJOIFdyb25nIGJvdW5jZSBi
dWZmZXIgd3JpdGUgbGVuZ3RoOiAwICE9IDUxMgoyMDIxLTAxLTE5VDE0OjAxOjQ4Ljk0Nzcx
MCswMTowMCBsb2NhbGhvc3Qga2VybmVsOiBbMjY1MTEuMTQyMzMzXSBCdWxrT3V0RGF0YVBh
Y2tldCBmYWlsZWQ6IFJlYXNvbkNvZGU9LTIhCjIwMjEtMDEtMTlUMTQ6MDE6NDguOTQ3NzM3
KzAxOjAwIGxvY2FsaG9zdCBrZXJuZWw6IFsyNjUxMS4xNDIzNTZdICAgICAgID4+QnVsa091
dCBSZXE9MHhjN2Y5MywgQ29tcGxldGU9MHhjN2Y5MiwgT3RoZXI9MHgyCjIwMjEtMDEtMTlU
MTQ6MDE6NDguOTQ3NzM5KzAxOjAwIGxvY2FsaG9zdCBrZXJuZWw6IFsyNjUxMS4xNDIzNjFd
ICAgICAgID4+QnVsa091dCBIZWFkZXI6MTAgNiAwIDQ0IGQwIDAgOGYgODAKMjAyMS0wMS0x
OVQxNDowMTo1NC4zMDMzMTIrMDE6MDAgbG9jYWxob3N0IGtlcm5lbDogWzI2NTE2LjQ5ODA2
MF0gQnVsa091dERhdGFQYWNrZXQgZmFpbGVkOiBSZWFzb25Db2RlPS0yIQoyMDIxLTAxLTE5
VDE0OjAxOjU0LjMwMzMzMyswMTowMCBsb2NhbGhvc3Qga2VybmVsOiBbMjY1MTYuNDk4MDc4
XSAgICAgICA+PkJ1bGtPdXQgUmVxPTB4YzdmOTMsIENvbXBsZXRlPTB4YzdmOTIsIE90aGVy
PTB4MwoyMDIxLTAxLTE5VDE0OjAxOjU0LjMwMzMzNSswMTowMCBsb2NhbGhvc3Qga2VybmVs
OiBbMjY1MTYuNDk4MDgzXSAgICAgICA+PkJ1bGtPdXQgSGVhZGVyOjEwIDYgMCA0NCBkMCAw
IDhmIDgwCjIwMjEtMDEtMTlUMTQ6MDE6NTkuNjc2MDE2KzAxOjAwIGxvY2FsaG9zdCBrZXJu
ZWw6IFsyNjUyMS44NzA3NzNdIEJ1bGtPdXREYXRhUGFja2V0IGZhaWxlZDogUmVhc29uQ29k
ZT0tMiEKMjAyMS0wMS0xOVQxNDowMTo1OS42NzYwNDQrMDE6MDAgbG9jYWxob3N0IGtlcm5l
bDogWzI2NTIxLjg3MDgwMF0gICAgICAgPj5CdWxrT3V0IFJlcT0weGM3ZjkzLCBDb21wbGV0
ZT0weGM3ZjkyLCBPdGhlcj0weDQKMjAyMS0wMS0xOVQxNDowMTo1OS42NzYwNDYrMDE6MDAg
bG9jYWxob3N0IGtlcm5lbDogWzI2NTIxLjg3MDgxNV0gICAgICAgPj5CdWxrT3V0IEhlYWRl
cjoxMCA2IDAgNDQgZDAgMCA4ZiA4MAoyMDIxLTAxLTE5VDE0OjAyOjA0Ljk5OTczNyswMTow
MCBsb2NhbGhvc3Qga2VybmVsOiBbMjY1MjcuMTk0NTQ5XSBCdWxrT3V0RGF0YVBhY2tldCBm
YWlsZWQ6IFJlYXNvbkNvZGU9LTIhCjIwMjEtMDEtMTlUMTQ6MDI6MDQuOTk5NzYyKzAxOjAw
IGxvY2FsaG9zdCBrZXJuZWw6IFsyNjUyNy4xOTQ1NzNdICAgICAgID4+QnVsa091dCBSZXE9
MHhjN2Y5MywgQ29tcGxldGU9MHhjN2Y5MiwgT3RoZXI9MHg1CjIwMjEtMDEtMTlUMTQ6MDI6
MDQuOTk5NzY0KzAxOjAwIGxvY2FsaG9zdCBrZXJuZWw6IFsyNjUyNy4xOTQ1NzddICAgICAg
ID4+QnVsa091dCBIZWFkZXI6MTAgNiAwIDQ0IGQwIDAgOGYgODAKMjAyMS0wMS0xOVQxNDow
MjoxMC40MzkzMzMrMDE6MDAgbG9jYWxob3N0IGtlcm5lbDogWzI2NTMyLjYzNDE4Nl0gQnVs
a091dERhdGFQYWNrZXQgZmFpbGVkOiBSZWFzb25Db2RlPS0yIQoyMDIxLTAxLTE5VDE0OjAy
OjEwLjQzOTM1NSswMTowMCBsb2NhbGhvc3Qga2VybmVsOiBbMjY1MzIuNjM0MjAyXSAgICAg
ICA+PkJ1bGtPdXQgUmVxPTB4YzdmOTMsIENvbXBsZXRlPTB4YzdmOTIsIE90aGVyPTB4Ngoy
MDIxLTAxLTE5VDE0OjAyOjEwLjQzOTM1NyswMTowMCBsb2NhbGhvc3Qga2VybmVsOiBbMjY1
MzIuNjM0MjA3XSAgICAgICA+PkJ1bGtPdXQgSGVhZGVyOjEwIDYgMCA0NCBkMCAwIDhmIDgw
CjIwMjEtMDEtMTlUMTQ6MDI6MTUuNzg4Mzg5KzAxOjAwIGxvY2FsaG9zdCBrZXJuZWw6IFsy
NjUzNy45ODMyNzBdIEJ1bGtPdXREYXRhUGFja2V0IGZhaWxlZDogUmVhc29uQ29kZT0tMiEK
MjAyMS0wMS0xOVQxNDowMjoxNS43ODg0MTMrMDE6MDAgbG9jYWxob3N0IGtlcm5lbDogWzI2
NTM3Ljk4MzI5Ml0gICAgICAgPj5CdWxrT3V0IFJlcT0weGM3ZjkzLCBDb21wbGV0ZT0weGM3
ZjkyLCBPdGhlcj0weDcKMjAyMS0wMS0xOVQxNDowMjoxNS43ODg0MTQrMDE6MDAgbG9jYWxo
b3N0IGtlcm5lbDogWzI2NTM3Ljk4MzI5N10gICAgICAgPj5CdWxrT3V0IEhlYWRlcjoxMCA2
IDAgNDQgZDAgMCA4ZiA4MAoyMDIxLTAxLTE5VDE0OjAyOjIxLjIzMTc2NSswMTowMCBsb2Nh
bGhvc3Qga2VybmVsOiBbMjY1NDMuNDI2NjgwXSBCdWxrT3V0RGF0YVBhY2tldCBmYWlsZWQ6
IFJlYXNvbkNvZGU9LTIhCjIwMjEtMDEtMTlUMTQ6MDI6MjEuMjMxNzg4KzAxOjAwIGxvY2Fs
aG9zdCBrZXJuZWw6IFsyNjU0My40MjY3MDFdICAgICAgID4+QnVsa091dCBSZXE9MHhjN2Y5
MywgQ29tcGxldGU9MHhjN2Y5MiwgT3RoZXI9MHg4CjIwMjEtMDEtMTlUMTQ6MDI6MjEuMjMx
NzkwKzAxOjAwIGxvY2FsaG9zdCBrZXJuZWw6IFsyNjU0My40MjY3MDZdICAgICAgID4+QnVs
a091dCBIZWFkZXI6MTAgNiAwIDQ0IGQwIDAgOGYgODAKMjAyMS0wMS0xOVQxNDowMjoyNi41
MjczNTUrMDE6MDAgbG9jYWxob3N0IGtlcm5lbDogWzI2NTQ4LjcyMjMxMF0gQnVsa091dERh
dGFQYWNrZXQgZmFpbGVkOiBSZWFzb25Db2RlPS0yIQoyMDIxLTAxLTE5VDE0OjAyOjI2LjUy
NzM3NyswMTowMCBsb2NhbGhvc3Qga2VybmVsOiBbMjY1NDguNzIyMzI3XSAgICAgICA+PkJ1
bGtPdXQgUmVxPTB4YzdmOTMsIENvbXBsZXRlPTB4YzdmOTIsIE90aGVyPTB4OQoyMDIxLTAx
LTE5VDE0OjAyOjI2LjUyNzM3OSswMTowMCBsb2NhbGhvc3Qga2VybmVsOiBbMjY1NDguNzIy
MzMxXSAgICAgICA+PkJ1bGtPdXQgSGVhZGVyOjEwIDYgMCA0NCBkMCAwIDhmIDgwCjIwMjEt
MDEtMTlUMTQ6MDI6MzEuOTk5MDk3KzAxOjAwIGxvY2FsaG9zdCBrZXJuZWw6IFsyNjU1NC4x
OTQwODBdIEJ1bGtPdXREYXRhUGFja2V0IGZhaWxlZDogUmVhc29uQ29kZT0tMiEKMjAyMS0w
MS0xOVQxNDowMjozMS45OTkxMjErMDE6MDAgbG9jYWxob3N0IGtlcm5lbDogWzI2NTU0LjE5
NDEwMV0gICAgICAgPj5CdWxrT3V0IFJlcT0weGM3ZjkzLCBDb21wbGV0ZT0weGM3ZjkyLCBP
dGhlcj0weGEKMjAyMS0wMS0xOVQxNDowMjozMS45OTkxMjIrMDE6MDAgbG9jYWxob3N0IGtl
cm5lbDogWzI2NTU0LjE5NDEwNl0gICAgICAgPj5CdWxrT3V0IEhlYWRlcjoxMCA2IDAgNDQg
ZDAgMCA4ZiA4MAoK
--------------56E2304374A3B590F2EF171B--
